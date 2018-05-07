<?php

namespace App\Http\Controllers;

use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Repositories\RolRepository;
use App\Repositories\UserRepository;

class UsuariosController extends Controller
{

    private $userModel;
    private $rolModel;

    const SESSION_ID     = "su_id";
    const SESSION_NAME   = "su_nombre";
    const SESSION_EMAIL  = "su_email";
    const SESSION_ROL    = "su_rol";
    const SESSION_STATUS = "su_status";

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(UserRepository $user, RolRepository $rol)
    {
        //$this->middleware('auth');
        $this->userModel = $user;
        $this->rolModel  = $rol;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request)
    {
        try {
            Log::info(" UsuariosController - listado ");
            if ( $request->isMethod('post') ) {
                if( $request->has(self::SESSION_ID)) {
                    $request->session()->put(self::SESSION_ID, $request->input(self::SESSION_ID));
                }

                if( $request->has(self::SESSION_NAME)) {
                    $request->session()->put(self::SESSION_NAME, $request->input(self::SESSION_NAME));
                }

                if( $request->has(self::SESSION_EMAIL)) {
                    $request->session()->put(self::SESSION_EMAIL, $request->input(self::SESSION_EMAIL));
                }

                if( $request->has(self::SESSION_ROL)) {
                    $request->session()->put(self::SESSION_ROL, $request->input(self::SESSION_ROL));
                }

                if( $request->has(self::SESSION_STATUS)) {
                    $request->session()->put(self::SESSION_STATUS, $request->input(self::SESSION_STATUS));
                }
            }
            $search = array();
            if ( $request->session()->has(self::SESSION_ID)
                    && $request->session()->get(self::SESSION_ID) != '0' ) {
                $search[UserRepository::SQL_ID] = $request->session()->get(self::SESSION_ID);
            }
            if ($request->session()->has(self::SESSION_NAME)
                    && $request->session()->get(self::SESSION_NAME) != 'NA' ) {
                $search[UserRepository::SQL_NAME] = $request->session()->get(self::SESSION_NAME);
            }
            if ($request->session()->has(self::SESSION_EMAIL)
                    && $request->session()->get(self::SESSION_EMAIL) != 'NA' ) {
                $search[UserRepository::SQL_EMAIL] = $request->session()->get(self::SESSION_EMAIL);
            }
            if ($request->session()->has(self::SESSION_ROL)
                    && $request->session()->get(self::SESSION_ROL) != '0' ) {
                $search[UserRepository::SQL_ROL] = $request->session()->get(self::SESSION_ROL);
            }
            if ($request->session()->has(self::SESSION_STATUS)
                    && $request->session()->get(self::SESSION_STATUS) != '-1' ) {
                $search[UserRepository::SQL_STATUS] = $request->session()->get(self::SESSION_STATUS);
            }
            Log::info(" UsuariosController - listado - search: ".json_encode($search));
            $listado = $this->userModel->getList(15, $search);
            return view('usuarios.listado',
                array(
                    "listado" => $listado,
                    "roles"   => $this->rolModel->getAll()
                )
            );
        } catch (\Exception $e) {
            Log::error( 'UsuariosController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para agregar un usuario a la BD.
     * Se usa en ajax.
     *
     * @return json
     */
    public function agregar(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" UsuariosController - agregar ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'nombre'   => 'required|string|max:191',
                    'email'    => 'required|string|email|max:120|unique:users',
                    'rol'      => 'required|integer|exists:rols,id',
                    'password' => 'required|string|min:6|confirmed',
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $data = array(
                    UserRepository::SQL_NAME  => $request->nombre,
                    UserRepository::SQL_EMAIL => $request->email,
                    UserRepository::SQL_ROL   => $request->rol,
                    UserRepository::SQL_PASS  => bcrypt($request->password),
                );
                Log::info(" UsuariosController - agregar - data: ".json_encode($data));
                $this->userModel->create($data);
            }
        } catch (\Exception $e) {
            Log::error( 'UsuariosController - agregar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = $e->getMessage();
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes));
    }

    /**
     * Función para consultar los datos de un usuario
     * Se usa en ajax.
     *
     * @return json
     */
    public function consultar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" UsuariosController - consultar ");
            if( $request->has('id') ) {
                $usuario = $this->userModel->getById( $request->get('id') );
                if( !empty($usuario) ) {
                    $datos = $usuario;
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos de usuario" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos de usuario" );
            }
        } catch (\Exception $e) {
            Log::error( 'UsuariosController - consultar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = $e->getMessage();
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }

    /**
     * Función para editar los datos de un usuario
     * Se usa en ajax.
     *
     * @return json
     */
    public function editar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" UsuariosController - editar ");
            if($request->has('id'))
            {
                $usuario = $this->userModel->getById( $request->get('id') );
                if( !empty($usuario) )
                {
                    $validator = Validator::make(
                        $request->all(),
                        array(
                            'nombre'   => 'required|string|max:191',
                            'email'    => 'required|string|email|max:120|unique:users,email,'.$usuario->id,
                            'rol'      => 'required|integer|exists:rols,id',
                            'password' => 'sometimes|string|min:6|confirmed',
                            'status'   => 'required|boolean'
                        ),
                        Controller::$messages
                    );
                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = $validator->errors();
                    } else {
                        $datos = array();
                        $datos[UserRepository::SQL_NAME]   = $request->nombre;
                        $datos[UserRepository::SQL_EMAIL]  = $request->email;
                        $datos[UserRepository::SQL_ROL]    = $request->rol;
                        $datos[UserRepository::SQL_STATUS] = $request->status;
                        if($request->has(UserRepository::SQL_PASS)) {
                            $datos[UserRepository::SQL_PASS] = bcrypt($request->password);
                        }
                        if(!$this->userModel->update( $request->get('id'), $datos)) {
                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el usuario" );
                        }
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos de usuario" );
                }
            }

        } catch (\Exception $e) {
            Log::error( 'UsuariosController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }
}