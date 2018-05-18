<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

use App\Repositories\UserRepository;
use App\Repositories\EloquentUser;

use App\Repositories\RolRepository;
use App\Repositories\EloquentRol;

use App\Repositories\MenuRepository;
use App\Repositories\EloquentMenu;

use App\Repositories\CatalogoRepository;
use App\Repositories\EloquentCatalogo;

use App\Repositories\ClienteRepository;
use App\Repositories\EloquentCliente;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
         Schema::defaultStringLength(191);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(UserRepository::class, EloquentUser::class);
        $this->app->singleton(RolRepository::class,  EloquentRol::class);
        $this->app->singleton(MenuRepository::class, EloquentMenu::class);
        $this->app->singleton(CatalogoRepository::class, EloquentCatalogo::class);
        $this->app->singleton(ClienteRepository::class, EloquentCliente::class);
    }
}
