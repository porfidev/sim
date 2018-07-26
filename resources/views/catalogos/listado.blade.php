@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Catalogos</h2>
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
                                Etiqueta
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                Grupo
                            </th>
                            <th scope="col" style="min-width: 220px;">
                                Valor
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoCatalogo"
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
                                    @if ( Session::has('sc_id') && Session::get('sc_id') != '0' )
                                        value="{{ Session::get('sc_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaEtiqueta"
                                        placeholder="Etiqueta"
                                    @if ( Session::has('sc_etiqueta') && Session::get('sc_etiqueta') != 'NA' )
                                        value="{{ Session::get('sc_etiqueta') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="hidden" id="grupoSelEsp" value="{{ Session::get('sc_grupo') }}">
                                <select class="form-control" id="seleccionaGrup">
                                    <option value="0">Todos</option>
                                    <option value="-1">Padre</option>
                                    @if (count($padresCat) != 0)
                                        @foreach ($padresCat as $cat)
                                            <option value="{{ $cat->id }}">{{ $cat->label }}</option>
                                        @endforeach
                                    @endif
                                </select>                               
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaValor"
                                        placeholder="Valor"
                                    @if ( Session::has('sc_valor') && Session::get('sc_valor') != '0' )
                                        value="{{ Session::get('sc_valor') }}"
                                    @endif>
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
            @foreach ($listado as $cat)
                        <tr>
                            <td style="text-align: center;">
                                {{ $cat->id }}
                            </td>
                            <td>
                                {{ $cat->label }}
                            </td>
                            <td>
                                @if ($cat->group_id === null)
                                   Padre
                                @else
                                    {{ $cat->myParent->label }}
                                @endif
                            </td>
                            <td>
                                {{ $cat->value }}
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success editarCatalogo"
                                        data-id="{{ $cat->id }}"
                                        data-etiqueta="{{ $cat->label }}"
                                        data-grupo="{{ $cat->group_id }}"
                                        data-valor="{{ $cat->value }}"
                                        data-estatus="{{ $cat->status }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">mode_edit</i>
                                </button>
                                <button class="btn btn-sm btn-danger borrarCatalogo"
                                        data-id="{{ $cat->id }}"
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
                            <td colspan="6">
                                No hay catalogos que mostrar
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
        action="{{ route('catalogos.listado') }}">
        {{ csrf_field() }}
        <input type="hidden" name="sc_id"       id="busquedaId"       value="0">
        <input type="hidden" name="sc_etiqueta" id="busquedaEtiqueta" value="NA">
        <input type="hidden" name="sc_grupo"    id="busquedaGrupo"    value="0">
        <input type="hidden" name="sc_valor"    id="busquedaValor"    value="0">
        <input type="hidden" name="sc_estatus"  id="busquedaEstatus"  value="-1">
    </form>
@endsection

@section('final')
@include('partials.modalComun')
@include('partials.modalMensaje')
@include('catalogos.modalNuevo')
@include('catalogos.modalEditar')
@include('partials.modalConfirmacion')
    <script type="text/javascript">

        function ejecutaBusquedasFiltros() {
            $( '#busquedaId'       ).val( $( '#formaId'        ).val() ? $( '#formaId'       ).val() : '0'  );
            $( '#busquedaEtiqueta' ).val( $( '#formaEtiqueta'  ).val() ? $( '#formaEtiqueta' ).val() : 'NA' );
            $( '#busquedaGrupo'    ).val( $( '#seleccionaGrup' ).val() ? $( '#seleccionaGrup').val() : '0' );
            $( '#busquedaValor'    ).val( $( '#formaValor'     ).val() ? $( '#formaValor'    ).val() : '0'  );
            $( '#busquedaEstatus'  ).val( $( '#formaEstatus'   ).val() ? $( '#formaEstatus'  ).val() : '-1' );
            $( '#searchForm' ).submit();
        }

        $(document).ready(function () {

            if($('#grupoSelEsp').val()) {
                $('#seleccionaGrup').val($('#grupoSelEsp').val());
            }

            $( '[data-toggle="tooltip"]' ).tooltip();
            $( '#btnLimpiar' ).click(function () {
                $( '#busquedaId'       ).val( '0'  );
                $( '#busquedaEtiqueta' ).val( 'NA' );
                $( '#busquedaGrupo'    ).val( '0'  );
                $( '#busquedaValor'    ).val( '0'  );
                $( '#busquedaEstatus'  ).val( '-1' );
                $( '#searchForm' ).submit();
            });

            $( '#btnBuscar' ).click(ejecutaBusquedasFiltros);

            $( '#formaEstatus' ).change(ejecutaBusquedasFiltros);

            $( '.inputFiltro' ).keyup(function(e){
                if(e.keyCode == 13) {
                    ejecutaBusquedasFiltros();
                }
            });

            $( "#seleccionaGrup" ).change(function() {
                ejecutaBusquedasFiltros();
            });

            $( '.borrarCatalogo' ).click(function () {
                var parametros = [];
                parametros["id"] = $(this).attr("data-id");
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro de eliminar este catálogo?",
                    "{{ route('catalogos.eliminar') }}",
                    parametros
                );
            });

        });
    </script>
@endsection