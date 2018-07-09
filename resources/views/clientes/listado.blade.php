@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de clientes</h2>
    <br>
    @if(Session::has('exito'))
    <div class="alert alert-success alert-dismissible fade show mt-3 mb-2"
        role="alert">
        <button type="button"
            class="close"
            data-dismiss="alert"
            aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
        </button>
        {{{ Session::get('exito') }}}
    </div>
    @endif
    <input id="rolcin" type="hidden" value="{{ Session::get('rol') }}">

    <span id="mensajeHist"></span>

    @if(Session::has('errores'))
    <div class="alert alert-danger alert-dismissible fade show mt-3 mb-2"
        role="alert">
        <button type="button"
            class="close"
            data-dismiss="alert"
            aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
        </button>
        {{ Session::get('errores') }}
    </div>
    @endif
    <div class="card">
        <div class="card-body">
            {{ $listado->links('pagination.default') }}
            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                #
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                Nombre
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                Correo
                            </th>
                            <th scope="col" style="min-width: 220px;">
                                Tel&eacute;fono
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                RFC
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                CP
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Ciudad
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Direcci&oacute;n
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                C&oacute;digo
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Prioridad
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Tiendas
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Sku
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Prioridad 2
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Tipo de empaque
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Complejidad de empaque
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Tamaño de pedido
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Promedio
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Estatus
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoCliente"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">add</i>
                                </button> 
                                <button
                                    class="btn btn-primary btn-sm"
                                    id="btnCSV"
                                    data-tooltip="tooltip"
                                    data-placement="top"
                                    title="Cargar CSV">
                                    <i class="material-icons">file_upload</i>
                                </button>
                            </th>
                        </tr>
                        <tr class="table-dark">
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaId"
                                        placeholder="#"
                                    @if ( Session::has('scl_id') && Session::get('scl_id') != '0' )
                                        value="{{ Session::get('scl_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaNombre"
                                        placeholder="Nombre"
                                    @if ( Session::has('scl_nombre') && Session::get('scl_nombre') != 'NA' )
                                        value="{{ Session::get('scl_nombre') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaCorreo"
                                        placeholder="Correo"
                                    @if ( Session::has('scl_correo') && Session::get('scl_correo') != 'NA' )
                                        value="{{ Session::get('scl_correo') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaTelefono"
                                        placeholder="Telefono"
                                    @if ( Session::has('scl_telefono') && Session::get('scl_telefono') != 'NA' )
                                        value="{{ Session::get('scl_telefono') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaRFC"
                                        placeholder="RFC"
                                    @if ( Session::has('scl_RFC') && Session::get('scl_RFC') != 'NA' )
                                        value="{{ Session::get('scl_RFC') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaCP"
                                        placeholder="CP"
                                    @if ( Session::has('scl_CP') && Session::get('scl_CP') != 'NA' )
                                        value="{{ Session::get('scl_CP') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaCiudad"
                                        placeholder="Ciudad"
                                    @if ( Session::has('scl_ciudad') && Session::get('scl_ciudad') != 'NA' )
                                        value="{{ Session::get('scl_ciudad') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaDireccion"
                                        placeholder="Direccion"
                                    @if ( Session::has('scl_direccion') && Session::get('scl_direccion') != 'NA' )
                                        value="{{ Session::get('scl_direccion') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaCode"
                                        placeholder="Codigo"
                                    @if ( Session::has('scl_code') && Session::get('scl_code') != 'NA' )
                                        value="{{ Session::get('scl_code') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="number"
                                        class="form-control inputFiltro"
                                        id="formaP"
                                        placeholder="P"
                                    @if ( Session::has('scl_p') && Session::get('scl_p') != 'NA' )
                                        value="{{ Session::get('scl_p') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="number"
                                        class="form-control inputFiltro"
                                        id="formaShops"
                                        placeholder="Tiendas"
                                    @if ( Session::has('scl_shops') && Session::get('scl_shops') != 'NA' )
                                        value="{{ Session::get('scl_shops') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="number"
                                        class="form-control inputFiltro"
                                        id="formaSku"
                                        placeholder="Sku"
                                    @if ( Session::has('scl_sku') && Session::get('scl_sku') != 'NA' )
                                        value="{{ Session::get('scl_sku') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="number"
                                        class="form-control inputFiltro"
                                        id="formaD2"
                                        placeholder="D2"
                                    @if ( Session::has('scl_d2') && Session::get('scl_d2') != 'NA' )
                                        value="{{ Session::get('scl_d2') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="hidden" id="grupoSelEsp" value="{{ Session::get('scl_te') }}">
                                <select class="form-control" id="seleccionaGrup">
                                    <option value="0">Todos</option>
                                    @if (count($empaques) != 0)
                                        @foreach ($empaques as $cat)
                                            <option value="{{ $cat->id }}">{{ $cat->label }}</option>
                                        @endforeach
                                    @endif
                                </select>    
                            </th>
                            <th>
                                <input type="number"
                                        class="form-control inputFiltro"
                                        id="formaCe"
                                        placeholder="CE"
                                    @if ( Session::has('scl_ce') && Session::get('scl_ce') != 'NA' )
                                        value="{{ Session::get('scl_ce') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="number"
                                        class="form-control inputFiltro"
                                        id="formaTp"
                                        placeholder="TP"
                                    @if ( Session::has('scl_tp') && Session::get('scl_tp') != 'NA' )
                                        value="{{ Session::get('scl_tp') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="number"
                                        class="form-control inputFiltro"
                                        id="formaPromedio"
                                        placeholder="Promedio"
                                    @if ( Session::has('scl_average') && Session::get('scl_average') != 'NA' )
                                        value="{{ Session::get('scl_average') }}"
                                    @endif>
                            </th>
                            <th>
                                <select class="form-control"
                                        id="formaEstatus">
                                    <option value="-1">
                                        --- Todos ---
                                    </option>
                                    <option value="1"
                                    @if ( Session::has('scl_estatus') && Session::get('scl_estatus') == 1 )
                                        selected
                                    @endif>
                                        Activo
                                    </option>
                                    <option value="0"
                                    @if ( Session::has('scl_estatus') && Session::get('scl_estatus') == 0 )
                                        selected
                                    @endif>
                                        Inactivo
                                    </option>
                                </select>
                            </th>
                            <th style="text-align: center;">
                                <button class="btn btn-sm btn-info"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar"
                                        id="btnBuscar">
                                    <i class="material-icons">search</i>
                                </button>

                                <button class="btn btn-sm btn-warning"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Limpiar filtros"
                                        id="btnLimpiar">
                                    <i class="material-icons">settings_backup_restore</i>
                                </button>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
            @foreach ($listado as $cli)
                        <tr>
                            <td style="text-align: center;">
                                {{ $cli->id }}
                            </td>
                            <td>
                                {{ $cli->name }}
                            </td>
                            <td>
                                {{ $cli->email }}
                            </td>
                            <td>
                                {{ $cli->telephone }}
                            </td>
                            <td>
                                {{ $cli->rfc }}
                            </td>
                            <td>
                                {{ $cli->cp }}
                            </td>
                            <td>
                                {{ $cli->city }}
                            </td>
                            <td>
                                {{ $cli->address }}
                            </td>
                            <td>
                                {{ $cli->code }}
                            </td>
                            <td>
                                {{ $cli->P }}
                            </td>
                            <td>
                                {{ $cli->shops }}
                            </td>
                            <td>
                                {{ $cli->sku }}
                            </td>
                            <td>
                                {{ $cli->D2 }}
                            </td>
                            <td>
                                {{ $cli->TE }}
                            </td>
                            <td>
                                {{ $cli->CE }}
                            </td>
                            <td>
                                {{ $cli->TP }}
                            </td>
                            <td>
                                {{ $cli->average }}
                            </td>
                            <td style="text-align: center;">
                    @if ($cli->estatus == 0)
                                <span class="text-danger font-weight-bold">Inactivo</span>
                    @elseif ($cli->estatus == 1)
                                <span class="text-success font-weight-bold">Activo</span>
                    @endif
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success editarCliente"
                                        data-id="{{ $cli->id }}"
                                        data-nombre="{{ $cli->name }}"
                                        data-correo="{{ $cli->email }}"
                                        data-telefono="{{ $cli->telephone }}"
                                        data-rfc="{{ $cli->rfc }}"
                                        data-cp="{{ $cli->cp }}"
                                        data-ciudad="{{ $cli->city }}"
                                        data-direccion="{{ $cli->address }}"
                                        data-estatus="{{ $cli->estatus }}"
                                        data-code="{{ $cli->code }}"
                                        data-p="{{ $cli->P }}"
                                        data-tienda="{{ $cli->shops }}"
                                        data-sku="{{ $cli->sku }}"
                                        data-d2="{{ $cli->D2 }}"
                                        data-tp="{{ $cli->TP }}"
                                        data-promedio="{{ $cli->average }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">mode_edit</i>
                                </button>
                                <button class="btn btn-sm btn-danger borrarCliente"
                                        data-id="{{ $cli->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">delete</i>
                                </button>
                            </td>
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="10">
                                No hay clientes que mostrar
                            </td>
                        </tr>
            @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade"
    id="CSVModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="listaModalTitle"
    aria-hidden="true">

    {{
        Form::open(
            array(
                'url'    => 'clientes/CSVCli',
                'id'     => 'CsvForm',
                'method' => 'POST',
                'enctype'=> 'multipart/form-data'
            )
        )
    }}
    <!-- MODAL PARA CSV -->
    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="listaModalTitle">
                        Archivo CSV
                </h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file"
                            name="CSVFile3"
                            id="CSVFile3"
                            class="custom-file-input">
                        <label class="custom-file-label"
                                id="labelCSV"
                                for="CSVFile3">
                            Selecciona un archivo CSV
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button 
                    type="submit" 
                    class="btn btn-primary">
                    Guardar
                </button>
                <button type="button"
                    id="btnCerrar"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cerrar
                </button>
            </div>
        </div>
    </div>

    {{ Form::close() }}

</div>

    <form id="searchForm"
        method="POST"
        action="{{ route('clientes.listado') }}">
        {{ csrf_field() }}
        <input type="hidden" name="scl_id"        id="busquedaId"        value="0">
        <input type="hidden" name="scl_nombre"    id="busquedaNombre"    value="NA">
        <input type="hidden" name="scl_correo"    id="busquedaCorreo"    value="NA">
        <input type="hidden" name="scl_telefono"  id="busquedaTelefono"  value="NA">
        <input type="hidden" name="scl_RFC"       id="busquedaRFC"       value="NA">
        <input type="hidden" name="scl_CP"        id="busquedaCP"        value="NA">
        <input type="hidden" name="scl_ciudad"    id="busquedaCiudad"    value="NA">
        <input type="hidden" name="scl_direccion" id="busquedaDireccion" value="NA">
        <input type="hidden" name="scl_code"      id="busquedaCodigo" value="NA">
        <input type="hidden" name="scl_p"         id="busquedaP" value="NA">
        <input type="hidden" name="scl_shops"     id="busquedaTienda" value="NA">
        <input type="hidden" name="scl_sku"       id="busquedaSku" value="NA">
        <input type="hidden" name="scl_pack"      id="busquedaPack" value="NA">
        <input type="hidden" name="scl_d2"        id="busquedaD2" value="NA">
        <input type="hidden" name="scl_te"        id="busquedaTe" value="NA">
        <input type="hidden" name="scl_ce"        id="busquedaCe" value="NA">
        <input type="hidden" name="scl_tp"        id="busquedaTp" value="NA">
        <input type="hidden" name="scl_average"   id="busquedaPromedio" value="NA">
        <input type="hidden" name="scl_d"         id="busquedaD"   value="-1">
    </form>
@endsection

@section('final')
@include('partials.modalComun')
@include('partials.modalMensaje')
@include('clientes.modalNuevo')
@include('clientes.modalEditar')
@include('partials.modalConfirmacion')
    <script type="text/javascript">

        function ejecutaBusquedasFiltros() {
            $( '#busquedaId'        ).val( $( '#formaId'       ).val() ? $( '#formaId'       ).val() : '0'  );
            $( '#busquedaNombre'    ).val( $( '#formaNombre'   ).val() ? $( '#formaNombre'   ).val() : 'NA' );
            $( '#busquedaCorreo'    ).val( $( '#formaCorreo'   ).val() ? $( '#formaCorreo'   ).val() : 'NA' );
            $( '#busquedaTelefono'  ).val( $( '#formaTelefono' ).val() ? $( '#formaTelefono' ).val() : 'NA' );
            $( '#busquedaRFC'       ).val( $( '#formaRFC'      ).val() ? $( '#formaRFC'      ).val() : 'NA' );
            $( '#busquedaCP'        ).val( $( '#formaCP'       ).val() ? $( '#formaCP'       ).val() : 'NA' );
            $( '#busquedaCiudad'    ).val( $( '#formaCiudad'   ).val() ? $( '#formaCiudad'   ).val() : 'NA' );
            $( '#busquedaDireccion' ).val( $( '#formaDireccion').val() ? $( '#formaDireccion').val() : 'NA' );
            $( '#busquedaCodigo' ).val( $( '#formaCode').val() ? $( '#formaCode').val() : 'NA' );
            $( '#busquedaP' ).val( $( '#formaP').val() ? $( '#formaP').val() : 'NA' );
            $( '#busquedaTienda' ).val( $( '#formaShops').val() ? $( '#formaShops').val() : 'NA' );
            $( '#busquedaSku' ).val( $( '#formaSku').val() ? $( '#formaSku').val() : 'NA' );
            $( '#busquedaPack' ).val( $( '#formaPack').val() ? $( '#formaPack').val() : 'NA' );
            $( '#busquedaD2' ).val( $( '#formaD2').val() ? $( '#formaD2').val() : 'NA' );
            $( '#busquedaTe' ).val( $( '#formaTe').val() ? $( '#formaTe').val() : 'NA' );
            $( '#busquedaCe' ).val( $( '#formaCe').val() ? $( '#formaCe').val() : 'NA' );
            $( '#busquedaTp' ).val( $( '#formaTp').val() ? $( '#formaTp').val() : 'NA' );
            $( '#busquedaPromedio' ).val( $( '#formaPromedio').val() ? $( '#formaPromedio').val() : 'NA' );
            $( '#busquedaD' ).val( $( '#formaD').val() ? $( '#formaD').val() : 'NA' );
            $( '#busquedaEstatus'   ).val( $( '#formaEstatus'  ).val() ? $( '#formaEstatus'  ).val() : '-1' );
            $( '#searchForm' ).submit();
        }

        $(document).ready(function () {

            $( '[data-toggle="tooltip"]' ).tooltip();

            $( "#seleccionaGrup" ).change(function() {
                ejecutaBusquedasFiltros();
            });

            $( '#btnLimpiar' ).click(function () {
                $( '#busquedaId'        ).val( '0'  );
                $( '#busquedaNombre'    ).val( 'NA' );
                $( '#busquedaCorreo'    ).val( 'NA' );
                $( '#busquedaTelefono'  ).val( 'NA' );
                $( '#busquedaRFC'       ).val( 'NA' );
                $( '#busquedaCP'        ).val( 'NA' );
                $( '#busquedaCiudad'    ).val( 'NA' );
                $( '#busquedaDireccion' ).val( 'NA' );
                $( '#busquedaCodigo' ).val( 'NA' );
                $( '#busquedaP' ).val( 'NA' );
                $( '#busquedaSku' ).val( 'NA' );
                $( '#busquedaTienda' ).val( 'NA' );
                $( '#busquedaPack' ).val( 'NA' );
                $( '#busquedaD2' ).val( 'NA' );
                $( '#busquedaTe' ).val( 'NA' );
                $( '#busquedaCe' ).val( 'NA' );
                $( '#busquedaTp' ).val( 'NA' );
                $( '#busquedaPromedio' ).val( 'NA' );
                $( '#busquedaD' ).val( 'NA' );
                $( '#busquedaEstatus'   ).val( '-1' );
                $( '#searchForm' ).submit();
            });

            $( '#btnBuscar' ).click(ejecutaBusquedasFiltros);

            $( '#formaEstatus' ).change(ejecutaBusquedasFiltros);

            $( '.inputFiltro' ).keyup(function(e){
                if(e.keyCode == 13) {
                    ejecutaBusquedasFiltros();
                }
            });

            $( '.borrarCliente' ).click(function () {
                var parametros = [];
                parametros["id"] = $(this).attr("data-id");
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro de eliminar este catálogo?",
                    "{{ route('clientes.eliminar') }}",
                    parametros
                );
            });

            $("#btnCSV").click(function () {
            $( "#labelCSV" ).text('Seleccina un archivo CSV');
            $( "#CSVModal" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

            $( "#CSVFile3" ).change(function () {
                $( "#labelCSV" ).text($( "#CSVFile3" ).val().replace(/C:\\fakepath\\/i, ''));
            });
        });

        });
    </script>
@endsection