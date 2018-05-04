<!-- Modal para Mensaje -->
<div class="modal fade"
    id="divMensajeModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="MensajeModalTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-md"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="showTitulo"></h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <div id ="showErrores"></div>
            <div id="showMensaje"></div>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    data-dismiss="modal"
                    id="btnGuardarBorrar">
                    Aceptar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Fin de Modal para mensaje -->



<!-- Scripts comunes para Modales -->
<script type="text/javascript">
    function showErrores(error){
        $( "#showErrores" ).append("<div class='alert alert-danger' role='alert'>" + error + "</div>"); 
    }



    function showMensaje(showTitulo, showMensaje){
        $( "#showTitulo").html(showTitulo);
        $( "#showMensaje").html(showMensaje);
        $('#divMensajeModal').modal('toggle');
    }

</script>
<!-- Fin de Scripts comunes para Modales -->