<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

use App\Repositories\MenuRepository;

class HomeController extends Controller
{
    private $menuModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(MenuRepository $menu)
    {
        $this->middleware('auth');
        $this->menuModel = $menu;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            Log::info(" HomeController - index ");
            $user = Auth::user();
            $user->rol;
            $request->session()->put('menu', $this->menuModel->getMenu($user->rol->id));
            return view('home');
        } catch (\Exception $e) {
            Log::error( 'HomeController - index - Error'.$e->getMessage() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }
}
