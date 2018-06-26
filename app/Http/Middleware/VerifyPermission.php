<?php

namespace App\Http\Middleware;

use Log;
use Auth;
use Closure;

use App\Repositories\MenuRepository;

class VerifyPermission
{
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
        $base = env('APP_BASE_URL', 'http://localhost:8000/');
        Log::debug("VerifyPermission - Base: ".$base);
        $url  = $request->url();

        $url = str_replace($base, "", $url);
        Log::debug("VerifyPermission - Intento de acceder a: ".$url);
        if(!empty($url)) {
            $user = Auth::user();
            $rol = $user->rol;
            $permission = $rol
                ->getMenuItems()
                ->whereRaw("'$url' rlike CONCAT( '^',".MenuRepository::SQL_URL.", '$')")
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
