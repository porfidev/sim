<?php


namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Purchase;
use App\PurchaseItem;

use App\Repositories\PurchaseItemsRepository;
use App\Repositories\PurchasesRepository;

class DownloadPurchaseOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:dpo';

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
    public function __construct(Purchase $pur, PurchaseItem $puri)
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
        //Servicio del bajado de pedidos

            //---------------------------------------------------------------------------------------



            $servername = '192.168.71.4';
            $connectionInfo = array('Database' =>  'MARCOPOLO_PROD' , 'UID' => 'sim',
                                'PWD' => '~Cs_z~Ww','ReturnDatesAsStrings'=>true, 'CharacterSet' => 'UTF-8');

            $con = sqlsrv_connect($servername,$connectionInfo);

            if($con){

                $sql = "select DocNum, CardCode, CardName, DocDueDate, ItemCode, Quantity, CodeBars, U_CANTREQ from OPOR".
                       " left join POR1 ON OPOR.DocEntry = POR1.DocEntry";
            $stmt = sqlsrv_query( $con, $sql );

            while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {

                Log::info(" purchaseOrder:  ".$row['DocNum']." , ".$row['CardCode']." , ".$row['CardName'].
                          " , ".$row['DocDueDate']);


                $data1 = array(
                    PurchasesRepository::SQL_DOCNUM  => $row['DocNum'],
                    PurchasesRepository::SQL_CARDCODE   => $row['CardCode'],
                    PurchasesRepository::SQL_CARDNAME   => $row['CardName'],
                    PurchasesRepository::SQL_DOCDUEDATE   => $row['DocDueDate']
                );


                $data2 = array(
                    PurchaseItemsRepository::SQL_ITEMCODE => $row['ItemCode'],
                    PurchaseItemsRepository::SQL_QUANTITY => $row['Quantity'],
                    PurchaseItemsRepository::SQL_CODEBARS => $row['CodeBars'],
                    PurchaseItemsRepository::SQL_CANTREQ => $row['U_CANTREQ']
                );
       

                if($this->pur->getByCode($row['DocNum']) == null){

                    $this->pur->create($data1);
                }

                $idPur = $this->pur->getByCode($row['DocNum']);      

                if($this->puri->getDetExt($row['purchase_id'],$row['Quantity'],$row['CodeBars'],$row['U_CANTREQ'],$idPur) == null){

                    $this->puri->create($data2);
                    
                }
            }


            }else{

                Log::info(" DownloadPurchaseOrders - error:  ".sqlsrv_errors());

            }
    }
}


