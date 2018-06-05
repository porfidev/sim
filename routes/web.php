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

// Productos
Route::get('/productos/listado',        '\App\Http\Controllers\Base\ProductController@listado'  );
Route::post('/productos/listado',       '\App\Http\Controllers\Base\ProductController@listado'  )->name('productos.listado');
Route::post('/productos/agregar',       '\App\Http\Controllers\Base\ProductController@agregar'  )->name('productos.agregar');
Route::post('/productos/consultar',     '\App\Http\Controllers\Base\ProductController@consultar')->name('productos.consultar');
Route::post('/productos/editar',        '\App\Http\Controllers\Base\ProductController@editar'   )->name('productos.editar');
Route::post('/productos/eliminar',      '\App\Http\Controllers\Base\ProductController@eliminar' )->name('productos.eliminar');

// Administración de menu
Route::get('/menu/listado',            '\App\Http\Controllers\Base\MenuController@listado'          );
Route::post('/menu/listado',           '\App\Http\Controllers\Base\MenuController@listado'          )->name('menu.listado');
Route::post('/menu/agregar',           '\App\Http\Controllers\Base\MenuController@agregar'          )->name('menu.agregar');
Route::post('/menu/consultar',         '\App\Http\Controllers\Base\MenuController@consultar'        )->name('menu.consultar');
Route::post('/menu/editar',            '\App\Http\Controllers\Base\MenuController@editar'           )->name('menu.editar');
Route::post('/menu/eliminar',          '\App\Http\Controllers\Base\MenuController@eliminar'         )->name('menu.eliminar');
Route::post('/menu/agregar/permiso',   '\App\Http\Controllers\Base\MenuController@agregarPermiso'   )->name('menu.agregar.permiso');
Route::post('/menu/consultar/permiso', '\App\Http\Controllers\Base\MenuController@consultarPermisos')->name('menu.consultar.permiso');
Route::post('/menu/eliminar/permiso',  '\App\Http\Controllers\Base\MenuController@eliminarPermiso'  )->name('menu.eliminar.permiso');

// Administración de Catalogos
Route::get('/catalogos/listado',    '\App\Http\Controllers\Base\CatalogosController@listado'  );
Route::post('/catalogos/listado',   '\App\Http\Controllers\Base\CatalogosController@listado'  )->name('catalogos.listado');
Route::post('/catalogos/agregar',   '\App\Http\Controllers\Base\CatalogosController@agregar'  )->name('catalogos.agregar');
Route::post('/catalogos/editar',    '\App\Http\Controllers\Base\CatalogosController@editar'   )->name('catalogos.editar');
Route::post('/catalogos/eliminar',  '\App\Http\Controllers\Base\CatalogosController@eliminar' )->name('catalogos.eliminar');
Route::post('/catalogos/obtener',   '\App\Http\Controllers\Base\CatalogosController@obtenerCatalogo')->name('catalogos.obtener');

// Administracion de clientes
Route::get('/clientes/listado',    '\App\Http\Controllers\Ventas\ClientesController@listado'  );
Route::post('/clientes/listado',   '\App\Http\Controllers\Ventas\ClientesController@listado'  )->name('clientes.listado');
Route::post('/clientes/agregar',   '\App\Http\Controllers\Ventas\ClientesController@agregar'  )->name('clientes.agregar');
Route::post('/clientes/editar',    '\App\Http\Controllers\Ventas\ClientesController@editar'   )->name('clientes.editar');
Route::post('/clientes/eliminar',  '\App\Http\Controllers\Ventas\ClientesController@eliminar' )->name('clientes.eliminar');

// Almacén o surtir
Route::get('/listadoPedidosJefe', '\App\Http\Controllers\Surtido\SurtidoJefeController@listadoPedidos'      )->name('listadoPedidosJefe');
Route::get('/listadoTareas',      '\App\Http\Controllers\Surtido\SurtidoTrabajadorController@listadoTareas' )->name('listadoTareas');

// Recepción de mercancía
Route::get('/ordenes/listado',    '\App\Http\Controllers\Recepcion\RecepcionController@listado'    )->name('ordenes.listado');
Route::get('/ordenes/validacion', '\App\Http\Controllers\Recepcion\RecepcionController@validacion' )->name('ordenes.validacion');

// Preparación de pedido o embalaje

// Embarque o distribución de pedido
