<?php

namespace App\Http\Controllers\Surtido;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;

use App\Repositories\CalculationRepository;

use Illuminate\Support\Facades\Auth;

class SurtidoJefeController extends Controller
{

    private $calcModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(CalculationRepository $cal)
    {
        $this->middleware('auth');
        $this->calcModel = $cal;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function listadoPedidos(){

        try {

            Log::info(" listadoPedidos - listado ");

            $listado = $this->calcModel->getAllOrd();

            //Log::info(" listadoPedidos - listado - Listita: ".$listado->get());

            $listado = $listado->paginate(10);

            return view('surtir.jefe',
                array(

                    "listado" => $listado
                ));

        } catch (\Exception $e) {
            Log::error( 'listadoPedidos - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }
}