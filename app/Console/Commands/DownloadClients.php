<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Illuminate\Support\Facades\Log;

use App\Repositories\ClienteRepository;

class DownloadClients extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clientsDownload';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Download clients';

    protected $clientsModel;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(ClienteRepository $cli){

        parent::__construct();

        $this->clientsModel = $cli;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {

        $servername = env('SQL_SERVER_NAME', '');
        $connectionInfo = array('Database' =>  env('SQL_DATABASE_NAME', '') , 
                                'UID' => env('SQL_USER', ''),
                                'PWD' => env('SQL_PASS', ''),
                                'ReturnDatesAsStrings'=>true, 
                                'CharacterSet' => 'UTF-8');

        $con = sqlsrv_connect($servername,$connectionInfo);

        if($con){

            echo "conexion exitosa<br>";

            $sql = "select CardName,CardCode,Phone1,ZipCode,City,Address,E_Mail,LicTradNum from OCRD".
                       " where OCRD.CardType = 'C'";
            $stmt = sqlsrv_query( $con, $sql );

            while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {

                Log::info(" Cliente:  ".$row['CardName']." , ".$row['CardCode']." , ".$row['Phone1'].
                          " , ".$row['ZipCode']." , ".$row['City']." , ".$row['Address']." , ".$row['E_Mail'].
                          " , ".$row['LicTradNum']);


                $data = array(
                    ClienteRepository::SQL_NOMBRE  => (empty($row['CardName'])) ? "-":$row['CardName'],
                    ClienteRepository::SQL_CORREO   => (empty($row['E_Mail'])) ? "-":$row['E_Mail'],
                    ClienteRepository::SQL_TELEFONO  => (empty($row['Phone1'])) ? "-":$row['Phone1'],
                    ClienteRepository::SQL_RFC   => (empty($row['LicTradNum'])) ? "-":$row['LicTradNum'],
                    ClienteRepository::SQL_CP  => (empty($row['ZipCode'])) ? "-":$row['ZipCode'],
                    ClienteRepository::SQL_CIUDAD   => (empty($row['City'])) ? "-":$row['City'],
                    ClienteRepository::SQL_DIRECCION  => (empty($row['Address'])) ? "-":$row['Address'],
                    ClienteRepository::SQL_ESTATUS   => ClienteRepository::ACTIVE,
                    ClienteRepository::SQL_CODE  => $row['CardCode'],
                    ClienteRepository::SQL_P   => "-",
                    ClienteRepository::SQL_SHOPS  => "-",
                    ClienteRepository::SQL_SKU   => "-",
                    ClienteRepository::SQL_D2   => "-",
                    ClienteRepository::SQL_TE   => "-",
                    ClienteRepository::SQL_CE  => "-",
                    ClienteRepository::SQL_TP   => "-",
                    ClienteRepository::SQL_AVERAGE  => "-",
                    ClienteRepository::SQL_D   => "-",
                );

                $cliEsp = $this->clientsModel->getByCodigo($row['CardCode']);

                if($cliEsp != null){

                    $datos = array();
                    $datos[ClienteRepository::SQL_RFC] = $row['LicTradNum'];

                    $this->clientsModel->update( $cliEsp->id, $datos);
                    
                }else{

                    $this->clientsModel->create($data);

                }                

            }

        }else{

                Log::info(" CatalogosController - error:  ".sqlsrv_errors());

        }

    }
}
