<?php

namespace App\Http\Controllers\Auth;

use Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\HomeController;

use App\Repositories\MenuRepository;

use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{

    private $menuModel;

    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(MenuRepository $menu)
    {
        $this->middleware('guest')->except('logout');
        $this->menuModel = $menu;
    }

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected function redirectTo()
    {
        return '/home';
    }

    /**
     * Handle a login request to the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        if (Auth::attempt(
                [
                    'email'    => request('email'),
                    'password' => request('password'),
                    'status'   => 1
                ]
            )) {
            HomeController::setMenu($request, $this->menuModel);
            // Authentication passed...
            return redirect()->intended('home');
        }
    }
}
