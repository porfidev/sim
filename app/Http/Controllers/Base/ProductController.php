<?php

namespace App\Http\Controllers\Base;

use DB;
use Auth;
use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use App\Repositories\ProductRepository;

class ProductController extends Controller
{

    const SESSION_SKU     = "sp_sku";
    const SESSION_NAME    = "sp_concept";
    const SESSION_ALIAS   = "sp_alias";

    private $productModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(ProductRepository $product)
    {
        $this->middleware('auth');
        $this->productModel = $product;
    }

    /**
     * Show the product list.
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request)
    {
        try {
            Log::info(" ProductController - listado ");
            if ( $request->isMethod('post') ) {
                if( $request->has(self::SESSION_SKU) ) {
                    $request->session()->put(self::SESSION_SKU, $request->input(self::SESSION_SKU));
                }

                if( $request->has(self::SESSION_NAME)) {
                    $request->session()->put(self::SESSION_NAME, $request->input(self::SESSION_NAME));
                }

                if( $request->has(self::SESSION_ALIAS)) {
                    $request->session()->put(self::SESSION_ALIAS, $request->input(self::SESSION_ALIAS));
                }
            }
            $search = array();
            if ( $request->session()->has(self::SESSION_SKU)
                    && $request->session()->get(self::SESSION_SKU) != 'NA' ) {
                $search[ProductRepository::SQL_SKU] = $request->session()->get(self::SESSION_SKU);
            }
            if ( $request->session()->has(self::SESSION_NAME)
                    && $request->session()->get(self::SESSION_NAME) != 'NA' ) {
                $search[ProductRepository::SQL_CONCEPT] = $request->session()->get(self::SESSION_NAME);
            }
            if ( $request->session()->has(self::SESSION_ALIAS)
                    && $request->session()->get(self::SESSION_ALIAS) != 'NA' ) {
                $search[ProductRepository::SQL_ALIAS] = $request->session()->get(self::SESSION_ALIAS);
            }
            Log::info(" ProductController - listado - search: ".json_encode($search));
            $listado = $this->productModel->getList(15, $search);
            $dataToView = array(
                "listado" => $listado
            );
            return view('catalogos.products.listado', $dataToView);
        } catch (\Exception $e) {
            Log::error( 'ProductController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para agregar un producto a la BD.
     * Se usa en ajax.
     *
     * @return json
     */
    public function agregar(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" ProductController - agregar ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'sku'                      => 'required|string|max:50',
                    'concepto'                 => 'required|string|max:150',
                    'alias'                    => 'required|string|max:150',
                    'pesoPorPieza'             => 'required|numeric',
                    'piezasPorDisplay'         => 'required|integer',
                    'pesoPorDisplay'           => 'required|numeric',
                    'displayPorCaja'           => 'required|integer',
                    'pesoPorCaja'              => 'required|numeric',
                    'ancho'                    => 'required|numeric',
                    'profundidad'              => 'required|numeric',
                    'altura'                   => 'required|numeric',
                    'codigoDeBarras'           => 'required|string|max:150',
                    'codigoDeBarrasDelDisplay' => 'required|string|max:150',
                    'codigoDeBarrasCorrugado'  => 'required|string|max:150',
                ),
                Controller::$messages
            );
            if ($validator->fails())
            {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $data = array(
                    ProductRepository::SQL_SKU     => $request->sku,
                    ProductRepository::SQL_CONCEPT => $request->concepto,
                    ProductRepository::SQL_ALIAS   => $request->alias,
                    ProductRepository::SQL_W_P_P   => $request->pesoPorPieza,
                    ProductRepository::SQL_I_P_D   => $request->piezasPorDisplay,
                    ProductRepository::SQL_W_P_D   => $request->pesoPorDisplay,
                    ProductRepository::SQL_D_P_B   => $request->displayPorCaja,
                    ProductRepository::SQL_W_P_B   => $request->pesoPorCaja,
                    ProductRepository::SQL_WIDTH   => $request->ancho,
                    ProductRepository::SQL_DEPTH   => $request->profundidad,
                    ProductRepository::SQL_HEIGHT  => $request->altura,
                    ProductRepository::SQL_B_C     => $request->codigoDeBarras,
                    ProductRepository::SQL_D_B_C   => $request->codigoDeBarrasDelDisplay,
                    ProductRepository::SQL_C_B_C   => $request->codigoDeBarrasCorrugado,
                    ProductRepository::SQL_USER    => Auth::id(),
                );
                Log::info(" ProductController - agregar - data: ".json_encode($data));
                DB::beginTransaction();
                $this->productModel->create($data);
                DB::commit();
            }
        } catch (\Exception $e) {
            Log::error( 'ProductController - agregar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
            DB::rollBack();
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /**
     * Función para consultar datos de un producto.
     * Se ocupa en ajax
     *
     * @return json
     */
    public function consultar(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" ProductController - consultar ");
            if($request->has('id'))
            {
                $product = $this->productModel->getById($request->id);
                if( !empty($product) ) {
                    $datos = $product;
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del producto" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "Faltan datos para poder consultar datos del producto" );
            }
        } catch (\Exception $e) {
            Log::error( 'ProductController - consultar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
            DB::rollBack();
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes,
            Controller::JSON_DATA     => $datos
        ));
    }

    /**
     * Función para editar un producto.
     * Se ocupa en ajax
     *
     * @return json
     */
    public function editar(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" ProductController - editar ");
            if($request->has('id'))
            {
                $product = $this->productModel->getById( $request->get('id') );
                if( !empty($product) )
                {
                    $validator = Validator::make(
                        $request->all(),
                        array(
                            'sku'                      => 'required|string|max:50',
                            'concepto'                 => 'required|string|max:150',
                            'alias'                    => 'required|string|max:150',
                            'pesoPorPieza'             => 'required|numeric',
                            'piezasPorDisplay'         => 'required|integer',
                            'pesoPorDisplay'           => 'required|numeric',
                            'displayPorCaja'           => 'required|integer',
                            'pesoPorCaja'              => 'required|numeric',
                            'ancho'                    => 'required|numeric',
                            'profundidad'              => 'required|numeric',
                            'altura'                   => 'required|numeric',
                            'codigoDeBarras'           => 'required|string|max:150',
                            'codigoDeBarrasDelDisplay' => 'required|string|max:150',
                            'codigoDeBarrasCorrugado'  => 'required|string|max:150',
                        ),
                        Controller::$messages
                    );
                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = $validator->errors();
                    } else {
                        $data = array(
                            ProductRepository::SQL_SKU     => $request->sku,
                            ProductRepository::SQL_CONCEPT => $request->concepto,
                            ProductRepository::SQL_ALIAS   => $request->alias,
                            ProductRepository::SQL_W_P_P   => $request->pesoPorPieza,
                            ProductRepository::SQL_I_P_D   => $request->piezasPorDisplay,
                            ProductRepository::SQL_W_P_D   => $request->pesoPorDisplay,
                            ProductRepository::SQL_D_P_B   => $request->displayPorCaja,
                            ProductRepository::SQL_W_P_B   => $request->pesoPorCaja,
                            ProductRepository::SQL_WIDTH   => $request->ancho,
                            ProductRepository::SQL_DEPTH   => $request->profundidad,
                            ProductRepository::SQL_HEIGHT  => $request->altura,
                            ProductRepository::SQL_B_C     => $request->codigoDeBarras,
                            ProductRepository::SQL_D_B_C   => $request->codigoDeBarrasDelDisplay,
                            ProductRepository::SQL_C_B_C   => $request->codigoDeBarrasCorrugado,
                            ProductRepository::SQL_USER    => Auth::id(),
                        );
                        Log::info(" ProductController - editar - data: ".json_encode($data));
                        DB::beginTransaction();
                        $this->productModel->update($request->id, $data);
                        DB::commit();
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontró el producto" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "Faltan datos para poder actualizar el producto" );
            }
        } catch (\Exception $e) {
            Log::error( 'ProductController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
            DB::rollBack();
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /**
     * Función para eliminar un producto en la BD.
     * Solo agrega la fecha de borrado.
     * Se usa en ajax.
     *
     * @return json
     */
    public function eliminar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" ProductController - eliminar ");
            if( $request->has('id') ) {
                Log::info(" ProductController - eliminar: ".$request->get('id') );
                $product = $this->productModel->getById( $request->get('id') );
                if( !empty($product) ) {
                    Log::debug(" ProductController - eliminar: ".json_encode($product) );
                    DB::beginTransaction();
                    $result = $this->productModel->delete( $request->get('id'), Auth::id() );
                    Log::debug(" ProductController - eliminar - result: ".json_encode($result) );
                    if(!$result) {
                        $resultado = "ERROR";
                        $mensajes  = array( "No se pudo elimnar el producto" );
                        DB::rollBack();
                    } else {
                        DB::commit();
                    }
                } else {
                    Log::error("ProductController - eliminar: El objeto product esta vacío");
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos del producto" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "Faltan datos para identificar el producto que deseas borrar" );
            }
        } catch (\Exception $e) {
            Log::error( 'ProductController - eliminar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }
}