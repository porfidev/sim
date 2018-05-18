<?php

namespace App\Http\Controllers\Ventas;

use Validator;
use Auth;
use DB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use App\Repositories\ClienteRepository;

class ClientesController extends Controller{

    private $clienteModel;

    const SESSION_ID        = "scl_id";
    const SESSION_NOMBRE    = "scl_nombre";
    const SESSION_CORREO    = "scl_correo";
    const SESSION_TELEFONO  = "scl_telefono";
    const SESSION_RFC       = "scl_RFC";
    const SESSION_CP        = "scl_CP";
    const SESSION_CIUDAD    = "scl_ciudad";
    const SESSION_DIRECCION = "scl_direccion";
    const SESSION_ESTATUS   = "scl_estatus";

    /**
     * Create a new catalogos instance.
     *
     * @return void
     */
    public function __construct(ClienteRepository $cli){

        $this->middleware('auth');
        $this->clienteModel = $cli;
    }

    /**
     * Show the catalogos list.
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request){

        try {
            Log::info(" ClientesController - listado ");

            if ( $request->isMethod('post') ) {
                if( $request->has(self::SESSION_ID)) {
                    $request->session()->put(self::SESSION_ID, $request->input(self::SESSION_ID));
                }

                if( $request->has(self::SESSION_NOMBRE)) {
                    $request->session()->put(self::SESSION_NOMBRE, $request->input(self::SESSION_NOMBRE));
                }

                if( $request->has(self::SESSION_CORREO)) {
                    $request->session()->put(self::SESSION_CORREO, $request->input(self::SESSION_CORREO));
                }

                if( $request->has(self::SESSION_TELEFONO)) {
                    $request->session()->put(self::SESSION_TELEFONO, $request->input(self::SESSION_TELEFONO));
                }

                if( $request->has(self::SESSION_RFC)) {
                    $request->session()->put(self::SESSION_RFC, $request->input(self::SESSION_RFC));
                }

                if( $request->has(self::SESSION_CP)) {
                    $request->session()->put(self::SESSION_CP, $request->input(self::SESSION_CP));
                }

                if( $request->has(self::SESSION_CIUDAD)) {
                    $request->session()->put(self::SESSION_CIUDAD, $request->input(self::SESSION_CIUDAD));
                }

                if( $request->has(self::SESSION_DIRECCION)) {
                    $request->session()->put(self::SESSION_DIRECCION, $request->input(self::SESSION_DIRECCION));
                }

                if( $request->has(self::SESSION_ESTATUS)) {
                    $request->session()->put(self::SESSION_ESTATUS, $request->input(self::SESSION_ESTATUS));
                }
            }
            $search = array();
            if ( $request->session()->has(self::SESSION_ID)
                    && $request->session()->get(self::SESSION_ID) != '0' ) {
                $search[ClienteRepository::SQL_ID] = $request->session()->get(self::SESSION_ID);
            }
            if ($request->session()->has(self::SESSION_NOMBRE)
                    && $request->session()->get(self::SESSION_NOMBRE) != 'NA' ) {
                $search[ClienteRepository::SQL_NOMBRE] = $request->session()->get(self::SESSION_NOMBRE);
            }
            if ($request->session()->has(self::SESSION_CORREO)
                    && $request->session()->get(self::SESSION_CORREO) != 'NA' ) {
                $search[ClienteRepository::SQL_CORREO] = $request->session()->get(self::SESSION_CORREO);
            }
            if ($request->session()->has(self::SESSION_TELEFONO)
                    && $request->session()->get(self::SESSION_TELEFONO) != 'NA' ) {
                $search[ClienteRepository::SQL_TELEFONO] = $request->session()->get(self::SESSION_TELEFONO);
            }
            if ($request->session()->has(self::SESSION_RFC)
                    && $request->session()->get(self::SESSION_RFC) != 'NA' ) {
                $search[ClienteRepository::SQL_RFC] = $request->session()->get(self::SESSION_RFC);
            }
            if ($request->session()->has(self::SESSION_CP)
                    && $request->session()->get(self::SESSION_CP) != 'NA' ) {
                $search[ClienteRepository::SQL_CP] = $request->session()->get(self::SESSION_CP);
            }
            if ($request->session()->has(self::SESSION_CIUDAD)
                    && $request->session()->get(self::SESSION_CIUDAD) != 'NA' ) {
                $search[ClienteRepository::SQL_CIUDAD] = $request->session()->get(self::SESSION_CIUDAD);
            }
            if ($request->session()->has(self::SESSION_DIRECCION)
                    && $request->session()->get(self::SESSION_DIRECCION) != 'NA' ) {
                $search[ClienteRepository::SQL_DIRECCION] = $request->session()->get(self::SESSION_DIRECCION);
            }
            if ($request->session()->has(self::SESSION_ESTATUS)
                    && $request->session()->get(self::SESSION_ESTATUS) != '-1' ) {
                $search[ClienteRepository::SQL_ESTATUS] = $request->session()->get(self::SESSION_ESTATUS);
            }
            Log::info(" ClientesController - listado - search: ".json_encode($search));

            $listado = $this->clienteModel->getAll($search);
            return view('clientes.listado',
                array(
                    "listado" => $listado
                ));
        } catch (\Exception $e) {
            Log::error( 'ClientesController - listado - Error'.$e->getMessage() );
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
            Log::info(" ClientesController - agregar ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'nombre'    => 'required|string|max:191',
                    'email'    => 'required|string|email|max:120|unique:clients',
                    'telefono'  => 'required|string|max:191',
                    'rfc'       => 'required|string|max:20',
                    'cp'        => 'required|string|max:10',
                    'ciudad'    => 'required|string|max:191',
                    'direccion' => 'required|string|max:191'
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $data = array(
                    ClienteRepository::SQL_NOMBRE    => $request->nombre,
                    ClienteRepository::SQL_CORREO    => $request->email,
                    ClienteRepository::SQL_TELEFONO  => $request->telefono,
                    ClienteRepository::SQL_RFC       => $request->rfc,
                    ClienteRepository::SQL_CP        => $request->cp,
                    ClienteRepository::SQL_CIUDAD    => $request->ciudad,
                    ClienteRepository::SQL_DIRECCION => $request->direccion,
                    ClienteRepository::SQL_ESTATUS   => ClienteRepository::ACTIVE
                );
                Log::info(" ClientesController - agregar - data: ".json_encode($data));
                $this->clienteModel->create($data);
            }
        } catch (\Exception $e) {
            Log::error( 'ClientesController - agregar - Error: '.$e->getMessage() );
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
            Log::info(" ClientesController - editar ");
            if($request->has('id'))
            {
                $catalogo = $this->clienteModel->getById( $request->get('id') );
                if( !empty($catalogo) )
                {
                    $validator = Validator::make(
                        $request->all(),
                        array(
                            'nombre'    => 'required|string|max:191',
                            'correo'    => 'required|string|email|max:120',
                            'telefono'  => 'required|string|max:191',
                            'rfc'       => 'required|string|max:20',
                            'cp'        => 'required|string|max:10',
                            'ciudad'    => 'required|string|max:191',
                            'direccion' => 'required|string|max:191',
                            'estatus'   => 'required|boolean'
                        ),
                        Controller::$messages
                    );
                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = $validator->errors();
                    } else {
                        $datos = array();
                        $datos[ClienteRepository::SQL_NOMBRE]    = $request->nombre;
                        $datos[ClienteRepository::SQL_CORREO]    = $request->correo;
                        $datos[ClienteRepository::SQL_TELEFONO]  = $request->telefono;
                        $datos[ClienteRepository::SQL_RFC]       = $request->rfc;
                        $datos[ClienteRepository::SQL_CP]        = $request->cp;
                        $datos[ClienteRepository::SQL_CIUDAD]    = $request->ciudad;
                        $datos[ClienteRepository::SQL_DIRECCION] = $request->direccion;
                        $datos[ClienteRepository::SQL_ESTATUS]   = $request->estatus;

                        if(!$this->clienteModel->update( $request->get('id'), $datos)) {
                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el cliente" );
                        }
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos de cliente" );
                }
            }

        } catch (\Exception $e) {
            Log::error( 'ClientesController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }

    public function eliminar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" ClientesController - eliminar ");
            if( $request->has('id') ) {
                Log::info(" ClientesController - eliminar: ".$request->get('id') );
                $cliItem = $this->clienteModel->getById( $request->get('id') );
                if( !empty($cliItem) ) {
                    Log::debug(" ClientesController - eliminar: ".json_encode($cliItem) );
                    DB::beginTransaction();
                    $result = $this->clienteModel->delete( $request->get('id') );
                    Log::debug(" ClientesController - eliminar - result: ".json_encode($result) );
                    if(!$result) {
                        $resultado = "ERROR";
                        $mensajes  = array( "No se pudo elimnar el elemento" );
                        DB::rollBack();
                    } else {
                        DB::commit();
                    }
                } else {
                    Log::error("ClientesController - eliminar: El objeto cliItem esta vacío");
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del elemento" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento" );
            }
        } catch (\Exception $e) {
            Log::error( 'ClientesController - eliminar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }
}