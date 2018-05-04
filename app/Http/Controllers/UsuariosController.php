<?php

namespace App\Http\Controllers;

use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Repositories\UserRepository;

class UsuariosController extends Controller
{

    private $model;

    const SESSION_ID     = "su_id";
    const SESSION_NAME   = "su_nombre";
    const SESSION_EMAIL  = "su_email";
    const SESSION_STATUS = "su_status";

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(UserRepository $model)
    {
        //$this->middleware('auth');
        $this->model = $model;
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
            if ($request->session()->has(self::SESSION_STATUS)
                    && $request->session()->get(self::SESSION_STATUS) != '-1' ) {
                $search[UserRepository::SQL_STATUS] = $request->session()->get(self::SESSION_STATUS);
            }
            Log::info(" UsuariosController - listado - search: ".json_encode($search));
            $listado = $this->model->getList(15, $search);
            return view('usuarios.listado',
                array(
                    "listado" => $listado
                )
            );
        } catch (\Exception $e) {
            Log::error( 'UsuariosController - listado - Error'.$e->getMessage() );
            return View::make('error',
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
        $mensajes = "NA";
        try {
            Log::info(" UsuariosController - agregar ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'nombre'   => 'required|string|max:191',
                    'email'    => 'required|string|email|max:120|unique:users',
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
                    "name"     => $request->nombre,
                    "email"    => $request->email,
                    "password" => bcrypt($request->password),
                );
                Log::info(" UsuariosController - agregar - data: ".json_encode($data));
                $this->model->create($data);
            }
        } catch (\Exception $e) {
            Log::error( 'UsuariosController - agregar - Error'.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = $e->getMessage();
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes));
    }
}