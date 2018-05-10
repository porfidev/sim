<?php

namespace App\Http\Controllers\Surtido;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

class SurtidoJefeController extends Controller
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