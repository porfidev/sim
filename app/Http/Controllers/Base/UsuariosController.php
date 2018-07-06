<?php

namespace App\Http\Controllers\Base;

use DB;
use Auth;
use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use App\Repositories\RolRepository;
use App\Repositories\UserRepository;

use App\Repositories\AssignmentRepository;

class UsuariosController extends Controller
{


    private $userModel;
    private $rolModel;
    private $assiModel;

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
    public function __construct(
        UserRepository $user,
        RolRepository $rol,
        AssignmentRepository $as)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->userModel = $user;
        $this->rolModel  = $rol;
        $this->assiModel = $as;
    }

    public function buscaJefe(Request $request) {
        $response = array();
        $nombre = "";
        try {

            if($request->has("term")) {
                $nombre = $request->input("term");
            }

            Log::info(" UsuariosController - buscaJefe ");

            $listado = $this->userModel->getListBus($nombre);

            $response = $listado->toArray();

            Log::info(" array especial: ".$listado);

        } catch (\Exception $e) {
            Log::error( 'UsuariosController - obtenerNombre - Error: '.$e->getMessage() );
            $response = array();

        }
        return response()->json($response, 200);
    }

    /**
     * Función para buscar los trabajadores asignados a un jefe
     * que estén conectados (tengan sesión abierta).
     *
     * @return json
     */
    public function buscaUsuarios($ord, Request $request) {
        $response = array();
        try {
            Log::info("UsuariosController - buscaUsuarios ");
            $listado = $this->userModel->getListBusUsu(Auth::id());
            $assig   = $this->assiModel->getListAsi($ord);

            foreach ($listado as $usuario) {
                $check = 0;
                $box   = 0;
                foreach ($assig as $assi) {
                    if($usuario->value == $assi->idUsu){
                        $check = 1;
                        $box   = $assi->box_id;
                        break;
                    }
                }
                $response[] = array(
                    "value"  => $usuario->value,
                    "label"  => $usuario->label,
                    "box"    => $box,
                    "check"  => $check,
                    "online" => $usuario->connected
                );
            }
            Log::info("UsuariosController - buscaUsuarios - array: ".json_encode($response));

        } catch (\Exception $e) {
            Log::error( 'UsuariosController - buscaUsuarios - Error: '.$e->getMessage() );
            $response = array();
        }
        return response()->json($response, 200);
    }

    public function listaAsig(Request $request) {
        $response = array();
        $ordId = "";
        try {

            if($request->has("ord")) {
                $ordId = $request->input("ord");
            }

            Log::info(" UsuariosController - listaAsig ");

            $listado = $this->assiModel->getListAsi($ordId);

            $response = $listado->toArray();

            Log::info(" array especial: ".$listado);

           
        } catch (\Exception $e) {
            Log::error( 'UsuariosController - listaAsig - Error: '.$e->getMessage() );
            $response = array();

        }
        return response()->json($response, 200);
    }


    /**
     * Show the user list.
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
            //Log::info(" UsuariosController - listado - search: ".json_encode($search));
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

    /**
     * Función para asignar jefe a un usuario
     * Se usa en ajax.
     *
     * @return json
     */
    public function asignarJefe(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" UsuariosController - asignarJefe - id: ".$request->get('usrId'));
            if($request->has('usrId'))
            {
                $usuario = $this->userModel->getById( $request->get('usrId') );
                if( !empty($usuario) )
                {
                    
                        $datos = array();
                        $datos[UserRepository::SQL_BOSS]   = $request->jefeId;

                        if(!$this->userModel->update( $request->get('usrId'), $datos)) {
                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el usuario" );
                        }
                    
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos de usuario" );
                }
            }

        } catch (\Exception $e) {
            Log::error( 'UsuariosController - asignarJefe - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }

    /**
     * Función para asignar un usuario a una tarea en surtido del pedido
     *
     * @return json
     */
    public function asignarUsuario(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" UsuariosController - asignarUsuario - idUsuario: ".
                $request->get('userId')." idOrder: ".$request->get('orderId'));

            $listaTotal = $this->assiModel->getListAsi( $request->orderId);

            foreach ($listaTotal as $ele) {
                $this->assiModel->delete($ele->idA);
            }

            $typedocs = $request->typedoc;
            if(!empty($typedocs)){
                foreach($typedocs as $value){
                    $assignment = $this->assiModel->search( $request->orderId, $value );
                    if( empty($assignment) ){

                            $data = array(
                                AssignmentRepository::SQL_ORDID  => $request->orderId,
                                AssignmentRepository::SQL_USRID => $value
                            );

                    Log::info(" UsuariosController - asignarUsuario - data: ".json_encode($data));
                    $this->assiModel->create($data);
                    } else {
                        $resultado = "ERROR";
                        $mensajes  = array( "Ese usuario ya esta asignado" );
                    }
                }
            }

        } catch (\Exception $e) {
            Log::error( 'UsuariosController - asignarUsuario - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }

  

    public function desasignarUsuario(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" UsuariosController - eliminar ");
            if( $request->has('id') ) {
                Log::info(" UsuariosController - eliminar: ".$request->get('id') );
                $catItem = $this->assiModel->getById( $request->get('id') );
                if( !empty($catItem) ) {
                    Log::debug(" UsuariosController - eliminar: ".json_encode($catItem) );
                    DB::beginTransaction();
                    $result = $this->assiModel->delete( $request->get('id') );
                    Log::debug(" UsuariosController - eliminar - result: ".json_encode($result) );
                    if(!$result) {
                        $resultado = "ERROR";
                        $mensajes  = array( "No se pudo elimnar el elemento" );
                        DB::rollBack();
                    } else {
                        DB::commit();
                    }
                } else {
                    Log::error("UsuariosController - eliminar: El objeto catItem esta vacío");
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
}