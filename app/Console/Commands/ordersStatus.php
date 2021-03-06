<?php

namespace App\Console\Commands;

use App\Calculation;
use App\Order;
use App\Catalogo;

use Illuminate\Console\Command;
use App\Repositories\CalculationRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;

class OrdersStatus extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'ordersStatus';

    protected $calc;
    protected $order;
    protected $cat;

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
    public function __construct(Calculation $cal, Order $ord, Catalogo $cata)
    {
        parent::__construct();

        $this->calc = $cal;
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
        $listado = $this->order->getAll();

        foreach ($listado as $element) {

            $idCalc = $this->calc->getCalc($element->id);

            $fechaI = strtotime($element->start);
            $fechaF = strtotime($element->end);

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

            //$validity = diasFechaProgramada - Fecha hoy

            $validity = $daysLeft;

            $distanciaEsp = $this->cat->getById($element->dist_id);

            /*if($daysValidity > $c1){
                $validity = (($daysValidity/$c2)+$daysLeft+$c3);

            } else if($daysValidity < $c1){
                $validity = (($daysValidity/$c2)+$daysLeft);
            }*/

            $V = 0;
            if($validity <= 1){
                $V = 90;
            } else if($validity == 2) {
                $V = 50;
            } else if($validity > 3) {
                $V = (50 - (2*($validity - 2)));
                if($V < 0) {
                    $V = 0;
                }
            }

            $dist = $distanciaEsp->value;

            //$priority = (($idCalc->P + $V + $idCalc->D) / 2);
            $priority = floor((($idCalc->P + $V + $idCalc->D) / 2) + $dist);

            $datos = array();
            $datos[CalculationRepository::SQL_V]   = $V;
            $datos[CalculationRepository::SQL_PRIORITY]  = $priority;

            $this->calc->update( $idCalc->id, $datos);
        }
    }
}
