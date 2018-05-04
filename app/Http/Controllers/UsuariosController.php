<?php

namespace App\Http\Controllers;

use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Repositories\UserRepository;

class UsuariosController extends Controller
{

    private $model;

    const SESSION_NAME = "su_nombre";

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
            if ($request->isMethod('post')) {
                if( $request->has(self::SESSION_NAME)
                    && $request->input(self::SESSION_NAME) != 'NA' ) {
                    $request->session()->put(self::SESSION_NAME, $request->input(self::SESSION_NAME));
                }
            }
            $search = array();
            if ($request->session()->has(self::SESSION_NAME)) {
                $search["nombre"] = $request->session()->get(self::SESSION_NAME);
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