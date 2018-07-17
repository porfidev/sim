<?php

namespace App\Http\Controllers\Pendings;

use Validator;
use Auth;
use DB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Session;
use Datetime;

use Illuminate\Support\Facades\Input;

use App\Http\Controllers\Controller;
use App\Repositories\PendingsRepository;
use App\Repositories\ClienteRepository;
use App\Repositories\CatalogoRepository;
use App\Repositories\CalculationRepository;
use App\Repositories\OrderRepository;

use Illuminate\Support\Facades\Redirect;

class PendingsController extends Controller{

    private $pendingModel;
    private $clienteModel;
    private $cat;
    protected $calc;
    private $orderModel;

    const SESSION_ID        = "scl_id";

    /**
     * Create a new catalogos instance.
     *
     * @return void
     */
    public function __construct(PendingsRepository $pen, ClienteRepository $cli, CatalogoRepository $cata,
                                CalculationRepository $calcu, OrderRepository $ord)
    {
        $this->middleware(['auth', 'permission', 'update.session']);

        $this->pendingModel = $pen;
        $this->clienteModel = $cli;
        $this->cat = $cata;
        $this->calc   = $calcu;
        $this->orderModel   = $ord;
    }

    /**
     * Show the catalogos list.
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request){

        try {
            Log::info(" PendingsController - listado ");

            $listado = $this->pendingModel->getAll();
            $listadoU = $this->pendingModel->getUserPed(Auth::id());
            $empaques = $this->cat->getGroupById(13);

            Log::info(" PendingsController - listado - listadoU: ".count($listadoU));

            return view('pendings.listado',
                array(
                    "listado"  => $listado,
                    "listadoU" => $listadoU,
                    "empaques" => $empaques
                ));
        } catch (\Exception $e) {
            Log::error( 'PendingsController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    public function apartar(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" PendingsController - apartar ");
            if($request->has('idP') && $request->has('id'))
            { 

                $datos = array();
                $datos[PendingsRepository::SQL_ID_USER] = Auth::id();

                if(!$this->pendingModel->update( $request->get('id'), $datos)) {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se pudo apartar el pedido" );
                }
              
            }

        } catch (\Exception $e) {
            Log::error( "PendingsController - apartar: ".$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }

        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    public function arreglaCli(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" PendingsController - editar ");
            if($request->has('idE') && $request->has('idPed'))
            {
                $catalogo = $this->clienteModel->getById( $request->get('idE') );
                if( !empty($catalogo) )
                {
                    $validator = Validator::make(
                        $request->all(),
                        array(
                            'p'         => 'required|numeric|max:100',
                            'tiendas'   => 'required|numeric',
                            'sku'       => 'required|numeric',
                            'd2'        => 'required|numeric',
                            'te'        => 'required|numeric|exists:catalogs,id',
                            'promedio'  => 'required|numeric',
                            'cita'      => 'required|numeric'
                        ),
                        Controller::$messages
                    );
                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = $validator->errors();
                    } else {

                        $te = $this->cat->getById($request->te);
                        $c5 = $this->cat->getByLabel('c5');
                        $c4 = $this->cat->getByLabel('c4');

                        $ce = floor(($request->tiendas * $request->sku) * ($te->value * $request->d2));
                        $tp = floor(($request->promedio/$c4)*$c5);

                        $datos = array();
                        $datos[ClienteRepository::SQL_APPOINT]   = $request->cita;
                        $datos[ClienteRepository::SQL_P]         = $request->p;
                        $datos[ClienteRepository::SQL_SHOPS]     = $request->tiendas;
                        $datos[ClienteRepository::SQL_SKU]       = $request->sku;
                        $datos[ClienteRepository::SQL_D2]        = $request->d2;
                        $datos[ClienteRepository::SQL_TE]        = $request->te;
                        $datos[ClienteRepository::SQL_CE]        = $ce;
                        $datos[ClienteRepository::SQL_TP]        = $tp;
                        $datos[ClienteRepository::SQL_AVERAGE]   = $request->promedio;

                        if(!$this->clienteModel->update( $request->get('idE'), $datos)) {
                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el cliente" );
                        }else{


                            $cli = $this->clienteModel->getById($request->get('idE'));

                            self::recalculaPrioridad($cli);


                        }
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos de cliente" );
                }
            }

        } catch (\Exception $e) {
            Log::error( "PendingsController - editar - Exception: ".$e->getMessage().
                " en la linea: ".$e->getLine() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }

    public function arreglaDist(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        $datos     = array();
        try {
            Log::info(" PendingsController - arreglaDist ");
            if($request->has('id'))
            {
                $catalogo = $this->cat->getById( $request->get('id') );
                if( !empty($catalogo) )
                {
                    $validator = Validator::make(
                        $request->all(),
                        array(                         
                            'valor'      => 'required|numeric|max:50',
                        ),
                        Controller::$messages
                    );
                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = $validator->errors();
                    } else {

                        $datos = array();
                        $datos[CatalogoRepository::SQL_VALOR]    = $request->valor;

                        if(!$this->cat->update( $request->get('id'), $datos)) {
                            $resultado = "ERROR";
                            $mensajes  = array( "No se pudo actualizar el catalogo" );
                        }else{

                            $dist = $this->cat->getById($request->get('id'));

                            self::recalculaPrioridadDist($dist);
                        }
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontraron datos de catalogo" );
                }
            }

        } catch (\Exception $e) {
            Log::error( 'PendingsController - arreglaDist - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes = array( $e->getMessage() );
        }
        return response()->json(array('resultado' => $resultado, 'mensajes' => $mensajes, 'datos' => $datos));
    }

    public function recalculaPrioridad($cli) {
        
        try {

            Log::info(" PendingsController - recalculaPrioridad ");

            $listado = $this->orderModel->getByCodeCli($cli->code);

            foreach ($listado as $elem) {

                $calc = $this->calc->getCalc($elem->id);

                $dist = $this->cat->getById($calc->dist_id);

                $pend = $this->pendingModel->getByIdPed($elem->id);

                $datos4 = array();

                $datos4[PendingsRepository::SQL_STA_CLI] = 0;

                $this->pendingModel->update($pend->id, $datos4);

                Log::info(" PendingsController - recalculaPrioridad - bandera 1");
                
                if($cli->CE != '-'
                    && $cli->TP != '-'
                    && $cli->P != '-'
                    && $cli->appointment != null
                    && $dist->value != -1){

                    //función para restar fechas, regresa los dias restantes

                        //------------------------------------------------------
                        $datetime1 = new DateTime(date('Y-m-d', $elem->start));
                        $datetime2 = new DateTime(date('Y-m-d', $elem->end));
                        $interval = $datetime1->diff($datetime2);
                        // DV => Días de vigencia
                        $daysValidity = intval($interval->format("%d"));

                        //------------------------------------------------------
                        $datetime3 = new DateTime("now");
                        $interval1 = $datetime1->diff($datetime3);
                        // DF => Días faltantes
                        $daysLeft = intval($interval1->format("%d"));

                        $c1 = $this->cat->getByLabel('c1');
                        $c2 = $this->cat->getByLabel('c2');
                        $c3 = $this->cat->getByLabel('c3');
                        $c6 = $this->cat->getByLabel('c6');

                        /**
                         * Cálculo de días para fecha programada
                         */
                        $validity = 0;
                        if($daysValidity > $c1) {
                            $validity = (($daysValidity/$c2)+$daysLeft+$c3);
                        } else if($daysValidity < $c1) {
                            $validity = (($daysValidity/$c2)+$daysLeft);

                        }

                        /**
                         * Regla 2: Cálculo de puntaje para vigencia
                         *
                         */
                        $V = 0;
                        if($validity == 1){
                            $V = 90;
                        } else if($validity == 2) {
                            $V = 50;
                        } else if($validity > 3) {
                            $V = (50 - (2*($validity - 2)));
                            if($V < 0) {
                                $V = 0;
                            }
                        }

                        /**
                         * Cálculo de fecha programada de atención del pedido
                         */

                        $cita = $cli->appointment;

                        if($cita == ClienteRepository::ACTIVE_APPOINTMENT){

                            $c6 = $this->cat->getByLabel('c7');

                            $fechaInicio = date('Y-m-d', $elem->start);
                            $fp = strtotime ( $c6.' day' , strtotime ( $fechaInicio ) );
                            $fp = date('Y-m-d', $fp);

                        }else{

                            $fechaHoy = date('Y-m-j');
                            $fp = strtotime ( '+'.$validity.' day' , strtotime ( $fechaHoy ) );
                            $fp = date('Y-m-d', $fp);

                        }

                        $fpCompara = strtotime($fp);

                        $boolFPExcedida = 0;

                        if($datetime3 > $fpCompara){

                            $fp = date('Y-m-j');
                            $boolFPExcedida = 1;
                        }

                        if(date('D',$fp) == 'Sun' && $boolFPExcedida != 1){

                            $nuevafecha = strtotime ( '-1 day' , strtotime ( $fp ) ) ;
                            $fp = date ( 'Y-m-d' , $nuevafecha );

                        }else{

                            $nuevafecha = strtotime ( '+1 day' , strtotime ( $fp ) ) ;
                            $fp = date ( 'Y-m-d' , $nuevafecha );
                        }

                        /**
                         * Regla 5: Cálculo de detalle del pedido
                         *
                         * (Complejidad de empaque * Tamaño del pedido) / 2600
                         */
                        $D = floor(($cli->CE * $cli->TP) / $c6);

                        /**
                         * Regla 6: Puntaje por distancia
                         */
                        $dista = $dist->value;

                        /**
                         * Regla general: Prioridad del pedido
                         *
                         * ((P + V + D) / 2 ) + Dist
                         */
                        $priority = floor((($cli->P + $V + $D) / 2) + $dista);

                        $data3 = array(
                            CalculationRepository::SQL_P        => $cliente->P,
                            CalculationRepository::SQL_V        => $V,
                            CalculationRepository::SQL_D        => $D,
                            CalculationRepository::SQL_PRIORITY => $priority,
                            CalculationRepository::SQL_FP       => $fp
                        );

                        $this->calc->update($calc->id, $data3);

                        $this->pendingModel->delete($pend->id);
                    
                }

            }
            

        } catch (\Exception $e) {
            Log::error( "PendingsController - recalculaPrioridad - error: ".$e->getMessage().
                " en la linea: ".$e->getLine() );
        }

        return true;
    }

    public function recalculaPrioridadDist($dist) {
        
        try {

            Log::info(" PendingsController - recalculaPrioridadDist - idDist: ".$dist->id);

            $listado = $this->calc->getCalcDist($dist->id);

            Log::info(" PendingsController - recalculaPrioridadDist - countList: ".count($listado));

            foreach ($listado as $elem) {

                $ord = $this->orderModel->getById($elem->order_id);

                $cli = $this->clienteModel->getByCodigo($ord->code);

                $pend = $this->pendingModel->getByIdPed($ord->id);

                $datos4 = array();

                $datos4[PendingsRepository::SQL_STA_CAT] = 0;

                $this->pendingModel->update($pend->id, $datos4);

                Log::info(" PendingsController - recalculaPrioridadDist - bandera 1");
                
                if($cli->CE != '-'
                    && $cli->TP != '-'
                    && $cli->P != '-'
                    && $cli->appointment != null
                    && $dist->value != -1){

                    //función para restar fechas, regresa los dias restantes

                        //------------------------------------------------------
                        $datetime1 = new DateTime(date('Y-m-d', $elem->start));
                        $datetime2 = new DateTime(date('Y-m-d', $elem->end));
                        $interval = $datetime1->diff($datetime2);
                        // DV => Días de vigencia
                        $daysValidity = intval($interval->format("%d"));

                        //------------------------------------------------------
                        $datetime3 = new DateTime("now");
                        $interval1 = $datetime1->diff($datetime3);
                        // DF => Días faltantes
                        $daysLeft = intval($interval1->format("%d"));

                        $c1 = $this->cat->getByLabel('c1');
                        $c2 = $this->cat->getByLabel('c2');
                        $c3 = $this->cat->getByLabel('c3');
                        $c6 = $this->cat->getByLabel('c6');

                        /**
                         * Cálculo de días para fecha programada
                         */
                        $validity = 0;
                        if($daysValidity > $c1) {
                            $validity = (($daysValidity/$c2)+$daysLeft+$c3);
                        } else if($daysValidity < $c1) {
                            $validity = (($daysValidity/$c2)+$daysLeft);

                        }

                        /**
                         * Regla 2: Cálculo de puntaje para vigencia
                         *
                         */
                        $V = 0;
                        if($validity == 1){
                            $V = 90;
                        } else if($validity == 2) {
                            $V = 50;
                        } else if($validity > 3) {
                            $V = (50 - (2*($validity - 2)));
                            if($V < 0) {
                                $V = 0;
                            }
                        }

                        /**
                         * Cálculo de fecha programada de atención del pedido
                         */

                        $cita = $cli->appointment;

                        if($cita == ClienteRepository::ACTIVE_APPOINTMENT){

                            $c6 = $this->cat->getByLabel('c7');

                            $fechaInicio = date('Y-m-d', $elem->start);
                            $fp = strtotime ( $c6.' day' , strtotime ( $fechaInicio ) );
                            $fp = date('Y-m-d', $fp);

                        }else{

                            $fechaHoy = date('Y-m-j');
                            $fp = strtotime ( '+'.$validity.' day' , strtotime ( $fechaHoy ) );
                            $fp = date('Y-m-d', $fp);

                        }

                        $fpCompara = strtotime($fp);

                        $boolFPExcedida = 0;

                        $hoyE = strtotime(date('Y-m-j'));

                        if($hoyE > $fpCompara){

                            $fp = date('Y-m-j');
                            $boolFPExcedida = 1;
                        }

                        if(date('D',$fpCompara) == 'Sun' && $boolFPExcedida != 1){

                            $nuevafecha = strtotime ( '-1 day' , strtotime ( $fp ) ) ;
                            $fp = date ( 'Y-m-d' , $nuevafecha );

                        }else{

                            $nuevafecha = strtotime ( '+1 day' , strtotime ( $fp ) ) ;
                            $fp = date ( 'Y-m-d' , $nuevafecha );
                        }

                        /**
                         * Regla 5: Cálculo de detalle del pedido
                         *
                         * (Complejidad de empaque * Tamaño del pedido) / 2600
                         */
                        $D = floor(($cli->CE * $cli->TP) / $c6);

                        /**
                         * Regla 6: Puntaje por distancia
                         */
                        $dista = $dist->value;

                        /**
                         * Regla general: Prioridad del pedido
                         *
                         * ((P + V + D) / 2 ) + Dist
                         */
                        $priority = floor((($cli->P + $V + $D) / 2) + $dista);

                        $data3 = array(
                            CalculationRepository::SQL_P        => $cli->P,
                            CalculationRepository::SQL_V        => $V,
                            CalculationRepository::SQL_D        => $D,
                            CalculationRepository::SQL_PRIORITY => $priority,
                            CalculationRepository::SQL_FP       => $fp
                        );

                        $data1 = array(
                            OrderRepository::SQL_ESTATUS        => 1
                        );

                        $this->orderModel->update($ord->id,$data1);

                        $this->calc->update($elem->id, $data3);

                        $this->pendingModel->delete($pend->id);
                    
                }

            }
            

        } catch (\Exception $e) {
            Log::error( "PendingsController - recalculaPrioridadDist - error: ".$e->getMessage().
                " en la linea: ".$e->getLine() );
        }

        return true;
    }
}