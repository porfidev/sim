<!-- Modal para Usuario Editar -->
<div class="modal fade"
    id="modalEditarUsuario"
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
                        <label for="modalEditName">
                            Nombre
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditName"
                                placeholder="Escribe tu nombre completo"
                                name="nombre"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditEmail">
                            Correo electr&oacute;nico
                        </label>
                        <input type="email"
                                class="form-control"
                                id="modalEditEmail"
                                placeholder="Escribe tu correo electr&oacute;nico"
                                name="email"
                                required>
                        <small id="emailHelp"
                                class="form-text text-muted">
                            EL correo electr&oacute;nico debe ser &uacute;nico.
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="modalEditRol">
                            Rol
                        </label>
                        <select class="form-control"
                                id="modalEditRol"
                                name="rol">
                    @foreach ($roles as $rol)
                            <option value="{{ $rol->id }}">
                                {{ $rol->description }}
                            </option>
                    @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="modalEditEmail">
                            Estatus
                        </label>
                        <select class="form-control"
                            id="modalEditEstatus"
                            name="status">
                            <option value="1">
                                Activo
                            </option>
                            <option value="0">
                                Inactivo
                            </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="modalEditPassword">
                            Contrase&ntilde;a
                        </label>
                        <input type="password"
                                class="form-control"
                                id="modalEditPassword"
                                placeholder="Escribe la nueva contrase&ntilde;a"
                                name="password"
                                required>
                        <small id="emailHelp"
                                class="form-text text-muted">
                            Llena este campo solo en caso de que desees cambiar la contrase&ntilde;a
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="password-confirm-edit">
                            Confirmaci&oacute;n
                        </label>
                        <input id="password-confirm-edit"
                            type="password"
                            class="form-control"
                            placeholder="Escribe la confirmaci&oacute;n de tu contrase&ntilde;a"
                            name="password_confirmation"
                            required>
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
        $( '.editarUsuario' ).click(function () {
            var id = $(this).attr( "data-id" );
            update = 0;
            $( "#modalEditarUsuario" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
            $.ajax({
                headers: {
                      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url    : "{{ route('usuarios.consultar') }}",
                method : "POST",
                data   : {
                    id : id
                }
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $( '#modalEditarUsuarioTitle' ).text("Usuario " + data.datos.id);
                    $( '#modalEditId'      ).val(data.datos.id);
                    $( '#modalEditName'    ).val(data.datos.name);
                    $( '#modalEditEmail'   ).val(data.datos.email);
                    $( '#modalEditRol'     ).val(data.datos.rol_id);
                    $( '#modalEditEstatus' ).val(data.datos.status);
                    $( '#loading_modal_edit_user' ).hide();
                    $( '#formGuardarEditar' ).show();
                } else {
                    var errorMsg = "<p>Error al obtener datos del usuario.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditar", errorMsg);
                    $( '#loading_modal_edit_user' ).hide();
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditar", "Error al editar el usuario." );
            });
        });

        $( '#btnEditar' ).click(function () {
            $( '#loading_modal_edit_user' ).show();
            $( '#formGuardarEditar' ).hide();
            if( $( '#modalEditPassword' ).val().length === 0 ) {
                $( '#modalEditPassword' ).prop( 'disabled', true );
                $( '#password-confirm-edit' ).prop( 'disabled', true );
            }
            $.ajax({
                url    : "{{ route('usuarios.editar') }}",
                method : "POST",
                data: $( "#formGuardarEditar" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    update = 1;
                    mensajeExito("erroresValidacionEditar", "Se han guardado los cambios.");
                } else {
                    var errorMsg = "<p>Error al actualizar el usuario.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditar", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditar", "Error al editar el usuario." );
            }).always(function() {
                $( '#modalEditPassword' ).prop( 'disabled', false );
                $( '#password-confirm-edit' ).prop( 'disabled', false );
                $( '#loading_modal_edit_user' ).hide();
                $( '#formGuardarEditar' ).show();
            });
        });

        $('#modalEditarUsuario').on('hide.bs.modal', function (e) {
            if(update === 1) {
                location.reload();
            }
        });
    });
</script>
<!-- Fin de Modal para Usuario Editar -->