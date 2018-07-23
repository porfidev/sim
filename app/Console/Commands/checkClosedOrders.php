<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class checkClosedOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'closedOrders';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //
    }
}
