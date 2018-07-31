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
use App\Repositories\EloquentPurchase;

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



    //Presenta el listado de ordenes en la hand held
    public function listadoHH(Request $request){
        $data = Purchase::paginate(10);
        return view('recepcion.listadoHH',['data' => $data] );
    }


    //Presenta el listado de recepciones a validar en la hand held
    public function listadoValidacionHH(Request $request){
        $data = ArrivalItem::paginate(10);

        return view('recepcion.validacionHH',['data' => $data,'leyendaTitulo' => "Productos recibidos"] );

    }


    //Presenta detalle de purchases
    public function listadoItems($purchase_id)
    {
        $data = PurchaseItems::where('purchase_id','=',$purchase_id)->paginate(10);
        $data2 = ArrivalItem::where('purchase_id','=',$purchase_id)->paginate(10);

        return view('recepcion.listadoItems',['data' => $data, 'data2' => $data2] );
    }

    //Presenta detalle de purchases en hand held
    public function listadoItemsHH($purchase_id)
    {    
        $data = DB::table('purchase_items')
        ->join('products', 'purchase_items.ItemCode', '=', 'products.sku')
        ->where('purchase_id','=',$purchase_id)
        ->paginate(10);

        $proveedor = Purchase::find($purchase_id);

        return view('recepcion.listadoItemsHH',['data' => $data,'leyendaTitulo' => $proveedor->CardName] );
    }



    //Funcion que actualiza arrival items una vez validados
    public function actualizar(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "Los datos fueron actualizados.";
        $vista = "recepcion.mensajesRecepcionHH";
        
      
        try {
            Log::info(" RecepcionController - editar ");
            if($request->has('id'))
            {

                $modeloAI =  new ArrivalItem;
                $arrivalItemModelE = new EloquentArrivalItem($modeloAI);
                $arrivalItem = $arrivalItemModelE->getById( $request->get('id') );

                if( !empty($arrivalItem) )
                {

                    $validator = Validator::make(
                        $request->all(),
                        array(
                            'cantidadFinal'        => 'required|integer',
                            'purchaseid'           => 'required|integer',
                            'ItemCode'             => 'required|string',
                            'DistNumber'           => 'required|string',
                            'u_Caducidad'          => 'required|date',
                            'quantity'             => 'required|numeric',
                            'product_id'           => 'required|integer',
                            'status'               => 'required|string',
                        ),
                        Controller::$messages
                    );

                    if ($validator->fails())
                    {
                        $resultado = "ERROR";
                        $mensajes = "No se puedieron actualizar los datos."; //$validator->errors();
                    } else {
                        $data = array(
                            ArrivalItemRepository::SQL_PURCHASEID      => $request->purchaseid,
                            ArrivalItemRepository::SQL_ICODE           => $request->ItemCode,
                            ArrivalItemRepository::SQL_PRODUCTID       => $request->product_id,
                            ArrivalItemRepository::SQL_QUANT           => $request->cantidadFinal,
                            ArrivalItemRepository::SQL_DISTNUMBER      => $request->DistNumber,
                            ArrivalItemRepository::SQL_CADUCIDAD       => $request->u_Caducidad,
                            ArrivalItemRepository::SQL_STATUS          => "validado",
                        );
                        Log::info(" ProductController - editar - data: ".json_encode($data));
                        DB::beginTransaction();
                        $arrivalItemModelE->update($request->id, $data);  // <- Here 
                        DB::commit();
                    }
                } else {
                    $resultado = "ERROR";
                    $mensajes  = array( "No se encontró el producto" );
                }
            } else {
                $resultado = "ERROR";
                $mensajes  = array( "Faltan datos para poder actualizar el producto" );
            }
        } catch (\Exception $e) {
            Log::error( 'ProductController - editar - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes =  $e->getMessage();
            DB::rollBack();
        }

        $data["mensajes"] = $mensajes;
        $data["resultado"] = $resultado;
        return view($vista,['data' => $data,'leyendaTitulo' => "Validaci&oacute;n de recepci&oacute;n"]  );;
    }



    //Muestra los datos de la recepcion para verificar que sean correctos
    public function validaRecepciones(Request $request)
    {
        $data = [];
      
        if( $request->has("id")) {
            $id = $request->input("id");
        }

        if( $request->has("purchaseid")) {
            $purchaseid = $request->input("purchaseid");
        }

        if( $request->has("ItemCode")) {
            $ItemCode = $request->input("ItemCode");
        }

        if( $request->has("DistNumber")) {
            $DistNumber = $request->input("DistNumber");
        }

        if( $request->has("u_Caducidad")) {
            $u_Caducidad = $request->input("u_Caducidad");
        }

        if( $request->has("quantity")) {
            $quantity = $request->input("quantity");
        }

        if( $request->has("product_id")) {
            $product_id = $request->input("product_id");
        }

        if( $request->has("status")) {
            $status = $request->input("status");
        }


        $data["id"] = $id;
        $data["purchaseid"] = $purchaseid;
        $data["ItemCode"] = $ItemCode;
        $data["DistNumber"] = $DistNumber;
        $data["u_Caducidad"] = $u_Caducidad;
        $data["quantity"] = $quantity;
        $data["product_id"] = $product_id;
        $data["status"] = $status;



        return view('recepcion.validacionRecepcionesHH',['data' => $data,'leyendaTitulo' => "Validar"] );
    }


    //Presenta los datos finales que se actualizaran
    public function validacionFinal(Request $request)
    {

        $data = [];

        if( $request->has("id")) {
            $id = $request->input("id");
        }
      
        if( $request->has("cantidadFinal")) {
            $cantidadFinal = $request->input("cantidadFinal");
        }

        if( $request->has("purchaseid")) {
            $purchaseid = $request->input("purchaseid");
        }

        if( $request->has("ItemCode")) {
            $ItemCode = $request->input("ItemCode");
        }

        if( $request->has("DistNumber")) {
            $DistNumber = $request->input("DistNumber");
        }

        if( $request->has("u_Caducidad")) {
            $u_Caducidad = $request->input("u_Caducidad");
        }

        if( $request->has("quantity")) {
            $quantity = $request->input("quantity");
        }

        if( $request->has("product_id")) {
            $product_id = $request->input("product_id");
        }

        if( $request->has("status")) {
            $status = $request->input("status");
        }
     
        $data["id"] = $id;
        $data["cantidadFinal"] = $cantidadFinal;
        $data["purchaseid"] = $purchaseid;
        $data["ItemCode"] = $ItemCode;
        $data["DistNumber"] = $DistNumber;
        $data["u_Caducidad"] = $u_Caducidad;
        $data["quantity"] = $quantity;
        $data["product_id"] = $product_id;
        $data["status"] = $status;

    
        return view('recepcion.finalValidacionHH',['data' => $data,'leyendaTitulo' => "Validar"] );
    }


    //Funcion para ir actualizando la cantidad recibida o por validar 
    public function obtenCantidadPorCodigo(Request $request){

        $codigo = "0";

        if( $request->has("codigo")) {
            $codigo = $request->input("codigo");
        }

        $mensajes  = "OK";
        $cantidadTot = -1;

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
                $caducidadMinima=$product->caducidad_minima;

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

        $response["mensajes"] = $mensajes;
        $response["cantidad"] = $cantidadTot;
        
        return $response;
      
    }


    //Funcion que devuelve la cantidad de items segun su barcode
    public function validaCodigo($codigo, $sku, $purchaseid){

        $mensajes  = "OK";
        $cantidadTot = -1;
        $concept="";
        $cantidadRequerida="";
        $caducidadMinima="";
        $response = [];
        
        $modelo =  new Product;
        $productModelE = new EloquentProduct($modelo);
        $modeloPI =  new PurchaseItems;
        $purchaseItemModelE = new EloquentPurchaseItems($modeloPI);

        try {
            Log::info(" RecepcionController - validaCodigo codigo: " . $codigo);
            
            $product = $productModelE->getByCode( $codigo );

            if( $product != null ) {

                if($product->sku === $sku){ 

                    $sku=$product->sku;
                    $concept=$product->concept;
                    $caducidadMinima=$product->caducidad_minima;

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
                    $resultado = "El codigo de barras corresponde a otro producto";
                    $mensajes  = "El codigo de barras corresponde a otro producto" ;
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
        $response["caducidadMinima"] = $caducidadMinima;
        $response["purchaseid"] = $purchaseid;
        
        return $response;
      
    }


    //Manda los datos que se validaran 
    public function regresaDatos($codigo, $sku, $purchaseid, $cantidadFinal){

        $mensajes  = "OK";
        $cantidadTot = $cantidadFinal;
        $concept="";
        $cantidadRequerida="";
        $caducidadMinima="";
        $response = [];
        
        $modelo =  new Product;
        $productModelE = new EloquentProduct($modelo);
        $modeloPI =  new PurchaseItems;
        $purchaseItemModelE = new EloquentPurchaseItems($modeloPI);

        try {
            Log::info(" RecepcionController - regresaDatos codigo: " . $codigo);
            
            $product = $productModelE->getByCode( $codigo );

            if( $product != null ) {

                    $sku=$product->sku;
                    $concept=$product->concept;
                    $caducidadMinima=$product->caducidad_minima;

                    $lepurchaseItem = $purchaseItemModelE->getByCode($sku);
                    $cantidadRequerida = $lepurchaseItem->u_CantReq;

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
        $response["caducidadMinima"] = $caducidadMinima;
        $response["purchaseid"] = $purchaseid;
        
        return $response;
      
    }


    //Recibe los datos que se registraran en la recepcion 
    public function formularioDatos(Request $request){
        $resultado = "recepcion.capturaRecepcionHH";
        $codigo = "0";

        if( $request->has("codigo")) {
            $codigo = $request->input("codigo");
        }

        if( $request->has("ItemCode")) {
            $ItemCode = $request->input("ItemCode");
        }

        if( $request->has("purchaseid")) {
            $purchaseid = $request->input("purchaseid");
        }

        if( $request->has("cantidadFinal")) {
            $cantidadFinal = $request->input("cantidadFinal");
        }

        $data = $this->regresaDatos($codigo, $ItemCode, $purchaseid, $cantidadFinal);

        if ( $data["cantidad"] == -1 ) { 
            $resultado = "recepcion.mensajesRecepcionHH";
            $leyendaTitulo = "Sin registro";
        } else {
            $leyendaTitulo = $data["concept"];
        }
        
        return view($resultado,['data' => $data,'leyendaTitulo' => $leyendaTitulo] );

    }


   //Recibe los datos que se validaran (caducidad)
    public function formularioDatosValidacion(Request $request){
        $resultado = "recepcion.capturaRecepcionHH";
        $codigo = "0";

        if( $request->has("codigo")) {
            $codigo = $request->input("codigo");
        }

        if( $request->has("ItemCode")) {
            $ItemCode = $request->input("ItemCode");
        }

        if( $request->has("purchaseid")) {
            $purchaseid = $request->input("purchaseid");
        }
        
        return $this->validaCodigo($codigo, $ItemCode, $purchaseid);
    }


   //Validacion de existencia de arrival_items y caducidad 
    public function formularioValidar(Request $request){
        $resultado = "recepcion.actualizadoHH";
        $lote="";
        $sku="";
        $caducidad="";
        $recibida="";
        $purchase="";
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

        if( $request->has("purchase")) {
            $purchase = $request->input("purchase");
        }

        $data = $this->capturaDatos($sku,$caducidad,$recibida,$lote,$purchase);

        if ( $data["resultado"] === "ERROR" ) { 
            $resultado = "recepcion.mensajesRecepcionHH";
            $leyendaTitulo = "No se completo el registro";
            $purchase = "ERROR";
        } else {
            $leyendaTitulo = $sku;

        }

        return view($resultado,['data' => $data,'leyendaTitulo' => $leyendaTitulo]  );

    }


    static function capturaDatos($sku,$caducidad, $cantidadCapturada, $lote, $purchaseid){
  
        $resultado  = "NA";
        $mensajes  = "";
        $response = [];
        $total="";
        $caducidad_minima="";
        
        $modeloP =  new Product;
        $modeloAI =  new ArrivalItem;
        $modeloPS =  new Purchase;


        $productModelE = new EloquentProduct($modeloP);
        $arrivalItemModelE = new EloquentArrivalItem($modeloAI);
        $purchaseModelE = new EloquentPurchase($modeloPS);

        $carbon = new Carbon();  

        try {
            
            Log::info(" RecepcionController - capturaDatos codigo : ".$sku);
            $product = $productModelE->getBySku( $sku );
            $arrivalItem = $arrivalItemModelE->getByItemCodeLote( $sku, $lote );

            if ($product != null) {
                    $caducidad_minima = Carbon::now();
                    $caducidad_minima->addMonths($product->caducidad_minima);

                    if( $product->caducidad_minima != null ) {

                        Log::debug(" RecepcionController - capturaDatos: ".json_encode($product) );


                            if($arrivalItem != null){

                                //$caducidad_minima = $arrivalItem->u_Caducidad;

                                $caducidad_minima = Carbon::now();
                                $caducidad_minima->addMonths($arrivalItem->u_Caducidad);
                             

                                if($caducidad-> format('ymd') >= $caducidad_minima-> format('ymd')){

                                    $data = array(
                                    'quantity'      => $arrivalItem->quantity + $cantidadCapturada,
                                    'u_Caducidad'   => $caducidad,
                                    );
                            
                                    $total= $arrivalItem->quantity + $cantidadCapturada;
                                    $resultado = $arrivalItemModelE->update($arrivalItem->id, $data);
                                    $mensajes  = "La recepcion ha sido actualizada: " .  $arrivalItem->ItemCode . $caducidad_minima;
                                  

                                } else {
                                    Log::error( 'RecepcionController - capturaDatos - Error:  La caducidad registrada es menor a la caducidad del ultimo producto recibido.' );
                                    $resultado = "ERROR";
                                    $mensajes  = "La caducidad registrada es menor a la caducidad del ultimo producto recibido: " . $caducidad_minima;
                                }

                            } else {

                                // Modelos
                                $modeloPI = new PurchaseItems;
                                $purchaseItemModelE = new EloquentPurchaseItems($modeloPI);

                                //Buscar purchase item
                                $purchaseItem = $purchaseItemModelE->getByCode( $sku );

                                $caducidad_minima = Carbon::now();
                                $caducidad_minima->addMonths($product->caducidad_minima);
                                
                                if($caducidad-> format('ymd') >= $caducidad_minima-> format('ymd') ){
                
                                    if($purchaseItem != null) {

                                        $purchase = $purchaseModelE->updateStatus($purchaseid , 1);
                                        $status="por validar";

                                        $data = array(
                                        'purchase_id'        => $purchaseItem->purchase_id,
                                        'ItemCode'           => $purchaseItem->ItemCode,
                                        'product_id'         => $purchaseItem->product_id,
                                        'quantity'           => $cantidadCapturada,
                                        'cantidad_rec'       => $purchaseItem->u_CantReq,
                                        'DistNumber'         => $lote,
                                        'u_Caducidad'        => $caducidad,
                                        'status'             => $status,
                                        );

                                    $nuevoArrivalItem =$arrivalItemModelE ->create($data);
                                    $total= $cantidadCapturada;
                                    $mensajes  = "Se han registrado los productos";
                                    $resultado = "New Done";

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
                        $resultado = "ERROR";
                        $mensajes  = " El item no tiene caducidad minima definida.";
                    }
                } else {
                   Log::error( 'RecepcionController - capturaDatos - Error:  El producto no existe' );
                   $resultado = "ERROR";
                   $mensajes  = " El producto no existe.";
                }
          

        } catch (\Exception $e) {
            Log::error( 'RecepcionController - capturaDatos - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  =  $e->getMessage();
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
        $response["purchaseid"] = $purchaseid;

        return $response;    
    }



//Recibe los datos que se validaran (caducidad)
public function cerrarCaptura(Request $request){
    $resultado = "recepcion.validacionHH";
    $id = "0";
    $status = "recibido";

    if( $request->has("id")) {
        $id = $request->input("id");
    }

    $modeloAI =  new ArrivalItem;
    $arrivalItemModelE = new EloquentArrivalItem($modeloAI);
    $arrivalItem = $arrivalItemModelE->updateId( $request->get('id') );
   
    return $this->validaCodigo($codigo, $ItemCode, $purchaseid);
}


//Actualizar el status de un purchase items especifico
public function updateStatusPurchaseItems(Request $request){
    //$resultado = "recepcion.listadoItemsHH";
    $purchaseid = "" ;
    $sku= "";

    if( $request->has("purchaseid")) {
        $purchaseid = $request->input("purchaseid");
    }

    if( $request->has("sku")) {
        $sku = $request->input("sku");
    }

    $modeloPI =  new PurchaseItems;
    $purchaseItemModelE = new EloquentPurchaseItems($modeloPI);
    return $purchaseItem = $purchaseItemModelE->updateStatus( $purchaseid, $sku );
   
    
}


//Actualizar el status de todo el purchase
public function updateStatusPurchase(Request $request){
    //$purchaseid = "" ;

    if( $request->has("el_id")) {
        $el_id = $request->input("el_id");
    }

    if( $request->has("num")) {
        $num = $request->input("num");
    }

    $modeloP =  new Purchase;
    $purchaseModelE = new EloquentPurchase($modeloP);
    return $purchaseModelE->updateStatus($el_id , $num);

}


//Actualizar el status de todo el purchase en la validacion
public function updateStatusPurchaseVal(Request $request){
    //$purchaseid = "" ;

    $resultado = "OK";
    $mensajes  = "NA";


    if( $request->has("el_id")) {
        $el_id = $request->input("el_id");
    }

    if( $request->has("num")) {
        $num = $request->input("num");
    }

    if( $request->has("id")) {
        $id = $request->input("id");
    }

    $modeloAr = new ArrivalItem;
    $modeloP =  new Purchase;
    
    $arrivalModelE = new EloquentArrivalItem($modeloAr);
    $purchaseModelE = new EloquentPurchase($modeloP);

    $arrivalModelE->updatePurchaseStatus($el_id );

    $arrivalItem = $arrivalModelE->getById( $id );
    $date = $arrivalItem->created_at;
    $purchaseModelE->updateArrival($el_id , $date);

    $purchaseModelE->updateStatus($el_id , $num);

     /*
    $servername = env('SQL_SERVER_NAME', '');
    $connectionInfo = array('Database' =>  env('SQL_DATABASE_NAME_2', '') , 
                            'UID' => env('SQL_USER', ''),
                            'PWD' => env('SQL_PASS', ''),
                            'ReturnDatesAsStrings'=>true, 
                            'CharacterSet' => 'UTF-8');

    $con = sqlsrv_connect($servername, $connectionInfo);

    if($con){

        Log::info("id: ".$arrivalItem->id." ItemCode: ".$arrivalItem->ItemCode.
                  " Quantity: ".$arrivalItem->quantity." Lote: ".$arrivalItem->DistNumber." Pedimento: ".$arrivalItem->pedimento." Caducidad: ".$arrivalItem->u_Caducidad);
        $sql = "INSERT INTO ComprasSim (Id, LineNum,ItemCode,Quantity,Lote,Pedimento, Caducidad) VALUES ".
                "('".$arrivalItem->id."', '1', '".$arrivalItem->ItemCode."', '".$arrivalItem->quantity."', '".$arrivalItem->Lote."','".$arrivalItem->Pedimento."','".$arrivalItem->Caducidad."' )";

         Log::info("Query: ".$sql);

        $stmt = sqlsrv_query( $con, $sql);
        if( $stmt === false ) {
             if( ($errors = sqlsrv_errors() ) != null) {
                foreach( $errors as $error ) {
                    Log::info("updateStatusPurchaseVal - SQLSTATE: ".$error[ 'SQLSTATE']);
                    Log::info("updateStatusPurchaseVal - code: ".$error[ 'code']);
                    Log::info("updateStatusPurchaseVal - message: ".$error[ 'message']);
                }
            }
        }
    }
     
    */
    return $resultado;


}


}


 

