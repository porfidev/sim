<?php


namespace App\Http\Controllers\Surtido;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Controller;

use App\Repositories\OrderDetailRepository;

use App\Repositories\AssignmentRepository;

use Illuminate\Support\Facades\Log;

class SurtidoTrabajadorController extends Controller
{

    private $detModel;
    private $assiModel;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(OrderDetailRepository $det, AssignmentRepository $as)
    {
        $this->middleware('auth');
        $this->detModel = $det;
        $this->assiModel = $as;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

     public function listadoTareas(){

        try {

            Log::info(" listadoPedidos - listado ");

            $userId = Auth::id();
            //$userId = 2;

            $listado = $this->assiModel->getPedUser($userId);

            //Log::info(" listadoPedidos - listado - Listita: ".$listado->get());

            $listado = $listado->paginate(10);

            return view('surtir.pedidosUsuario',
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

     public function listaAsig(Request $request) {
        $response = array();
        $ordId = "";
        try {

            if($request->has("ord")) {
                $ordId = $request->input("ord");
            }

            Log::info(" listadoPedidos - listaAsig ");

            $listado = $this->detModel->getByIdOrd($ordId);

            $response = $listado->toArray();

            Log::info(" array especial: ".$listado);

           
        } catch (\Exception $e) {
            Log::error( 'listadoPedidos - listaAsig - Error: '.$e->getMessage() );
            $response = array();

        }
        return response()->json($response, 200);
    }
}