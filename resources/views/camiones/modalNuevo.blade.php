<!-- Modal para Usuario Nuevo -->
<div class="modal fade"
    id="modalNuevoCamion"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Nuevo Cami&oacute;n 
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
                        <label for="modalNewMarca">
                            Marca
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewMarca"
                                placeholder="Escribe la Marca"
                                name="marca"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewSmarca">
                            Sub Marca
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewSmarca"
                                placeholder="Escribe la Sub Marca"
                                name="smarca"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalNewModelo">
                            Modelo
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewModelo"
                                placeholder="Escribe el Modelo"
                                name="modelo"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalNewPlacas">
                            Placas
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewPlacas"
                                placeholder="Escribe el Placas"
                                name="placas"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="modalNewCapacidad">
                            Capacidad
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewCapacidad"
                                placeholder="Escribe el Capacidad"
                                name="capacidad"
                                required>
                    </div>

                    <div class="form-group">
                        <label for="selChof">
                            Chofer
                        </label>
                        <select class="form-control" id="selChof" name="chofer">
                            <option default value="">Selecciona el chofer</option>
                            @if (count($choferes) != 0)
                                @foreach ($choferes as $chof)
                                    <option value="{{ $chof->id }}">{{ $chof->name }}</option>
                                @endforeach
                            @endif
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="modalNewSerie">
                            Serie
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewSerie"
                                placeholder="Escribe el Serie"
                                name="serie"
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
        $( '.nuevoCamion' ).click(function () {
            $( "#modalNuevoCamion" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnGuardarNuevo' ).click(function () {
            $.ajax({
                url    : "{{ route('camiones.agregar') }}",
                method : "POST",
                data: $( "#formGuardarNuevo" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoCamion').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el camion.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionNuevo", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevo", "Error al dar de alta el camion." );
            });
        });
    });
</script>
<!-- Fin de Modal para Usuario Nuevo -->