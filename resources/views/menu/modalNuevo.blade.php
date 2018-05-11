<!-- Modal para Nuevo Menu Item -->
<div class="modal fade"
    id="modalNuevoMenuItem"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoMenuItemTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Agregar Elemento al Menu
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="erroresValidacionNuevo"></div>
                <div id="loading_modal_new_menu"
                        style="display: none;">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <form id="formGuardarNuevo">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="modalNewMenuItem">
                            Padre
                        </label>
                        <select class="form-control"
                                id="modalNewMenuItem"
                                name="padre">
                            <option value="0">
                                Ninguno
                            </option>
                    @foreach ($parents as $item)
                            <option value="{{ $item->id }}">
                                {{ $item->label }}
                            </option>
                    @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="modalNewLabel">
                            Etiqueta
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewLabel"
                                placeholder="Escribe la etiqueta del elemento del menu"
                                name="etiqueta"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewUrl">
                            Url
                        </label>
                        <input type="url"
                                class="form-control"
                                id="modalNewUrl"
                                placeholder="Escribe la url a donde se dirigira"
                                name="url">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnGuardarNuevo">
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
<!-- Fin de Modal para Nuevo Menu Item -->

<!-- Script de Modal para Nuevo Menu Item -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.nuevoElementoMenu' ).click(function () {
            $( "#modalNuevoMenuItem" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnGuardarNuevo' ).click(function () {
            $( '#formGuardarNuevo' ).hide();
            $( '#loading_modal_new_menu' ).show();
            if( $( '#modalNewMenuItem' ).val() == '0' ) {
                $( '#modalNewMenuItem' ).prop( 'disabled', true );
            }
            if( $( '#modalNewUrl' ).val().length === 0 ) {
                $( '#modalNewUrl' ).prop( 'disabled', true );
            }
            $.ajax({
                url    : "{{ route('menu.agregar') }}",
                method : "POST",
                data: $( "#formGuardarNuevo" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoMenuItem').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el elemento al menu.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionNuevo", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevo", "Error al dar de alta el nuevo elemento del menu." );
            }).always(function() {
                $( '#modalNewMenuItem' ).prop( 'disabled', false );
                $( '#modalNewUrl'      ).prop( 'disabled', false );

                $( '#loading_modal_new_menu' ).hide();
                $( '#formGuardarNuevo'      ).show();
            });
        });
    });
</script>
<!-- Fin de Modal para Nuevo Menu Item -->