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
        $this->middleware(['auth', 'permission', 'update.session']);
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

            Log::info("SurtidoJefeController - listadoPedidos - listado ");

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
                $search[OrderRepository::SQL_ESTATUS]     = $request->session()->get(self::SESSION_ESTATUS);
            } else {
                $search[OrderRepository::SQL_ESTATUS]     = OrderRepository::PREPARADO_RECIBIDO;
                $search[OrderRepository::STATUS_OPERATOR] = "<";
            }
            Log::info(" SurtidoJefeController - listadoPedidos - search: ".json_encode($search));


            $listado = $this->calcModel->getAllOrd($search);
            Log::info(" SurtidoJefeController-  listadoPedidos - listado - count: ".$listado->count());

            $listado = $listado->paginate(10);

            return view('surtir.jefe',
                array(
                    "listado" => $listado
                )
            );

        } catch (\Exception $e) {
            Log::error( 'SurtidoJefeController - listadoPedidos - Exception: '.$e->getMessage() );
            Log::error( "SurtidoJefeController - listadoPedidos - Trace: \n".$e->getTraceAsString() );
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
            Log::info(" listadoPedidos - listadoTareasJ - buscando: idOrd: ".$idPed);
            $codigo = $this->orderModel->getById($idOrd)->codeOrder;
            $status = $this->orderModel->getById($idOrd)->status;
            if(ProductController::checaPedUsrJ($idOrd,$this->ordDetModel)){

                $terminado  = 1;

            }else{

                $terminado  = 0;

            }
            //$userId = 2;

            $listado = $this->ordDetModel->getByIdOrd($idPed);
            Log::info(" listadoPedidos - listadoTareasJ - obtuve: ".$listado);

            /*foreach ($listado as $ped) {

                if( $ped->pres_req == "BOX"){

                    $cantU = ($ped->quantity_user / $ped->itemsDisp) / $ped->dispBox;
                    $cantT = ($ped->quantity / $ped->itemsDisp) / $ped->dispBox;
                    $cantB = ($ped->quantity_boss / $ped->itemsDisp) / $ped->dispBox;

                }elseif ($ped->pres_req == "DSP"){

                    $cantU = ($ped->quantity_user / $ped->itemsDisp);
                    $cantT = ($ped->quantity / $ped->itemsDisp);
                    $cantB = ($ped->quantity_boss / $ped->itemsDisp);

                }else{

                    $cantU = $ped->quantity_user;
                    $cantT = $ped->quantity;
                    $cantB = $ped->quantity_boss;

                }
            }*/

            //Log::info(" listadoTareasJ - listado - Listita: ".$listado->get());

            return view('surtir.validaProyecto',
                array(

                    "listado" => $listado,
                    "idP" => $idOrd,
                    "cod" => $codigo,
                    "statusPed" => $status,
                    "terminado" => $terminado
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

            $buscaPro = $this->ordDetModel->getByIdOrd($request->get('idOrd'));
            $codigo = $request->get('cod');
            $ordEsp = null;

            foreach ($buscaPro as $elem) {
                
                if($elem->barcode == $codigo || $elem->disBarcode == $codigo || $elem->boxBarcode == $codigo){

                    $ordEsp = $elem;
                    break;
                }
            }

            if($ordEsp == null){

                $resultado = "ERROR";
                $mensajes  = array( "no existe ese codigo de barras" );

                return response()->json(array(
                Controller::JSON_RESPONSE => $resultado,
                Controller::JSON_MESSAGE  => $mensajes
                ));
            }


            Log::info(" SurtidoTrabajadorController - addDet sku : ".$ordEsp->itemcode);
            $product = $this->productModel->getBySku( $ordEsp->itemcode );
            Log::debug(" SurtidoTrabajadorController - addDet: ".json_encode($product) );

            $detalleOrder = $this->ordDetModel->getById($ordEsp->id);

            $modPed = $this->orderModel->getById($detalleOrder->idOrder);

            if($modPed->status < 4){
                
                $cantU = intval($ordEsp->quantity_boss);
                $cantT = intval($ordEsp->quantity);

                $resp = ProductController::validaSku($ordEsp->itemcode,$codigo,$cantU,$this->productModel); 

                Log::debug(" SurtidoTrabajadorController - cantCalculadaW: ".$resp[0] );                   

                if($resp[0] != -1) {

                    $cantidadTot = $resp[0] + $cantU;

                    if($cantidadTot <= $cantT){

                        Log::info("SurtidoTrabajadorController - addDet: idDet: ".$ordEsp->id." cantidadTot: ".$cantidadTot);
                        $datos = array();
                        $datos[OrderDetailRepository::SQL_CANTIDAD_B] = intval($cantidadTot);

                        if(!$this->ordDetModel->update($ordEsp->id,$datos)) {

                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el detalle" );

                        }else{

                            if($ordEsp->pres_req == "BOX"){

                                $cantidadTot = ($cantidadTot / $ordEsp->itemsDisp) / $ordEsp->dispBox; 

                            }else if($ordEsp->pres_req == "DSP"){

                                $cantidadTot = $cantidadTot / $ordEsp->itemsDisp; 

                            }else{

                                $cantidadTot = $cantidadTot; 

                            }

                            $resultado = array( "idDet" => $ordEsp->id, "cantEsp" => $cantidadTot);

                            $fecHor = date("Y-m-d H:i:s");

                            $dataHist = array(
                                HistorySupplyRepository::SQL_ORDID     => $detalleOrder->idOrder,
                                HistorySupplyRepository::SQL_DETID     => $ordEsp->id,
                                HistorySupplyRepository::SQL_PROID     => $product->id,
                                HistorySupplyRepository::SQL_USRID     => Auth::id(),
                                HistorySupplyRepository::SQL_QUANTITY  => $resp[0],
                                HistorySupplyRepository::SQL_DATIME    => $fecHor
                            );

                            $this->histModel->create($dataHist);

                            if(ProductController::checaPedUsrJ($detalleOrder->idOrder,$this->ordDetModel)){

                                //$datosW = array();
                                //$datosW[OrderRepository::SQL_ESTATUS] = 4;

                                //$this->orderModel->update($detalleOrder->idOrder,$datosW);
                                $mensajes  = "Terminado";
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

        Log::info(" SurtidoTrabajadorController - cierraPedJ idPed : ".$request->get('id'));

        try{

            $idPed = $request->get('id');

            $datosW = array();
            $datosW[OrderRepository::SQL_ESTATUS] = OrderRepository::SURTIDO_VALIDO;

            if(!$this->orderModel->update($idPed,$datosW)) {

                $resultado = "ERROR";
                $mensajes  = array( "No se pudo validar el pedido" );

            }

            $datos['order_id'] = $idPed;
            $datos['trace_type'] = OrderRepository::TRACE_VALDAR_SURTIDO;
            $datos['user_id'] = Auth::id();

            $this->orderModel->addTrace($datos);

            $pedido = $this->orderModel->getByIdCli($idPed);

            $servername = env('SQL_SERVER_NAME', '');
            $connectionInfo = array('Database' =>  env('SQL_DATABASE_NAME_2', '') , 
                                    'UID' => env('SQL_USER', ''),
                                    'PWD' => env('SQL_PASS', ''),
                                    'ReturnDatesAsStrings'=>true, 
                                    'CharacterSet' => 'UTF-8');

            $con = sqlsrv_connect($servername, $connectionInfo);

            if($con){

                Log::info("id: ".$pedido->codeOrder." cardCode: ".$pedido->code.
                          " cardName: ".$pedido->cliName." status: 'O'");
                $sql = "INSERT INTO VentasPedidosSim (Id, CardCode,CardName,Status) VALUES ".
                        "('".$pedido->codeOrder."', '565656', '".$pedido->cliName."', 'O')";

                /*$sql = "INSERT INTO VentasPedidosSim (Id, CardCode,CardName,Status) VALUES ".
                        "('12', '123-123', 'oxxo', 'O')";*/

                 Log::info("Query: ".$sql);

                $stmt = sqlsrv_query( $con, $sql);
                if( $stmt === false ) {
                     if( ($errors = sqlsrv_errors() ) != null) {
                        foreach( $errors as $error ) {
                            Log::info("cierraPedJ - SQLSTATE: ".$error[ 'SQLSTATE']);
                            Log::info("cierraPedJ - code: ".$error[ 'code']);
                            Log::info("cierraPedJ - message: ".$error[ 'message']);
                        }
                    }
                }
            }


        } catch (\Exception $e) {

            Log::error( 'SurtidoTrabajadorController - cierraPedJ - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );

        }

        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }
}