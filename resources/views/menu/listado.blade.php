@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Elementos del Menu</h2>
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
                            <th scope="col" style="min-width: 220px;">
                                Padre
                            </th>
                            <th scope="col" style="min-width: 220px;">
                                Etiqueta
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                URL
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoElementoMenu"
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
                                    @if ( Session::has('smi_id') && Session::get('smi_id') != '0' )
                                        value="{{ Session::get('smi_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <select class="form-control"
                                        id="formaParent">
                                    <option value="0"> --- Todos --- </option>
                            @foreach ($parents as $item)
                                    <option value="{{ $item->id }}"
                                @if ( Session::has('smi_parent')
                                        && Session::get('smi_parent') == $item->id )
                                        selected
                                @endif>
                                        {{ $item->label }}
                                    </option>
                            @endforeach
                                </select>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaLabel"
                                        placeholder="Etiqueta"
                                    @if ( Session::has('smi_label') && Session::get('smi_label') != 'NA' )
                                        value="{{ Session::get('smi_label') }}"
                                    @endif>
                            </th>
                            <th>
                                &nbsp;
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
            @foreach ($listado as $item)
                        <tr>
                            <td style="text-align: center;">
                                {{ $item->id }}
                            </td>
                            <td>
                @isset($item->myParent)
                                {{ $item->myParent->label }}
                @endisset
                            </td>
                            <td>
                                {{ $item->label }}
                            </td>
                            <td>
                                {{ $item->url }}
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success editarElementoMenu"
                                        data-id="{{ $item->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">mode_edit</i>
                                </button>
                                <button class="btn btn-sm btn-warning profiles"
                                        data-id="{{ $item->id }}"
                                        data-title="{{ $item->label }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Permisos">
                                    <i class="material-icons">lock</i>
                                </button>
                            </td>
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="6">
                                No hay elementos del menu que mostrar
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
        action="{{ route('menu.listado') }}">
        {{ csrf_field() }}
        <input type="hidden" name="smi_id"     id="busquedaId"      value="0">
        <input type="hidden" name="smi_parent" id="busquedaParent"  value="NA">
        <input type="hidden" name="smi_label"  id="busquedaLabel"   value="NA">
    </form>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')

    @include('menu.modalNuevo')
    @include('menu.modalEditar')
    @include('menu.modalPermisos')

    <script type="text/javascript">
        function ejecutaBusquedasFiltros() {
            $( '#busquedaId'      ).val( $( '#formaId'      ).val() ? $( '#formaId'      ).val() : '0'  );
            $( '#busquedaParent'  ).val( $( '#formaParent'  ).val() ? $( '#formaParent'  ).val() : '0' );
            $( '#busquedaLabel'   ).val( $( '#formaLabel'   ).val() ? $( '#formaLabel'   ).val() : 'NA' );
            $( '#searchForm' ).submit();
        }
        $(document).ready(function () {
            $( '[data-toggle="tooltip"]' ).tooltip();
            $( '#btnLimpiar' ).click(function () {
                $( '#busquedaId'      ).val( '0'  );
                $( '#busquedaParent'  ).val( '0' );
                $( '#busquedaLabel'   ).val( 'NA' );
                $( '#searchForm' ).submit();
            });
            $( '#btnBuscar' ).click(ejecutaBusquedasFiltros);

            $( '#formaParent' ).change(ejecutaBusquedasFiltros);

            $( '.inputFiltro' ).keyup(function(e){
                if(e.keyCode == 13) {
                    ejecutaBusquedasFiltros();
                }
            });
        });
    </script>
@endsection