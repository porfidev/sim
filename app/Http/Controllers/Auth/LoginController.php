<?php

namespace App\Http\Controllers\Auth;

use Log;
use Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\HomeController;

use App\Repositories\MenuRepository;
use App\Repositories\UserRepository;

use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{

    private $menuModel;
    private $userModel;

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
    public function __construct(
        MenuRepository $menu,
        UserRepository $user )
    {
        $this->middleware('guest')->except('logout');
        $this->menuModel = $menu;
        $this->userModel = $user;
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
            $session = $this->userModel->getSession(Auth::id());
            if(!empty($session)){
                Log::error("LoginController - login: ".json_encode($session));
                Log::error("LoginController - login - Intento doble de autenticación: ".Auth::id()." | ".$request->ip());
                Auth::logout();
                $request->session()->flash('error', 'Existe una sesión del usuario');
                return redirect()->route('login');
            } else {
                $oldSessions = $this->userModel->getSession(Auth::id(), true);
                if(count($oldSessions) > 0) {
                    Log::warning("LoginController - login - Tenemos sesiones caducadas sin borrar: ".count($oldSessions));
                }
                foreach ($oldSessions as $item) {
                    $this->userModel->deleteSession($item->id);
                }
                $this->userModel->createSession(Auth::id(), $request->ip());
                // Authentication passed...
                return redirect()->intended('home');
            }
        }
    }

    public function logout(Request $request)
    {
        $session = $this->userModel->getSession(Auth::id());
        if(!empty($session)){
            $this->userModel->deleteSession($session->id);
        }
        $this->guard()->logout();
        Auth::logout();

        $request->session()->flush();
        $request->session()->regenerate();

        return redirect()->route('login');
    }
}
