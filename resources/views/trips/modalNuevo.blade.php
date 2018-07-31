<!-- Modal para Usuario Nuevo -->
<div class="modal fade"
    id="modalNuevoViaje"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevoUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Nuevo Viaje
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

                    <div class="radio">
                        <label>
                            <input data-val="1" class="radioBTN" type="radio" name="optradio" checked>Transporte Interno
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input data-val="2" class="radioBTN" type="radio" name="optradio">Transporte Foraneo
                        </label>
                    </div>
                    <div id="camD" class="form-group">
                        <label for="selGrupo">
                            Cami&oacute;n

                        </label>
                        <select class="form-control" id="camion" name="camion">
                            <option placeholder value="0">Selecciona un cami&oacute;n</option>
                            @if (count($trucks) != 0)
                                @foreach ($trucks as $truck)
                                    <option value="{{ $truck->id }}">
                                        {{ $truck->brand }} {{ $truck->subBrand }} {{ $truck->model }}
                                    </option>
                                @endforeach
                            @endif
                        </select>
                    </div>
                    <div id="linT" class="form-group" style="display:none;">
                        <label for="selGrupoF">
                            Linea transportista
                        </label>
                        <select class="form-control" id="linea" name="linea">
                            <option placeholder value="0">Selecciona una linea transportista</option>
                            @if (count($foreign) != 0)
                                @foreach ($foreign as $fore)
                                    <option value="{{ $fore->id }}">
                                        {{ $fore->label }}
                                    </option>
                                @endforeach
                            @endif
                        </select>
                    </div>
                    <div id="guiaD" class="form-group" style="display:none;">
                        N&uacute;mero de guia:
                        <input type="text" name="guia" id="guia">
                    </div>
                    <div class="form-group">
                        Fecha de entrega:
                        <input type="date" name="fechaE" id="fechaA" style="display:none;">
                    </div>
                    <input type="hidden" value="1" name="boolF" id="hideF">
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

    function crearHiddenT(value, formId) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "idPeds[]");
        input.setAttribute("value", value);
        //append to form element that you want
        $( "#" + formId ).append(input);
    }

    function crearHiddenEsp(value,name, formId) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", name);
        input.setAttribute("value", value);
        //append to form element that you want
        $( "#" + formId ).append(input);
    }

    $(document).ready(function () {

        $(".radioBTN").change(function() {

            //alert( "valor: "+$(this).attr( "data-val" ) );

            var valor = $(this).attr( "data-val" );

            if(valor == 2){

                $("#linT").show();
                $("#guiaD").show();
                $("#camD").hide();
                $("#hideF").val(2);

            }else{

                $("#linT").hide();
                $("#guiaD").hide();
                $("#camD").show();
                $("#hideF").val(1);
            }

        });

        var arrId = [];

        $( '.nuevoViaje' ).click(function () {

            $("#fechaA").hide();

            $(".checkEsp").each(function(){

                if($(this).is(':checked')){

                    arrId.push($(this).attr( "data-id" ));

                    crearHiddenT($(this).attr( "data-id" ), "formGuardarNuevo");

                    if($(this).attr( "data-citaB" ) != 1){

                        $("#fechaA").show();
                    }
                }                

            });

            if($("#fechaA").hasClass("show")){

                crearHiddenEsp(0,"boolC", "formGuardarNuevo");
                
            }else{

                crearHiddenEsp(1,"boolC", "formGuardarNuevo");
            }

            if(arrId.length == 0){

                alert("no seleccionaste pedidos para un viaje");
                return;
            }

            $( "#modalNuevoViaje" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#btnGuardarNuevo' ).click(function () {
            $.ajax({
                url    : "{{ route('trips.agregar') }}",
                method : "POST",
                data: $( "#formGuardarNuevo" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalNuevoViaje').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el viaje.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionNuevo", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionNuevo", "Error al dar de alta el viaje." );
            });
        });
    });
</script>
<!-- Fin de Modal para Usuario Nuevo -->