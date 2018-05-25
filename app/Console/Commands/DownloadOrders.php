<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Calculation;
use App\OrderDetail;
use App\Order;
use App\Catalogo;

use App\Repositories\CalculationRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;


class DownloadOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:name';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    protected $calc;
    protected $detail;
    protected $order;
    protected $cat;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(Calculation $cal, OrderDetail $ordDet, Order $ord, Catalogo $cata)
    {
        parent::__construct();
        $this->calc = $cal;
        $this->detail = $ordDet;
        $this->order = $ord;
        $this->cat = $cata;
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
            $connectionInfo = array('Database' =>  'MARCOPOLO_PROD' , 'UID' => 'sim',
                                'PWD' => '~Cs_z~Ww','ReturnDatesAsStrings'=>true, 'CharacterSet' => 'UTF-8');

            $con = sqlsrv_connect($servername,$connectionInfo);

            if($con){

                echo "conexion exitosa<br>";

                $sql = "select DOCNUM,CARDCODE,U_VIGENCIAINI,U_VIGENCIAFIN,DOCSTATUS,ITEMCODE,QUANTITY,U_CANTREQ,Confirmed from ORDR".
                       " left join RDR1 ON ORDR.DocEntry = RDR1.DocEntry where ORDR.DocStatus = 'O' and ORDR.Confirmed = 'Y'";
            $stmt = sqlsrv_query( $con, $sql );

            while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {

                Log::info(" Registro:  ".$row['DOCNUM']." , ".$row['CARDCODE']." , ".$row['U_VIGENCIAINI'].
                          " , ".$row['U_VIGENCIAFIN']." , ".$row['DOCSTATUS']." , ".$row['Confirmed']." , ".$row['ITEMCODE'].
                          " , ".$row['QUANTITY']." , ".$row['U_CANTREQ']);

                $fechaI = strtotime($row['U_VIGENCIAINI']);
                $fechaF = strtotime($row['U_VIGENCIAFIN']);

                $data1 = array(
                    OrderRepository::SQL_CODIGO_ORDEN  => $row['DOCNUM'],
                    OrderRepository::SQL_INICIO  => date('Y-m-d', $fechaI),
                    OrderRepository::SQL_FIN => date('Y-m-d', $fechaF),
                    OrderRepository::SQL_ESTATUS => 1,
                    OrderRepository::SQL_CODIGO   => $row['CARDCODE']
                );

                $data2 = array(
                    OrderDetailRepository::SQL_CODIGOP => $row['ITEMCODE'],
                    OrderDetailRepository::SQL_CANTIDAD => $row['QUANTITY'],
                    OrderDetailRepository::SQL_CANTIDADP => $row['U_CANTREQ'],
                    'codigoOrden' => $row['DOCNUM']
                );

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

                $validity = 0;

                if($daysValidity > $c1){

                    $validity = (($daysValidity/$c2)+$daysLeft+$c3);

                }else if($daysValidity < $c1){

                    $validity = (($daysValidity/$c2)+$daysLeft);

                }

                $V = 0;

                if($Validity == 1){

                    $V = 90;

                }else if($validity == 2){

                    $V = 50;

                }else if($validity > 3){

                    $V = (50 - (2*($validity - 2)));

                    if($V < 0){

                        $V = 0;
                    }

                }
            }


            }else{

                Log::info(" CatalogosController - error:  ".sqlsrv_errors());

            }
    }
}