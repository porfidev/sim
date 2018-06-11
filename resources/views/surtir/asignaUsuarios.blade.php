
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
                    <span id="modalEditarUsuarioTitle">Asignacion de jefe</span>
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="erroresValidacionAsignar"></div>

                <div id="loading_modal_edit_userEsp">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>

                <form id="formGuardarAsignarPed">

                
                
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label>Jefe</label>
                        <input type="text"
                            id="usuarioAutocompleteEsp"
                            name="jefe"
                            class="form-control"
                            placeholder="Escribe el nombre del jefe"
                            value="">
                        <input type="hidden" name="userId" id="idUsr"/>
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
    var idUsr = 0;
    var idJefe;
    $(document).ready(function () {     


        $( '.asignarPersonal' ).click(function () {
            $( '#loading_modal_edit_userEsp' ).hide();
            
            update = 0;
            $( "#modalAsignarUsuarios" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

        });

        console.log("Listita: "+"{{ URL::to('usuarios/obtenerNombresJefe') }}");   

        
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
            if( idJefe == null ) {
                erroresValidacion("erroresValidacionAsignar", "No se ha seleccionado ningun usuario");
                $( '#loading_modal_edit_userEsp' ).hide();
                $( '#formGuardarAsignarPed' ).show();
                return;
            }
            $.ajax({
                url    : "{{ route('usuarios.asignarJ') }}",
                method : "POST",
                data: $( "#formGuardarAsignarPed" ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    update = 1;
                    mensajeExito("erroresValidacionAsignar", "Se han guardado los cambios.");
                } else {
                    var errorMsg = "<p>Error al actualizar el usuario.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionAsignar", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionAsignar", "Error al asignar el usuario." );
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