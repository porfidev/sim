<!-- Modal para Mensaje -->
<div class="modal fade"
    id="modalConfirmation"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalConfirmationTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-md"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalConfirmationTitle"></h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="messageModalConfirmation"></div>
                <div id="loading_modal_confirmation"
                    style="display: none;">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <p id="modalConfirmationMessage">&nbsp;</p>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnModalConfirmationOk">
                    Aceptar
                </button>
                <button type="button"
                    class="btn btn-secondary",
                    data-dismiss="modal">
                    Cancelar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Fin de Modal para mensaje -->

<form id="confirmationModalForm"
        method="POST"
        style="display: none;">
    {{ csrf_field() }}
</form>

<!-- Scripts comunes para Modales -->
<script type="text/javascript">
    function crearHidden(name, value, formId) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", name);
        input.setAttribute("value", value);
        //append to form element that you want
        $( "#" + formId ).append(input);
    }
    function abrirConfirmacion(titulo, mensaje, accion, parametros) {
        $( "#modalConfirmationTitle"   ).html(titulo);
        $( "#modalConfirmationMessage" ).html(mensaje);
        for(param in parametros) {
            crearHidden(param, parametros[param], "confirmationModalForm");
        }
        $( "#confirmationModalForm" ).attr("action", accion);
        $( "#modalConfirmation" ).modal({
            keyboard : false,
            backdrop : 'static'
        });
    }
    $( "#btnModalConfirmationOk" ).click(function () {
        $( '#modalConfirmationMessage'   ).hide();
        $( '#loading_modal_confirmation' ).show();
        $.ajax({
            url    : $( '#confirmationModalForm' ).attr( 'action' ),
            method : "POST",
            data   : $( "#confirmationModalForm" ).serialize()
        }).done(function( data ) {
            if(data.resultado === 'OK') {
                $('#modalConfirmation').modal('toggle');
                location.reload();

                if( $(".borra") ){

                    alert("si entro");

                    $(".btnCierra"+$(".borra").val()).hide();
                }

            } else {
                var errorMsg = "<p>Error al eliminar el elemento.<p><ul>";
                $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                errorMsg += "</ul>";
                erroresValidacion("messageModalConfirmation", errorMsg);
            }
        }).fail(function (jqXHR, textStatus) {
            errorDetalle = "";
            // If req debug show errorDetalle
            $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
            erroresValidacion( "messageModalConfirmation", "Error al eliminar el elemento." );
        }).always(function() {
            $( '#loading_modal_confirmation' ).hide();
            $( '#modalConfirmationMessage'   ).show();
        });
    });
</script>
<!-- Fin de Scripts comunes para Modales -->