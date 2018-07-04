<?php

namespace App\Http\Controllers\Preparacion;

use DB;
use Log;
use Auth;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;
use App\Repositories\BoxesRepository;
use App\Repositories\AssignmentRepository;

class PreparacionJefeController extends Controller
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
     * Mostramos el listado de pedidos para
     * el área de preparación de pedidos.
     *
     * @return \Illuminate\Http\Response
     */
    public function listadoPedidos(Request $request){
        try {
            $pedidosAnteriores = $this->orderModel->getAll(
                array(
                    OrderRepository::SQL_ESTATUS       => OrderRepository::SURTIDO_PROCESO,
                    OrderRepository::STATUS_OPERATOR   => ">=",
                    OrderRepository::SQL_ESTATUS_2     => OrderRepository::PREPARADO_RECIBIDO,
                    OrderRepository::STATUS_OPERATOR_2 => "<",
                )
            );

            $pedidos = $this->orderModel->getAll(
                array(
                    OrderRepository::SQL_ESTATUS       => OrderRepository::PREPARADO_RECIBIDO,
                    OrderRepository::STATUS_OPERATOR   => ">=",
                    OrderRepository::SQL_ESTATUS_2     => OrderRepository::DISTRIBUCION_RECIBIDO,
                    OrderRepository::STATUS_OPERATOR_2 => "<",
                )
            );
            return view('preparacion.listadoJefe',
                array(
                    "anteriores" => $pedidosAnteriores,
                    "listado"    => $pedidos
                )
            );
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - listadoPedidos - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para cambiar el estatus del pedido a recibido en el área
     * de preparación de pedido.
     *
     * @return json
     */
    public function recibirPedido(Request $request)
    {
        $resultado = "ERROR";
        $mensajes  = "NA";
        try {
            Log::info("PreparacionJefeController - recibirPedido ");
            if($request->has('id')){
                Log::info("PreparacionJefeController - recibirPedido: ".$request->get('id'));
                $pedido = $this->orderModel->getById($request->get('id'));
                if(!empty($pedido)) {
                    Log::info("PreparacionJefeController - recibirPedido - pedido: ".json_encode($pedido));
                    DB::beginTransaction();
                    $client = $pedido->client;
                    Log::info("PreparacionJefeController - recibirPedido - cliente: ".json_encode($client));
                    $boxType = $this->catalogModel->searchGroupItem(CatalogoRepository::TE_GROUP, "Caja");
                    if(!empty($boxType)) {
                        Log::info("PreparacionJefeController - recibirPedido - caja: ".$boxType->id);
                        if(intval($client->TE) === intval($boxType->id)){
                            $this->procesoPedidoEnCaja($pedido);
                            $this->orderModel->update($request->get('id'),
                                array(
                                    OrderRepository::SQL_ESTATUS => OrderRepository::PREPARADO_ESPERA,
                                )
                            );
                            $this->orderModel->addTrace(
                                array(
                                    OrderRepository::TRACE_SQL_ORER => $request->get('id'),
                                    OrderRepository::TRACE_SQL_USER => Auth::id(),
                                    OrderRepository::TRACE_SQL_TYPE => OrderRepository::TRACE_RECIBIR_SURTIDO
                                )
                            );
                        } else {
                            $this->orderModel->update($request->get('id'),
                                array(
                                    OrderRepository::SQL_ESTATUS => OrderRepository::PREPARADO_RECIBIDO,
                                )
                            );
                            $this->orderModel->addTrace(
                                array(
                                    OrderRepository::TRACE_SQL_ORER => $request->get('id'),
                                    OrderRepository::TRACE_SQL_USER => Auth::id(),
                                    OrderRepository::TRACE_SQL_TYPE => OrderRepository::TRACE_RECIBIR_SURTIDO
                                )
                            );
                        }
                        DB::commit();
                        $resultado = "OK";
                    } else {
                        $mensajes  = array( "Falta configurar tipo de empaque" );
                    }
                } else {
                    $mensajes  = array( "No se encontró el pedido" );
                }
            } else {
                $mensajes  = array( "No se cuenta con los datos para poder recibir el pedido" );
            }
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - recibirPedido - Error: '.$e->getMessage() );
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
     * Función para recibir un pedido en caja.
     * El diseño de pedido es solo las cajas por producto.
     *
     * @param App\Order $pedido
     */
    private function procesoPedidoEnCaja($pedido)
    {
        $orderList = $this->orderDetailModel->getByIdOrd($pedido->id);
        foreach ($orderList as $orderItem) {
            Log::info("____________________________________________________________________________");
            $itemsPerBox = ($orderItem->itemsDisp * $orderItem->dispBox);
            $boxQuantity = $orderItem->quantity / $itemsPerBox;
            Log::info("PreparacionJefeController - recibirPedido - Cajas por Item: ".$orderItem->itemcode." - ".$boxQuantity);
            $boxQuantity = floor($boxQuantity);
            for ($i=0; $i < $boxQuantity; $i++) {
                $this->orderModel->createDesign(
                    array(
                        OrderRepository::DESIGN_ORDER        => $pedido->id,
                        OrderRepository::DESIGN_ORDER_DETAIL => $orderItem->id,
                        OrderRepository::DESIGN_QUANTITY     => $itemsPerBox
                    )
                );
            }
        }
    }

    /**
     * Función que obtiene las cajas que se tienen que armar por pedido
     * para ser asignadas a lo trabajadores.
     *
     * @return json
     */
    public function tareasDelPedidoPorItem(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info("PreparacionJefeController - tareasDelPedidoPorItem ");
            if($request->has('id')) {
                $datos = $this->orderModel->getDesignGroupByItem($request->id);
            } else {
                $mensajes = array("No se tienen los datos necesarios");
            }
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - tareasDelPedidoPorItem - Error: '.$e->getMessage() );
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
     * Función para realizar la asignación de tareas por Item
     *
     * @return json
     */
    public function asignacionPorItem(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info("PreparacionJefeController - asignacionPorItem");
            if($request->has('id')
                && $request->has('usuario')) {
                Log::info("PreparacionJefeController - asignacionPorItem: ".$request->id." - ".$request->usuario);
                $designList = $this->orderModel->getDesignsByDetail($request->id);
                foreach ($designList as $item) {
                    $data = array(
                        AssignmentRepository::SQL_ORDID         => $item->order_id,
                        AssignmentRepository::SQL_ORDER_DETAIL  => $item->order_detail_id,
                        AssignmentRepository::SQL_ORDER_DESIGN  => $item->id,
                        AssignmentRepository::SQL_USRID         => $request->usuario
                    );
                    Log::info(" PreparacionJefeController - asignacionPorItem - data: ".json_encode($data));
                    $this->assigmentModel->create($data);
                }
            } else {
                $mensajes = array("No se tienen los datos necesarios para realizar la asignación de tareas");
            }
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - asignacionPorItem - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }
}
