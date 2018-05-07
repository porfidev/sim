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

Route::get('/home', 'HomeController@index')->name('home');

// Usuarios
Route::get('/usuarios/listado', 'UsuariosController@listado');
Route::post('/usuarios/listado', 'UsuariosController@listado')->name('usuarios.listado');
Route::post('/usuarios/agregar', 'UsuariosController@agregar')->name('usuarios.agregar');
Route::post('/usuarios/consultar', 'UsuariosController@consultar')->name('usuarios.consultar');
Route::post('/usuarios/editar', 'UsuariosController@editar')->name('usuarios.editar');

// Almacén o surtir
Route::get('/listadoPedidosJefe', 'SurtidoJefeController@listadoPedidos')->name('listadoPedidosJefe');
Route::get('/listadoTareas', 'SurtidoTrabajadorController@listadoTareas')->name('listadoTareas');

// Preparación de pedido o embalaje

// Embarque o distribución de pedido
