@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Productos</h2>
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

    <div class="modal fade"
    id="CSVModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="listaModalTitle"
    aria-hidden="true">

    {{
        Form::open(
            array(
                'url'    => 'productos/CSVPro',
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

            $("#btnCSV").click(function () {
            $( "#labelCSV" ).text('Seleccina un archivo CSV');
            $( "#CSVModal" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

            });

            $( "#CSVFile3" ).change(function () {
                $( "#labelCSV" ).text($( "#CSVFile3" ).val().replace(/C:\\fakepath\\/i, ''));
            });

        });
    </script>
@endsection
