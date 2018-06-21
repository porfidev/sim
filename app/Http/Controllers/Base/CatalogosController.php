<?php

namespace App\Http\Controllers\Base;

use Validator;
use Auth;
use DB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use App\Repositories\CatalogoRepository;

class CatalogosController extends Controller{

    private $catalogoModel;

    const SESSION_ID       = "sc_id";
    const SESSION_ETIQUETA = "sc_etiqueta";
    const SESSION_GRUPO    = "sc_grupo";
    const SESSION_VALOR    = "sc_valor";
    const SESSION_ESTATUS  = "sc_estatus";

    /**
     * Create a new catalogos instance.
     *
     * @return void
     */
    public function __construct(CatalogoRepository $cat){

        $this->middleware(['auth', 'permission']);
        $this->catalogoModel  = $cat;
    }

    /**
     * Show the catalogos list.
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request){



        try {
            Log::info(" CatalogosController - listado ");

            if ( $request->isMethod('post') ) {
                if( $request->has(self::SESSION_ID)) {
                    $request->session()->put(self::SESSION_ID, $request->input(self::SESSION_ID));
                }

                if( $request->has(self::SESSION_ETIQUETA)) {
                    $request->session()->put(self::SESSION_ETIQUETA, $request->input(self::SESSION_ETIQUETA));
                }

                if( $request->has(self::SESSION_GRUPO)) {
                    $request->session()->put(self::SESSION_GRUPO, $request->input(self::SESSION_GRUPO));
                }

                if( $request->has(self::SESSION_VALOR)) {
                    $request->session()->put(self::SESSION_VALOR, $request->input(self::SESSION_VALOR));
                }

                if( $request->has(self::SESSION_ESTATUS)) {
                    $request->session()->put(self::SESSION_ESTATUS, $request->input(self::SESSION_ESTATUS));
                }
            }
            $search = array();
            if ( $request->session()->has(self::SESSION_ID)
                    && $request->session()->get(self::SESSION_ID) != '0' ) {
                $search[CatalogoRepository::SQL_ID] = $request->session()->get(self::SESSION_ID);
            }
            if ($request->session()->has(self::SESSION_ETIQUETA)
                    && $request->session()->get(self::SESSION_ETIQUETA) != 'NA' ) {
                $search[CatalogoRepository::SQL_ETIQUETA] = $request->session()->get(self::SESSION_ETIQUETA);
            }
            if ($request->session()->has(self::SESSION_GRUPO)
                    && $request->session()->get(self::SESSION_GRUPO) != '0' ) {
                $search[CatalogoRepository::SQL_GRUPO_ID] = $request->session()->get(self::SESSION_GRUPO);
            }
            if ($request->session()->has(self::SESSION_VALOR)
                    && $request->session()->get(self::SESSION_VALOR) != '0' ) {
                $search[CatalogoRepository::SQL_VALOR] = $request->session()->get(self::SESSION_VALOR);
            }
            if ($request->session()->has(self::SESSION_ESTATUS)
                    && $request->session()->get(self::SESSION_ESTATUS) != '-1' ) {
                $search[CatalogoRepository::SQL_ESTATUS] = $request->session()->get(self::SESSION_ESTATUS);
            }
            Log::info(" UsuariosController - listado - search: ".json_encode($search));

            $listado = $this->catalogoModel->getAll($search);
            $padres = $this->catalogoModel->getPadres();

            return view('catalogos.listado',
                array(
                    "listado" => $listado,
                    "padresCat" => $padres
                ));
        } catch (\Exception $e) {
            Log::error( 'CatalogosController - listado - Error'.$e->getMessage() );
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
            Log::info(" CatalogosController - agregar ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'etiqueta'   => 'required|string|max:191',
                    'valor'      => 'required|string|max:20'
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();

            } else {

                if($request->grupo == 0){

                    $data = array(
                    CatalogoRepository::SQL_ETIQUETA  => $request->etiqueta,
                    CatalogoRepository::SQL_VALOR   => $request->valor
                );

                }else{

                    $data = array(
                    CatalogoRepository::SQL_ETIQUETA  => $request->etiqueta,
                    CatalogoRepository::SQL_GRUPO_ID => $request->grupo,
                    CatalogoRepository::SQL_VALOR   => $request->valor
                );

                }

                Log::info(" CatalogosController - agregar - data: ".json_encode($data));
                $this->catalogoModel->create($data);
            }
        } catch (\Exception $e) {
            Log::error( 'CatalogosController - agregar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = $e->getMessage();
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes));
    }

    public function editar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" CatalogosController - editar ");
            if($request->has('id'))
            {
                $catalogo = $this->catalogoModel->getById( $request->get('id') );
                if( !empty($catalogo) )
                {
                    $validator = Validator::make(
                        $request->all(),
                        array(
                            'etiqueta'   => 'required|string|max:191',                            
                            'valor'      => 'required|string|max:20',
                        ),
                        Controller::$messages
                    );
                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = $validator->errors();
                    } else {

                        if($request->grupo == 0){

                            $grupito = null;

                        }else{

                            $grupito = $request->grupo;
                        }

                        $datos = array();
                        $datos[CatalogoRepository::SQL_ETIQUETA]   = $request->etiqueta;
                        $datos[CatalogoRepository::SQL_GRUPO_ID]  = $grupito;
                        $datos[CatalogoRepository::SQL_VALOR]    = $request->valor;

                        if(!$this->catalogoModel->update( $request->get('id'), $datos)) {
                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el catalogo" );
                        }
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos de catalogo" );
                }
            }

        } catch (\Exception $e) {
            Log::error( 'CatalogosController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }

    public function eliminar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" CatalogosController - eliminar ");
            if( $request->has('id') ) {
                Log::info(" CatalogosController - eliminar: ".$request->get('id') );
                $catItem = $this->catalogoModel->getById( $request->get('id') );
                if( !empty($catItem) ) {
                    Log::debug(" CatalogosController - eliminar: ".json_encode($catItem) );
                    DB::beginTransaction();
                    $result = $this->catalogoModel->delete( $request->get('id') );
                    Log::debug(" CatalogosController - eliminar - result: ".json_encode($result) );
                    if(!$result) {
                        $resultado = "ERROR";
                        $mensajes  = array( "No se pudo elimnar el elemento" );
                        DB::rollBack();
                    } else {
                        DB::commit();
                    }
                } else {
                    Log::error("CatalogosController - eliminar: El objeto catItem esta vacío");
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del elemento" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento" );
            }
        } catch (\Exception $e) {
            Log::error( 'CatalogosController - eliminar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /**
     * Función para consultar los elementos de un catálogo
     * Se usa en ajax.
     *
     * @return json
     */
    public function obtenerCatalogo(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" CatalogosController - obtenerCatalogo ");
            if( $request->has('id') ) {
                $datos = $this->catalogoModel->getGroupById($request->id);
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "Es necesario el grupo para poder obtener el catálogo." );
            }
        } catch (\Exception $e) {
            Log::error( 'CatalogosController - obtenerCatalogo - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes,
            Controller::JSON_DATA     => $datos
        ));
    }
}