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
                            name="idE"
                            id="modalEditId"
                            value="0">
                    <input type="hidden"
                            name="idPed"
                            id="modalEditIdPed"
                            value="0">
                    <div class="form-group">
                        <label for="nombreE">
                            Nombre
                        </label>
                        <input type="text"
                                class="form-control"
                                id="nombreE"
                                disabled
                                placeholder="Escribe el nombre"
                                name="nombre"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="pE">
                            Prioridad
                        </label>
                        <input type="number"
                                class="form-control"
                                id="pE"
                                placeholder="Escribe p"
                                name="p"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="tiendasE">
                            Tiendas
                        </label>
                        <input type="number"
                                class="form-control"
                                id="tiendasE"
                                placeholder="Escribe las tiendas"
                                name="tiendas"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="skuE">
                            # Sku
                        </label>
                        <input type="number"
                                class="form-control"
                                id="skuE"
                                placeholder="Escribe el # sku"
                                name="sku"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="d2E">
                            Prioridad 2
                        </label>
                        <input type="number"
                                class="form-control"
                                id="d2E"
                                placeholder="Escribe D2"
                                name="d2"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="teE">
                            Tipo de empaque
                        </label>
                        <select class="form-control" id="teE" name="te">
                            <option value="0"> --- Selecciona un tipo de empaque --- </option>
                            @if (count($empaques) != 0)
                                @foreach ($empaques as $cat)
                                    <option value="{{ $cat->id }}">{{ $cat->label }}</option>
                                @endforeach
                            @endif
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="promedioE">
                            Promedio
                        </label>
                        <input type="number"
                                class="form-control"
                                id="promedioE"
                                placeholder="Escribe el Promedio"
                                name="promedio"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditEmail">
                            Cita
                        </label>
                        <select class="form-control"
                            id="citaE"
                            name="cita">
                            <option value="0">
                                Sin cita
                            </option>
                            <option value="1">
                                Con cita
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

        $( '.arreglarCliente' ).click(function () {
            
            var id = $(this).attr( "data-id" );
            var idPed = $(this).attr( "data-idPed" );
            update = 0;
            $( "#modalEditarCliente" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

            $( '#modalEditarUsuarioTitle' ).text( $(this).attr('data-name') );
            $( '#modalEditId'      ).val(id);
            $( '#modalEditIdPed'      ).val(idPed);
            $( '#nombreE'    ).val($(this).attr( "data-nombre" ));
            $( '#pE' ).val($(this).attr( "data-p" ));
            $( '#tiendasE' ).val($(this).attr( "data-tienda" ));
            $( '#skuE' ).val($(this).attr( "data-sku" ));
            $( '#d2E' ).val($(this).attr( "data-d2" ));
            if($(this).attr( "data-te" )) {
                $( '#teE' ).val($(this).attr( "data-te" ));
            }
            $( '#promedioE' ).val($(this).attr( "data-promedio" ));
            if($(this).attr( "data-appo" )) {
                $( '#citaE' ).val($(this).attr( "data-appo" ));
            }
            $( '#loading_modal_edit_user' ).hide();
            $( '#formGuardarEditar' ).show();
            
        });

        $( '#btnEditar' ).click(function () {

            $( '#loading_modal_edit_user' ).show();
            $( '#formGuardarEditar' ).hide();

            $.ajax({
                url    : "{{ route('pendiente.arreglaCli') }}",
                method : "POST",
                data: $( "#formGuardarEditar" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    update = 1;
                    mensajeExito("erroresValidacionEditar", "Se han guardado los cambios.");
                } else {
                    var errorMsg = "<p>Error al actualizar el cliente.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionEditar", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionEditar", "Error al editar el cliente." );
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