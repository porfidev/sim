<!-- Modal para Usuario Nuevo -->
<div class="modal fade"
    id="modalNuevoUsuario"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Nuevo Usuario
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
                <form id="formGuardarNuevo">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="modalNewName">
                            Nombre
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewName"
                                placeholder="Escribe tu nombre completo"
                                name="nombre"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewEmail">
                            Correo electr&oacute;nico
                        </label>
                        <input type="email"
                                class="form-control"
                                id="modalNewEmail"
                                placeholder="Escribe tu correo electr&oacute;nico"
                                name="email"
                                required>
                        <small id="emailHelp"
                                class="form-text text-muted">
                            EL correo electr&oacute;nico debe ser &uacute;nico.
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="modalNewPassword">
                            Contrase&ntilde;a
                        </label>
                        <input type="password"
                                class="form-control"
                                id="modalNewPassword"
                                placeholder="Escribe tu contrase&ntilde;a"
                                name="password"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="password-confirm">
                            Confirmaci&oacute;n
                        </label>
                        <input id="password-confirm"
                            type="password"
                            class="form-control"
                            name="password_confirmation"
                            required>
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
<!-- Fin de Modal para Usuario Nuevo -->

<!-- Script de Modal para Usuario Nuevo -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.nuevoUsuario' ).click(function () {
            $( "#modalNuevoUsuario" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnGuardarNuevo' ).click(function () {
            $.ajax({
                url    : "{{ route('usuarios.agregar') }}",
                method : "POST",
                data: $( "#formGuardarNuevo" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoUsuario').modal('toggle');
                    location.reload();
                } else {
                    erroresValidacion("erroresValidacionNuevo", "Error al agregar el usuario." );
                    $.each(data.mensajes, function(i,val) { erroresValidacion("erroresValidacionNuevo", val) } );
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevo", "Error al dar de alta el usuario." );
            });
        });
    });
</script>
<!-- Fin de Modal para Usuario Nuevo -->