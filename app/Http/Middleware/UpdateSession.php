<?php

namespace App\Http\Middleware;

use Log;
use Auth;
use Closure;

use App\Repositories\UserRepository;

class UpdateSession
{
    private $userModel;

    /**
     * Create a new middleware instance.
     *
     * @return void
     */
    public function __construct(UserRepository $user)
    {
        $this->userModel = $user;
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
        $response = $next($request);
        $session = $this->userModel->getSession(Auth::id());
        if(!empty($session)){
            Log::debug("UpdateSession - handle - Actualizamos session: ".$session->id);
            $this->userModel->updateSession($session->id,
                array(
                    UserRepository::SQL_SESSION_TOKEN => str_random(30)
                )
            );
        } else {
            Log::error("UpdateSession - handle - Usuario sin sessión");
        }
        return $response;
    }
}
