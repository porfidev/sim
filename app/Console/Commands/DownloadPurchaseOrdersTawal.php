<?php


namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Purchase;
use App\PurchaseItems;

use App\Repositories\PurchaseItemsRepository;
use App\Repositories\PurchasesRepository;
use Illuminate\Support\Facades\Log;

class DownloadPurchaseOrdersTW extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:dpoTW';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    protected $pur;
    protected $puri;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(Purchase $pur, PurchaseItems $puri)
    {
        parent::__construct();
        $this->pur = $pur;
        $this->puri = $puri;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //Servicio del bajado de ordenes de pedidos

            //---------------------------------------------------------------------------------------



            $servername = '192.168.71.4';
            $connectionInfo = array('Database' =>  'TAWAL_PROD' , 'UID' => 'sim',
                                'PWD' => '~Cs_z~Ww','ReturnDatesAsStrings'=>true, 'CharacterSet' => 'UTF-8');

            $con = sqlsrv_connect($servername,$connectionInfo);

            if($con){

                $sql = "select OPOR.DocEntry, DocNum, CardCode, CardName, DocDueDate, ItemCode, Quantity, CodeBars, LineNum, U_CANTREQ from OPOR".
                       "  join POR1 ON OPOR.DocEntry = POR1.DocEntry where OPOR.DocStatus = 'O' ";
                $stmt = sqlsrv_query( $con, $sql );
//pedimento

                $cuentaRegistros = 0;
                $cuentaPurchases = 0;
                $cuentaPurchaseItems = 0;
                $docEntry = "";
                while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC ) ) {
         
                    if (  $row['DocEntry']  != $docEntry ) {
                        $data1 = array(
                            PurchasesRepository::SQL_DOCENTRY  => $row['DocEntry'],
                            PurchasesRepository::SQL_DOCNUM  => $row['DocNum'],
                            PurchasesRepository::SQL_CARDCODE   => $row['CardCode'],
                            PurchasesRepository::SQL_CARDNAME   => $row['CardName'],
                            PurchasesRepository::SQL_DOCDUEDATE   => $row['DocDueDate']
                        );
                       
                        $creado = $this->pur->create($data1);                        
                        $docEntry  = $row['DocEntry'];
                        $cuentaPurchases++;
                    }

                    $data2 = array(
                        PurchasesRepository::SQL_DOCENTRY  => $row['DocEntry'],
                        PurchaseItemsRepository::SQL_ITEMCODE => $row['ItemCode'],
                        PurchaseItemsRepository::SQL_QUANTITY => $row['Quantity'],
                        PurchaseItemsRepository::SQL_CODEBARS => $row['CodeBars'],
                        PurchaseItemsRepository::SQL_CANTREQ => $row['U_CANTREQ'],  
                        PurchaseItemsRepository::SQL_PURCHASE_ID   => $creado['id']
                    );

                    $this->puri->create($data2);
                    $cuentaPurchaseItems++;
                    if ( $cuentaRegistros++ == 1000 ) break;
                
                }
                echo (" Registros:  " . $cuentaRegistros);
                echo (" Purchase:  " . $cuentaPurchases);
                echo (" Purchase Items:  " . $cuentaPurchaseItems);

            }else{

                Log::info(" DownloadPurchaseOrdersTW - error:  ".sqlsrv_errors());

            }
    }
}
