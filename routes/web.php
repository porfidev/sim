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
Route::get('/usuarios/listado',            '\App\Http\Controllers\Base\UsuariosController@listado'           );
Route::post('/usuarios/listado',           '\App\Http\Controllers\Base\UsuariosController@listado'           )->name('usuarios.listado');
Route::post('/usuarios/agregar',           '\App\Http\Controllers\Base\UsuariosController@agregar'           )->name('usuarios.agregar');
Route::post('/usuarios/consultar',         '\App\Http\Controllers\Base\UsuariosController@consultar'         )->name('usuarios.consultar');
Route::post('/usuarios/editar',            '\App\Http\Controllers\Base\UsuariosController@editar'            )->name('usuarios.editar');
Route::get('/usuarios/obtenerNombre',      '\App\Http\Controllers\Base\UsuariosController@buscaJefe'         )->name('usuarios.nom');
Route::get('/usuarios/obtenerNombresJefe/{ord}', '\App\Http\Controllers\Base\UsuariosController@buscaUsuarios')->name('usuarios.usu');
Route::post('/usuarios/asignarJefe',       '\App\Http\Controllers\Base\UsuariosController@asignarJefe'       )->name('usuarios.asignarJ');
Route::post('/usuarios/asignarUsuario',    '\App\Http\Controllers\Base\UsuariosController@asignarUsuario'    )->name('usuarios.asignarU');
Route::post('/usuarios/listaAsig',         '\App\Http\Controllers\Base\UsuariosController@listaAsig'         )->name('usuarios.listaAsig');
Route::post('/usuarios/desasignarUsuario', '\App\Http\Controllers\Base\UsuariosController@desasignarUsuario' )->name('usuarios.desasignar');

// Pedidos
Route::post('/pedidos/listaAsig', '\App\Http\Controllers\Surtido\SurtidoTrabajadorController@listaAsig' )->name('pedidos.listaAsig');

// Productos
Route::get('/productos/listado',        '\App\Http\Controllers\Base\ProductController@listado'  );
Route::post('/productos/listado',       '\App\Http\Controllers\Base\ProductController@listado'  )->name('productos.listado');
Route::post('/productos/agregar',       '\App\Http\Controllers\Base\ProductController@agregar'  )->name('productos.agregar');
Route::post('/productos/consultar',     '\App\Http\Controllers\Base\ProductController@consultar')->name('productos.consultar');
Route::post('/productos/editar',        '\App\Http\Controllers\Base\ProductController@editar'   )->name('productos.editar');
Route::post('/productos/eliminar',      '\App\Http\Controllers\Base\ProductController@eliminar' )->name('productos.eliminar');
Route::post('/productos/CSVPro',        '\App\Http\Controllers\Base\ProductController@CSVPro'   )->name('productos.CSV');

// Cajas
Route::get('/cajas/listado',    '\App\Http\Controllers\Base\BoxesController@listado'  )->name('cajas.listado');
Route::post('/cajas/agregar',   '\App\Http\Controllers\Base\BoxesController@agregar'  )->name('cajas.agregar');
Route::post('/cajas/eliminar',  '\App\Http\Controllers\Base\BoxesController@eliminar' )->name('cajas.eliminar');

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
Route::post('/clientes/CSVCli',    '\App\Http\Controllers\Ventas\ClientesController@CSVCli'   )->name('clientes.CSV');

// Almacén o surtir
Route::get('/listadoPedidosJefe',       '\App\Http\Controllers\Surtido\SurtidoJefeController@listadoPedidos'      )->name('listadoPedidosJefe');
Route::post('/listadoPedidosJefe',       '\App\Http\Controllers\Surtido\SurtidoJefeController@listadoPedidos'      )->name('listadoPedidosJefe');
Route::get('/listadoTareas',            '\App\Http\Controllers\Surtido\SurtidoTrabajadorController@listadoTareas' )->name('listadoTareas');
Route::get('/listadoTareasJ/{idPed}',   '\App\Http\Controllers\Surtido\SurtidoJefeController@listadoTareasJ'      )->name('listadoTareasJ');
Route::post('/addDet',                  '\App\Http\Controllers\Surtido\SurtidoTrabajadorController@addDet'        )->name('surtir.addDet');
Route::post('/addDetJ',                 '\App\Http\Controllers\Surtido\SurtidoJefeController@addDetJ'             )->name('surtir.addDetJ');
Route::post('/cierraPed',               '\App\Http\Controllers\Surtido\SurtidoTrabajadorController@cierraPed'     )->name('surtir.cierraPed');
Route::post('/cierraPedJ',              '\App\Http\Controllers\Surtido\SurtidoJefeController@cierraPedJ'          )->name('surtir.cierraPedJ');

// Recepción de mercancía
Route::get('/ordenes/listado',                 '\App\Http\Controllers\Recepcion\RecepcionController@listado'        );
Route::post('/ordenes/listado',                '\App\Http\Controllers\Recepcion\RecepcionController@listado'        )->name('ordenes.listado');
Route::get('/ordenes/listadoItems/{purchase}', '\App\Http\Controllers\Recepcion\RecepcionController@listadoItems'   )->name('ordenes.listadoItems');
Route::post('/ordenes/validar',                '\App\Http\Controllers\Recepcion\RecepcionController@validaCodigo'   )->name('ordenes.validar');
Route::get('/ordenes/validar',                 '\App\Http\Controllers\Recepcion\RecepcionController@validaCodigo'   )->name('ordenes.validar');
Route::get('/ordenes/validacion',              '\App\Http\Controllers\Recepcion\RecepcionController@validacion'     )->name('ordenes.validacion');


//Funciones de HandHeld
Route::get('/hh/recepcion/listadoHH',                  '\App\Http\Controllers\Recepcion\RecepcionController@listadoHH'             );
Route::post('/hh/recepcion/listadoHH',                 '\App\Http\Controllers\Recepcion\RecepcionController@listadoHH'             )->name('ordenes.listadoHH');
Route::get('/hh/recepcion/listadoItemsHH/{purchase}',  '\App\Http\Controllers\Recepcion\RecepcionController@listadoItemsHH'        );
Route::post('/hh/recepcion/listadoItemsHH/{purchase}', '\App\Http\Controllers\Recepcion\RecepcionController@listadoItemsHH'        )->name('ordenes.listadoItemsHH');
Route::get('hh/recepcion/validacionHH/',               '\App\Http\Controllers\Recepcion\RecepcionController@listadoValidacionHH'   )->name('ordenes.listadoValidacionHH');
Route::post('hh/recepcion/validacionHH/',              '\App\Http\Controllers\Recepcion\RecepcionController@listadoValidacionHH'  )->name('ordenes.listadoValidacionHH');
Route::get('hh/recepcion/validacionRecepcionesHH/',    '\App\Http\Controllers\Recepcion\RecepcionController@validaRecepciones'     )->name('ordenes.validaRecibido');
Route::post('hh/recepcion/validacionRecepcionesHH/',   '\App\Http\Controllers\Recepcion\RecepcionController@validaRecepciones'    )->name('ordenes.validaRecibido');

Route::get('hh/recepcion/finalValidacionHH/',            '\App\Http\Controllers\Recepcion\RecepcionController@validacionFinal'       )->name('ordenes.validacionFinal');
Route::post('hh/recepcion/finalValidacionHH/',           '\App\Http\Controllers\Recepcion\RecepcionController@validacionFinal'       )->name('ordenes.validacionFinal');

Route::post('hh/recepcion/obtenCantidadPorCodigo/',    '\App\Http\Controllers\Recepcion\RecepcionController@obtenCantidadPorCodigo' )->name('ordenes.obtenCantidadPorCodigo');
Route::get('hh/recepcion/actualizar/',                 '\App\Http\Controllers\Recepcion\RecepcionController@actualizar'             )->name('ordenes.actualizar');
Route::post('hh/recepcion/actualizar/',                '\App\Http\Controllers\Recepcion\RecepcionController@actualizar'             )->name('ordenes.actualizar');


Route::post('hh/recepcion/captura',                    '\App\Http\Controllers\Recepcion\RecepcionController@formularioDatos'   )->name('ordenes.captura');
Route::get('hh/recepcion/captura',                     '\App\Http\Controllers\Recepcion\RecepcionController@formularioDatos'   )->name('ordenes.captura');

Route::post('hh/recepcion/valida',                    '\App\Http\Controllers\Recepcion\RecepcionController@formularioDatosValidacion'   )->name('ordenes.valida');
Route::get('hh/recepcion/valida',                     '\App\Http\Controllers\Recepcion\RecepcionController@formularioDatosValidacion'   )->name('ordenes.valida');

Route::post('hh/recepcion/validaCaptura',              '\App\Http\Controllers\Recepcion\RecepcionController@formularioValidar'   )->name('ordenes.validaCaptura');
Route::get('hh/recepcion/validaCaptura',               '\App\Http\Controllers\Recepcion\RecepcionController@formularioValidar'   )->name('ordenes.validaCaptura');


// Preparación de pedido o embalaje Jefe
Route::get('/preparacion/listado',             '\App\Http\Controllers\Preparacion\PreparacionJefeController@listadoPedidos'         )->name('preparacion.listado');
Route::get('/preparacion/informacion',         '\App\Http\Controllers\Preparacion\PreparacionJefeController@mostrarInformacion'     );
Route::post('/preparacion/recibir',            '\App\Http\Controllers\Preparacion\PreparacionJefeController@recibirPedido'          )->name('preparacion.recibir');
Route::post('/preparacion/tareas',             '\App\Http\Controllers\Preparacion\PreparacionJefeController@tareasDelPedidoPorItem' )->name('preparacion.tareas');
Route::post('/preparacion/tareasPorCaja',      '\App\Http\Controllers\Preparacion\PreparacionJefeController@tareasDelPedidoPorCaja' )->name('preparacion.tareas.caja');
Route::post('/preparacion/asignacionDetalle',  '\App\Http\Controllers\Preparacion\PreparacionJefeController@asignacionPorItem'      )->name('preparacion.asignacionDetalle');
Route::post('/preparacion/asignacionCaja',     '\App\Http\Controllers\Preparacion\PreparacionJefeController@asignacionPorCaja'      )->name('preparacion.asignacionCaja');
Route::post('/preparacion/obtenerInformacion', '\App\Http\Controllers\Preparacion\PreparacionJefeController@obtenerInformacion'     )->name('preparacion.obtenerInformacion');
Route::post('/preparacion/validar',            '\App\Http\Controllers\Preparacion\PreparacionJefeController@valida'                 )->name('preparacion.validar');
Route::post('/preparacion/CSVReparto',         '\App\Http\Controllers\Preparacion\PreparacionJefeController@CSVReparto'             )->name('preparacion.reparto');
Route::get('/preparacion/mostrarValidacion/{order_id}', '\App\Http\Controllers\Preparacion\PreparacionJefeController@mostrarValidacion'  )->name('preparacion.mostrarValidacion');
Route::post('/preparacion/agregar/caja',       '\App\Http\Controllers\Preparacion\PreparacionJefeController@agregarCaja'            )->name('preparacion.agregar.caja');
Route::post('/preparacion/disenio',            '\App\Http\Controllers\Preparacion\PreparacionJefeController@crearDisenioSinCSV'     )->name('preparacion.disenio.sinCSV');
Route::get('/preparacion/mostrarDisenio/{id}', '\App\Http\Controllers\Preparacion\PreparacionJefeController@mostrarDisenio'         )->name('preparacion.mostrar.disenio');
Route::post('/preparacion/validarDiseion',     '\App\Http\Controllers\Preparacion\PreparacionJefeController@validarDisenio'         )->name('preparacion.validar.disenio');
Route::post('/preparacion/actualizarCantidad', '\App\Http\Controllers\Preparacion\PreparacionJefeController@actualizarCantidad'     )->name('preparacion.disenio.actualizar');
Route::post('/preparacion/quitarProducto',     '\App\Http\Controllers\Preparacion\PreparacionJefeController@quitarProducto'         )->name('preparacion.disenio.quitar');
Route::post('/preparacion/agregarProducto',    '\App\Http\Controllers\Preparacion\PreparacionJefeController@agregarProducto'        )->name('preparacion.disenio.agregar');
Route::post('/preparacion/cambiarOrden',       '\App\Http\Controllers\Preparacion\PreparacionJefeController@cambiarOrdenDisenio'    )->name('preparacion.disenio.orden');
Route::post('/preparacion/quitarCaja',         '\App\Http\Controllers\Preparacion\PreparacionJefeController@quitarCaja'             )->name('preparacion.disenio.quitar.caja');

// Preparación de pedido o embalaje trabajador
Route::get('/preparacion/listadoTareas', '\App\Http\Controllers\Preparacion\PreparacionTrabajadorController@listadoTareas' );
Route::post('/preparacion/asignaCaja',   '\App\Http\Controllers\Preparacion\PreparacionTrabajadorController@asignaCaja'    )->name('preparacion.asigna.caja');
Route::post('/preparacion/terminaTarea', '\App\Http\Controllers\Preparacion\PreparacionTrabajadorController@terminarTarea' )->name('preparacion.terminarTarea');

// Pedidos pendientes
Route::get('/pendientes/listado',     '\App\Http\Controllers\Pendings\PendingsController@listado')->name('pendiente.listado');
Route::post('/pendientes/apartar',     '\App\Http\Controllers\Pendings\PendingsController@apartar')->name('pendiente.apartar');
Route::post('/pendientes/arreglaCli',     '\App\Http\Controllers\Pendings\PendingsController@arreglaCli')->name('pendiente.arreglaCli');
Route::post('/pendientes/arreglaDist',     '\App\Http\Controllers\Pendings\PendingsController@arreglaDist')->name('pendiente.arreglaDist');

//Tarimas
Route::get('/tarimas/listado',     '\App\Http\Controllers\Tarimas\TarimasController@listado')->name('tarimas.listado');
Route::post('/tarimas/nuevaTarima',     '\App\Http\Controllers\Tarimas\TarimasController@nuevaTarima')->name('tarimas.nuevaTarima');
Route::post('/tarimas/asignaTarima',     '\App\Http\Controllers\Tarimas\TarimasController@asignaTarima')->name('tarimas.asignaTarima');
Route::post('/tarimas/listaCajas',     '\App\Http\Controllers\Tarimas\TarimasController@listaCajas')->name('tarimas.listaCajas');

// Embarque o distribución de pedido
Route::get('/camiones/listado',     '\App\Http\Controllers\camiones\CamionesController@listado')->name('camiones.listado');
Route::post('/camiones/agregar',     '\App\Http\Controllers\camiones\CamionesController@agregar')->name('camiones.agregar');
Route::post('/camiones/editar',     '\App\Http\Controllers\camiones\CamionesController@editar')->name('camiones.editar');
Route::post('/camiones/eliminar',     '\App\Http\Controllers\camiones\CamionesController@eliminar')->name('camiones.eliminar');