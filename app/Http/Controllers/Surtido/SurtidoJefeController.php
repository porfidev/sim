<?php

namespace App\Http\Controllers\Surtido;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;

use App\Repositories\CalculationRepository;

use Illuminate\Support\Facades\Auth;

use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\ClienteRepository;
use App\Repositories\HistorySupplyRepository;

use App\Http\Controllers\Base\ProductController;

class SurtidoJefeController extends Controller
{

    private $calcModel;
    private $productModel;
    private $ordDetModel;
    private $orderModel;
    private $histModel;
    private $cliModel;

    const SESSION_ID         = "sc_id";
    const SESSION_CLIENTE    = "sc_cliente";
    const SESSION_ESTATUS    = "sc_estatus";
    const SESSION_FECHA_PROG = "sc_fec_prog";
    const SESSION_FECHA_INI  = "sc_fec_ini";
    const SESSION_FECHA_FIN  = "sc_fec_fin";

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(CalculationRepository $cal,
        ProductRepository $product, OrderDetailRepository $det,
        OrderRepository $ord, HistorySupplyRepository $hist,
        ClienteRepository $cli)
    {
        $this->middleware(['auth', 'permission']);
        $this->calcModel    = $cal;
        $this->productModel = $product;
        $this->ordDetModel  = $det;
        $this->orderModel   = $ord;
        $this->histModel    = $hist;
        $this->cliModel     = $cli;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function listadoPedidos(Request $request){

        try {

            Log::info(" listadoPedidos - listado ");

            if ( $request->isMethod('post') ) {
                if( $request->has(self::SESSION_ID)) {
                    $request->session()->put(self::SESSION_ID, $request->input(self::SESSION_ID));
                }

                if( $request->has(self::SESSION_CLIENTE)) {
                    $request->session()->put(self::SESSION_CLIENTE, $request->input(self::SESSION_CLIENTE));
                }

                if( $request->has(self::SESSION_FECHA_PROG)) {
                    $request->session()->put(self::SESSION_FECHA_PROG, $request->input(self::SESSION_FECHA_PROG));
                }

                if( $request->has(self::SESSION_FECHA_INI)) {
                    $request->session()->put(self::SESSION_FECHA_INI, $request->input(self::SESSION_FECHA_INI));
                }

                if( $request->has(self::SESSION_FECHA_FIN)) {
                    $request->session()->put(self::SESSION_FECHA_FIN, $request->input(self::SESSION_FECHA_FIN));
                }

                if( $request->has(self::SESSION_ESTATUS)) {
                    $request->session()->put(self::SESSION_ESTATUS, $request->input(self::SESSION_ESTATUS));
                }
            }
            $search = array();
            if ( $request->session()->has(self::SESSION_ID)
                    && $request->session()->get(self::SESSION_ID) != '0' ) {
                $search[OrderRepository::SQL_CODIGO_ORDEN] = $request->session()->get(self::SESSION_ID);
            }
            if ($request->session()->has(self::SESSION_CLIENTE)
                    && $request->session()->get(self::SESSION_CLIENTE) != '-' ) {
                $search[ClienteRepository::SQL_NOMBRE] = $request->session()->get(self::SESSION_CLIENTE);
            }
            if ($request->session()->has(self::SESSION_FECHA_PROG)
                    && $request->session()->get(self::SESSION_FECHA_PROG) != 'NA' ) {
                $search[CalculationRepository::SQL_FP] = $request->session()->get(self::SESSION_FECHA_PROG);
            }
            if ($request->session()->has(self::SESSION_FECHA_INI)
                    && $request->session()->get(self::SESSION_FECHA_INI) != 'NA' ) {
                $search[OrderRepository::SQL_INICIO] = $request->session()->get(self::SESSION_FECHA_INI);
            }
            if ($request->session()->has(self::SESSION_FECHA_FIN)
                    && $request->session()->get(self::SESSION_FECHA_FIN) != 'NA' ) {
                $search[OrderRepository::SQL_FIN] = $request->session()->get(self::SESSION_FECHA_FIN);
            }
            if ($request->session()->has(self::SESSION_ESTATUS)
                    && $request->session()->get(self::SESSION_ESTATUS) != '-1' ) {
                $search[OrderRepository::SQL_ESTATUS] = $request->session()->get(self::SESSION_ESTATUS);
            }
            Log::info(" UsuariosController - listado - search: ".json_encode($search));


            $listado = $this->calcModel->getAllOrd($search);

            //Log::info(" listadoPedidos - listado - Listita: ".$listado->get());

            $listado = $listado->paginate(10);

            return view('surtir.jefe',
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

    public function listadoTareasJ($idPed){

        try {

            Log::info(" listadoTareasJ - listado ");

            $idOrd = $idPed;
            //$userId = 2;

            $listado = $this->ordDetModel->getByIdOrd($idOrd);

            //Log::info(" listadoTareasJ - listado - Listita: ".$listado->get());

            return view('surtir.validaProyecto',
                array(

                    "listado" => $listado,
                    "idP" => $idOrd
                ));

        } catch (\Exception $e) {
            Log::error( 'listadoTareasJ - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    public function addDetJ(Request $request) {

        $resultado = "OK";
        $mensajes  = "NA";
        $cantidad = 0;

        try {
            Log::info(" SurtidoTrabajadorController - addDet sku : ".$request->get('sku'));
            $product = $this->productModel->getBySku( $request->get('sku') );
            Log::debug(" SurtidoTrabajadorController - addDet: ".json_encode($product) );

            $detalleOrder = $this->ordDetModel->getById($request->get('idDet'));

            $modPed = $this->orderModel->getById($detalleOrder->idOrder);

            if($modPed->status < 4){

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
                        $datos[OrderDetailRepository::SQL_CANTIDAD_B] = intval($cantidadTot);

                        if(!$this->ordDetModel->update($request->get('idDet'),$datos)) {

                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el detalle" );

                        }else{

                            $resultado = $cantidadTot;

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

                            if(ProductController::checaPedUsrJ($detalleOrder->idOrder,$this->ordDetModel)){

                                $datosW = array();
                                $datosW[OrderRepository::SQL_ESTATUS] = 4;

                                $this->orderModel->update($detalleOrder->idOrder,$datosW);
                            }
                        }

                    } else {
                        $resultado = "ERROR";
                        $mensajes  = array( "Cantidad excedida" );
                    }
                }else{

                    $resultado = "ERROR";
                    $mensajes  = array( "no existe ese codigo de barras" );
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
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    function cierraPedJ(Request $request){

        $resultado = "OK";
        $mensajes  = "NA";

        Log::info(" ProductController - cierraPed idPed : ".$request->get('id'));

        try{

            $idPed = $request->get('id');

            $datosW = array();
            $datosW[OrderRepository::SQL_ESTATUS] = 4;

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