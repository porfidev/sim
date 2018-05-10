<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Auth::routes();

Route::get('/home', '\App\Http\Controllers\Base\HomeController@index')->name('home');

// Usuarios
Route::get('/usuarios/listado',    '\App\Http\Controllers\Base\UsuariosController@listado'  );
Route::post('/usuarios/listado',   '\App\Http\Controllers\Base\UsuariosController@listado'  )->name('usuarios.listado');
Route::post('/usuarios/agregar',   '\App\Http\Controllers\Base\UsuariosController@agregar'  )->name('usuarios.agregar');
Route::post('/usuarios/consultar', '\App\Http\Controllers\Base\UsuariosController@consultar')->name('usuarios.consultar');
Route::post('/usuarios/editar',    '\App\Http\Controllers\Base\UsuariosController@editar'   )->name('usuarios.editar');

// Administración de menu
Route::get('/menu/listado',    '\App\Http\Controllers\Base\MenuController@listado'   );
Route::post('/menu/listado',   '\App\Http\Controllers\Base\MenuController@listado'   )->name('menu.listado');
Route::post('/menu/agregar',   '\App\Http\Controllers\Base\MenuController@agregar'   )->name('menu.agregar');
Route::post('/menu/consultar', '\App\Http\Controllers\Base\MenuController@consultar' )->name('menu.consultar');
Route::post('/menu/editar',    '\App\Http\Controllers\Base\MenuController@editar'    )->name('menu.editar');

// Almacén o surtir
Route::get('/listadoPedidosJefe', '\App\Http\Controllers\Surtido\SurtidoJefeController@listadoPedidos'      )->name('listadoPedidosJefe');
Route::get('/listadoTareas',      '\App\Http\Controllers\Surtido\SurtidoTrabajadorController@listadoTareas' )->name('listadoTareas');

// Preparación de pedido o embalaje

// Embarque o distribución de pedido
