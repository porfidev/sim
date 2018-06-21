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

    const SQL = "SELECT
                    DOCNUM,
                    CARDCODE,
                    U_VIGENCIAINI,
                    U_VIGENCIAFIN,
                    DOCSTATUS,
                    ITEMCODE,
                    QUANTITY,
                    U_CANTREQ,
                    ShipToCode,
                    Confirmed,
	                Address2
                FROM ORDR
                LEFT JOIN RDR1
                    ON ORDR.DocEntry = RDR1.DocEntry
                WHERE ORDR.DocStatus = 'O'
                    AND ORDR.Confirmed = 'Y'";

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(CalculationRepository $cal, OrderDetailRepository $ordDet, OrderRepository $ord,
                                CatalogoRepository $cata, ClienteRepository $clie)
    {
        parent::__construct();
        $this->calc   = $cal;
        $this->detail = $ordDet;
        $this->order  = $ord;
        $this->cat    = $cata;
        $this->cli    = $clie;
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
        $servername = '192.168.71.4';
        $connectionInfo = array(
            'Database'             =>  'MARCOPOLO_PROD' ,
            'UID'                  => 'sim',
            'PWD'                  => '~Cs_z~Ww',
            'ReturnDatesAsStrings' => true,
            'CharacterSet'         => 'UTF-8'
        );

        $con = sqlsrv_connect($servername, $connectionInfo);

        if($con){
            $stmt = sqlsrv_query( $con, self::SQL);

            while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
                Log::info("DownloadOrders - item: [".implode(" , ", $row)."]");
                if($row['CARDCODE'] == "CLN-0044-0001") {
                    Log::info(" pedido:  ".$row['DOCNUM']." , ".$row['CARDCODE']." , ".$row['U_VIGENCIAINI'].
                            " , ".$row['U_VIGENCIAFIN']." , ".$row['DOCSTATUS']." , ".$row['Confirmed']." , ".$row['ITEMCODE'].
                            " , ".$row['QUANTITY']." , ".$row['U_CANTREQ']." , ".$row['ShipToCode']);

                    $fechaI = strtotime($row['U_VIGENCIAINI']);
                    $fechaF = strtotime($row['U_VIGENCIAFIN']);

                    $distanciaEsp = $this->cat->getByLabelFull($row['ShipToCode']);

                    if($distanciaEsp == null){

                        $dataCat = array(
                            CatalogoRepository::SQL_ETIQUETA  => $row['ShipToCode'],
                            CatalogoRepository::SQL_GRUPO_ID => 8,
                            CatalogoRepository::SQL_VALOR   => 0
                        );

                        $this->cat->create($dataCat);

                        $distanciaEsp = $this->cat->getByLabelFull($row['ShipToCode']);
                    }

                    

                    $cliente = $this->cli->getByCodigo($row['CARDCODE']);

                    if($cliente != null && $distanciaEsp->value != 0 && $cliente->CE != '-' && 
                        $cliente->TP != '-' && $cliente->P != '-'){

                        //función para restar fechas, regresa los dias restantes

                        //------------------------------------------------------
                        $datetime1 = new DateTime(date('Y-m-d', $fechaI));
                        $datetime2 = new DateTime(date('Y-m-d', $fechaF));
                        $interval = $datetime1->diff($datetime2);
                        //DV
                        $daysValidity = intval($interval->format("%d"));

                        //------------------------------------------------------
                        $datetime3 = new DateTime("now");
                        $interval1 = $datetime1->diff($datetime3);
                        //DF
                        $daysLeft = intval($interval1->format("%d"));

                        $c1 = $this->cat->getByLabel('c1');
                        $c2 = $this->cat->getByLabel('c2');
                        $c3 = $this->cat->getByLabel('c3');
                        $c6 = $this->cat->getByLabel('c6');

                        $validity = 0;

                        if($daysValidity > $c1) {

                            $validity = (($daysValidity/$c2)+$daysLeft+$c3);

                        } else if($daysValidity < $c1) {

                            $validity = (($daysValidity/$c2)+$daysLeft);

                        }

                        $V = 0;

                        if($validity == 1){

                            $V = 90;

                        } else if($validity == 2){

                            $V = 50;

                        } else if($validity > 3){

                            $V = (50 - (2*($validity - 2)));

                            if($V < 0){
                                $V = 0;
                            }

                        }

                        $data1 = array(
                            OrderRepository::SQL_CODIGO_ORDEN   => $row['DOCNUM'],
                            OrderRepository::SQL_INICIO         => date('Y-m-d', $fechaI),
                            OrderRepository::SQL_FIN            => date('Y-m-d', $fechaF),
                            OrderRepository::SQL_ESTATUS        => 1,
                            OrderRepository::SQL_CODIGO         => $row['CARDCODE'],
                            OrderRepository::SQL_DIST_ID         => $distanciaEsp->id
                        );

                        $fechaHoy = date('Y-m-j');

                        $fp = strtotime ( '+'.$validity.' day' , strtotime ( $fechaHoy ) );

                        $fp = date('Y-m-d', $fp);

                        $D = floor(($cliente->CE * $cliente->TP) / $c6);

                        $dist = $distanciaEsp->value;

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
                                CalculationRepository::SQL_FP       => "0000-00-00",
                                CalculationRepository::SQL_ORDID    => $idOrderEsp
                            );

                            $this->calc->create($data3);
                        }
                    }

                    $idOrder = $this->order->getByCode($row['DOCNUM'])->id;
                    $data2 = array(
                        OrderDetailRepository::SQL_CODIGOP   => $row['ITEMCODE'],
                        OrderDetailRepository::SQL_CANTIDAD  => $row['QUANTITY'],
                        OrderDetailRepository::SQL_CANTIDADP => $row['U_CANTREQ'],
                        OrderDetailRepository::SQL_ORDEN_ID  => $idOrder
                    );

                    $this->detail->create($data2);
                }
            }
        } else {
            Log::error(" DownloadOrders - error:  ".implode(" \n ", sqlsrv_errors()));
        }
    }
}
