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

use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\PalletRepository;
use App\Repositories\TrucksRepository;

class CamionesController extends Controller
{

    private $orderDetailModel;
    private $orderModel;
    private $palletModel;
    private $truckModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        OrderDetailRepository $detail,
        OrderRepository $order,
        PalletRepository $pall,
        TrucksRepository $tru)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->orderDetailModel  = $detail;
        $this->orderModel        = $order;
        $this->palletModel    = $pall;
        $this->truckModel    = $tru;
    }

    /**
     * Mostramos el listado de trucks
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request){

        try {

            Log::info("CamionesController - listado ");

            $truck = $this->truckModel->getAll();

            return view('camiones.listado',
                array(
                    "camiones" => $truck
                )
            );

        } catch (\Exception $e) {
            Log::error( 'CamionesController - listadoTarimas - Error'.$e->getMessage() );
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

            Log::info(" CamionesController - agregar ");

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

                Log::info(" CamionesController - agregar - data: ".json_encode($data));
                $this->truckModel->create($data);

            }


        } catch (\Exception $e) {
            Log::error( 'CamionesController - agregar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    public function editar(Request $request) {
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

    /**
     * Función para obtener datos de una orden asignada
     */
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
    }

}
