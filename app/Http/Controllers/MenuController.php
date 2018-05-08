<?php

namespace App\Http\Controllers;

use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Repositories\MenuRepository;

class MenuController extends Controller
{

    private $menuModel;

    const SESSION_ID     = "smi_id";
    const SESSION_PARENT = "smi_parent";
    const SESSION_LABEL  = "smi_label";

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(MenuRepository $menu)
    {
        //$this->middleware('auth');
        $this->menuModel = $menu;
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
                    "parents" => $this->menuModel->getParents()
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
                    MenuRepository::SQL_LABEL  => $request->etiqueta
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
            $mensajes = $e->getMessage();
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes));
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
                            MenuRepository::SQL_LABEL  => $request->etiqueta
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
            }

        } catch (\Exception $e) {
            Log::error( 'MenuController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }
}