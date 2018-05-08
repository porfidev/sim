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
    }
}
