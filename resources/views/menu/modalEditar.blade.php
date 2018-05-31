<!-- Modal para Editar un Menu Item -->
<div class="modal fade"
    id="modalEditarMenuItem"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalEditMenuItemTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <span id="modalEditMenuItemTitle">&nbsp;</span>
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="messageModalEditMenuItem"></div>
                <div id="loading_modal_edit_menu">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <form id="formUpdateMenuItem"
                    style="display: none;">
                    {{ csrf_field() }}
                    <input type="hidden" name="id" id="modalEditMenuId" value="0">
                    <div class="form-group">
                            <label for="modalEditMenuOrder">
                                Orden
                            </label>
                            <input type="number"
                                    class="form-control"
                                    id="modalEditMenuOrder"
                                    name="orden"
                                    value="0"
                                    required>
                        </div>
                    <div class="form-group">
                        <label for="modalEditMenuParent">
                            Padre
                        </label>
                        <select class="form-control"
                                id="modalEditMenuParent"
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
                        <label for="modalEditMenuLabel">
                            Etiqueta
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditMenuLabel"
                                placeholder="Escribe la etiqueta del elemento del menu"
                                name="etiqueta"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditMenuUrl">
                            Url
                        </label>
                        <input type="url"
                                class="form-control"
                                id="modalEditMenuUrl"
                                placeholder="Escribe la url a donde se dirigira"
                                name="url">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnEditMenuItem">
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
<!-- Fin de Modal para Editar un Menu Item -->

<!-- Script de Modal para Editar un Menu Item -->
<script type="text/javascript">
    var updateEditMenuItem = 0;
    $(document).ready(function () {
        $( '.editarElementoMenu' ).click(function () {
            var id = $(this).attr( "data-id" );
            updateEditMenuItem = 0;
            $("#messageModalEditMenuItem").text("");
            $( "#modalEditarMenuItem" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
            $.ajax({
                headers: {
                      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url    : "{{ route('menu.consultar') }}",
                method : "POST",
                data   : {
                    id : id
                }
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $( '#modalEditMenuItemTitle' ).text("Elemento " + data.datos.id);
                    $( '#modalEditMenuId'        ).val(data.datos.id);
                    $( '#modalEditMenuOrder'     ).val(data.datos.sequence);
                    if(data.datos.parent) {
                        $( '#modalEditMenuParent' ).val(data.datos.parent);
                    }
                    $( '#modalEditMenuLabel' ).val(data.datos.label);
                    if(data.datos.url) {
                        $( '#modalEditMenuUrl' ).val(data.datos.url);
                    }
                } else {
                    var errorMsg = "<p>Error al obtener datos del usuario.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("messageModalEditMenuItem", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "messageModalEditMenuItem", "Error al editar el usuario." );
            }).always(function() {
                $( '#loading_modal_edit_menu' ).hide();
                $( '#formUpdateMenuItem'     ).show();
            });
        });

        $( '#btnEditMenuItem' ).click(function () {
            $( '#formUpdateMenuItem' ).hide();
            $( '#loading_modal_new_menu' ).show();
            if( $( '#modalEditMenuParent' ).val() == '0' ) {
                $( '#modalEditMenuParent' ).prop( 'disabled', true );
            }
            if( $( '#modalEditMenuUrl' ).val().length === 0 ) {
                $( '#modalEditMenuUrl' ).prop( 'disabled', true );
            }
            $.ajax({
                url    : "{{ route('menu.editar') }}",
                method : "POST",
                data: $( "#formUpdateMenuItem" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    updateEditMenuItem = 1;
                    mensajeExito("messageModalEditMenuItem", "Se han guardado los cambios.");
                } else {
                    var errorMsg = "<p>Error al agregar el elemento al menu.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("messageModalEditMenuItem", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "messageModalEditMenuItem", "Error al dar de alta el nuevo elemento del menu." );
            }).always(function() {
                $( '#modalEditMenuParent' ).prop( 'disabled', false );
                $( '#modalEditMenuUrl'    ).prop( 'disabled', false );

                $( '#loading_modal_edit_menu' ).hide();
                $( '#formUpdateMenuItem'     ).show();
            });
        });

        $('#modalEditarMenuItem').on('hide.bs.modal', function (e) {
            if(updateEditMenuItem === 1) {
                location.reload();
            }
        });
    });
</script>
<!-- Fin de Modal para Editar un Menu Item -->