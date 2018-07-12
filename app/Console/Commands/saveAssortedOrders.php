<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class saveAssortedOrders extends Command
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

        $con = sqlsrv_connect($servername, $connectionInfo);

        if($con){

            Log::info("saveOrders - si entro");
        }
    }
}
