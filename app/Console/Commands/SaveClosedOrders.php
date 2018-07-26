<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class SaveClosedOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'saveOrders';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    const SQL1 = "SELECT 
                    Id,
                    CardCode,
                    CardName,
                    status
                FROM VentasPedidosSim";


    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $servername = env('SQL_SERVER_NAME', '');
        $connectionInfo = array('Database' =>  env('SQL_DATABASE_NAME_2', '') , 
                                'UID' => env('SQL_USER', ''),
                                'PWD' => env('SQL_PASS', ''),
                                'ReturnDatesAsStrings'=>true,
                                'CharacterSet' => 'UTF-8');

        $connectionInfo2 = array('Database' =>  env('SQL_DATABASE_NAME', '') , 
                                'UID' => env('SQL_USER', ''),
                                'PWD' => env('SQL_PASS', ''),
                                'ReturnDatesAsStrings'=>true, 
                                'CharacterSet' => 'UTF-8');

        Log::info("DownloadOrders - connection:  [".print_r($connectionInfo)."]");

        $con = sqlsrv_connect($servername, $connectionInfo);
        $con2 = sqlsrv_connect($servername, $connectionInfo2);

        Log::info("DownloadOrders - sss:  [".print_r($con)."]");

        print_r(sqlsrv_errors());

        if($con && $con2){

            Log::info("saveOrders - si entro");
            $stmt = sqlsrv_query( $con, self::SQL1);

            print_r(sqlsrv_errors());

            while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {

                Log::info(" pedido:  ".$row['Id']." , ".$row['CardCode']." , ".$row['CardName'].
                        " , ".$row['status']);

                $SQL2 = "SELECT 
                            DOCNUM,
                            DocStatus 
                        FROM ORDR where DOCNUM = ".$row['Id'];

                $stmt2 = sqlsrv_query( $con2, $SQL2);

                print_r(sqlsrv_errors());

                $row2 = sqlsrv_fetch_array( $stmt2, SQLSRV_FETCH_ASSOC);

                if($row2["DocStatus"] != 'O'){

                    Log::info("Pedido con ID: ".$row['Id']." Cerrado, respaldando y eliminando...");

                    $sql = "INSERT INTO HistVentasPedidosSim (Id, CardCode,CardName,Status) VALUES ".
                    "('".$row['Id']."', '".$row['CardCode'].
                    "', '".$row['CardName']."', 'C')";

                    /*$sql = "INSERT INTO VentasPedidosSim (Id, CardCode,CardName,Status) VALUES ".
                            "('12', '123-123', 'oxxo', 'O')";*/

                     Log::info("Query: ".$sql);

                    $stmt3 = sqlsrv_query( $con, $sql);

                    print_r(sqlsrv_errors());

                    if( $stmt3 != false ) {

                        Log::info("Se inserto con exito pedido con ID: ".$row['Id']." en historial");

                        $sqlDel = "delete from VentasPedidosSim where Id = '".$row['Id']."'";

                        $stmt4 = sqlsrv_query( $con, $sql);

                        print_r(sqlsrv_errors());

                        if( !$stmt3 ) {

                            Log::info("Se borro con exito pedido con ID: ".$row['Id']);

                        }else{

                            Log::info("error al borrar pedido con ID: ".$row['Id']);
                        }

                    }
                }

            }
        }
    }
}
