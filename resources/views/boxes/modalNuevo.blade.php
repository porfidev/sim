<!-- Modal para Usuario Nuevo -->
<div class="modal fade"
    id="modalNuevaCaja"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Nueva caja 
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
                            Descripci&oacute;n
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewDescripcion"
                                name="descripcion"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewAnchura">
                            Anchura
                        </label>
                        <input type="number"
                                class="form-control"
                                id="modalNewAnchura"
                                name="anchura"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewAltura">
                            Altura
                        </label>
                        <input type="number"
                                class="form-control"
                                id="modalNewAltura"
                                name="altura"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewProfundidad">
                            Profundidad
                        </label>
                        <input type="number"
                                class="form-control"
                                id="modalNewProfundidad"
                                name="profundidad"
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
        $( '.nuevaCaja' ).click(function () {
            $( "#modalNuevaCaja" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnGuardarNuevo' ).click(function () {
            $.ajax({
                url    : "{{ route('cajas.agregar') }}",
                method : "POST",
                data: $( "#formGuardarNuevo" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevaCaja').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar la caja.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionNuevo", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevo", "Error al dar de alta la caja." );
            });
        });
    });
</script>
<!-- Fin de Modal para Usuario Nuevo -->