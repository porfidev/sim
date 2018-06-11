<!-- Modal para Usuario Editar -->
<div class="modal fade"
    id="modalAsignarJefe"
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

                <form id="formGuardarAsignar">

                <div class="form-group">
                        <label>Usuario</label>
                        <input type="text"
                            id="usuarioSub"
                            name="usr"
                            readonly="true" 
                            class="form-control"
                            value="">
                        <input type="hidden" name="usrId" id="idUsr"/>
                </div>

                
                
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label>Jefe</label>
                        <input type="text"
                            id="usuarioAutocomplete"
                            name="jefe"
                            class="form-control"
                            placeholder="Escribe el nombre del jefe"
                            value="">
                        <input type="hidden" name="jefeId" id="idJefe"/>
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


        $( '.asignarJefe' ).click(function () {
            $( '#loading_modal_edit_userEsp' ).hide();
            idUsr = $(this).attr( "data-id" );
            idJefe = $(this).attr( "data-idJ" );
            $( "#idUsr" ).val(idUsr);
            $( "#idJefe" ).val(idJefe);
            $( "#usuarioSub" ).val($(this).attr( "data-nombre" ));
            $( "#usuarioAutocomplete" ).val($(this).attr( "data-nombreJ" ));
            
            update = 0;
            $( "#modalAsignarJefe" ).modal({
                keyboard : false,
                backdrop : 'static'
            });

        });

        console.log("Listita: "+"{{ URL::to('usuarios/obtenerNombre') }}");   

        
        $( "#usuarioAutocomplete" ).autocomplete({
            minLength: 2,
            source: "{{ URL::to('usuarios/obtenerNombre') }}",
            focus: function( event, ui ) {
                console.log(ui);
                $( "#usuarioAutocomplete" ).val(
                    ui.item.label
                );
                return false;
            },
            select: function( event, ui ) {
                //alert("idSecreto: "+ui.item.value);
                $( "#idJefe" ).val(ui.item.value);
                idJefe = ui.item.value;
                return false;
            }
        });

        $( '#btnAsignar' ).click(function () {
            $( '#loading_modal_edit_userEsp' ).show();
            $( '#formGuardarAsignar' ).hide();
            if( idJefe == null ) {
                erroresValidacion("erroresValidacionAsignar", "No se ha seleccionado ningun jefe");
                $( '#loading_modal_edit_userEsp' ).hide();
                $( '#formGuardarAsignar'       ).show();
                return;
            }
            $.ajax({
                url    : "{{ route('usuarios.asignarJ') }}",
                method : "POST",
                data: $( "#formGuardarAsignar" ).serialize()
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
                erroresValidacion( "erroresValidacionAsignar", "Error al editar el usuario." );
            }).always(function() {

                $( '#loading_modal_edit_userEsp' ).hide();
                $( '#formGuardarAsignar'       ).show();

            });

            $('#modalAsignarJefe').on('hide.bs.modal', function (e) {
            if(update === 1) {
                location.reload();
            }
        });
        });
       
    });
</script>
<!-- Fin de Modal para Usuario Editar -->