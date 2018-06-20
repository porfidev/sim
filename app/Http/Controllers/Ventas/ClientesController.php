<?php

namespace App\Http\Controllers\Ventas;

use Validator;
use Auth;
use DB;
use App\Catalogo;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Session;

use Illuminate\Support\Facades\Input;

use App\Http\Controllers\Controller;
use App\Repositories\ClienteRepository;
use App\Repositories\CatalogoRepository;

use Illuminate\Support\Facades\Redirect;

class ClientesController extends Controller{

    private $clienteModel;
    private $cat;

    const SESSION_ID        = "scl_id";
    const SESSION_NOMBRE    = "scl_nombre";
    const SESSION_CORREO    = "scl_correo";
    const SESSION_TELEFONO  = "scl_telefono";
    const SESSION_RFC       = "scl_RFC";
    const SESSION_CP        = "scl_CP";
    const SESSION_CIUDAD    = "scl_ciudad";
    const SESSION_DIRECCION = "scl_direccion";
    const SESSION_ESTATUS   = "scl_estatus";
    const SESSION_CODE      = "scl_code";
    const SESSION_P         = "scl_p";
    const SESSION_SHOPS     = "scl_shops";
    const SESSION_SKU       = "scl_sku";
    const SESSION_PACK      = "scl_pack";
    const SESSION_D2        = "scl_d2";
    const SESSION_TE        = "scl_te";
    const SESSION_CE        = "scl_ce";
    const SESSION_TP        = "scl_tp";
    const SESSION_AVERAGE   = "scl_average";
    const SESSION_D         = "scl_d";

    /**
     * Create a new catalogos instance.
     *
     * @return void
     */
    public function __construct(ClienteRepository $cli, CatalogoRepository $cata)
    {
        $this->middleware('auth');
        $this->clienteModel = $cli;
        $this->cat = $cata;
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

                if( $request->has(self::SESSION_CODE)) {
                    $request->session()->put(self::SESSION_CODE, $request->input(self::SESSION_CODE));
                }

                if( $request->has(self::SESSION_P)) {
                    $request->session()->put(self::SESSION_P, $request->input(self::SESSION_P));
                }

                if( $request->has(self::SESSION_SHOPS)) {
                    $request->session()->put(self::SESSION_SHOPS, $request->input(self::SESSION_SHOPS));
                }

                if( $request->has(self::SESSION_SKU)) {
                    $request->session()->put(self::SESSION_SKU, $request->input(self::SESSION_SKU));
                }

                if( $request->has(self::SESSION_PACK)) {
                    $request->session()->put(self::SESSION_PACK, $request->input(self::SESSION_PACK));
                }

                if( $request->has(self::SESSION_D2)) {
                    $request->session()->put(self::SESSION_D2, $request->input(self::SESSION_D2));
                }

                if( $request->has(self::SESSION_TE)) {
                    $request->session()->put(self::SESSION_TE, $request->input(self::SESSION_TE));
                }

                if( $request->has(self::SESSION_CE)) {
                    $request->session()->put(self::SESSION_CE, $request->input(self::SESSION_CE));
                }

                if( $request->has(self::SESSION_TP)) {
                    $request->session()->put(self::SESSION_TP, $request->input(self::SESSION_TP));
                }

                if( $request->has(self::SESSION_AVERAGE)) {
                    $request->session()->put(self::SESSION_AVERAGE, $request->input(self::SESSION_AVERAGE));
                }

                if( $request->has(self::SESSION_D)) {
                    $request->session()->put(self::SESSION_D, $request->input(self::SESSION_D));
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
            if ( $request->session()->has(self::SESSION_P)
                    && $request->session()->get(self::SESSION_P) != 'NA' ) {
                $search[ClienteRepository::SQL_P] = $request->session()->get(self::SESSION_P);
            }
            if ( $request->session()->has(self::SESSION_SHOPS)
                    && $request->session()->get(self::SESSION_SHOPS) != 'NA' ) {
                $search[ClienteRepository::SQL_SHOPS] = $request->session()->get(self::SESSION_SHOPS);
            }
            if ( $request->session()->has(self::SESSION_CODE)
                    && $request->session()->get(self::SESSION_CODE) != 'NA' ) {
                $search[ClienteRepository::SQL_CODE] = $request->session()->get(self::SESSION_CODE);
            }
            if ( $request->session()->has(self::SESSION_SKU)
                    && $request->session()->get(self::SESSION_SKU) != 'NA' ) {
                $search[ClienteRepository::SQL_SKU] = $request->session()->get(self::SESSION_SKU);
            }
            if ( $request->session()->has(self::SESSION_PACK)
                    && $request->session()->get(self::SESSION_PACK) != 'NA' ) {
                $search[ClienteRepository::SQL_PACK] = $request->session()->get(self::SESSION_PACK);
            }
            if ( $request->session()->has(self::SESSION_D2)
                    && $request->session()->get(self::SESSION_D2) != 'NA' ) {
                $search[ClienteRepository::SQL_D2] = $request->session()->get(self::SESSION_D2);
            }
            if ( $request->session()->has(self::SESSION_TE)
                    && $request->session()->get(self::SESSION_TE) != 'NA' ) {
                $search[ClienteRepository::SQL_TE] = $request->session()->get(self::SESSION_TE);
            }
            if ( $request->session()->has(self::SESSION_CE)
                    && $request->session()->get(self::SESSION_CE) != 'NA' ) {
                $search[ClienteRepository::SQL_CE] = $request->session()->get(self::SESSION_CE);
            }
            if ( $request->session()->has(self::SESSION_TP)
                    && $request->session()->get(self::SESSION_TP) != 'NA' ) {
                $search[ClienteRepository::SQL_TP] = $request->session()->get(self::SESSION_TP);
            }
            if ( $request->session()->has(self::SESSION_AVERAGE)
                    && $request->session()->get(self::SESSION_AVERAGE) != 'NA' ) {
                $search[ClienteRepository::SQL_AVERAGE] = $request->session()->get(self::SESSION_AVERAGE);
            }
            if ( $request->session()->has(self::SESSION_D)
                    && $request->session()->get(self::SESSION_D) != 'NA' ) {
                $search[ClienteRepository::SQL_D] = $request->session()->get(self::SESSION_D);
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
                    'direccion' => 'required|string|max:191',
                    'code'      => 'required|string|max:191',
                    'p'         => 'required|numeric|max:10',
                    'tiendas'   => 'required|numeric|max:10',
                    'sku'       => 'required|numeric|max:10',
                    'pack'      => 'required|numeric|max:10',
                    'd2'        => 'required|numeric|max:10',
                    'te'        => 'required|numeric|max:10',
                    'ce'        => 'required|numeric|max:10',
                    'tp'        => 'required|numeric|max:10',
                    'promedio'  => 'required|numeric|max:10',
                    'd'         => 'required|numeric|max:10'
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
                    ClienteRepository::SQL_CODE      => $request->code,
                    ClienteRepository::SQL_P         => $request->p,
                    ClienteRepository::SQL_SHOPS     => $request->tiendas,
                    ClienteRepository::SQL_SKU       => $request->sku,
                    ClienteRepository::SQL_PACK      => $request->pack,
                    ClienteRepository::SQL_D2        => $request->d2,
                    ClienteRepository::SQL_TE        => $request->te,
                    ClienteRepository::SQL_CE        => $request->ce,
                    ClienteRepository::SQL_TP        => $request->tp,
                    ClienteRepository::SQL_AVERAGE   => $request->promedio,
                    ClienteRepository::SQL_D         => $request->d,
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
                            'code'      => 'required|string|max:191',
                            'p'         => 'required|numeric|max:10',
                            'tiendas'   => 'required|numeric|max:10',
                            'sku'       => 'required|numeric|max:10',
                            'pack'      => 'required|numeric|max:10',
                            'd2'        => 'required|numeric|max:10',
                            'te'        => 'required|numeric|max:10',
                            'ce'        => 'required|numeric|max:10',
                            'tp'        => 'required|numeric|max:10',
                            'promedio'  => 'required|numeric|max:10',
                            'd'         => 'required|numeric|max:10',
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
                        $datos[ClienteRepository::SQL_CODE]      = $request->code;
                        $datos[ClienteRepository::SQL_P]         = $request->p;
                        $datos[ClienteRepository::SQL_SHOPS]     = $request->tiendas;
                        $datos[ClienteRepository::SQL_SKU]       = $request->sku;
                        $datos[ClienteRepository::SQL_PACK]      = $request->pack;
                        $datos[ClienteRepository::SQL_D2]        = $request->d2;
                        $datos[ClienteRepository::SQL_TE]        = $request->te;
                        $datos[ClienteRepository::SQL_CE]        = $request->ce;
                        $datos[ClienteRepository::SQL_TP]        = $request->tp;
                        $datos[ClienteRepository::SQL_AVERAGE]   = $request->promedio;
                        $datos[ClienteRepository::SQL_D]         = $request->d;

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

    public function CSVCli() {
        Log::debug("CursosController - CSVHist");
        try {
            $file = Input::file('CSVFile3');

            Log::debug(" ClientesController - CSVCli - NombreCSV: ".$file );

            if(empty($file)){

                Session::flash('errores', 'No se selecciono un archivo CSV ');
                Log::debug(" ClientesController - CSVCli - archivo vacio " );
                return Redirect::route('clientes.listado');
            }

            if($file->getMimeType() != "text/plain"){

                Session::flash('errores', 'El archivo seleccionado no es un CSV');
                Log::debug(" ClientesController - CSVCli - no es texto " );
                return Redirect::route('clientes.listado');
            }

            $gestor = fopen($file->getRealPath(), "r");
            $deliminator = ";";
            $contador = 0;
            $contMod = 0;
            DB::beginTransaction();
            while (($datos = fgetcsv($gestor, 10000, $deliminator)) !== FALSE) {
                Log::info("_________________________________________________________________");
                Log::info("Datos: ".json_encode($datos));
                $cliente = $this->clienteModel->getByCodigo( $datos[0] );

                if($cliente == null){

                        $c4 = $this->cat->getByLabel('c4');
                        $c5 = $this->cat->getByLabel('c5');
                        $c6 = $this->cat->getByLabel('c6');

                        $CE = floor((floatval($datos[9])*floatval($datos[10]))*(floatval($datos[11])*floatval($datos[12])));

                        $TP = floor((floatval($datos[13])/intval($c4))*intval($c5));                        

                        $data = array(
                            ClienteRepository::SQL_NOMBRE    => $datos[1],
                            ClienteRepository::SQL_CORREO    => $datos[2],
                            ClienteRepository::SQL_TELEFONO  => $datos[3],
                            ClienteRepository::SQL_RFC       => $datos[4],
                            ClienteRepository::SQL_CP        => $datos[5],
                            ClienteRepository::SQL_CIUDAD    => $datos[6],
                            ClienteRepository::SQL_DIRECCION => $datos[7],
                            ClienteRepository::SQL_CODE      => $datos[0],
                            ClienteRepository::SQL_P         => $datos[8],
                            ClienteRepository::SQL_SHOPS     => $datos[9],
                            ClienteRepository::SQL_SKU       => $datos[10],
                            ClienteRepository::SQL_PACK      => $datos[11],
                            ClienteRepository::SQL_D2        => $datos[12],
                            ClienteRepository::SQL_TE        => $datos[11],
                            ClienteRepository::SQL_CE        => $CE,
                            ClienteRepository::SQL_TP        => $TP,
                            ClienteRepository::SQL_AVERAGE   => $datos[13],
                            ClienteRepository::SQL_D         => $datos[14],
                            ClienteRepository::SQL_ESTATUS   => ClienteRepository::ACTIVE
                        );

                        $this->clienteModel->create($data);

                        $contador++;

                } else {
                    
                        $c4 = $this->cat->getByLabel('c4');
                        $c5 = $this->cat->getByLabel('c5');

                        $CE = floor((floatval($datos[9])*floatval($datos[10]))*(floatval($datos[11])*floatval($datos[12])));

                        $TP = floor((floatval($datos[13])/intval($c4))*floatval($c5));

                        Log::debug(" ClientesController - CSVCli - CE:  ".$CE." TP: ".$TP." Promedio: ".floatval($datos[13]).
                                    " tiendas: ".floatval($datos[9])." Sku: ".floatval($datos[10])." TE: ".floatval($datos[11]).
                                    " D2: ".floatval($datos[12])." C4: ".intval($c4)." C5: ".floatval($c5));

                        $datosC = array();
                        $datosC[ClienteRepository::SQL_NOMBRE]    = $datos[1];
                        $datosC[ClienteRepository::SQL_CORREO]    = $datos[2];
                        $datosC[ClienteRepository::SQL_TELEFONO]  = $datos[3];
                        $datosC[ClienteRepository::SQL_RFC]       = $datos[4];
                        $datosC[ClienteRepository::SQL_CP]        = $datos[5];
                        $datosC[ClienteRepository::SQL_CIUDAD]    = $datos[6];
                        $datosC[ClienteRepository::SQL_DIRECCION] = $datos[7];
                        $datosC[ClienteRepository::SQL_P]         = $datos[8];
                        $datosC[ClienteRepository::SQL_SHOPS]     = $datos[9];
                        $datosC[ClienteRepository::SQL_SKU]       = $datos[10];
                        $datosC[ClienteRepository::SQL_PACK]      = $datos[11];
                        $datosC[ClienteRepository::SQL_D2]        = $datos[12];
                        $datosC[ClienteRepository::SQL_TE]        = $datos[11];
                        $datosC[ClienteRepository::SQL_CE]        = $CE;
                        $datosC[ClienteRepository::SQL_TP]        = $TP;
                        $datosC[ClienteRepository::SQL_AVERAGE]   = $datos[13];
                        $datosC[ClienteRepository::SQL_D]         = $datos[14];

                        $cliId = $cliente->id;
                        Log::debug(" ClientesController - CSVCli - objCli:  ".$cliente);
                        //$cliId = 174;

                        $this->clienteModel->update( $cliId, $datosC);

                        $contMod++;
                }
            }
            DB::commit();
            Session::flash('exito', 'Se han agregado: '.$contador.' clientes y se modificaron:  '.$contMod);
            return Redirect::route('clientes.listado');

        } catch (\Exception $e) {
            Log::error( 'ClientesController - CSVCli - Error: '.$e->getMessage() );
            DB::rollback();
            Session::flash('errores', 'ocurrio el siguiente error: '.$e->getMessage());
            return Redirect::route('clientes.listado');
        }
    }
}