<?php

namespace App\Http\Controllers\Recepcion;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Support\Facades\Log;


use App\Purchase;
use App\PurchaseItem;

class RecepcionController extends Controller
{

    /**
     * Listado de ordenes de compra por llegar
     *
     * @return \Illuminate\Http\Response
     */
    public function listado()
    {
        $data = Purchase::all();

        return view('recepcion.listado',['data' => $data] );
    }

    public function listadoItems($purchase_id)
    {
        $data = PurchaseItem::where('purchase_id','=',$purchase_id)->get();

        return view('recepcion.listadoItems',['data' => $data] );
    }

}