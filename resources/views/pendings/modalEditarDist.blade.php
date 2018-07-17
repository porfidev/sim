<!-- Modal para Catalogo Editar -->
<div class="modal fade"
    id="modalEditarCatalogo"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalEditarUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <span id="modalEditarUsuarioTitle">&nbsp;</span>
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="erroresValidacionEditarDist"></div>
                <div id="loading_modal_edit_dist">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <form id="formGuardarEditarDist" style="display: none;">
                    {{ csrf_field() }}
                    <input type="hidden"
                            name="id"
                            id="modalEditIdDist"
                            value="0">
                    <div class="form-group">
                        <label for="modalEditEtiqueta">
                            Etiqueta
                        </label>
                        <input type="text"
                                class="form-control"
                                disabled
                                id="modalEditEtiqueta"
                                placeholder="Escribe la etiqueteta"
                                name="etiqueta"
                                required>
                    </div>
                   <div class="form-group">
                        <label for="modalEditValor">
                            Valor
                        </label>
                        <input type="number"
                                class="form-control"
                                id="modalEditValor"
                                placeholder="Escribe el Valor"
                                name="valor"
                                required>
                        
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnEditarDist">
                    Guardar
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
<!-- Fin de Modal para Usuario Editar -->

<!-- Script de Modal para Usuario Editar -->
<script type="text/javascript">
    var update = 0;

    $(document).ready(function () {
        $( '.arreglarCatalogo' ).click(function () {
            var id = $(this).attr( "data-id" );
            update = 0;
            $( "#modalEditarCatalogo" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

            //console.log("opcion seleccionada: "+$(this).attr( "data-grupo" ));
            
            $( '#modalEditIdDist'      ).val(id);
            $( '#modalEditEtiqueta'    ).val($(this).attr( "data-etiqueta" ));
            
            $( '#modalEditValor'     ).val($(this).attr( "data-valor" ));
            $( '#loading_modal_edit_dist' ).hide();
            $( '#formGuardarEditarDist' ).show();
            
        });

        $( '#btnEditarDist' ).click(function () {

            $( '#loading_modal_edit_dist' ).show();
            $( '#formGuardarEditarDist' ).hide();

            $.ajax({
                url    : "{{ route('pendiente.arreglaDist') }}",
                method : "POST",
                data: $( "#formGuardarEditarDist" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    update = 1;
                    mensajeExito("erroresValidacionEditarDist", "Se han guardado los cambios.");
                } else {
                    var errorMsg = "<p>Error al actualizar el catalogo.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditarDist", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditarDist", "Error al editar el catalogo." );
            }).always(function() {

                $( '#loading_modal_edit_dist' ).hide();
                $( '#formGuardarEditarDist'       ).show();

            });
        });

        $('#modalEditarCatalogo').on('hide.bs.modal', function (e) {
            if(update === 1) {
                location.reload();
            }
        });
    });
</script>
<!-- Fin de Modal para catalogo Editar -->