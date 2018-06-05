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

use App\Repositories\OrderRepository;
use App\Repositories\EloquentOrder;

use App\Repositories\OrderDetailRepository;
use App\Repositories\EloquentOrderDetail;

use App\Repositories\CalculationRepository;
use App\Repositories\EloquentCalculation;

use App\Repositories\ProductRepository;
use App\Repositories\EloquentProduct;

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
        $this->app->singleton(UserRepository::class,        EloquentUser::class);
        $this->app->singleton(RolRepository::class,         EloquentRol::class);
        $this->app->singleton(MenuRepository::class,        EloquentMenu::class);
        $this->app->singleton(CatalogoRepository::class,    EloquentCatalogo::class);
        $this->app->singleton(ClienteRepository::class,     EloquentCliente::class);
        $this->app->singleton(OrderRepository::class,       EloquentOrder::class);
        $this->app->singleton(OrderDetailRepository::class, EloquentOrderDetail::class);
        $this->app->singleton(CalculationRepository::class, EloquentCalculation::class);
        $this->app->singleton(ProductRepository::class,     EloquentProduct::class);
    }
}
