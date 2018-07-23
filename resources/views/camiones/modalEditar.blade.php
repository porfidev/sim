<!-- Modal para Usuario Nuevo -->
<div class="modal fade"
    id="modalEditarCamion"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Editar Cami&oacute;n 
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
                <form id="formGuardarEditar">
                    {{ csrf_field() }}
                    <input type="hidden" name="id" id="idSecEdit">
                    <div class="form-group">
                        <label for="modalEditMarca">
                            Marca
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditMarca"
                                placeholder="Escribe la Marca"
                                name="marca"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditSmarca">
                            Sub Marca
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditSmarca"
                                placeholder="Escribe la Sub Marca"
                                name="smarca"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalEditModelo">
                            Modelo
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditModelo"
                                placeholder="Escribe el Modelo"
                                name="modelo"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalEditPlacas">
                            Placas
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditPlacas"
                                placeholder="Escribe el Placas"
                                name="placas"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalEditCapacidad">
                            Capacidad
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditCapacidad"
                                placeholder="Escribe el Capacidad"
                                name="capacidad"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalEditOperador">
                            Operador
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditOperador"
                                placeholder="Escribe el Operador"
                                name="operador"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalEditSerie">
                            Serie
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalEditSerie"
                                placeholder="Escribe el Serie"
                                name="serie"
                                required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary"
                    id="btnSaveEditCamion">
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
        $( '.editarCamion' ).click(function () {

            $("#idSecEdit").val($(this).attr( "data-id" ));
            $("#modalEditMarca").val($(this).attr( "data-marca" ));
            $("#modalEditSmarca").val($(this).attr( "data-smarca" ));
            $("#modalEditModelo").val($(this).attr( "data-modelo" ));
            $("#modalEditPlacas").val($(this).attr( "data-placas" ));
            $("#modalEditCapacidad").val($(this).attr( "data-cap" ));
            $("#modalEditOperador").val($(this).attr( "data-ope" ));
            $("#modalEditSerie").val($(this).attr( "data-serie" ));

            $( "#modalEditarCamion" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnSaveEditCamion' ).click(function () {
            //alert("si entro");
            $.ajax({
                url    : "{{ route('camiones.editar') }}",
                method : "POST",
                data: $( "#formGuardarEditar" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoCamion').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el camion.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditar", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditar", "Error al dar de alta el camion." );
            });
        });
    });
</script>
<!-- Fin de Modal para Usuario Nuevo -->