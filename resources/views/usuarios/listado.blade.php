@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Usuarios</h2>
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
                                Correo electr&oacute;nico
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Estatus
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoUsuario"
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
                                    @if ( Session::has('su_id') && Session::get('su_id') != '0' )
                                        value="{{ Session::get('su_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaNombre"
                                        placeholder="Nombre"
                                    @if ( Session::has('su_nombre') && Session::get('su_nombre') != 'NA' )
                                        value="{{ Session::get('su_nombre') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaEmail"
                                        placeholder="Correo electr&oacute;nico"
                                    @if ( Session::has('su_email') && Session::get('su_email') != 'NA' )
                                        value="{{ Session::get('su_email') }}"
                                    @endif>
                            </th>
                            <th>
                                <select class="form-control"
                                        id="formaEstatus">
                                    <option value="-1">
                                        --- Todos ---
                                    </option>
                                    <option value="1"
                                    @if ( Session::has('su_status') && Session::get('su_status') == 1 )
                                        selected
                                    @endif>
                                        Activo
                                    </option>
                                    <option value="0"
                                    @if ( Session::has('su_status') && Session::get('su_status') == 0 )
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
            @foreach ($listado as $user)
                        <tr>
                            <td style="text-align: center;">
                                {{ $user->id }}
                            </td>
                            <td>
                                {{ $user->name }}
                            </td>
                            <td>
                                {{ $user->email }}
                            </td>
                            <td style="text-align: center;">
                    @if ($user->status == 0)
                                <span class="text-danger font-weight-bold">Inactivo</span>
                    @elseif ($user->status == 1)
                                <span class="text-success font-weight-bold">Activo</span>
                    @endif
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success editarUsuario"
                                        data-id="{{ $user->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">mode_edit</i>
                                </button>
                            </td>
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="5">
                                No hay usuarios que mostrar
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
        action="{{ route('usuarios.listado') }}">
        {{ csrf_field() }}
        <input type="hidden" name="su_id"     id="busquedaId"      value="0">
        <input type="hidden" name="su_nombre" id="busquedaNombre"  value="NA">
        <input type="hidden" name="su_email"  id="busquedaEmail"   value="NA">
        <input type="hidden" name="su_status" id="busquedaEstatus" value="-1">
    </form>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('usuarios.modalNuevo')
    @include('usuarios.modalEditar')
    <script type="text/javascript">
        function ejecutaBusquedasFiltros() {
            $( '#busquedaId'      ).val( $( '#formaId'      ).val() ? $( '#formaId'      ).val() : '0'  );
            $( '#busquedaNombre'  ).val( $( '#formaNombre'  ).val() ? $( '#formaNombre'  ).val() : 'NA' );
            $( '#busquedaEmail'   ).val( $( '#formaEmail'   ).val() ? $( '#formaEmail'   ).val() : 'NA' );
            $( '#busquedaEstatus' ).val( $( '#formaEstatus' ).val() ? $( '#formaEstatus' ).val() : '-1' );
            $( '#searchForm' ).submit();
        }
        $(document).ready(function () {
            $( '[data-toggle="tooltip"]' ).tooltip();
            $( '#btnLimpiar' ).click(function () {
                $( '#busquedaId'      ).val( '0'  );
                $( '#busquedaNombre'  ).val( 'NA' );
                $( '#busquedaEmail'   ).val( 'NA' );
                $( '#busquedaEstatus' ).val( '-1' );
                $( '#searchForm' ).submit();
            });
            $( '#btnBuscar' ).click(ejecutaBusquedasFiltros);
            $( '#formaEstatus' ).change(ejecutaBusquedasFiltros);
            $('.inputFiltro').keyup(function(e){
                if(e.keyCode == 13) {
                    ejecutaBusquedasFiltros();
                }
            });
        });
    </script>
@endsection