<?php

namespace App\Http\Controllers\Base;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Controller;
use App\Repositories\MenuRepository;
use App\Repositories\RolRepository;

class HomeController extends Controller
{
    private $menuModel;
    private $rolModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(MenuRepository $menu, RolRepository $rol)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->menuModel = $menu;
        $this->rolModel  = $rol;
    }

    public static function setMenu($request, $menuModel) {
        $user = Auth::user();
        $user->rol;
        $request->session()->put('menu', $menuModel->getMenu($user->rol));
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
