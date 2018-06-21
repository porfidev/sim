<?php

namespace App\Http\Controllers\Base;

use DB;
use Auth;
use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use Illuminate\Support\Facades\Input;

use App\Http\Controllers\Controller;
use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;

use Session;

use Illuminate\Support\Facades\Redirect;

class ProductController extends Controller
{

    const SESSION_SKU     = "sp_sku";
    const SESSION_NAME    = "sp_concept";
    const SESSION_ALIAS   = "sp_alias";

    private $productModel;
    private $ordDetModel;
    private $orderModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(ProductRepository $product, OrderDetailRepository $det, OrderRepository $ord)
    {
        $this->middleware(['auth', 'permission']);
        $this->productModel = $product;
        $this->ordDetModel = $det;
        $this->orderModel = $ord;
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
                    'caducidadMinima'          => 'required|numeric',
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
                    ProductRepository::SQL_CADM    => $request->caducidadMinima,
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
                            'editCaducidadMinima'      => 'required|numeric',
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
                            ProductRepository::SQL_CADM    => $request->editCaducidadMinima,
                            ProductRepository::SQL_USER    => Auth::id()
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

    public function CSVPro() {
        Log::debug("ProductController - CSVPro");
        try {
            $file = Input::file('CSVFile3');

            Log::debug(" ProductController - CSVPro - NombreCSV: ".$file );

            if(empty($file)){

                Session::flash('errores', 'No se selecciono un archivo CSV ');
                Log::debug(" ProductController - CSVPro - archivo vacio " );
                return Redirect::route('productos.listado');
            }

            if($file->getMimeType() != "text/plain"){

                Session::flash('errores', 'El archivo seleccionado no es un CSV');
                Log::debug(" ProductController - CSVPro - no es texto " );
                return Redirect::route('productos.listado');
            }

            $gestor = fopen($file->getRealPath(), "r");
            $deliminator = ";";
            $contador = 0;
            $contMod = 0;
            DB::beginTransaction();
            while (($datos = fgetcsv($gestor, 10000, $deliminator)) !== FALSE) {
                Log::info("_________________________________________________________________");
                Log::info("Datos: ".json_encode($datos));
                $product = $this->productModel->getBySku( $datos[0] );

                if($product == null){

                    if(empty($datos[3])){

                        $datos[3] = 1;
                    }

                    if(!is_numeric($datos[3])){

                        $datos[3] = 1;
                    }

                    if(empty($datos[4])){

                        $datos[4] = 1;
                    }

                    if(!is_numeric($datos[4])){

                        $datos[4] = 1;
                    }

                    if(empty($datos[5])){

                        $datos[5] = 1;
                    }

                    if(!is_numeric($datos[5])){

                        $datos[5] = 1;
                    }

                    $vowels = array("kg", "ml", "g", "G","K","k");

                    $vowels2 = array("á", "é", "í", "ó","ú","ñ");

                    if(strpos($datos[3], "kg") || strpos($datos[3], "Kg")){

                        $datos[3] = str_replace($vowels, "", $datos[3]);

                        $datos[3] = floatval($datos[3])*1000;


                    }else{

                        $datos[3] = str_replace($vowels, "", $datos[3]);

                    }

                    //$datos[1] = str_replace($vowels2, "", $datos[1]);
                    //$datos[2] = str_replace($vowels2, "", $datos[2]);

                    //trim universal, quita todo tipo de espacios en blanco

                    $datos[1] = preg_replace(
                       '/
                           ^
                           [\pZ\p{Cc}\x{feff}]+
                           |
                           [\pZ\p{Cc}\x{feff}]+$
                       /ux',
                       '',
                    $datos[1]
                    );

                    $datos[2] = preg_replace(
                       '/
                           ^
                           [\pZ\p{Cc}\x{feff}]+
                           |
                           [\pZ\p{Cc}\x{feff}]+$
                       /ux',
                       '',
                    $datos[2]
                    );

                    $data = array(
                    ProductRepository::SQL_SKU     => $datos[0],
                    ProductRepository::SQL_CONCEPT => $datos[1],
                    ProductRepository::SQL_ALIAS   => $datos[2],
                    ProductRepository::SQL_W_P_P   => $datos[3],
                    ProductRepository::SQL_I_P_D   => $datos[4],
                    ProductRepository::SQL_W_P_D   => floatval($datos[3])*floatval($datos[4]),
                    ProductRepository::SQL_D_P_B   => $datos[5],
                    ProductRepository::SQL_W_P_B   => floatval($datos[3])*floatval($datos[4])*floatval($datos[5]),
                    ProductRepository::SQL_WIDTH   => 0,
                    ProductRepository::SQL_DEPTH   => 0,
                    ProductRepository::SQL_HEIGHT  => 0,
                    ProductRepository::SQL_B_C     => $datos[6],
                    ProductRepository::SQL_D_B_C   => $datos[7],
                    ProductRepository::SQL_C_B_C   => $datos[8],
                    ProductRepository::SQL_CADM    => $datos[9],
                    ProductRepository::SQL_USER    => Auth::id(),
                );

                Log::info(" ProductController - agregar - data: ".json_encode($data));
                DB::beginTransaction();
                $this->productModel->create($data);
                $contador++;
                DB::commit();

                }
            }
            DB::commit();
            Session::flash('exito', 'Se han agregado: '.$contador.' productos  ');
            return Redirect::route('productos.listado');

        } catch (\Exception $e) {
            Log::error( 'ProductController - CSVPro - Error: '.$e->getMessage() );
            DB::rollback();
            Session::flash('errores', 'ocurrio el siguiente error: '.$e->getMessage());
            return Redirect::route('productos.listado');
        }
    }

    static function validaSku($sku,$codigo,$cantU,$productModelE){

        $resultado = "OK";
        $mensajes  = "NA";
        //error
        $cantidadTot = -1;
        $response = [];

        try {

            Log::info(" ProductController - validaSku sku : ".$sku);
            $product = $productModelE->getBySku( $sku );

            if( $product != null ) {

                Log::debug(" ProductController - validaSku: ".json_encode($product) );

                if($codigo == $product->corrugated_barcode){

                    $cantidadTot = intval($product->display_per_box)*intval($product->items_per_display);

                } else if($codigo == $product->display_barcode){

                    $cantidadTot = intval($product->items_per_display);

                } else if($codigo == $product->barcode){

                    $cantidadTot = 1;

                } else {

                    $resultado = "ERROR";
                    $mensajes  = "Código de barras incorrecto";

                }

            } else {

                Log::error("ProductController - validaSku: El objeto product esta vacío");
                $resultado = "ERROR";
                $mensajes  = "No se encontro ese producto";
            }

        } catch (\Exception $e) {
            Log::error( 'ProductController - validaSku - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }

        $response[1] = $mensajes;
        $response[0] = $cantidadTot;

        return $response;
    }

    static function checaPedUsr($idPed,$ordDetModelE){

        Log::info(" ProductController - checaPedUsr idPed : ".$idPed);

        try{

            $boolDet = true;

            $listaDet = $ordDetModelE->getByIdOrd($idPed);

            foreach ($listaDet as $ele) {

                Log::info(" ProductController - checaPedUsr cant : ".$ele->quantity." CantUsr: ".$ele->quantity_user);

                if($ele->quantity > $ele->quantity_user){

                    $boolDet = false;

                }

            }

            Log::info(" ProductController - checaPedUsr - boolEsp : ".$boolDet);

            return $boolDet;


        } catch (\Exception $e) {

            Log::error( 'ProductController - checaPedUsr - Error: '.$e->getMessage() );
            return -1;

        }
    }
    
}