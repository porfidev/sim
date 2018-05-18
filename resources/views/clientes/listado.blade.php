@extends('layouts.app')

@section('content')
    <br>
    <h2 class="mt-2">Listado de clientes</h2>
    <br>
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
                                Estatus
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoCliente"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">add</i>
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
        <input type="hidden" name="scl_estatus"   id="busquedaEstatus"   value="-1">
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
            $( '#busquedaEstatus'   ).val( $( '#formaEstatus'  ).val() ? $( '#formaEstatus'  ).val() : '-1' );
            $( '#searchForm' ).submit();
        }

        $(document).ready(function () {

            $( '[data-toggle="tooltip"]' ).tooltip();
            $( '#btnLimpiar' ).click(function () {
                $( '#busquedaId'        ).val( '0'  );
                $( '#busquedaNombre'    ).val( 'NA' );
                $( '#busquedaCorreo'    ).val( 'NA' );
                $( '#busquedaTelefono'  ).val( 'NA' );
                $( '#busquedaRFC'       ).val( 'NA' );
                $( '#busquedaCP'        ).val( 'NA' );
                $( '#busquedaCiudad'    ).val( 'NA' );
                $( '#busquedaDireccion' ).val( 'NA' );
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

        });
    </script>
@endsection