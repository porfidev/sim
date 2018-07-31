<?php

namespace App\Http\Controllers\Embarque;

use DB;
use Log;
use Auth;
use Session;
use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;

use App\Http\Controllers\Controller;

use App\Repositories\TripRepository;
use App\Repositories\TrucksRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;

class TripsController extends Controller
{

    private $tripModel;
    private $truckModel;
    private $orderModel;
    private $catalogoModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        TripRepository $tr, TrucksRepository $tru, OrderRepository $ord, CatalogoRepository $cat)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->tripModel  = $tr;
        $this->truckModel  = $tru;
        $this->orderModel  = $ord;
        $this->catalogoModel  = $cat;
    }

    /**
     * Mostramos el listado de trucks
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request){

        try {

            Log::info("TripsController - listado ");

            $trips = $this->tripModel->getAllTripsId(Auth::id());
            $trucks = $this->truckModel->getAll();

            return view('trips.listado',
                array(
                    "trips" => $trips,
                    "trucks" => $trucks
                )
            );

        } catch (\Exception $e) {
            Log::error( 'TripsController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Mostramos el listado de trucks
     *
     * @return \Illuminate\Http\Response
     */
    public function listadoPedidos(Request $request){

        try {

            Log::info("TripsController - listadoPedidos ");

            $trips = $this->tripModel->getAllTrips();
            $trucks = $this->truckModel->getAll();
            $dist = $this->orderModel->getAllStatus(OrderRepository::DISTRIBUCION_RECIBIDO);
            $preDist = $this->orderModel->getAllStatus(OrderRepository::PREPARADO_VALIDADO);
            $foreign = $this->catalogoModel->getGroupById(95);

            return view('trips.listadoDist',
                array(
                    "trips" => $trips,
                    "trucks" => $trucks,
                    "dist" => $dist,
                    "preDist" => $preDist,
                    "foreign" => $foreign
                )
            );

        } catch (\Exception $e) {
            Log::error( 'TripsController - listadoPedidos - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    public function agregar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {

            Log::info(" TripsController - agregar ");            

            $validator = Validator::make(
                $request->all(),
                array(
                    'camion'   => 'required|numeric|max:191',
                    'fechaE'   => 'required',
                    'guia'     => 'max:191'
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();

            } else {

                $idPeds = $request->idPeds;

                if(empty($request->fechaE) && $request->boolC == 0){

                    $resultado = "ERROR";
                    $mensajes  = array( "Fecha vacia");
                    return response()->json(array(
                        Controller::JSON_RESPONSE => $resultado,
                        Controller::JSON_MESSAGE  => $mensajes
                    ));
                }

                if($request->boolF == 1 && $request->camion == 0){

                    $resultado = "ERROR";
                    $mensajes  = array( "selecciona un cámion");
                    return response()->json(array(
                        Controller::JSON_RESPONSE => $resultado,
                        Controller::JSON_MESSAGE  => $mensajes
                    ));
                }

                if($request->boolF == 2 && $request->linea == 0){

                    $resultado = "ERROR";
                    $mensajes  = array( "selecciona una linea transportista");
                    return response()->json(array(
                        Controller::JSON_RESPONSE => $resultado,
                        Controller::JSON_MESSAGE  => $mensajes
                    ));
                }

                if($request->boolF == 2 && empty($request->guia)){

                    $resultado = "ERROR";
                    $mensajes  = array( "Número de guia vacio");
                    return response()->json(array(
                        Controller::JSON_RESPONSE => $resultado,
                        Controller::JSON_MESSAGE  => $mensajes
                    ));
                }

                $fechasPed = array();

                foreach ($idPeds as $idP) {

                    $order = $this->orderModel->getById($idP);

                    if($order->client->appointment != 1){

                        if($this->orderModel->serchDate($request->fechaE,$idP) == null){

                            $resultado = "ERROR";
                            $mensajes  = array( "La fecha no esta dentro del rango de vigencia de algun pedido con id: ".$idP );
                            return response()->json(array(
                                Controller::JSON_RESPONSE => $resultado,
                                Controller::JSON_MESSAGE  => $mensajes
                            ));

                        }else{

                            array_push($fechasPed,$request->fechaE);
                        }

                    }else{

                        $fechaCli = date('Y-m-d', strtotime($order->client_appointment));

                        array_push($fechasPed,$fechaCli);
                    }
                }

                $fechinas = array();

                foreach ($fechasPed as $fech) {
                    
                    array_push($fechinas,strtotime($fech) * 1000);
                }

                sort($fechinas);

                if($request->boolF == 1){

                    $data = array(
                        TripRepository::SQL_TRUCK_ID  => $request->camion,
                        TripRepository::SQL_ARRIVE  => date('Y-m-d', ($fechinas[0]/1000)),
                        TripRepository::SQL_STATUS  => TripRepository::CREADO
                    );

                }else{

                    $data = array(
                        TripRepository::SQL_ARRIVE  => date('Y-m-d', ($fechinas[0]/1000)),
                        TripRepository::SQL_STATUS  => TripRepository::FORANEO,
                        TripRepository::SQL_FOREIGN  => $request->linea,
                        TripRepository::SQL_GUIDE  => $request->guia
                    );
                }

                

                Log::info(" TripsController - agregar - data: ".json_encode($data));
                $idTrip = $this->tripModel->create($data)->id;

                Log::info(" TripsController - lastInsertId: ".$idTrip);

                foreach ($idPeds as $idP) {

                    $data2 = array(
                        TripRepository::SQL_TRIP_ID  => $idTrip,
                        TripRepository::SQL_ORDER_ID  => $idP
                    );

                    Log::info(" TripsController - agregar - data: ".json_encode($data2));
                    $this->tripModel->createTO($data2);

                    $data3 = array(
                        OrderRepository::SQL_ESTATUS  => OrderRepository::DISTRIBUCION_PROCESO
                    );

                    Log::info(" TripsController - agregar - data: ".json_encode($data2));
                    $this->orderModel->update($idP,$data3);

                }

            }


        } catch (\Exception $e) {
            Log::error( 'TripsController - agregar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    function recibir(Request $request){

        $resultado = "OK";
        $mensajes  = "NA";

        Log::info(" TripsController - recibir idPed : ".$request->get('id'));

        try{

            $idPed = $request->get('id');

            $datosW = array();
            $datosW[OrderRepository::SQL_ESTATUS] = OrderRepository::DISTRIBUCION_RECIBIDO;

            if(!$this->orderModel->update($idPed,$datosW)) {

                $resultado = "ERROR";
                $mensajes  = array( "No se pudo validar el pedido" );

            }else{

                $datos['order_id'] = $idPed;
                $datos['trace_type'] = OrderRepository::TRACE_RECIBIR_DIST;
                $datos['user_id'] = Auth::id();

                $this->orderModel->addTrace($datos);
            }


        } catch (\Exception $e) {

            Log::error( 'TripsController - recibir - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );

        }

        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    function cerrar(Request $request){

        $resultado = "OK";
        $mensajes  = "NA";

        Log::info(" TripsController - cerrar idPed : ".$request->get('id'));

        try{

            $idV = $request->get('id');

            $datosW = array();
            $datosW[TripRepository::SQL_STATUS] = TripRepository::VALIDADO;

            if(!$this->tripModel->update($idV,$datosW)) {

                $resultado = "ERROR";
                $mensajes  = array( "No se pudo validar el viaje" );

            }


        } catch (\Exception $e) {

            Log::error( 'TripsController - cerrar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );

        }

        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    function validaViaje(Request $request){

        $resultado = "OK";
        $mensajes  = "NA";

        Log::info(" TripsController - validaViaje id: ".$request->get('id'));

        try{

            $idPed = $request->get('id');

            $datosW = array();
            $datosW[OrderRepository::SQL_ESTATUS] = OrderRepository::DISTRIBUCION_RECIBIDO;

            if(!$this->orderModel->update($idPed,$datosW)) {

                $resultado = "ERROR";
                $mensajes  = array( "No se pudo validar el pedido" );

            }else{

                $datos['order_id'] = $idPed;
                $datos['trace_type'] = OrderRepository::TRACE_RECIBIR_DIST;
                $datos['user_id'] = Auth::id();

                $this->orderModel->addTrace($datos);
            }


        } catch (\Exception $e) {

            Log::error( 'TripsController - recibir - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );

        }

        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /*public function editar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {

            Log::info(" CamionesController - editar ");

            $validator = Validator::make(
                $request->all(),
                array(
                    'marca'   => 'required|string|max:191',
                    'smarca'   => 'required|string|max:191',
                    'modelo'   => 'required|string|max:191',
                    'placas'   => 'required|string|max:191',
                    'capacidad'   => 'required|string|max:191',
                    'operador'   => 'required|string|max:191',
                    'serie'      => 'required|string|max:191'
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();

            } else {

                $data = array(
                        TrucksRepository::SQL_MARCA  => $request->marca,
                        TrucksRepository::SQL_SUBMARCA  => $request->smarca,
                        TrucksRepository::SQL_MODELO  => $request->modelo,
                        TrucksRepository::SQL_PLACAS  => $request->placas,
                        TrucksRepository::SQL_CAPACIDAD  => $request->capacidad,
                        TrucksRepository::SQL_OPERADOR  => $request->operador,
                        TrucksRepository::SQL_SERIE  => $request->serie

                );

                Log::info(" CamionesController - editar - data: ".json_encode($data));
                $this->truckModel->update($request->id ,$data);

            }


        } catch (\Exception $e) {
            Log::error( 'CamionesController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    public function eliminar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" CamionesController - eliminar ");
            if( $request->has('id') ) {
                Log::info(" CamionesController - eliminar: ".$request->get('id') );
                $catItem = $this->truckModel->getById( $request->get('id') );
                if( !empty($catItem) ) {
                    Log::debug(" CamionesController - eliminar: ".json_encode($catItem) );
                    DB::beginTransaction();
                    $result = $this->truckModel->delete( $request->get('id') );
                    Log::debug(" CamionesController - eliminar - result: ".json_encode($result) );
                    if(!$result) {
                        $resultado = "ERROR";
                        $mensajes  = array( "No se pudo elimnar el elemento" );
                        DB::rollBack();
                    } else {
                        DB::commit();
                    }
                } else {
                    Log::error("CamionesController - eliminar: El objeto catItem esta vacío");
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del elemento" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento" );
            }
        } catch (\Exception $e) {
            Log::error( 'CamionesController - eliminar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    public function asignaTarima(Request $request) {

        $resultado = "OK";
        $mensajes  = "NA";
        $cantidad = 0;

        try {

            $caja = $this->boxModel->getBoxByLabel($request->get('cod'));
            $tar = $this->palletModel->getById($request->get('idTar'));

            if($caja != null){

                if($caja == 2){

                    $des = $this->orderModel->getIdOrdByBox($caja->id);

                    if($tar->order_id == null){                        

                        $dataPall = array(
                                    PalletRepository::SQL_ORDER_ID  => $des->order_id
                                );
                        $this->palletModel->update($tar->id,$dataPall);
                    }

                    $tar = $this->palletModel->getById($request->get('idTar'));

                    if($tar->order_id == $des->order_id){

                        if($this->pallBoxModel->getByPallBox($tar->id,$caja->id) == null){

                            $dataPallBox = array(
                                    PallBoxRepository::SQL_BOX_ID     => $caja->id,
                                    PallBoxRepository::SQL_PALLET_ID  => $tar->id
                                );

                            $this->pallBoxModel->create($dataPallBox);

                            $listita = $this->pallBoxModel->getAllTar($tar->id);

                            $resultado = array( "idOrd" => $tar->order_id, "lista" => $listita);

                        }else{

                            $resultado = "ERROR";
                            $mensajes  = "Esta caja ya esta en la tarima";
                        }

                    }else{

                        $resultado = "ERROR";
                        $mensajes  = "Esta caja no pertenece al pedido de la tarima";
                    }

                }else{

                    $resultado = "ERROR";
                    $mensajes  = "Esta caja no esta lista";
                }

                
            }else{

                $resultado = "ERROR";
                $mensajes  = "No hay un codigo con esa caja";
            }

        } catch (\Exception $e) {
            Log::error( 'CamionesController - addDet - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    public function listaCajas(Request $request) {
        $response = array();
        $mensajes = array();
        $ordId = "";
        try {

            if($request->has("tar")) {
                $tar = $request->input("tar");
            }

            Log::info(" CamionesController - listaCajas ");

            $listado = $this->pallBoxModel->getAllTar($tar);

            $response = $listado->toArray();

            Log::info(" array especial: ".$listado);

        } catch (\Exception $e) {
            Log::error( 'CamionesController - listaCajas - Error: '.$e->getMessage() );
            $response = array();

        }
        //return response()->json($response, 200);
        return response()->json(
            array(
                Controller::JSON_RESPONSE => $response,
                Controller::JSON_MESSAGE  => $mensajes
            )
        );
    }*/

}
