<!-- Modal para Catalogo Editar -->
<div class="modal fade"
    id="modalEditarCliente"
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

                <div id="erroresValidacionEditar"></div>
                <div id="loading_modal_edit_user">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <form id="formGuardarEditar" style="display: none;">
                    {{ csrf_field() }}
                    <input type="hidden"
                            name="id"
                            id="modalEditId"
                            value="0">
                    <div class="form-group">
                        <label for="nombre">
                            Nombre
                        </label>
                        <input type="text"
                                class="form-control"
                                id="nombre"
                                placeholder="Escribe el nombre"
                                name="nombre"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="correo">
                            Correo
                        </label>
                        <input type="text"
                                class="form-control"
                                id="correo"
                                placeholder="Escribe el correo"
                                name="correo"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">
                            Telefono
                        </label>
                        <input type="text"
                                class="form-control"
                                id="telefono"
                                placeholder="Escribe el telefono"
                                name="telefono"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="rfc">
                            RFC
                        </label>
                        <input type="text"
                                class="form-control"
                                id="rfc"
                                placeholder="Escribe el RFC"
                                name="rfc"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="cp">
                            CP
                        </label>
                        <input type="text"
                                class="form-control"
                                id="cp"
                                placeholder="Escribe el CP"
                                name="cp"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="ciudad">
                            Ciudad
                        </label>
                        <input type="text"
                                class="form-control"
                                id="ciudad"
                                placeholder="Escribe la Ciudad"
                                name="ciudad"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="direccion">
                            Direcci&oacute;n
                        </label>
                        <input type="text"
                                class="form-control"
                                id="direccion"
                                placeholder="Escribe la Direccion"
                                name="direccion"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditEmail">
                            Estatus
                        </label>
                        <select class="form-control"
                            id="modalEditEstatus"
                            name="estatus">
                            <option value="1">
                                Activo
                            </option>
                            <option value="0">
                                Inactivo
                            </option>
                        </select>
                    </div> 
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnEditar">
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
        $( '.editarCliente' ).click(function () {
            var id = $(this).attr( "data-id" );
            update = 0;
            $( "#modalEditarCliente" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

            $( '#modalEditId'      ).val(id);
            $( '#nombre'    ).val($(this).attr( "data-nombre" ));
            $( '#correo'   ).val($(this).attr( "data-correo" ));
            $( '#telefono'     ).val($(this).attr( "data-telefono" ));
            $( '#rfc' ).val($(this).attr( "data-rfc" ));
            $( '#cp' ).val($(this).attr( "data-cp" ));
            $( '#ciudad' ).val($(this).attr( "data-ciudad" ));
            $( '#direccion' ).val($(this).attr( "data-direccion" ));
            $( '#estatus' ).val($(this).attr( "data-estatus" ));
            $( '#loading_modal_edit_user' ).hide();
            $( '#formGuardarEditar' ).show();
            
        });

        $( '#btnEditar' ).click(function () {

            $( '#loading_modal_edit_user' ).show();
            $( '#formGuardarEditar' ).hide();

            $.ajax({
                url    : "{{ route('clientes.editar') }}",
                method : "POST",
                data: $( "#formGuardarEditar" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    update = 1;
                    mensajeExito("erroresValidacionEditar", "Se han guardado los cambios.");
                } else {
                    var errorMsg = "<p>Error al actualizar el catalogo.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditar", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditar", "Error al editar el catalogo." );
            }).always(function() {

                $( '#loading_modal_edit_user' ).hide();
                $( '#formGuardarEditar'       ).show();

            });
        });

        $('#modalEditarCliente').on('hide.bs.modal', function (e) {
            if(update === 1) {
                location.reload();
            }
        });
    });
</script>
<!-- Fin de Modal para catalogo Editar -->