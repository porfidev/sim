<?php

namespace App\Http\Controllers\Recepcion;

use Validator;
use Auth;
use DB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Session;

use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;

use App\Http\Controllers\Controller;
use App\Repositories\PurchaseRepository;

use App\Repositories\ProductRepository;
use App\Repositories\EloquentProduct;

use App\Repositories\ArrivalItemRepository;
use App\Repositories\EloquentArrivalItem;

use App\Repositories\PurchaseItemsRepository;
use App\Repositories\EloquentPurchaseItems;

use App\Purchase;
use App\PurchaseItems;
use App\Product;
use App\ArrivalItem;

use Carbon\Carbon;

class RecepcionController extends Controller
{
    private $purchaseModel;

    const SESSION_ID        = "su_id";
    const SESSION_NOMBRE    = "su_proveedor";
    const SESSION_REC       = "su_reception";
    const SESSION_ENTR      = "su_entrega";
    const SESSION_COD       = "su_codigo";

    public function __construct(PurchaseRepository $cli)
    {
        //$this->middleware(['auth', 'permission']);
        $this->purchaseModel = $cli;
    }

    public function listado(Request $request){
        $data = Purchase::paginate(10);

        return view('recepcion.listado',['data' => $data] );

        try {
            Log::info(" RecepcionController - listado ");

            if ( $request->isMethod('post') ) {
                if( $request->has(self::SESSION_ID)) {
                    $request->session()->put(self::SESSION_ID, $request->input(self::SESSION_ID));
                }

                if( $request->has(self::SESSION_NOMBRE)) {
                    $request->session()->put(self::SESSION_NOMBRE, $request->input(self::SESSION_NOMBRE));
                }

                if( $request->has(self::SESSION_REC)) {
                    $request->session()->put(self::SESSION_REC, $request->input(self::SESSION_REC));
                }

                if( $request->has(self::SESSION_ENTR)) {
                    $request->session()->put(self::SESSION_ENTR, $request->input(self::SESSION_ENTR));
                }

                if( $request->has(self::SESSION_COD)) {
                    $request->session()->put(self::SESSION_COD, $request->input(self::SESSION_COD));
                }
            }
            $search = array();
            if ( $request->session()->has(self::SESSION_ID)
                    && $request->session()->get(self::SESSION_ID) != '0' ) {
                $search[PurchaseRepository::SQL_ID] = $request->session()->get(self::SESSION_ID);
            }
            if ($request->session()->has(self::SESSION_NOMBRE)
                    && $request->session()->get(self::SESSION_NOMBRE) != 'NA' ) {
                $search[PurchaseRepository::SQL_CARDNAME] = $request->session()->get(self::SESSION_NOMBRE);
            }
            if ($request->session()->has(self::SESSION_REC)
                    && $request->session()->get(self::SESSION_REC) != 'NA' ) {
                $search[PurchaseRepository::SQL_ARRIVAL] = $request->session()->get(self::SESSION_REC);
            }
            if ($request->session()->has(self::SESSION_ENTR)
                    && $request->session()->get(self::SESSION_ENTR) != 'NA' ) {
                $search[PurchaseRepository::SQL_DOCDUEDATE] = $request->session()->get(self::SESSION_ENTR);
            }
            if ($request->session()->has(self::SESSION_COD)
                    && $request->session()->get(self::SESSION_COD) != 'NA' ) {
                $search[PurchaseRepository::SQL_CARDCODE] = $request->session()->get(self::SESSION_COD);
            }
            Log::info(" RecepcionController - listado - search: ".json_encode($search));

            $listado = $this->purchaseModel->getAll($search);
            return view('recepcion.listado',
                array(
                    "listado" => $listado
                ));
        } catch (\Exception $e) {
            Log::error( 'RecepcionController - listado - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }


    public function listadoHH(Request $request){
        $data = Purchase::paginate(10);

        return view('recepcion.listadoHH',['data' => $data] );
    }


    public function listadoItems($purchase_id)
    {
        $data = PurchaseItems::where('purchase_id','=',$purchase_id)->paginate(10);

        return view('recepcion.listadoItems',['data' => $data] );
    }


    public function listadoItemsHH($purchase_id)
    {    
        $data = DB::table('purchase_items')
        ->join('products', 'purchase_items.ItemCode', '=', 'products.sku')
        ->where('purchase_id','=',$purchase_id)
        ->paginate(10);

        $proveedor = Purchase::find($purchase_id);

        return view('recepcion.listadoItemsHH',['data' => $data,'proveedor' => $proveedor] );
    }


    static function validaCodigo($codigo){
        
        $mensajes  = "NA";
        $cantidadTot = -1;
        $sku=0;
        $response = [];
        
        $modelo =  new Product;
        $productModelE = new EloquentProduct($modelo);

        try {

            Log::info(" RecepcionController - validaBarcode codigo : ".$codigo);
            $product = $productModelE->getByCode( $codigo );

            if( $product != null ) {

                Log::debug(" RecepcionController - validaBarcode: ".json_encode($product) );

                $sku=$product->sku;

                if($codigo == $product->corrugated_barcode){

                    $cantidadTot = intval($product->display_per_box)*intval($product->items_per_display);

                } else if($codigo == $product->display_barcode){

                    $cantidadTot = intval($product->items_per_display);

                } else if($codigo == $product->barcode){

                    $cantidadTot = 1;
                } 
            } else {

                Log::error("RecepcionController - validaBarcode: El objeto product esta vacío");
                $resultado = "No existe el producto";
                $mensajes  = "No se encontro ese producto";
            }
        } catch (\Exception $e) {
            Log::error( 'RecepcionController - validaBarcode - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }

        $response[2] = $sku;
        $response[1] = $mensajes;
        $response[0] = $cantidadTot;

        return $response;
      
    }

    static function capturaDatos($sku,$caducidad, $cantidadCapturada, $lote){
  
        $resultado  = "NA";
        $mensajes  = "";
        $response = [];
        
        $modeloP =  new Product;
        $modeloAI =  new ArrivalItem;

        $productModelE = new EloquentProduct($modeloP);
        $arrivalItemModelE = new EloquentArrivalItem($modeloAI);

        $carbon = new Carbon();  

        try {

            Log::info(" RecepcionController - capturaDatos codigo : ".$sku);
            $product = $productModelE->getBySku( $sku );
            $arrivalItem = $arrivalItemModelE->getByItemCodeLote( $sku, $lote );


            if ($product != null) {
                    $caducidad_minima = Carbon::now();
                    $caducidad_minima->addDays($product->caducidad_minima);

                    if( $product->caducidad_minima != null ) {

                        Log::debug(" RecepcionController - capturaDatos: ".json_encode($product) );


                            if($arrivalItem != null){

                                $caducidad_minima = Carbon::now();
                                $caducidad_minima = $arrivalItem->u_Caducidad;

                                if($caducidad >= $caducidad_minima ){

                                    $data = array(
                                    'quantity'      => $arrivalItem->quantity + $cantidadCapturada,
                                    'u_Caducidad'   => $caducidad,
                                    );
                            
                                    $resultado = $arrivalItemModelE->update($arrivalItem->id, $data);
                                    $mensajes  = "Se ha actualizado el arrival item: " .  $arrivalItem->ItemCode;

                                } else {
                                    Log::error( 'RecepcionController - capturaDatos - Error:  La caducidad del producto recibido es menor al ultimo producto recibido.' );
                                    $resultado = "ERROR.";
                                    $mensajes  = "La caducidad del producto recibido es menor al ultimo producto recibido";
                                }

                            } else {

                                // Modelos
                                $modeloPI = new PurchaseItems;
                                $purchaseItemModelE = new EloquentPurchaseItems($modeloPI);

                                //Buscar purchase item
                                $purchaseItem = $purchaseItemModelE->getByCode( $sku );

                                $caducidad_minima = Carbon::now();
                                $caducidad_minima->addDays($product->caducidad_minima);
                                
                                if($caducidad-> format('D') >= $caducidad_minima-> format('D') ){
                
                                    if($purchaseItem != null) {

                                        $data = array(
                                        'purchase_id'        => $purchaseItem->purchase_id,
                                        'ItemCode'           => $purchaseItem->ItemCode,
                                        'product_id'         => $purchaseItem->product_id,
                                        'quantity'           => $cantidadCapturada,
                                        'cantidad_rec'       => $purchaseItem->u_CantReq,
                                        'DistNumber'         => $lote,
                                        'u_Caducidad'        => $caducidad,
                                        );
                                
                                    $nuevoArrivalItem =$arrivalItemModelE ->create($data);
                                    $mensajes  = "Se ha creado un nuevo arrival item.";

                                    }else{
                                        Log::error( 'No existe el purchase item' );
                                        $resultado = "ERROR";
                                        $mensajes  = "No existe el purchase item";
                                    }
                                }else{
                                    Log::error( 'La caducidad es menor a la minima' );
                                    $resultado = "ERROR";
                                    $mensajes  = "La caducidad es menor a la minima";
                                }
                            }

                    } else {
                        Log::error( 'RecepcionController - capturaDatos - Error:  El item no tiene caducidad minima definida.' );
                        $resultado = "ERROR..";
                        $mensajes  = " El item no tiene caducidad minima definida.";
                    }
                } else {
                   Log::error( 'RecepcionController - capturaDatos - Error:  El producto no existe' );
                   $resultado = "ERROR..";
                   $mensajes  = " El producto no existe.";
                }
          

        } catch (\Exception $e) {
            Log::error( 'RecepcionController - capturaDatos - Error: '.$e->getMessage() );
            $resultado = "ERROR...";
            $mensajes  = array( $e->getMessage() );
        }

        $response[4] = $caducidad;
        $response[3] = $caducidad_minima;
        $response[2] = $product->caducidad_minima;
        $response[1] = $mensajes;
        $response[0] = $resultado;

        return $response;    
    }

}