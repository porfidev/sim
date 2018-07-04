<!-- Inicio de Modal para Usuario Editar -->
<div class="modal fade"
    id="modalAsignarUsuarios"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalEditarUsuarioTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <span id="modalEditarUsuarioTitle">Asignaci&oacute;n de Tarea</span>
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="erroresValidacionAsignarEsp"></div>

                <div id="loading_modal_edit_userEsp">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>

                <form id="formGuardarAsignarPed">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">
                                            Asignado
                                        </th>
                                        <th>
                                            Nombre
                                        </th>
                                        <th style="text-align: center;">
                                            Conectado
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="espTrab">

                                </tbody>
                            </table>
                        </div>
                        <input type="hidden" name="userId" id="idUsr"/>
                        <input type="hidden" name="orderId" id="idOrd"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnAsignar">
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
    var idUsr;
    var idJefe;
    $(document).ready(function () {

        $( '.asignarPersonal' ).click(function () {

            $( '#loading_modal_edit_userEsp' ).hide();

            $( "#idOrd" ).val($(this).attr( "data-id" ));

            listita = "{{ URL::to('usuarios/obtenerNombresJefe') }}/"+$(this).attr( "data-id" );
            console.log(listita);

            ter = "";

            $.ajax({
               type     : 'GET',
               url      : "{{ URL::to('usuarios/obtenerNombresJefe') }}/"+$(this).attr( "data-id" ),
               dataType : 'json',
               success  : function(data) {
                    $.each(data, function(i,item){
                        //console.log(item.value);
                        contadorEsp = 0;
                        ter += "<tr><td style=\"text-align: center;\">";
                        ter += "<div class=\"form-check\">";
                        ter += ("<input type=\"checkbox\" class=\"form-check-input\" name=\"typedoc[]\" value=\""+item.value+"\"");
                        if(item.check ==1){
                            ter += ' checked';
                        }
                        if(item.online == null){
                            ter += ' disabled';
                        }
                        ter += " >";
                        ter += "</div>";
                        ter += "</td><td>"
                        ter += item.label;
                        ter += "</td><td style=\"text-align: center;\">"
                        if(item.online != null){
                            ter += "Si";
                        } else {
                            ter += "No";
                        }
                        ter += "</td></tr>"
                        contadorEsp++;
                    });
                    //console.log(ter);
                    $("#espTrab").html(ter);
               },
            });

            update = 0;
            $( "#modalAsignarUsuarios" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

        });

        //console.log("Listita: "+"{{ URL::to('usuarios/obtenerNombresJefe') }}");

        $( "#usuarioAutocompleteEsp" ).autocomplete({
            minLength: 2,
            source: "{{ URL::to('usuarios/obtenerNombresJefe') }}",
            focus: function( event, ui ) {
                console.log(ui);
                $( "#usuarioAutocompleteEsp" ).val(
                    ui.item.label
                );
                return false;
            },
            select: function( event, ui ) {
                //alert("idSecreto: "+ui.item.value);
                $( "#idUsr" ).val(ui.item.value);
                idUsr = ui.item.value;
                return false;
            }
        });

        $( '#btnAsignar' ).click(function () {
            $( '#loading_modal_edit_userEsp' ).show();
            $( '#formGuardarAsignarPed' ).hide();
            /*if( idUsr == null ) {
                erroresValidacion("erroresValidacionAsignarEsp", "No se ha seleccionado ningun usuario");
                $( '#loading_modal_edit_userEsp' ).hide();
                $( '#formGuardarAsignarPed' ).show();
                return;
            }*/
            $.ajax({
                url    : "{{ route('usuarios.asignarU') }}",
                method : "POST",
                data: $( "#formGuardarAsignarPed" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    update = 1;
                    mensajeExito("erroresValidacionAsignarEsp", "Se han guardado los cambios.");
                    idUsr = null;
                    $( "#usuarioAutocompleteEsp" ).val("");
                } else {
                    var errorMsg = "<p>Error al actualizar el usuario.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionAsignarEsp", errorMsg);

                    idUsr = null;
                    $( "#usuarioAutocompleteEsp" ).val("");
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionAsignarEsp", "Error al asignar el usuario." );

                idUsr = null;
                $( "#idUsr" ).val("");

            }).always(function() {

                $( '#loading_modal_edit_userEsp' ).hide();
                $( '#formGuardarAsignarPed'       ).show();

            });

            $('#modalAsignarUsuarios').on('hide.bs.modal', function (e) {
                if(update === 1) {
                    location.reload();
                }
            });
        });

    });
</script>
<!-- Fin de Modal para Usuario Editar -->