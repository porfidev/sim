<!-- Modal para Producto Nuevo -->
<div class="modal fade"
    id="modalEditarProducto"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalEditarProductoTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalEditarProductoTitle">&nbsp;</h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="erroresValidacionEditarProducto"></div>
                <div id="loading_modal_edit_product">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <form id="formEditarProducto">
                    {{ csrf_field() }}
                    <input type="hidden" name="id" id="modalEditId" value="0">
                    <div class="form-group">
                        <label for="modalEditProductSku">
                            SKU
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditProductSku"
                                placeholder="Escribe la Clave del producto"
                                name="sku"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditProductConcept">
                            Concepto
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditProductConcept"
                                placeholder="Escribe la descripci&oacute;n o nombre del producto"
                                name="concepto"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditProductAlias">
                            Alias
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditProductAlias"
                                placeholder="Escribe la descripci&oacute;n o nombre del producto"
                                name="alias"
                                required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="modalEditProductPpP">
                                Peso por pieza
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductPpP"
                                    placeholder="Escribe el peso por pieza del producto"
                                    name="pesoPorPieza"
                                    required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="modalEditProductPpD">
                                Piezas por display
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductPpD"
                                    placeholder="Escribe el n&uacute;mero de piezas por display"
                                    name="piezasPorDisplay"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="modalEditProductPepD">
                                Peso por display
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductPepD"
                                    placeholder="Escribe el peso por display del producto"
                                    name="pesoPorDisplay"
                                    required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="modalEditProductDpC">
                                Display por caja
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductDpC"
                                    placeholder="Escribe el n&uacute;mero de display por caja"
                                    name="displayPorCaja"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="modalEditProductPpC">
                                Peso por caja
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductPpC"
                                    placeholder="Escribe el peso por caja del producto"
                                    name="pesoPorCaja"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="modalEditProductWidth">
                                Ancho
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductWidth"
                                    placeholder="Escribe el ancho del producto en cm"
                                    name="ancho"
                                    required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="modalEditProductDepth">
                                Profundidad
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductDepth"
                                    placeholder="Escribe la profundidad del producto en cm"
                                    name="profundidad"
                                    required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="modalEditProductHeight">
                                Altura
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductHeight"
                                    placeholder="Escribe la altura del producto en cm"
                                    name="altura"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="modalEditProductCB">
                                C&oacute;digo de barras
                            </label>
                            <input type="text"
                                    class="form-control"
                                    id="modalEditProductCB"
                                    placeholder="Escribe el c&oacute;digo de barras del producto"
                                    name="codigoDeBarras"
                                    required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="modalEditProductCBD">
                                C&oacute;digo de barras del Display
                            </label>
                            <input type="text"
                                    class="form-control"
                                    id="modalEditProductCBD"
                                    placeholder="Escribe el c&oacute;digo de barras del display"
                                    name="codigoDeBarrasDelDisplay"
                                    required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="modalEditProductCBC">
                                C&oacute;digo de barras corrugado
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditProductCBC"
                                    placeholder="Escribe el peso por caja del producto"
                                    name="codigoDeBarrasCorrugado"
                                    required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="modalEditCaducidadMinima">
                                Editar caducidad m&iacute;nima
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditCaducidadMinima"
                                    placeholder="Escribe el peso por caja del producto"
                                    name="editCaducidadMinima"
                                    required>
                        </div>

                    </div>
                    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnEditarProducto">
                    Aceptar
                </button>
                <button type="button"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cerrar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Fin de Modal para Producto Nuevo -->

<!-- Script de Modal para Producto Nuevo -->
<script type="text/javascript">
    var updateEditProduct = 0;
    $(document).ready(function () {
        $( '.editProduct' ).click(function () {
            updateEditProduct = 0;
            var id = $(this).attr("data-id");
            $("#erroresValidacionEditarProducto").text("");
            $( "#modalEditarProducto" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
            $.ajax({
                headers: {
                      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url    : "{{ route('productos.consultar') }}",
                method : "POST",
                data   : {
                    id : id
                }
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $( '#modalEditarProductoTitle' ).text("Producto " + data.datos.id);
                    $( '#modalEditId'              ).val(data.datos.id);
                    $( '#modalEditProductSku'      ).val(data.datos.sku);
                    $( '#modalEditProductConcept'  ).val(data.datos.concept);
                    $( '#modalEditProductAlias'    ).val(data.datos.alias);
                    $( '#modalEditProductPpP'      ).val(data.datos.weight_per_piece);
                    $( '#modalEditProductPpD'      ).val(data.datos.items_per_display);
                    $( '#modalEditProductPepD'     ).val(data.datos.weight_per_display);
                    $( '#modalEditProductDpC'      ).val(data.datos.display_per_box);
                    $( '#modalEditProductPpC'      ).val(data.datos.weight_per_box);
                    $( '#modalEditProductWidth'    ).val(data.datos.width);
                    $( '#modalEditProductDepth'    ).val(data.datos.depth);
                    $( '#modalEditProductHeight'   ).val(data.datos.height);
                    $( '#modalEditProductCB'       ).val(data.datos.barcode);
                    $( '#modalEditProductCBD'      ).val(data.datos.display_barcode);
                    $( '#modalEditProductCBC'      ).val(data.datos.corrugated_barcode);
                    $( '#modalEditCaducidadMinima' ).val(data.datos.caducidad_minima);
                } else {
                    var errorMsg = "<p>Error al obtener datos de productos.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditarProducto", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditarProducto", "Error al consultar datos del producto." );
            }).always(function() {
                $( '#loading_modal_edit_product' ).hide();
                $( '#formEditarProducto'         ).show();
            });
        });

        $( '#btnEditarProducto' ).click(function () {
            $( '#formEditarProducto'  ).hide();
            $( '#loading_modal_edit_product' ).show();
            $.ajax({
                url    : "{{ route('productos.editar') }}",
                method : "POST",
                data   : $( '#formEditarProducto'  ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    updateEditProduct = 1;
                    mensajeExito("erroresValidacionEditarProducto", "Se han guardado los cambios.");
                } else {
                    var errorMsg = "<p>Error al editar el producto.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditarProducto", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditarProducto", "Error al editar el producto." );
            }).always(function() {
                $( '#loading_modal_edit_product' ).hide();
                $( '#formEditarProducto'  ).show();
            });
        });

        $('#modalEditarProducto').on('hide.bs.modal', function (e) {
            if(updateEditProduct === 1) {
                location.reload();
            }
        });
    });
</script>
<!-- Fin de Modal para Producto Nuevo -->