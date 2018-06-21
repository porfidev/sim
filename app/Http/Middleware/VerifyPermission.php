<?php

namespace App\Http\Middleware;

use Log;
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
        $base = env('APP_BASE_URL', 'http://localhost/sim/public');
        $url  = $request->fullUrl();
        $url = str_replace($base, "", $url);
        Log::info("Intento de acceder a: ".$url);
        return $next($request);
    }
}
