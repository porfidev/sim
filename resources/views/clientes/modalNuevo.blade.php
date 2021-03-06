<!-- Modal para Usuario Nuevo -->
<div class="modal fade"
    id="modalNuevoCliente"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Nuevo Cliente
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
                        <label for="modalNewNombre">
                            Nombre
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewNombre"
                                placeholder="Escribe el nombre"
                                name="nombre"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewCorreo">
                            Correo
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewCorreo"
                                placeholder="Escribe el correo"
                                name="email"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewTelefono">
                            Telefono
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewTelefono"
                                placeholder="Escribe el telefono"
                                name="telefono"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewRFC">
                            RFC
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewRFC"
                                placeholder="Escribe el RFC"
                                name="rfc"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewCP">
                            CP
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewCP"
                                placeholder="Escribe el CP"
                                name="cp"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewCiudad">
                            Ciudad
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewCiudad"
                                placeholder="Escribe la Ciudad"
                                name="ciudad"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalNewDireccion">
                            Direcci&oacute;n
                        </label>
                        <input type="text"
                                class="form-control"
                                id="modalNewDireccion"
                                placeholder="Escribe la Direccion"
                                name="direccion"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="code">
                            C&oacute;digo
                        </label>
                        <input type="text"
                                class="form-control"
                                id="code"
                                placeholder="Escribe el codigo"
                                name="code"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="p">
                            Prioridad
                        </label>
                        <input type="number"
                                class="form-control"
                                id="p"
                                placeholder="Escribe p"
                                name="p"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="tiendas">
                            Tiendas
                        </label>
                        <input type="number"
                                class="form-control"
                                id="tiendas"
                                placeholder="Escribe las tiendas"
                                name="tiendas"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="sku">
                            # Sku
                        </label>
                        <input type="number"
                                class="form-control"
                                id="sku"
                                placeholder="Escribe el # sku"
                                name="sku"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="d2">
                            Prioridad 2
                        </label>
                        <input type="number"
                                class="form-control"
                                id="d2"
                                placeholder="Escribe D2"
                                name="d2"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="te">
                            Tipo de empaque
                        </label>
                        <select class="form-control" id="te" name="te">
                            <option value="0"> --- Selecciona un tipo de empaque --- </option>
                            @if (count($empaques) != 0)
                                @foreach ($empaques as $cat)
                                    <option value="{{ $cat->id }}">{{ $cat->label }}</option>
                                @endforeach
                            @endif
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="promedio">
                            Promedio
                        </label>
                        <input type="number"
                                class="form-control"
                                id="promedio"
                                placeholder="Escribe el Promedio"
                                name="promedio"
                                required>
                    </div>
                    <div class="form-group">
                        <label for="modalEditEmail">
                            Cita
                        </label>
                        <select class="form-control"
                            id="cita"
                            name="cita">
                            <option value="1">
                                Con cita
                            </option>
                            <option value="0">
                                Sin cita
                            </option>
                        </select>
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
        $( '.nuevoCliente' ).click(function () {
            $( "#modalNuevoCliente" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnGuardarNuevo' ).click(function () {
            $.ajax({
                url    : "{{ route('clientes.agregar') }}",
                method : "POST",
                data: $( "#formGuardarNuevo" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoCliente').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el cliente.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionNuevo", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevo", "Error al dar de alta el cliente." );
            });
        });
    });
</script>
<!-- Fin de Modal para Usuario Nuevo -->