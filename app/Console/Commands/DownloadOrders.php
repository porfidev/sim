<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Calculation;
use App\OrderDetail;
use App\Order;
use App\Catalogo;
use App\Cliente;
use Datetime;

use App\Repositories\CalculationRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;
use App\Repositories\ClienteRepository;
use App\Repositories\PendingsRepository;
use Illuminate\Support\Facades\Log;


class DownloadOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'downloadOrders';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Comando para descargar lista de pedidos de clientes de Marco Polo';

    protected $calc;
    protected $detail;
    protected $order;
    protected $cat;
    protected $cli;
    protected $pen;

    const SQL = "SELECT 
                    DOCNUM,
                    ORDR.CARDCODE as CARDCODE,
                    U_VIGENCIAINI,
                    U_VIGENCIAFIN,
                    DOCSTATUS,
                    RDR1.ITEMCODE as ITEMCODE,
                    QUANTITY,
                    U_CANTREQ,
                    ORDR.ShipToCode as ShipToCode,
                    Confirmed,
	                Address2,
                    U_PRESREQ,
                    INVNTITEM 
                FROM ORDR
                LEFT JOIN RDR1
                    ON ORDR.DocEntry = RDR1.DocEntry
                LEFT JOIN OITM
                    ON RDR1.ITEMCODE = OITM.ITEMCODE
                WHERE ORDR.DocStatus = 'O'
                    AND ORDR.Confirmed = 'Y'
                    AND OITM.INVNTITEM = 'Y'
                    AND ORDR.U_VIGENCIAINI is not null
                    AND ORDR.U_VIGENCIAFIN is not null";

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(CalculationRepository $cal, OrderDetailRepository $ordDet, OrderRepository $ord, CatalogoRepository $cata, ClienteRepository $clie, PendingsRepository $pend)
    {
        parent::__construct();
        $this->calc   = $cal;
        $this->detail = $ordDet;
        $this->order  = $ord;
        $this->cat    = $cata;
        $this->cli    = $clie;
        $this->pen    = $pend;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //Sericio del bajado de pedidos
        //---------------------------------------------------------------------------------------
        $servername = env('SQL_SERVER_NAME', '');
        $connectionInfo = array('Database' =>  env('SQL_DATABASE_NAME', '') , 
                                'UID' => env('SQL_USER', ''),
                                'PWD' => env('SQL_PASS', ''),
                                'ReturnDatesAsStrings'=>true, 
                                'CharacterSet' => 'UTF-8');

        Log::info("DownloadOrders - connection:  [".print_r($connectionInfo)."]");

        try {

            $con = sqlsrv_connect($servername, $connectionInfo);

            if($con){
                $stmt = sqlsrv_query( $con, self::SQL);

                print_r(sqlsrv_errors());

                while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
                    //Log::info("DownloadOrders - item: [".implode(" , ", $row)."]");
                    
                    Log::info(" pedido:  ".$row['DOCNUM']." , ".$row['CARDCODE']." , ".$row['U_VIGENCIAINI'].
                            " , ".$row['U_VIGENCIAFIN']." , ".$row['DOCSTATUS']." , ".$row['Confirmed']." , ".$row['ITEMCODE'].
                            " , ".$row['QUANTITY']." , ".$row['U_CANTREQ']." , ".$row['ShipToCode']." , ".$row['U_PRESREQ'].
                            " , ".$row['INVNTITEM']);

                    
                    $spl1 = explode(" ",$row['U_VIGENCIAINI']);
                    $spl2 = explode(" ",$row['U_VIGENCIAFIN']);
                    $fechaI = strtotime($spl1[0]);
                    $fechaF = strtotime($spl2[0]);

                    Log::info("DownloadOrders - bandera1");

                    $distanciaEsp = $this->cat->getByLabelFull($row['ShipToCode']);

                    Log::info("DownloadOrders - bandera2");

                    //0-50 dist

                    if($distanciaEsp == null){

                        $dataCat = array(
                            CatalogoRepository::SQL_ETIQUETA  => $row['ShipToCode'],
                            CatalogoRepository::SQL_GRUPO_ID => 8,
                            CatalogoRepository::SQL_VALOR   => -1
                        );

                        $this->cat->create($dataCat);

                        $distanciaEsp = $this->cat->getByLabelFull($row['ShipToCode']);
                    }

                    Log::info("DownloadOrders - distancia: ".$distanciaEsp->value);

                    $cliente = $this->cli->getByCodigo($row['CARDCODE']);

                    if($cliente != null
                        && $distanciaEsp->value != -1
                        && $cliente->CE != '-'
                        && $cliente->TP != '-'
                        && $cliente->P != '-'
                        && $cliente->appointment != null){

                        //función para restar fechas, regresa los dias restantes

                        //------------------------------------------------------
                        $datetime1 = new DateTime(date('Y-m-d', $fechaI));
                        $datetime2 = new DateTime(date('Y-m-d', $fechaF));
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

                        $data1 = array(
                            OrderRepository::SQL_CODIGO_ORDEN   => $row['DOCNUM'],
                            OrderRepository::SQL_INICIO         => date('Y-m-d', $fechaI),
                            OrderRepository::SQL_FIN            => date('Y-m-d', $fechaF),
                            OrderRepository::SQL_ESTATUS        => 1,
                            OrderRepository::SQL_CODIGO         => $row['CARDCODE'],
                            OrderRepository::SQL_DIST_ID        => $distanciaEsp->id
                        );

                        /**
                         * Cálculo de fecha programada de atención del pedido
                         */

                        $cita = $cliente->appointment;

                        if($cita == ClienteRepository::ACTIVE_APPOINTMENT){

                            $c6 = $this->cat->getByLabel('c7');

                            $fechaInicio = date('Y-m-d', $fechaI);
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
                        $D = floor(($cliente->CE * $cliente->TP) / $c6);

                        /**
                         * Regla 6: Puntaje por distancia
                         */
                        $dist = $distanciaEsp->value;

                        /**
                         * Regla general: Prioridad del pedido
                         *
                         * ((P + V + D) / 2 ) + Dist
                         */
                        $priority = floor((($cliente->P + $V + $D) / 2) + $dist);

                        if($this->order->getByCode($row['DOCNUM']) == null){

                            $this->order->create($data1);

                            $idOrderEsp = $this->order->getByCode($row['DOCNUM'])->id;

                            $data3 = array(
                                CalculationRepository::SQL_P        => $cliente->P,
                                CalculationRepository::SQL_V        => $V,
                                CalculationRepository::SQL_D        => $D,
                                CalculationRepository::SQL_PRIORITY => $priority,
                                CalculationRepository::SQL_DIST     => $distanciaEsp->id,
                                CalculationRepository::SQL_FP       => $fp,
                                CalculationRepository::SQL_ORDID    => $idOrderEsp
                            );

                            $this->calc->create($data3);
                        }

                    }else{

                        $data1 = array(
                            OrderRepository::SQL_CODIGO_ORDEN   => $row['DOCNUM'],
                            OrderRepository::SQL_INICIO         => date('Y-m-d', $fechaI),
                            OrderRepository::SQL_FIN            => date('Y-m-d', $fechaF),
                            OrderRepository::SQL_ESTATUS        => 0,
                            OrderRepository::SQL_CODIGO         => $row['CARDCODE'],
                            OrderRepository::SQL_DIST_ID         => $distanciaEsp->id
                        );

                        if($this->order->getByCode($row['DOCNUM']) == null){

                            $this->order->create($data1);

                            $idOrderEsp = $this->order->getByCode($row['DOCNUM'])->id;

                            $data3 = array(
                                CalculationRepository::SQL_P        => 0,
                                CalculationRepository::SQL_V        => 0,
                                CalculationRepository::SQL_D        => 0,
                                CalculationRepository::SQL_PRIORITY => 0,
                                CalculationRepository::SQL_DIST     => $distanciaEsp->id,
                                CalculationRepository::SQL_ORDID    => $idOrderEsp
                            );

                            $this->calc->create($data3);

                            $datos4 = array();

                            Log::info("DownloadOrders - clienteID: ".$cliente->id." CE: ".
                                      $cliente->CE." TP: ".$cliente->TP." P: ".$cliente->P.
                                      " distanciaVal: ".$distanciaEsp->value);

                            if($cliente == null){

                                $datos4[PendingsRepository::SQL_STA_CLI] = 2;

                            }

                            if($cliente->CE == '-'
                                || $cliente->TP == '-'
                                || $cliente->P == '-'){

                                $datos4[PendingsRepository::SQL_STA_CLI] = 1;

                            }else{

                                $datos4[PendingsRepository::SQL_STA_CLI] = 0;
                            }

                            if($distanciaEsp->value == -1){

                                $datos4[PendingsRepository::SQL_STA_CAT] = 1;
                            }

                            $datos4[PendingsRepository::SQL_ID_CAT] = $distanciaEsp->id;
                            $datos4[PendingsRepository::SQL_ID_CLIENT] = $cliente->id;                            
                            $datos4[PendingsRepository::SQL_ID_ORDER] = $idOrderEsp;
                            $this->pen->create($datos4);
                        }
                    }

                    $idOrder = $this->order->getByCode($row['DOCNUM'])->id;

                    $detallin = $this->detail->getDetExt($row['ITEMCODE'],$idOrder);

                    Log::info("DownloadOrders - checando... sku: ".$row['ITEMCODE']." idOrd: ".$idOrder);

                    if(empty($detallin)){

                        $data2 = array(
                            OrderDetailRepository::SQL_CODIGOP   => $row['ITEMCODE'],
                            OrderDetailRepository::SQL_CANTIDAD  => $row['QUANTITY'],
                            OrderDetailRepository::SQL_CANTIDADP => $row['U_CANTREQ'],
                            OrderDetailRepository::SQL_PRES_REQ => $row['U_PRESREQ'],
                            OrderDetailRepository::SQL_ORDEN_ID  => $idOrder
                        );

                        $this->detail->create($data2);
                    }
                    
                }
            } else {
                Log::error(" DownloadOrders - error:  ".print_r(sqlsrv_errors()));
            }

        } catch (\Exception $e) {
            Log::error( "DownloadOrders - error: ".$e->getMessage()." en la linea: ".$e->getLine() );
        }
    }
}
