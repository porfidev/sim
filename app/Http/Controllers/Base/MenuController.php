<?php

namespace App\Http\Controllers\Base;

use Validator;
use Auth;
use DB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use App\Repositories\RolRepository;
use App\Repositories\MenuRepository;

class MenuController extends Controller
{

    private $menuModel;
    private $rolModel;

    const SESSION_ID     = "smi_id";
    const SESSION_PARENT = "smi_parent";
    const SESSION_LABEL  = "smi_label";

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(MenuRepository $menu, RolRepository $rol)
    {
        $this->middleware('auth');
        $this->menuModel = $menu;
        $this->rolModel  = $rol;
    }

    /**
     * Show the menu item list.
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request)
    {
        try {
            Log::info(" MenuController - listado ");
            if ( $request->isMethod('post') ) {
                if( $request->has(self::SESSION_ID) ) {
                    $request->session()->put(self::SESSION_ID, $request->input(self::SESSION_ID));
                }

                if( $request->has(self::SESSION_PARENT)) {
                    $request->session()->put(self::SESSION_PARENT, $request->input(self::SESSION_PARENT));
                }

                if( $request->has(self::SESSION_LABEL)) {
                    $request->session()->put(self::SESSION_LABEL, $request->input(self::SESSION_LABEL));
                }
            }
            $search = array();
            if ( $request->session()->has(self::SESSION_ID)
                    && $request->session()->get(self::SESSION_ID) != '0' ) {
                $search[MenuRepository::SQL_ID] = $request->session()->get(self::SESSION_ID);
            }
            if ( $request->session()->has(self::SESSION_PARENT)
                    && !empty($request->session()->get(self::SESSION_PARENT)) ) {
                $search[MenuRepository::SQL_PARENT] = $request->session()->get(self::SESSION_PARENT);
            }
            if ( $request->session()->has(self::SESSION_LABEL)
                    && $request->session()->get(self::SESSION_LABEL) != 'NA' ) {
                $search[MenuRepository::SQL_LABEL] = $request->session()->get(self::SESSION_LABEL);
            }
            Log::info(" MenuController - listado - search: ".json_encode($search));
            $listado = $this->menuModel->getList(15, $search);
            return view('menu.listado',
                array(
                    "listado" => $listado,
                    "parents" => $this->menuModel->getParents(),
                    "roles"   => $this->rolModel->getAll()
                )
            );
        } catch (\Exception $e) {
            Log::error( 'MenuController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para eliminar un elemento del menu a la BD.
     * Elimina todos los registros de profile que tenga asociados.
     * Se usa en ajax.
     *
     * @return json
     */
    public function eliminar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" MenuController - eliminar ");
            if( $request->has('id') ) {
                Log::info(" MenuController - eliminar: ".$request->get('id') );
                $menuItem = $this->menuModel->getById( $request->get('id') );
                if( !empty($menuItem) ) {
                    Log::debug(" MenuController - eliminar: ".json_encode($menuItem) );
                    DB::beginTransaction();
                    $result = $this->menuModel->delete( $request->get('id') );
                    Log::debug(" MenuController - eliminar - result: ".json_encode($result) );
                    if(!$result) {
                        $resultado = "ERROR";
                        $mensajes  = array( "No se pudo elimnar el elemento del menu" );
                        DB::rollBack();
                    } else {
                        DB::commit();
                    }
                } else {
                    Log::error("MenuController - eliminar: El objeto menuItem esta vacío");
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del elemento del menu" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento del menu" );
            }
        } catch (\Exception $e) {
            Log::error( 'MenuController - eliminar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE => $mensajes
        ));
    }

    /**
     * Función para agregar un elemento del menu a la BD.
     * Se usa en ajax.
     *
     * @return json
     */
    public function agregar(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" MenuController - agregar ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'padre'    => 'sometimes|integer|exists:menus,id',
                    'orden'    => 'required|integer',
                    'etiqueta' => 'required|string|max:120',
                    'url'      => 'sometimes|string'
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $data = array(
                    MenuRepository::SQL_LABEL  => $request->etiqueta,
                    MenuRepository::SQL_ORDER  => $request->orden,
                    MenuRepository::SQL_USER   => Auth::id()
                );
                if($request->has('padre')) {
                    $data[MenuRepository::SQL_PARENT] = $request->padre;
                }
                if($request->has('url')) {
                    $data[MenuRepository::SQL_URL] = $request->url;
                }
                Log::info(" MenuController - agregar - data: ".json_encode($data));
                $this->menuModel->create($data);
            }
        } catch (\Exception $e) {
            Log::error( 'MenuController - agregar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE => $mensajes
        ));
    }

    /**
     * Función para consultar los datos de un item del menu
     * Se usa en ajax.
     *
     * @return json
     */
    public function consultar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" MenuController - consultar ");
            if( $request->has('id') ) {
                $menuItem = $this->menuModel->getById( $request->get('id') );
                if( !empty($menuItem) ) {
                    $datos = $menuItem;
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del elemento del menu" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento del menu" );
            }
        } catch (\Exception $e) {
            Log::error( 'MenuController - consultar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes,
            Controller::JSON_DATA     => $datos
        ));
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
            Log::info(" MenuController - editar ");
            if($request->has('id'))
            {
                $usuario = $this->menuModel->getById( $request->get('id') );
                if( !empty($usuario) )
                {
                    $validator = Validator::make(
                        $request->all(),
                        array(
                            'padre'    => 'sometimes|integer|exists:menus,id',
                            'orden'    => 'required|integer',
                            'etiqueta' => 'required|string|max:120',
                            'url'      => 'sometimes|string'
                        ),
                        Controller::$messages
                    );
                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = $validator->errors();
                    } else {
                        $data = array(
                            MenuRepository::SQL_LABEL  => $request->etiqueta,
                            MenuRepository::SQL_ORDER  => $request->orden,
                            MenuRepository::SQL_USER   => Auth::id()
                        );
                        if($request->has('padre')) {
                            $data[MenuRepository::SQL_PARENT] = $request->padre;
                        }
                        if($request->has('url')) {
                            $data[MenuRepository::SQL_URL] = $request->url;
                        }
                        if(!$this->menuModel->update( $request->get('id'), $data)) {
                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el elemento del menu" );
                        }
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del elemento del menu" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento del menu" );
            }

        } catch (\Exception $e) {
            Log::error( 'MenuController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(
            array(
                Controller::JSON_RESPONSE => $resultado,
                Controller::JSON_MESSAGE  => $mensajes,
                Controller::JSON_DATA     => $datos
            )
        );
    }

    /**
     * Función para agregar permisos del item del Menu
     * Se usa en ajax.
     *
     * @return json
     */
    public function agregarPermiso(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" MenuController - agregarPermiso ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'rol'  => 'required|integer|exists:rols,id',
                    'menu' => 'required|integer|exists:menus,id',
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $data = array(
                    MenuRepository::SQL_PROFILE_ROL  => $request->rol,
                    MenuRepository::SQL_PROFILE_MENU => $request->menu
                );
                $anterior = $this->menuModel->findProfile($data);
                if(count($anterior) > 0) {
                    $resultado = "ERROR";
                    $mensajes  = array( "El rol ya se encuentra registrado" );
                } else {
                    $data[MenuRepository::SQL_PROFILE_USER] = Auth::id();
                    Log::debug(" MenuController - agregarPermiso - data: ".json_encode($data));
                    $datos = $this->menuModel->addProfile($data)->id;
                    HomeController::setMenu($request, $this->menuModel);
                }
            }
        } catch (\Exception $e) {
            Log::error( 'MenuController - agregarPermiso - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(
            array(
                Controller::JSON_RESPONSE => $resultado,
                Controller::JSON_MESSAGE  => $mensajes,
                Controller::JSON_DATA     => $datos
            )
        );
    }

    /**
     * Función para consultar los permisos del item del Menu
     * Se usa en ajax.
     *
     * @return json
     */
    public function consultarPermisos(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" MenuController - consultarPermisos ");
            if( $request->has('id') ) {
                $profileList = $this->menuModel->getProfileList( $request->get('id') );
                Log::debug(" MenuController - consultarPermisos: ".json_encode($profileList));
                if( !empty($profileList) ) {
                    $datos = $profileList;
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del elemento del menu" );
            }
        } catch (\Exception $e) {
            Log::error( 'MenuController - consultarPermisos - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(
            array(
                Controller::JSON_RESPONSE => $resultado,
                Controller::JSON_MESSAGE  => $mensajes,
                Controller::JSON_DATA     => $datos
            )
        );
    }

    /**
     * Función para eliminar un permiso del item del Menu
     * Se usa en ajax.
     *
     * @return json
     */
    public function eliminarPermiso(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" MenuController - eliminarPermiso ");
            if( $request->has('id') ) {
                $deleted = $this->menuModel->deleteProfile( $request->get('id') );
                Log::debug(" MenuController - eliminarPermiso: ".json_encode($deleted));
                if( !$deleted ) {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se puede eliminar el permiso" );
                } else {
                    HomeController::setMenu($request, $this->menuModel);
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "No se encontraron datos del permiso" );
            }
        } catch (\Exception $e) {
            Log::error( 'MenuController - eliminarPermiso - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(
            array(
                Controller::JSON_RESPONSE => $resultado,
                Controller::JSON_MESSAGE  => $mensajes
            )
        );
    }
}