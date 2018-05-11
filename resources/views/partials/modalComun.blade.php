<!-- Scripts comunes para Modales -->
<script type="text/javascript">

    function buscaEnArreglo(array, property, value) {
        let find = -1;
        for (let index = 0; index < array.length; index++) {
            const element = array[index];
            if(array[index][property] == value) {
                find = index;
                break;
            }
        }
        return find;
    }

    function llenaCombo(comboId, datos, seleccionado){
        $('#' + comboId).html('');

        $('#' + comboId )
        .append($("<option></option>")
        .attr("value",'NA')
        .text("Selecciona una opción"));

        $.each(datos, function(key, value) {
            if (seleccionado == value["id"]) {
                $('#' + comboId )
                .append($("<option></option>")
                .attr("value",value["id"])
                .attr("selected","selected")
                .text(value["nombre"]));
            } else {
                $('#' + comboId )
                .append($("<option></option>")
                .attr("value",value["id"])
                .text(value["nombre"]));
            }
        });
    }

    function mensajeExito(erroresValidacion, mensaje) {
        $( "#" + erroresValidacion ).append("<div class='alert alert-success alert-dismissible fade show' role='alert'>" + mensaje +
            "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
    }

    function erroresValidacion(erroresValidacion, errores){
        $( "#" + erroresValidacion ).append("<div class='alert alert-danger alert-dismissible fade show' role='alert'>" + errores +
            "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
    }

    function jumboError(elFormulario, jumboError, errorTitulo, errorMensaje, mensajeTitulo, mensajeError){
        $( "#" + errorTitulo ).html(mensajeTitulo);
        $( "#" + errorMensaje ).html(mensajeError);

        $( "#" + elFormulario ).removeClass('noOculto');
        $( "#" + elFormulario ).addClass('oculto');

        $( "#" + jumboError ).removeClass('oculto');
        $( "#" + jumboError ).addClass('noOculto');
    }

</script>
<!-- Fin de Scripts comunes para Modales -->