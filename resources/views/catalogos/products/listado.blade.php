@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Productos</h2>
    <br>
    <div id="erroresLitadoProductos"></div>
    <div class="card">
        <div class="card-body">
            {{ $listado->links('pagination.default') }}
            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style="min-width: 100px;">
                                Sku
                            </th>
                            <th style="min-width: 230px;">
                                Concepto
                            </th>
                            <th style="min-width: 230px;">
                                Alias
                            </th>
                            <th style="min-width: 100px; text-align: center;">
                                C&oacute;digo de Barras
                            </th>
                            <th style="min-width: 100px; text-align: center;">
                                C&oacute;digo de Barras (Display)
                            </th>
                            <th style="text-align: center; min-width: 215px;">
                                <button class="btn btn-primary btn-sm nuevoProducto"
                                    data-toggle="tooltip"
                                    data-placement="top"
                                    title="Agregar Producto">
                                    <i class="material-icons">add</i>
                                </button>
                            </th>
                        </tr>
                        <tr class="table-dark">
                            <td>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaSku"
                                        placeholder="Sku"
                                @if ( Session::has('sp_sku') && Session::get('sp_sku') != 'NA' )
                                        value="{{ Session::get('sp_sku') }}"
                                @endif>
                            </td>
                            <td>
                                <input type="text"
                                    class="form-control inputFiltro"
                                    id="formaConcepto"
                                    placeholder="Concepto"
                            @if ( Session::has('sp_concept') && Session::get('sp_concept') != 'NA' )
                                    value="{{ Session::get('sp_concept') }}"
                            @endif>
                            </td>
                            <td>
                                <input type="text"
                                    class="form-control inputFiltro"
                                    id="formaAlias"
                                    placeholder="Alias"
                            @if ( Session::has('sp_alias') && Session::get('sp_alias') != 'NA' )
                                    value="{{ Session::get('sp_alias') }}"
                            @endif>
                            </td>
                            <td></td>
                            <td></td>
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
                            <td>
                                {{ $item->sku }}
                            </td>
                            <td>
                                {{ $item->concept }}
                            </td>
                            <td>
                                {{ $item->alias }}
                            </td>
                            <td>
                                {{ $item->barcode }}
                            </td>
                            <td>
                                {{ $item->display_barcode }}
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success editProduct"
                                        data-id="{{ $item->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">mode_edit</i>
                                </button>
                                <button class="btn btn-sm btn-danger deleteProduct"
                                        data-id="{{ $item->id }}"
                                        data-title="{{ $item->concept }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Eliminar">
                                    <i class="material-icons">delete</i>
                                </button>
                            </td>
                        </tr>
                @endforeach
                @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="9">
                                No hay productos que mostrar
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
        action="{{ route('productos.listado') }}">
        {{ csrf_field() }}
        <input type="hidden" name="sp_sku"     id="busquedaSku"     value="NA">
        <input type="hidden" name="sp_concept" id="busquedaConcept" value="NA">
        <input type="hidden" name="sp_alias"   id="busquedaAlias"   value="NA">
    </form>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    @include('catalogos.products.modalNuevo')
    @include('catalogos.products.modalEditar')

    <script type="text/javascript">
        function ejecutaBusquedasFiltros() {
            $( '#busquedaSku'     ).val( $( '#formaSku'      ).val() ? $( '#formaSku'      ).val() : 'NA' );
            $( '#busquedaConcept' ).val( $( '#formaConcepto' ).val() ? $( '#formaConcepto' ).val() : 'NA' );
            $( '#busquedaAlias'   ).val( $( '#formaAlias'    ).val() ? $( '#formaAlias'    ).val() : '0'  );
            $( '#searchForm' ).submit();
        }
        $(document).ready(function () {
            $( '[data-toggle="tooltip"]' ).tooltip();

            $( '.inputFiltro' ).keyup(function(e){
                if(e.keyCode == 13) {
                    ejecutaBusquedasFiltros();
                }
            });

            $( '#btnLimpiar' ).click(function () {
                $( '#busquedaSku'     ).val( 'NA' );
                $( '#busquedaConcept' ).val( 'NA' );
                $( '#busquedaAlias'   ).val( 'NA'  );
                $( '#searchForm' ).submit();
            });

            $( '#btnBuscar' ).click(ejecutaBusquedasFiltros);

            $( '.deleteProduct' ).click(function () {
                var parametros = [];
                parametros["id"] = $(this).attr("data-id");
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro de eliminar el producto '" + $(this).attr("data-title") + "'?",
                    "{{ route('productos.eliminar') }}",
                    parametros
                );
            });
        });
    </script>
@endsection
