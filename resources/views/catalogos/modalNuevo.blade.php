<!-- Modal para Usuario Nuevo -->
<div class="modal fade"
    id="modalNuevoCatalogo"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Nuevo Catalogo 
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
                            Etiqueta
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewEtiqueta"
                                placeholder="Escribe la Etiqueta"
                                name="etiqueta"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="selGrupo">
                            Grupo
                        </label>
                        <select class="form-control" id="selGrupo" name="grupo">
                            <option value="0">Padre</option>
                            @if (count($padresCat) != 0)
                                @foreach ($padresCat as $cat)
                                    <option value="{{ $cat->id }}">{{ $cat->label }}</option>
                                @endforeach
                            @endif
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="modalNewValor">
                            Valor
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewValor"
                                placeholder="Escribe el valor"
                                name="valor"
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
        $( '.nuevoCatalogo' ).click(function () {
            $( "#modalNuevoCatalogo" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnGuardarNuevo' ).click(function () {
            $.ajax({
                url    : "{{ route('catalogos.agregar') }}",
                method : "POST",
                data: $( "#formGuardarNuevo" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoUsuario').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el catalogo.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionNuevo", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevo", "Error al dar de alta el catalogo." );
            });
        });
    });
</script>
<!-- Fin de Modal para Usuario Nuevo -->