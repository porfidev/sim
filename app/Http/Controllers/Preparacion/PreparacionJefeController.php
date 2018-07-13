<?php

namespace App\Http\Controllers\Preparacion;

use DB;
use Log;
use Auth;
use Session;
use Validator;

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
        $boxType   = $this->boxModel->searchByName(BoxesRepository::ORIGIN_BOX);
        $sequence  = 0;
        foreach ($orderList as $orderItem) {
            Log::info("____________________________________________________________________________");
            $itemsPerBox = ($orderItem->itemsDisp * $orderItem->dispBox);
            $boxQuantity = $orderItem->quantity / $itemsPerBox;
            Log::info("PreparacionJefeController - recibirPedido - Cajas por Item: ".$orderItem->itemcode." - ".$boxQuantity);
            $boxQuantity = floor($boxQuantity);
            for ($i=0; $i < $boxQuantity; $i++) {
                $sequence += 1;
                $this->orderModel->createDesign(
                    array(
                        OrderRepository::DESIGN_SEQUENCE     => $sequence,
                        OrderRepository::DESIGN_BOX_TYPE     => $boxType->id,
                        OrderRepository::DESIGN_ORDER        => $pedido->id,
                        OrderRepository::DESIGN_ORDER_DETAIL => $orderItem->id,
                        OrderRepository::DESIGN_QUANTITY     => $itemsPerBox
                    )
                );
            }
        }
    }

    /**
     * Función para realizar el diseño de pedido
     *
     * @param array $lista
     */
    private function crearDisenioPedido($lista, &$sequence, $is_detail=true)
    {
        Log::info("PreparacionJefeController - crearDisenioPedido: ".count($lista)." elementos - ".$sequence);
        $biggestBox = $this->boxModel->getBiggestBox();
        $freeSpace  = $biggestBox->volumen;
        $size       = count($lista);
        foreach ($lista as $index => $item) {
            Log::info("________________________________________________ $index ________________________________________________");
            if($is_detail) {
                $detail = $item;
            } else {
                $detail = $item->detail()->with('product')->first();
            }
            $detail->order_id = $detail->idOrder;
            Log::info("PreparacionJefeController - crearDisenioPedido - item: \n".json_encode($item));
            Log::info("PreparacionJefeController - crearDisenioPedido - detail: \n".json_encode($detail));
            Log::info("PreparacionJefeController - crearDisenioPedido - secuencia: $sequence");
            Log::info("PreparacionJefeController - crearDisenioPedido - freeSpace: $freeSpace");
            $productVolume = ($detail->product->width * $detail->product->height * $detail->product->depth);

            // Para que nos quepa por lo menos 1 producto
            if($freeSpace < $productVolume) {
                Log::info("PreparacionJefeController - crearDisenioPedido - No nos cabe ni uno en la caja");
                // Cambiamos de caja para guardar los demás
                $sequence += 1;
                $freeSpace = $biggestBox->volumen;
            }

            // Obtenemos cuanto items caben en la caja
            $totalItems  = floor($freeSpace / $productVolume);
            Log::info("PreparacionJefeController - crearDisenioPedido - totalItems: $totalItems");

            // Verificamo que los productos quepan en la caja
            if($totalItems >= $item->quantity) {
                // Agregamos todos los productos a la caja
                Log::info("PreparacionJefeController - crearDisenioPedido - agrego items: ".$item->quantity." de ".$detail->product->sku);
                $usedBox = $biggestBox->id;
                $this->orderModel->createDesign(
                    array(
                        OrderRepository::DESIGN_SEQUENCE     => $sequence,
                        OrderRepository::DESIGN_BOX_TYPE     => $usedBox,
                        OrderRepository::DESIGN_ORDER        => $detail->order_id,
                        OrderRepository::DESIGN_ORDER_DETAIL => $detail->id,
                        OrderRepository::DESIGN_QUANTITY     => $item->quantity
                    )
                );
                $freeSpace -= ($productVolume * $item->quantity);
            } else {
                $qty = $item->quantity;
                while( $qty > 0 ){
                    Log::info("**************************************************************************");
                    Log::info("PreparacionJefeController - crearDisenioPedido - secuencia: $sequence");
                    Log::info("PreparacionJefeController - crearDisenioPedido - freeSpace: $freeSpace");
                    // Agregamos productos a la caja
                    $add = $totalItems;
                    $usedBox = $biggestBox->id;
                    if($qty - $totalItems < 0){
                        $add = $qty;
                        // Nos cabe todo en la caja, y es el último producto
                        // podemos buscar una caja mas pequeña
                        if($index+1 === $size){
                            Log::info("Es el final por lo que buscamos una caja más pequeña");
                            $box = $this->boxModel->getCorrectBox($qty*$productVolume);
                            if(!empty($box)){
                                Log::info("Ocupamos la caja: ".json_encode($box));
                                $usedBox = $box->id;
                            }
                        }
                    }
                    $qty -= $add;
                    Log::info("PreparacionJefeController - crearDisenioPedido - agrego items: ".$add." de ".$detail->product->sku);
                    Log::info("PreparacionJefeController - crearDisenioPedido - faltan: $qty");
                    if($add > 0) {
                        $this->orderModel->createDesign(
                            array(
                                OrderRepository::DESIGN_SEQUENCE     => $sequence,
                                OrderRepository::DESIGN_BOX_TYPE     => $usedBox,
                                OrderRepository::DESIGN_ORDER        => $detail->order_id,
                                OrderRepository::DESIGN_ORDER_DETAIL => $detail->id,
                                OrderRepository::DESIGN_QUANTITY     => $add
                            )
                        );
                    } else {
                        Log::warning("PreparacionJefeController - crearDisenioPedido - No se agregan porque son 0");
                    }
                    // Cambiamos de caja para guardar los demás
                    // Para que nos quepa por lo menos 1 producto
                    if($freeSpace < $productVolume) {
                        Log::info("PreparacionJefeController - crearDisenioPedido - No nos cabe ni uno en la caja");
                        // Cambiamos de caja para guardar los demás
                        $sequence += 1;
                        $freeSpace = $biggestBox->volumen;
                    } else {
                        $freeSpace -= ($productVolume * $add);
                        Log::info("PreparacionJefeController - crearDisenioPedido - Restamos para ver lo que nos queda de espacio: $freeSpace");
                    }
                    // Obtenemos cuanto items caben en la caja
                    $totalItems  = floor($freeSpace / $productVolume);
                }
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
                DB::beginTransaction();
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
                DB::commit();
            } else {
                $mensajes = array("No se tienen los datos necesarios para realizar la asignación de tareas");
            }
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - asignacionPorItem - Exception: '.$e->getMessage() );
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
     * Se puede consultar el contenido de una caja y su estado.
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
                    'caja' => 'required|string|exists:box_ids,label',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $box = $this->boxModel->getBoxByLabel($request->caja);
                Log::info("PreparacionJefeController - obtenerInformacion - caja: ".json_encode($box));
                if( !empty($box) ) {
                    $datos = $this->orderModel->getDesignListByBox($box->id);
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
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encotró caja" );
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
     * Función para saber si se ha terminado de validat todo
     * el pedido
     *
     * @param App\Order $order
     * @return integer 0: Terminado, 1: Sin terminar
     */
    public static function isFinish($order){
        $ans = 0;
        $details = $order->details;
        foreach ($details as $detail) {
            if($detail->quantity != $detail->quantity_op_boss){
                $ans += 1;
                break;
            }
        }
        return $ans;
    }

    /**
     * Función para crear el diseño del pedido pero sin agregar el CSV
     * de reparto por tienda.
     *
     * @return View
     */
    public function crearDisenioSinCSV(Request $request)
    {
        try {
            Log::info("PreparacionJefeController - crearDisenioSinCSV");
            if($request->has('id')){
                $pedido = $this->orderModel->getById($request->id);
                if(!empty($pedido)){
                    $lista = $this->orderModel->getDesignListByOrder($request->id);
                    DB::beginTransaction();
                    $sequence = 1;
                    $this->crearDisenioPedido($lista, $sequence);
                    $this->cambiarEstatusAdisenio($pedido);
                    DB::commit();
                    Session::flash('exito', 'Se ha creado el diseño del pedido');
                } else {
                    Session::flash('errores', 'No se encontro el pedido');
                }
            } else {
                Session::flash('errores', 'No se cuenta con los datos necesario para identificar el pedido');
            }
            return redirect()->route('preparacion.listado');
        } catch (\Exception $e) {
            Log::error( "PreparacionJefeController - crearDisenioSinCSV - Exception: ".$e->getMessage() );
            Log::error( "PreparacionJefeController - crearDisenioSinCSV - Trace: \n".$e->getTraceAsString() );
            DB::rollback();
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Mostramos el listado de productos a ser validados por un jefe
     * en preparación de pedidos
     *
     * @param integer $order_id
     * @return View
     */
    public function mostrarValidacion(Request $request, $order_id)
    {
        try {
            $order = $this->orderModel->getById($order_id);
            if(!empty($order)) {
                $terminado = self::isFinish($order);
                return view('preparacion.validacion',
                    array(
                        "order"     => $order,
                        "terminado" => $terminado,
                        "listado"   => $order->details()->with('product')->get()
                    )
                );
            } else {
                Log::error("PreparacionJefeController - mostrarValidacion - No se encontró orden: $order_id");
                return redirect()->route('preparacion.listado');
            }

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
     * Agrega a la cuenta del jefe de preparación lo que hay
     * en una caja para terminar de validar el pedido.
     *
     * @return json
     */
    public function agregarCaja(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info("PreparacionJefeController - agregarCaja");
            $validator = Validator::make(
                $request->all(),
                array(
                    'pedido' => 'required|string|exists:orders,id',
                    'caja'   => 'required|string|exists:box_ids,label'
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                $resultado = "ERROR";
                $mensajes  = $validator->errors();
            } else {
                DB::beginTransaction();
                $box = $this->boxModel->getBoxByLabel($request->caja);
                if( !empty($box) ){
                    $designs = $box->orderDesigns;
                    Log::info("PreparacionJefeController - agregarCaja - count: ".count($designs));
                    if(count($designs) > 0) {
                        Log::info("PreparacionJefeController - agregarCaja: ".json_encode($designs[0]));
                        Log::info("PreparacionJefeController - agregarCaja - pedido: ".$request->pedido);
                        if($request->pedido == $designs[0]->order_id){
                            if($box->status == BoxesRepository::BOX_ASSIGN) {
                                // Cambiamos el estado de la caja para saber que ya fue validada
                                $this->boxModel->updateBoxId(
                                    $box->id,
                                    array(
                                        BoxesRepository::SQL_BOX_ID_STATUS => BoxesRepository::BOX_VALID
                                    )
                                );
                                // Registramos lo que esta en la caja
                                $datos = $this->orderModel->getDesignListByBox($box->id);
                                foreach ($datos as $item) {
                                    $detail = $this->orderDetailModel->getById($item->order_detail_id);
                                    $quantity = 0;
                                    if(!empty($detail->quantity_op_boss)){
                                        $quantity = $detail->quantity_op_boss;
                                    }
                                    $this->orderDetailModel->update(
                                        $item->order_detail_id,
                                        array(
                                            OrderDetailRepository::SQL_CANTIDAD_OPB
                                                => ($quantity + $item->quantity)
                                        )
                                    );
                                }
                            } else {
                                $resultado = "ERROR";
                                $mensajes  = array("La caja ya ha sido validada");
                            }
                        } else {
                            $resultado = "ERROR";
                            $mensajes  = array("La caja no corresponde al pedido");
                        }
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array("No se encontró caja");
                }
                DB::commit();
            }
        } catch (\Exception $e) {
            Log::error( "PreparacionJefeController - agregarCaja - Exception: ".$e->getMessage() );
            Log::error( "PreparacionJefeController - agregarCaja - Trace: \n".$e->getTraceAsString() );
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
     * Función para cambiar de estatus un pedido a estado de diseño de pedido
     *
     * @param App\Order $pedido
     */
    private function cambiarEstatusAdisenio($pedido)
    {
        // Realizamos el cambio de estatus del pedido
        $datosW = array();
        $datosW[OrderRepository::SQL_ESTATUS] = OrderRepository::PREPARADO_DISENIO;
        $this->orderModel->update($pedido->id, $datosW);

        // Agregamos el seguimiento del pedido
        $datos = array();
        $datos['order_id']   = $pedido->id;
        $datos['trace_type'] = OrderRepository::TRACE_RECIBIR_DIST;
        $datos['user_id']    = Auth::id();
        $this->orderModel->addTrace($datos);
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
                Log::error(" PreparacionJefeController - CSVReparto - archivo vacio " );
                return Redirect::route('preparacion.listado');
            }

            $gestor = fopen($file->getRealPath(), "r");
            $deliminator = ",";
            $contador = 0;
            $contMod  = 0;
            $contadorArchivoCSV = 0;
            $producto = null;
            $pedido   = null;
            DB::beginTransaction();
            while (($datos = fgetcsv($gestor, 10000, $deliminator)) !== FALSE) {

                Log::info("_________________________________________________________________");
                Log::info("Datos: ".json_encode($datos));

                if($contadorArchivoCSV > 3) {

                    $producto = $this->productModel->getByCode($datos[9]);
                    $detail   = $this->orderDetailModel->getByOrdSku($pedido->id, $producto->sku);

                    if(empty($producto) || empty($detail)) {
                        Log::error("No se encontro producto o detalle del pedido correspondiente");
                        continue;
                    }

                    $data = array(
                        DistributionRepository::SQL_ID_ORDER    => $pedido->id,
                        DistributionRepository::SQL_SKU         => $producto->sku,
                        DistributionRepository::SQL_QUANTITY    => $datos[11],
                        DistributionRepository::SQL_SHOP        => $datos[0],
                        DistributionRepository::SQL_ID_DETAIL   => $detail->id
                    );

                    $this->distributionModel->create($data);

                    $contador++;

                } elseif($contadorArchivoCSV == 1) {
                    Log::info("PreparacionJefeController - CSVReparto - numat: ".$datos[0]);
                    $pedido = $this->orderModel->getByNumat($datos[0]);
                    if(empty($pedido)){
                        Session::flash('errores', 'No se encontro pedido con referencia: '.$datos[0]);
                        Log::error(" PreparacionJefeController - CSVReparto - No hay referencia: ".$datos[0] );
                        return Redirect::route('preparacion.listado');
                    }
                }

                $contadorArchivoCSV++;
            }

            // Realizamos el diseño del pedido con respecto a la distribución por tienda
            $shops = $this->distributionModel->getDistinctShops($pedido->id);
            $sequence = 1;
            foreach ($shops as $shop) {
                Log::info("PreparacionJefeController - CSVReparto - shop: ".json_encode($shop));
                $lista = $this->distributionModel->getItemsByShop($pedido->id, $shop->shop);
                Log::info(" ++++++++++++++++++++++++++++++++++++++++ ".$shop->shop." ++++++++++++++++++++++++++++++++++++++++ ");
                $this->crearDisenioPedido($lista, $sequence, false);
                $sequence += 1;
            }

            $this->cambiarEstatusAdisenio($pedido);
            DB::commit();

            Session::flash('exito', 'Se han agregado: '.$contador.' registros y se modificaron:  '.$contMod);
            return Redirect::route('preparacion.listado');

        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - CSVReparto - Exception: '.$e->getMessage() );
            Log::error( "PreparacionJefeController - CSVReparto - Trace: \n".$e->getTraceAsString() );
            DB::rollback();
            Session::flash('errores', 'Ocurrio el siguiente error: '.$e->getMessage());
            return Redirect::route('preparacion.listado');
        }
    }

}
