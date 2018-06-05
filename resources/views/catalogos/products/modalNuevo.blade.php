<!-- Modal para Producto Nuevo -->
<div class="modal fade"
    id="modalNuevoProducto"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoProductoTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Nuevo Producto
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="erroresValidacionNuevoProducto"></div>
                <div id="loading_modal_new_product"
                    style="display: none;">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <form id="formGuardarNuevoProducto">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label>
                            SKU
                        </label>
                        <input type="text"
                                class="form-control"
                                placeholder="Escribe la Clave del producto"
                                name="sku"
                                required>
                    </div>
                    <div class="form-group">
                        <label>
                            Concepto
                        </label>
                        <input type="text"
                                class="form-control"
                                placeholder="Escribe la descripci&oacute;n o nombre del producto"
                                name="concepto"
                                required>
                    </div>
                    <div class="form-group">
                        <label>
                            Alias
                        </label>
                        <input type="text"
                                class="form-control"
                                placeholder="Escribe la descripci&oacute;n o nombre del producto"
                                name="alias"
                                required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>
                                Peso por pieza
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe el peso por pieza del producto"
                                    name="pesoPorPieza"
                                    required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>
                                Piezas por display
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe el n&uacute;mero de piezas por display"
                                    name="piezasPorDisplay"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>
                                Peso por display
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe el peso por display del producto"
                                    name="pesoPorDisplay"
                                    required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>
                                Display por caja
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe el n&uacute;mero de display por caja"
                                    name="displayPorCaja"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>
                                Peso por caja
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe el peso por caja del producto"
                                    name="pesoPorCaja"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>
                                Ancho
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe el ancho del producto en cm"
                                    name="ancho"
                                    required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>
                                Profundidad
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe la profundidad del producto en cm"
                                    name="profundidad"
                                    required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>
                                Altura
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe la altura del producto en cm"
                                    name="altura"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>
                                C&oacute;digo de barras
                            </label>
                            <input type="text"
                                    class="form-control"
                                    placeholder="Escribe el c&oacute;digo de barras del producto"
                                    name="codigoDeBarras"
                                    required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>
                                C&oacute;digo de barras del Display
                            </label>
                            <input type="text"
                                    class="form-control"
                                    placeholder="Escribe el c&oacute;digo de barras del display"
                                    name="codigoDeBarrasDelDisplay"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>
                                C&oacute;digo de barras corrugado
                            </label>
                            <input type="number"
                                    class="form-control"
                                    placeholder="Escribe el peso por caja del producto"
                                    name="codigoDeBarrasCorrugado"
                                    required>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnGuardarNuevoProducto">
                    Aceptar
                </button>
                <button type="button"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cancelar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Fin de Modal para Producto Nuevo -->

<!-- Script de Modal para Producto Nuevo -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.nuevoProducto' ).click(function () {
            $( '#erroresValidacionNuevoProducto').text("");
            $( "#modalNuevoProducto" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });
        $( '#btnGuardarNuevoProducto' ).click(function () {
            $( '#formGuardarNuevoProducto'  ).hide();
            $( '#loading_modal_new_product' ).show();
            $.ajax({
                url    : "{{ route('productos.agregar') }}",
                method : "POST",
                data   : $( '#formGuardarNuevoProducto'  ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoProducto').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el producto.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionNuevoProducto", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevoProducto", "Error al agregar el producto." );
            }).always(function() {
                $( '#loading_modal_new_product' ).hide();
                $( '#formGuardarNuevoProducto'  ).show();
            });
        });
    });
</script>
<!-- Fin de Modal para Producto Nuevo -->