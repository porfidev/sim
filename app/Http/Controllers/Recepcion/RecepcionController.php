<?php

namespace App\Http\Controllers\Recepcion;

use Validator;
use Auth;
use DB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Session;

use Illuminate\Support\Facades\Input;

use App\Http\Controllers\Controller;
use App\Repositories\PurchaseRepository;

use Illuminate\Support\Facades\Redirect;


use App\Purchase;
use App\PurchaseItems;

class RecepcionController extends Controller
{
    private $purchaseModel;

    const SESSION_ID         = "su_id";
    const SESSION_PROVEEDOR  = "su_proveedor";
    const SESSION_RECEPTIOM  = "su_reception";
    const SESSION_ENTREGA    = "su_entrega";
    const SESSION_CODIGO     = "su_codigo";

    public function __construct(PurchaseRepository $cli){

        $this->middleware('auth');
        $this->purchaseModel = $cli;
    }

    public function listado(Request $request){
        $data = Purchase::paginate(10);

        return view('recepcion.listado',['data' => $data] );

        /*
        try {
            Log::info(" ClientesController - listado ");

            $search = array();

            Log::info(" ClientesController - listado - search: ".json_encode($search));

            $listado = $this->clienteModel->getAll($search);
            return view('clientes.listado',
                array(
                    "listado" => $listado
                ));
        } catch (\Exception $e) {
            Log::error( 'ClientesController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
        */
    }



    public function listadoItems($purchase_id)
    {
        $data = PurchaseItems::where('purchase_id','=',$purchase_id)->paginate(10);

        return view('recepcion.listadoItems',['data' => $data] );
    }


}