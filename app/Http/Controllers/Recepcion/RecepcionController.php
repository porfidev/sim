<?php

namespace App\Http\Controllers\Recepcion;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Support\Facades\Log;
use App\Repositories\PurchasesRepository;
use App\Repositories\PurchaseItemsRepository;

class RecepcionController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */


    private $purchasesModel;
    private $purchaseItemsModel;

    const SESSION_ID     = "su_id";
    const SESSION_NAME   = "su_proveedor";
    const SESSION_EMAIL  = "su_estatus";
    const SESSION_ROL    = "su_date";
    const SESSION_STATUS = "su_duedate";
    const SESSION_CODIGO = "su_codigo";


    public function __construct(PurchasesRepository $pur, PurchaseItemsRepository $puri)
    {
        $this->middleware('auth');
        $this->purchasesModel = $pur;
        $this->purchaseItemsModel  = $puri;
    }

    /**
     * Listado de ordenes de compra por llegar
     *
     * @return \Illuminate\Http\Response
     */
    public function listado()
    {
        return view('recepcion.listado');
    }

    /**
     * Validación de la recepción de mercancía
     *
     * @return \Illuminate\Http\Response
     */
    public function validacion()
    {
        return view('recepcion.validacion');
    }
}