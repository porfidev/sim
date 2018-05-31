<?php

namespace App\Http\Controllers\Recepcion;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

class RecepcionController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
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