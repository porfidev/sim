<?php

namespace App\Http\Controllers\Tarimas;

use DB;
use Log;
use Auth;
use Session;
use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;

use App\Http\Controllers\Controller;

use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;
use App\Repositories\BoxesRepository;
use App\Repositories\PallBoxRepository;
use App\Repositories\PalletRepository;

class TarimasController extends Controller
{

    private $productModel;
    private $orderDetailModel;
    private $orderModel;
    private $catalogModel;
    private $boxModel;
    private $palletModel;
    private $pallBoxModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        ProductRepository $product,
        OrderDetailRepository $detail,
        OrderRepository $order,
        CatalogoRepository $catalog,
        BoxesRepository $box,
        PallBoxRepository $pallBox,
        PalletRepository $pall)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->productModel      = $product;
        $this->orderDetailModel  = $detail;
        $this->orderModel        = $order;
        $this->catalogModel      = $catalog;
        $this->boxModel          = $box;
        $this->palletModel    = $pall;
        $this->pallBoxModel = $pallBox;
    }

    /**
     * Mostramos el listado de tarimas
     *
     * @return \Illuminate\Http\Response
     */
    public function listado(Request $request){

        try {

            Log::info("TarimasController - listadoTarimas - listado ");

            $tarimas = $this->palletModel->getAll();

            return view('tarimas.listado',
                array(
                    "tarimas" => $tarimas
                )
            );

        } catch (\Exception $e) {
            Log::error( 'TarimasController - listadoTarimas - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    public function nuevaTarima(Request $request) {
        $resultado = "OK";
        $mensajes  = "NA";
        try {

            Log::info(" TarimasController - nuevaTarima ");

            $code = date('YmdHis')."[".($this->palletModel->idInc()+1)."]";

            Log::info(" TarimasController - nuevaTarima - code: ".$code);

            $data = array(
                    PalletRepository::SQL_CODE  => $code
            );

            Log::info(" TarimasController - nuevaTarima - data: ".json_encode($data));
            $this->palletModel->create($data);

        } catch (\Exception $e) {
            Log::error( 'TarimasController - nuevaTarima - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    public function asignaTarima(Request $request) {

        $resultado = "OK";
        $mensajes  = "NA";
        $cantidad = 0;

        try {

            $caja = $this->boxModel->getBoxByLabel($request->get('cod'));
            $tar = $this->palletModel->getById($request->get('idTar'));

            if($caja != null){

                if($caja == 2){

                    $des = $this->orderModel->getIdOrdByBox($caja->id);

                    if($tar->order_id == null){                        

                        $dataPall = array(
                                    PalletRepository::SQL_ORDER_ID  => $des->order_id
                                );
                        $this->palletModel->update($tar->id,$dataPall);
                    }

                    $tar = $this->palletModel->getById($request->get('idTar'));

                    if($tar->order_id == $des->order_id){

                        if($this->pallBoxModel->getByPallBox($tar->id,$caja->id) == null){

                            $dataPallBox = array(
                                    PallBoxRepository::SQL_BOX_ID     => $caja->id,
                                    PallBoxRepository::SQL_PALLET_ID  => $tar->id
                                );

                            $this->pallBoxModel->create($dataPallBox);

                            $listita = $this->pallBoxModel->getAllTar($tar->id);

                            $resultado = array( "idOrd" => $tar->order_id, "lista" => $listita);

                        }else{

                            $resultado = "ERROR";
                            $mensajes  = "Esta caja ya esta en la tarima";
                        }

                    }else{

                        $resultado = "ERROR";
                        $mensajes  = "Esta caja no pertenece al pedido de la tarima";
                    }

                }else{

                    $resultado = "ERROR";
                    $mensajes  = "Esta caja no esta lista";
                }

                
            }else{

                $resultado = "ERROR";
                $mensajes  = "No hay un codigo con esa caja";
            }

        } catch (\Exception $e) {
            Log::error( 'TarimasController - addDet - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /**
     * Función para obtener datos de una orden asignada
     */
    public function listaCajas(Request $request) {
        $response = array();
        $mensajes = array();
        $ordId = "";
        try {

            if($request->has("tar")) {
                $tar = $request->input("tar");
            }

            Log::info(" TarimasController - listaCajas ");

            $listado = $this->pallBoxModel->getAllTar($tar);

            $response = $listado->toArray();

            Log::info(" array especial: ".$listado);

        } catch (\Exception $e) {
            Log::error( 'TarimasController - listaCajas - Error: '.$e->getMessage() );
            $response = array();

        }
        //return response()->json($response, 200);
        return response()->json(
            array(
                Controller::JSON_RESPONSE => $response,
                Controller::JSON_MESSAGE  => $mensajes
            )
        );
    }

}
