<?php


namespace App\Http\Controllers\Surtido;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\ProductController;

use App\Repositories\AssignmentRepository;
use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\HistorySupplyRepository;

use Illuminate\Support\Facades\Log;

class SurtidoTrabajadorController extends Controller
{

    private $assiModel;
    private $productModel;
    private $ordDetModel;
    private $orderModel;
    private $histModel;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(AssignmentRepository $as,
        OrderDetailRepository $det, OrderRepository $ord,
        HistorySupplyRepository $hist, ProductRepository $product )
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->assiModel    = $as;
        $this->productModel = $product;
        $this->ordDetModel  = $det;
        $this->orderModel   = $ord;
        $this->histModel    = $hist;
    }

    /**
     * Mostramos el listado de tareas que debe realizar un trabajador en
     * el proceso de surtido.
     *
     * @return \Illuminate\Http\Response
     */
     public function listadoTareas(){
        try {
            Log::info(" listadoPedidos - listado ");
            $listado = $this->assiModel->getPedUser(Auth::id());

            $listado = $listado->paginate(10);

            return view('surtir.pedidosUsuario',
                array(

                    "listado" => $listado
                ));

        } catch (\Exception $e) {
            Log::error( 'listadoPedidos - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para obtener datos de una orden asignada
     */
    public function listaAsig(Request $request) {
        $response = array();
        $mensajes = array();
        $ordId = "";
        try {

            if($request->has("ord")) {
                $ordId = $request->input("ord");
            }

            Log::info(" listadoPedidos - listaAsig ");

            $listado = $this->ordDetModel->getByIdOrd($ordId);

            $response = $listado->toArray();

            if(ProductController::checaPedUsr($ordId,$this->ordDetModel)){

                $terminado  = 1;

            }else{

                $terminado  = 0;

            }

            $mensajes = $terminado;

            Log::info(" array especial: ".$listado);

        } catch (\Exception $e) {
            Log::error( 'listadoPedidos - listaAsig - Error: '.$e->getMessage() );
            $response = array();

        }
        //return response()->json($response, 200);
        return response()->json(array(
                Controller::JSON_RESPONSE => $response,
                Controller::JSON_MESSAGE  => $mensajes
                ));
    }

    /**
     * Función para agregar productos a las tareas de un trabajador
     * (En Surtudo de pedidos)
     *
     * @param sku   String  Clave del producto a agregar
     * @param idDet integer Id del item dentro del pedido
     */
    public function addDet(Request $request) {

        $resultado = "OK";
        $mensajes  = "NA";
        $cerrado  = 0;

        try {
            Log::info(" SurtidoTrabajadorController - addDet sku : ".$request->get('sku'));
            $product = $this->productModel->getBySku( $request->get('sku') );
            Log::debug(" SurtidoTrabajadorController - addDet: ".json_encode($product) );

            $detalleOrder = $this->ordDetModel->getById($request->get('idDet'));

            $modPed = $this->orderModel->getById($detalleOrder->idOrder);

            if($modPed->status < 3){

                $codigo = $request->get('cod');
                $cantU = intval($request->get('cantU'));
                $cantT = intval($request->get('cant'));

                $resp = ProductController::validaSku($request->get('sku'),$codigo,$cantU,$this->productModel); 

                Log::debug(" SurtidoTrabajadorController - cantCalculadaW: ".$resp[0] );                   

                if($resp[0] != -1) {

                    $cantidadTot = $resp[0] + $cantU;

                    if($cantidadTot <= $cantT){

                        Log::info("SurtidoTrabajadorController - addDet: idDet: ".$request->get('idDet')." cantidadTot: ".$cantidadTot);
                        $datos = array();
                        $datos[OrderDetailRepository::SQL_CANTIDAD_U] = intval($cantidadTot);

                        if(!$this->ordDetModel->update($request->get('idDet'),$datos)) {

                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el detalle" );

                        }else{

                            $resultado = $cantidadTot;

                            $datosE = array();
                            $datosE[OrderRepository::SQL_ESTATUS] = OrderRepository::SURTIDO_PROCESO;

                            $this->orderModel->update($detalleOrder->idOrder,$datosE);

                            $fecHor = date("Y-m-d H:i:s");

                            $dataHist = array(
                                HistorySupplyRepository::SQL_ORDID     => $detalleOrder->idOrder,
                                HistorySupplyRepository::SQL_DETID     => $request->get('idDet'),
                                HistorySupplyRepository::SQL_PROID     => $product->id,
                                HistorySupplyRepository::SQL_USRID     => Auth::id(),
                                HistorySupplyRepository::SQL_QUANTITY  => $resp[0],
                                HistorySupplyRepository::SQL_DATIME    => $fecHor
                            );

                            $this->histModel->create($dataHist);

                            if(ProductController::checaPedUsr($detalleOrder->idOrder,$this->ordDetModel)){

<<<<<<< HEAD
                                /*$datosW = array();
                                $datosW[OrderRepository::SQL_ESTATUS] = 3;
=======
                                $datosW = array();
                                $datosW[OrderRepository::SQL_ESTATUS] = OrderRepository::SURTIDO_POR_V;
>>>>>>> 64fee531fcd609902cd877aba875f80aa034d51c

                                $this->orderModel->update($detalleOrder->idOrder,$datosW);*/

                                $cerrado = $detalleOrder->idOrder;
                                $mensajes  = array( "Pedido surtido" );
                            }
                        }

                    } else {
                        $resultado = "ERROR";
                        $mensajes  = array( "Cantidad excedida" );
                    }
                } else {
                        $resultado = "ERROR";
                        $mensajes  = array( "Codigo incorrecto" );
                }

            } else {
                $resultado = "ERROR";
                $mensajes  = array( "Este pedido ya esta Cerrado" );
            }
        } catch (\Exception $e) {
            Log::error( 'SurtidoTrabajadorController - addDet - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes,
            Controller::JSON_CERRADO  => $cerrado
        ));
    }

    function cierraPed(Request $request){

        $resultado = "OK";
        $mensajes  = "NA";

        Log::info(" ProductController - cierraPed idPed : ".$request->get('id'));

        try{

            $idPed = $request->get('id');

            $datosW = array();
            $datosW[OrderRepository::SQL_ESTATUS] = 3;

            if(!$this->orderModel->update($idPed,$datosW)) {

                $resultado = "ERROR";
                $mensajes  = array( "No se pudo cerrar el pedido" );

            }


        } catch (\Exception $e) {

            Log::error( 'ProductController - cierraPed - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );

        }

        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }
}