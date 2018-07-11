<?php

namespace App\Http\Controllers\Preparacion;

use DB;
use Log;
use Auth;
use Validator;
use Session;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;

use App\Http\Controllers\Controller;

use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;
use App\Repositories\BoxesRepository;
use App\Repositories\AssignmentRepository;
use App\Repositories\DistributionRepository;

class PreparacionJefeController extends Controller
{

    private $productModel;
    private $orderDetailModel;
    private $orderModel;
    private $catalogModel;
    private $boxModel;
    private $assigmentModel;
    private $distributionModel;

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
        AssignmentRepository $assigment,
        DistributionRepository $distribution)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->productModel      = $product;
        $this->orderDetailModel  = $detail;
        $this->orderModel        = $order;
        $this->catalogModel      = $catalog;
        $this->boxModel          = $box;
        $this->assigmentModel    = $assigment;
        $this->distributionModel = $distribution;
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

    /**
     * Se muestra la pantalla para validación de un pedido.
     * Se puede consultar el contenido de una caja y su estado.
     * Al concluir la revisión de las cajas se debe realizar la
     * acción de validación
     *
     * @return \Illuminate\Http\Response
     */
    public function mostrarInformacion(Request $request)
    {
        try {
            return view('preparacion.informacion');
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - mostrarValidacion - Exception: '.$e->getMessage() );
            Log::error( "PreparacionJefeController - mostrarValidacion - Trace: \n".$e->getTraceAsString() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para obtener información de una caja.
     * Orden a la que pertence y que productos contiene.
     *
     * @return json
     */
    public function obtenerInformacion(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info("PreparacionJefeController - obtenerInformacion");
            $validator = Validator::make(
                $request->all(),
                array(
                    'caja' => 'required|string|exists:box_ids,id',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $datos = $this->orderModel->getDesignListByBox($request->caja);
                $data  = null;
                if(count($datos) > 0){
                    $data = $this->orderModel->getMaxMin($datos[0]->order_id);
                    Log::info("PreparacionJefeController - obtenerInformacion - min: ".$data->min." max: ".$data->max);
                }
                foreach ($datos as $item) {
                    Log::info("PreparacionJefeController - obtenerInformacion: \n".json_encode($item));
                    if(isset($data)) {
                        $item->min = $data->min;
                        $item->max = $data->max;
                    }
                    if(isset($item->orderDetail)) {
                        Log::info("PreparacionJefeController - obtenerInformacion - Obtenemos producto: \n".json_encode($item->orderDetail));
                        $item->orderDetail->product;
                    }
                }
            }
        } catch (\Exception $e) {
            Log::error( "PreparacionJefeController - obtenerInformacion - Exception: ".$e->getMessage() );
            Log::error( "PreparacionJefeController - obtenerInformacion - Trace: \n".$e->getTraceAsString() );
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
     * Función para cambiar el estatus de la orden a validado
     *
     * @return json
     */
    public function valida(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info("PreparacionJefeController - valida");
            $validator = Validator::make(
                $request->all(),
                array(
                    'pedido' => 'required|string|exists:orders,id',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                DB::beginTransaction();
                $this->orderModel->update(
                    $request->pedido,
                    array(
                        OrderRepository::SQL_ESTATUS => OrderRepository::PREPARADO_VALIDADO
                    )
                );
                $this->orderModel->addTrace(
                    array(
                        OrderRepository::TRACE_SQL_ORER => $request->pedido,
                        OrderRepository::TRACE_SQL_USER => Auth::id(),
                        OrderRepository::TRACE_SQL_TYPE => OrderRepository::TRACE_VALIDAR_PP
                    )
                );
                DB::commit();
            }
        } catch (\Exception $e) {
            Log::error( "PreparacionJefeController - valida - Exception: ".$e->getMessage() );
            Log::error( "PreparacionJefeController - valida - Trace: \n".$e->getTraceAsString() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /**
     * Función para guardar csv de pedido en tabla reparto
     *
     * @return json
     */

    public function CSVReparto() {
        Log::debug("PreparacionJefeController - CSVReparto");
        try {
            $file = Input::file('CSVFile3');

            Log::debug(" PreparacionJefeController - CSVReparto - NombreCSV: ".$file );

            if(empty($file)){

                Session::flash('errores', 'No se selecciono un archivo CSV ');
                Log::debug(" PreparacionJefeController - CSVReparto - archivo vacio " );
                return Redirect::route('preparacion.listadoJ');
            }

            //valida que el archivo sea de tipo excel

            /*if($file->getMimeType() != "application/vnd.ms-excel" || 
                $file->getMimeType() != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"){

                Session::flash('errores', 'El archivo seleccionado no es un CSV');
                Log::debug(" PreparacionJefeController - CSVReparto - no es texto " );
                return Redirect::route('preparacion.listadoJ');
            }*/

            $gestor = fopen($file->getRealPath(), "r");
            $deliminator = ";";
            $contador = 0;
            $contMod = 0;
            $contadorArchivoCSV = 0;
            $producto = null;
            $pedido = null;
            DB::beginTransaction();
            while (($datos = fgetcsv($gestor, 10000, $deliminator)) !== FALSE) {

                Log::info("_________________________________________________________________");
                Log::info("Datos: ".json_encode($datos));

                if($contadorArchivoCSV > 3){

                    $producto = $this->ProductRepository->getByCode($datos[9]);

                    $data = array(
                        DistributionRepository::SQL_ID_ORDER    => $pedido->numat,
                        DistributionRepository::SQL_SKU         => $producto->sku,
                        DistributionRepository::SQL_QUANTITY    => $datos[11],
                        DistributionRepository::SQL_SHOP        => $datos[0]
                    );

                    $this->distributionModel->create($data);

                    $contador++;

                }elseif($contadorArchivoCSV == 1){

                    $pedido = $this->OrderRepository->getByNumat($datos[0]);
                }

                $contadorArchivoCSV++;
            }
            DB::commit();
            Session::flash('exito', 'Se han agregado: '.$contador.' clientes y se modificaron:  '.$contMod);
            return Redirect::route('preparacion.listadoJ');

        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - CSVReparto - Error: '.$e->getMessage() );
            DB::rollback();
            Session::flash('errores', 'ocurrio el siguiente error: '.$e->getMessage());
            return Redirect::route('preparacion.listadoJ');
        }
    }
}
