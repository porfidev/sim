<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SurtidoController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function listadoPedidos()
    {
        return view('surtir.jefe');
    }
}