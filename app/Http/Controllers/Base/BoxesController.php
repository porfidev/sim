<?php

namespace App\Http\Controllers\Base;

use Validator;
use Auth;
use DB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use App\Repositories\BoxesRepository;

class BoxesController extends Controller{

    private $boxesModel;

    /**
     * Create a new boxes instance.
     *
     * @return void
     */
    public function __construct(BoxesRepository $box){

        $this->middleware(['auth', 'permission']);
        $this->boxesModel = $box;
    }

    /**
     * Show the boxes list.
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request){

        try {
            Log::info(" BoxesController - listado ");

            $listado = $this->boxesModel->getAll();

            return view('boxes.listado',
                array(
                    "listado" => $listado
                ));
        } catch (\Exception $e) {
            Log::error( 'BoxesController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    public function agregar(Request $request){

        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" BoxesController - agregar ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'descripcion' => 'required|string|max:191',
                    'anchura'     => 'required|numeric',
                    'altura'      => 'required|numeric',
                    'profundidad' => 'required|numeric'
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();

            } else {

               

                $data = array(
                BoxesRepository::SQL_DESCRIPCION  => $request->descripcion,
                BoxesRepository::SQL_ANCHURA => $request->anchura,
                BoxesRepository::SQL_ALTURA   => $request->altura,
                BoxesRepository::SQL_PROFUNDIDAD   => $request->profundidad
                );

               

                Log::info(" BoxesController - agregar - data: ".json_encode($data));
                $this->boxesModel->create($data);
            }
        } catch (\Exception $e) {
            Log::error( 'BoxesController - agregar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = $e->getMessage();
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes));
    }

    public function eliminar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" BoxesController - eliminar ");
            if( $request->has('id') ) {
                Log::info(" BoxesController - eliminar: ".$request->get('id') );
                $catItem = $this->boxesModel->getById( $request->get('id') );
                if( !empty($catItem) ) {
                    Log::debug(" BoxesController - eliminar: ".json_encode($catItem) );
                    DB::beginTransaction();
                    $result = $this->boxesModel->delete( $request->get('id') );
                    Log::debug(" BoxesController - eliminar - result: ".json_encode($result) );
                    if(!$result) {
                        $resultado = "ERROR";
                        $mensajes  = array( "No se pudo elimnar el elemento" );
                        DB::rollBack();
                    } else {
                        DB::commit();
                    }
                } else {
                    Log::error("BoxesController - eliminar: El objeto catItem esta vacío");
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del elemento" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento" );
            }
        } catch (\Exception $e) {
            Log::error( 'BoxesController - eliminar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

}