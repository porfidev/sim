<?php

namespace App\Http\Controllers\Preparacion;

use DB;
use Log;
use Auth;
use Validator;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;
use App\Repositories\BoxesRepository;
use App\Repositories\AssignmentRepository;

class PreparacionTrabajadorController extends Controller
{
    private $productModel;
    private $orderDetailModel;
    private $orderModel;
    private $catalogModel;
    private $boxModel;
    private $assigmentModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        ProductRepository $product,
        OrderDetailRepository $detail,
        OrderRepository $order,
        CatalogoRepository $catalog,
        BoxesRepository $box,
        AssignmentRepository $assigment)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->productModel     = $product;
        $this->orderDetailModel = $detail;
        $this->orderModel       = $order;
        $this->catalogModel     = $catalog;
        $this->boxModel         = $box;
        $this->assigmentModel   = $assigment;
    }

    /**
     * Función para obtener el listado de tareas de un trabajador
     * en el área de preparación de pedidos.
     *
     * @return View
     */
    public function listadoTareas(Request $request)
    {
        try {
            $listado = $this->assigmentModel->getOPWorks(Auth::id(), 5);
            $pedidos = array();
            foreach ($listado as $item) {
                if(array_key_exists($item->order_id, $pedidos)){
                    $item->max    = $pedidos[$item->order_id]["max"];
                    $item->min    = $pedidos[$item->order_id]["min"];
                    $item->client = $pedidos[$item->order_id]["client"];
                } else {
                    $data   = $this->orderModel->getMaxMin($item->order_id);
                    $order  = $this->orderModel->getById($item->order_id);
                    $client = $order->client;
                    Log::info("PreparacionTrabajadorController - listadoTareas - consulta: ".json_encode($data));
                    $item->max   = $data->max;
                    $item->min   = $data->min;
                    $item->client = $client->name;
                    $pedidos[$item->order_id] = array(
                        "max"    => $data->max,
                        "min"    => $data->min,
                        "client" => $client->name
                    );
                }
            }

            return view('preparacion.trabajador',
                array(
                    "listado"    => $listado
                )
            );

        } catch (\Exception $e) {
            Log::error( 'PreparacionTrabajadorController - listadoPedidos - Exception: '.$e->getMessage() );
            Log::error( "PreparacionTrabajadorController - listadoPedidos - Trace: \n".$e->getTraceAsString() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para asignar una caja a una tarea
     *
     * @return json
     */
    public function asignaCaja(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" PreparacionTrabajadorController - asignaCaja ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'pedido'   => 'required|string|exists:orders,id', 
                    'caja'     => 'required|string|exists:order_designs,sequence,order_id,'.$request->pedido,
                    'etiqueta' => 'required|string|unique:box_ids,label,NULL,id,status,2',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                Log::error("PreparacionTrabajadorController - asignaCaja - Error en validator");
                $resultado = "ERROR";
                $mensajes  = $validator->errors();
            } else {
                Log::info("PreparacionTrabajadorController - asignaCaja - Cambio de estatus");
                DB::beginTransaction();
                $box = $this->boxModel->getBoxByLabel($request->etiqueta);
                if(empty($box)) {
                    $box = $this->boxModel->createBoxId(
                        array(
                            BoxesRepository::SQL_BOX_ID_LABEL  => $request->etiqueta,
                            BoxesRepository::SQL_BOX_ID_STATUS => BoxesRepository::BOX_ASSIGN
                        )
                    );
                } else {
                    $this->boxModel->updateBoxId(
                        $box->id,
                        array(
                            BoxesRepository::SQL_BOX_ID_STATUS => BoxesRepository::BOX_ASSIGN
                        )
                    );
                }
                $list = $this->orderModel->getDesignsByBox($request->pedido, $request->caja); 
                $usedBox = 0;
                foreach ($list as $index => $item) {
                    if($index === 0
                        && !empty($item->box_id)) {
                        $usedBox = $item->box_id;
                    }
                    $this->orderModel->updateDesign(
                        $item->id,
                        array(
                            OrderRepository::DESIGN_BOX => $box->id
                        )
                    );
                }
                if($usedBox != 0){
                    $this->boxModel->updateBoxId(
                        $usedBox,
                        array(
                            BoxesRepository::SQL_BOX_ID_STATUS => BoxesRepository::BOX_CREATED
                        )
                    );
                }
                DB::commit();
            }
        } catch (\Exception $e) {
            Log::error( "PreparacionTrabajadorController - asignaCaja - Exception: ".$e->getMessage() );
            Log::error( "PreparacionTrabajadorController - asignaCaja - Trace: \n".$e->getTraceAsString() );
            DB::rollback();
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /**
     * Función para saber si se ha terminado de agregar todos los elementos
     * de la caja del pedido
     *
     * @param integer $order_id
     * @param integer $sequence
     * @return integer 0: Terminado, 1: Sin terminar
     */
    private function isFinish($order_id, $sequence){
        $ans = 0;
        $details = $this->orderModel->getDesignBySequence($order_id, $sequence);
        foreach ($details as $detail) {
            if($detail->quantity != $detail->quantity_op){
                $ans += 1;
                break;
            }
        }
        return $ans;
    }

    /**
     * Función para registrar el producto que se agrega a una caja
     * 
     * @return json
     */
    public function registraProductoEnCaja(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" PreparacionTrabajadorController - registraProductoEnCaja ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'pedido'   => 'required|string|exists:orders,id',
                    'caja'     => 'required|string|exists:order_designs,sequence,order_id,'.$request->pedido,
                    'producto' => 'required|string'
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                Log::error("PreparacionTrabajadorController - registraProductoEnCaja - Error en validator");
                $resultado = "ERROR";
                $mensajes  = $validator->errors();
            } else {
                $order      = $this->orderModel->getById($request->pedido);
                $detailList = $order->details()->with('product')->get();
                $detailFind = null;
                $designFind = null;
                $qtyToAdd   = 0;
                DB::beginTransaction();
                foreach ($detailList as $detail) {
                    if($detail->product->barcode == $request->producto
                        || $detail->product->display_barcode == $request->producto
                        || $detail->product->corrugated_barcode == $request->producto ){
                        $designFind = $this->orderModel->getDesignItemInBox($detail->order_id, $request->caja, $detail->id);
                        $detailFind = $detail;
                        if( $detail->product->barcode == $request->producto ) {
                            $qtyToAdd = 1;
                        } else if( $detail->product->display_barcode == $request->producto ) {
                            $qtyToAdd = $detail->product->items_per_display;
                        } else if( $detail->product->display_barcode == $request->producto ) {
                            $qtyToAdd = $detail->product->items_per_display * $detail->product->display_per_box;
                        }
                        break;
                    }
                }
                if(!empty($detailFind) && !empty($detailFind)){
                    Log::info("");
                    if( $order->status < OrderRepository::PREPARADO_POR_V ) {
                        $total  = $qtyToAdd;
                        $enCaja = $qtyToAdd;
                        if( !empty($detailFind->quantity_op) ) {
                            $total += $detailFind->quantity_op;
                        }
                        if( !empty($designFind->quantity_op) ){
                            $enCaja += $designFind->quantity_op;
                        }
                        if($total <= $detailFind->quantity
                            && $enCaja <= $designFind->quantity ){

                            // Actualizamos la cantidad en el disño de empaque
                            $this->orderModel->updateDesign(
                                $designFind->id,
                                array(
                                    OrderRepository::DESIGN_QUANTITY_OP => $enCaja
                                )
                            );

                            // Actualizamos en el detalle de la orden
                            $this->orderDetailModel->update(
                                $detailFind->id,
                                array(
                                    OrderDetailRepository::SQL_CANTIDAD_OP => $total
                                )
                            );

                            $datos = array(
                                "producto"  => $detailFind->product->sku,
                                "terminado" => $this->isFinish($order->id, $request->caja),
                                "total"     => $enCaja
                            );
                            DB::commit();
                        } else {
                            $resultado = "ERROR";
                            $mensajes  = array( 'Cantidad excedida' );
                            DB::rollback();  
                        }
                    } else {
                        $resultado = "ERROR";
                        $mensajes  = array( 'El pedido ya se encuentra en estatus: Por validar preparación' );
                        DB::rollback();
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( 'No existe el código de barras' );
                    DB::rollback();
                }
            }
        } catch (\Exception $e) {
            Log::error( "PreparacionTrabajadorController - registraProductoEnCaja - Exception: ".$e->getMessage() );
            Log::error( "PreparacionTrabajadorController - registraProductoEnCaja - Trace: \n".$e->getTraceAsString() );
            DB::rollback();
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes,
            Controller::JSON_DATA     => $datos
        ));
    }

    /**
     * Función que cambia de estatus la asignación a terminada
     *
     * @return json
     */
    public function terminarTarea(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" PreparacionTrabajadorController - terminarTarea ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'tarea' => 'required|string|exists:assignments,id',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                DB::beginTransaction();
                $this->assigmentModel->update(
                    $request->tarea,
                    array(
                        AssignmentRepository::SQL_STATUS => AssignmentRepository::STATUS_FINISH
                    )
                );
                $task  = $this->assigmentModel->getById($request->tarea);
                $order = $task->order;
                if($order->status === OrderRepository::PREPARADO_ESPERA){
                    $this->orderModel->update(
                        $order->id,
                        array(
                            OrderRepository::SQL_ESTATUS => OrderRepository::PREPARADO_PROCESO
                        )
                    );
                }
                $missings = $this->assigmentModel->getMissings($order->id);
                Log::info("PreparacionTrabajadorController - terminarTarea - faltan: ".count($missings));
                if(count($missings) == 0) {
                    $this->orderModel->update(
                        $order->id,
                        array(
                            OrderRepository::SQL_ESTATUS => OrderRepository::PREPARADO_POR_V
                        )
                    );
                }
                DB::commit();
            }
        } catch (\Exception $e) {
            Log::error( "PreparacionTrabajadorController - terminarTarea - Exception: ".$e->getMessage() );
            Log::error( "PreparacionTrabajadorController - terminarTarea - Trace: \n".$e->getTraceAsString() );
            DB::rollback();
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

}