<?php

namespace App\Http\Middleware;

use Log;
use Auth;
use Closure;

use App\Repositories\MenuRepository;

class VerifyPermission
{

    const URL_HOME = "home";
    private $menuModel;

    /**
     * Create a new middleware instance.
     *
     * @return void
     */
    public function __construct(MenuRepository $menu)
    {
        $this->menuModel = $menu;
    }
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $base = env('APP_BASE_URL', 'http://localhost/sim/public/');
        $url  = $request->fullUrl();
        $url = str_replace($base, "", $url);
        Log::debug("VerifyPermission - Intento de acceder a: ".$url);
        if(!empty($url) && $url != self::URL_HOME) {
            $user = Auth::user();
            $rol = $user->rol;
            $permission = $rol
                ->getMenuItems()
                ->where(MenuRepository::SQL_URL, '=', $url)
                ->first();
            Log::debug("VerifyPermission - permission: ".json_encode($permission));
            if(empty($permission)) {
                Log::error("VerifyPermission - acceso sin permiso");
                return redirect()->route('login');
            }
        }
        return $next($request);
    }
}
