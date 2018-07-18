<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class SocketIOProviders extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *s
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('SocketIOService', function(){
            return new \App\Services\SocketIOService();
        });
    }
}
