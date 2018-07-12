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
        //$this->middleware(['auth', 'permission', 'update.session']);
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

        return view('recepcion.listadoItemsHH',['data' => $data,'leyendaTitulo' => $proveedor->CardName] );
    }


    public function validaCodigo($codigo){

        $mensajes  = "OK";
        $cantidadTot = -1;
        $sku=0;
        $concept="";
        $cantidadRequerida="";
        $response = [];
        
        $modelo =  new Product;
        $productModelE = new EloquentProduct($modelo);
        $modeloPI =  new PurchaseItems;
        $purchaseItemModelE = new EloquentPurchaseItems($modeloPI);

        try {
            Log::info(" RecepcionController - validaCodigo codigo: " . $codigo);
            
            $product = $productModelE->getByCode( $codigo );

            if( $product != null ) {

                $sku=$product->sku;
                $concept=$product->concept;

                $lepurchaseItem = $purchaseItemModelE->getByCode($sku);
                $cantidadRequerida = $lepurchaseItem->u_CantReq;

                if($codigo == $product->corrugated_barcode){

                    $cantidadTot = intval($product->display_per_box)*intval($product->items_per_display);

                } else if($codigo == $product->display_barcode){

                    $cantidadTot = intval($product->items_per_display);

                } else if($codigo == $product->barcode){

                    $cantidadTot = 1;
                }

            } else {

                Log::error("RecepcionController - validaCodigo: El objeto product esta vacío");
                $resultado = "No existe el producto";
                $mensajes  = "No se encontr&oacute; el producto:  " . $codigo;
            }
        } catch (\Exception $e) {
            Log::error( 'RecepcionController - validaCodigo - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }

        $response["sku"] = $sku;
        $response["mensajes"] = $mensajes;
        $response["cantidad"] = $cantidadTot;
        $response["concept"] = $concept;
        $response["cantidadRequerida"] = $cantidadRequerida;
        
        return $response;
      
    }

    public function formularioDatos(Request $request){
        $resultado = "recepcion.capturaRecepcion";
        $codigo = "0";

        if( $request->has("codigo")) {
            $codigo = $request->input("codigo");
        }

        $data = $this->validaCodigo($codigo);

        if ( $data["cantidad"] == -1 ) { 
            $resultado = "recepcion.mensajesRecepcion";
            $leyendaTitulo = "Sin registro";
        } else {
            $leyendaTitulo = $data["concept"];
        }
        
        return view($resultado,['data' => $data,'leyendaTitulo' => $leyendaTitulo] );

    }


    public function formularioValidar(Request $request){
        $resultado = "recepcion.actualizadoHH";
        $lote="";
        $sku="";
        $caducidad="";
        $recibida="";

        $carbon = new Carbon();  


        if( $request->has("lote")) {
            $lote = $request->input("lote");
        }

        if( $request->has("caducidad")) {
            $caducidad =  Carbon::createFromFormat('Y-m-d', $request->input("caducidad") );
        }

        if( $request->has("sku")) {
            $sku = $request->input("sku");
        }

        if( $request->has("recibida")) {
            $recibida = $request->input("recibida");
        }


        $data = $this->capturaDatos($sku,$caducidad,$recibida,$lote);
    
        $leyendaTitulo = $sku;

        return view($resultado,['data' => $data,'leyendaTitulo' => $leyendaTitulo]  );


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
                            
                                    $total= $arrivalItem->quantity;
                                    $resultado = $arrivalItemModelE->update($arrivalItem->id, $data);
                                    $mensajes  = "El producto ha sido actualizado: " .  $arrivalItem->ItemCode;

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

        $response["sku"] = $sku;
        $response["total"] = $total;
        $response["cantidad"] = $cantidadCapturada;
        $response["lote"] = $lote;
        $response["caducidad"] = $caducidad;
        $response["caducidad_minima"] = $caducidad_minima;
        $response["pcaducidad_minima"] = $product->caducidad_minima;
        $response["mensajes"] = $mensajes;
        $response["resultado"] = $resultado;

        return $response;    
    }

}