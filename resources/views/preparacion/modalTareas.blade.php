<!-- Inicio de Modal para mostar tareas por asignar -->
<div class="modal fade"
    id="modalAsignarTareas"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalAsignarTareasTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <span id="modalAsignarTareasTitle">
                        Asignaci&oacute;n de Tareas
                    </span>
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="erroresModalAsignarTareas"></div>

                <div id="loading_modal_assign_work">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>

                <form id="formAsignarTarea">
                    {{ csrf_field() }}
                    <input type="hidden" name="orden" id="order_id"/>
                    <div class="form-group">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">
                                            Caja / Producto
                                        </th>
                                        <th style="text-align: center;">
                                            # <span id="title">Cajas</span>
                                        </th>
                                        <th>
                                            Trabajador
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="lista_tareas">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cerrar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Fin de Modal para mostar tareas por asignar -->

<!-- Script de Modal para mostar tareas por asignar -->
<script type="text/javascript">
    function resetDefautlValuesAT() {
        $( '#lista_taras tr' ).remove();
        $( '#erroresModalAsignarTareas' ).text('');
    }
    function obtenerTareasPorCaja(usuarios) {
        $.ajax({
            headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type     : 'POST',
            url      : "{{ route('preparacion.tareas.caja') }}",
            dataType : 'json',
            data     : {
                id    : $( '#order_id' ).val()
            }
        }).done(function (data){
            if(data.resultado === 'OK') {
                var row = "";
                $.each(data.datos, function(i,item){
                    row += "<tr><td style=\"text-align: center;\">";
                    row += ("Caja " + item.sequence);
                    row += "</td><td style=\"text-align: center;\">";
                    row += item.cajas;
                    row += "</td><td>";
                    row += "<select class=\"form-control selecionDeTrabajadorCaja\"";
                    row += ("data-order=\"" + item.order_id + "\"");
                    row += ("data-id=\"" + item.sequence + "\" >");
                    row += "<option value=\"0\"> -- Selecciona un trabajador -- </option>";
                    for (index = 0; index < usuarios.length; index++) {
                        row += ("<option value=\"" + usuarios[index].value + "\" ");
                        if(usuarios[index].online == null) {
                            row += "disabled=\"true\"";
                        }
                        if( usuarios[index].value == item.usuario){
                            row += "selected >";
                        } else {
                            row += ">";
                        }
                        row += usuarios[index].label;
                        row += " </option>";
                    }
                    row += "</select>";
                    row += "</td></tr>";
                });
                $( '#lista_tareas' ).html(row);
            } else {
                var errorMsg = "<p>Error al obtener las tareas del pedido.<p><ul>";
                $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                errorMsg += "</ul>";
                erroresValidacion("erroresModalAsignarTareas", errorMsg);
            }
        }).fail(function (jqXHR, textStatus) {
            errorDetalle = "";
            // If req debug show errorDetalle
            $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
            erroresValidacion( "erroresModalAsignarTareas", "Error al obtener las tareas del pedido." );
        });
    }
    function obtenerTareas(usuarios) {
        $.ajax({
            headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type     : 'POST',
            url      : "{{ route('preparacion.tareas') }}",
            dataType : 'json',
            data     : {
                id    : $( '#order_id' ).val()
            }
        }).done(function (data){
            if(data.resultado === 'OK') {
                var row = "";
                $.each(data.datos, function(i,item){
                    row += "<tr><td style=\"text-align: center;\">";
                    row += item.order_detail.itemcode;
                    row += "</td><td style=\"text-align: center;\">";
                    row += item.cajas;
                    row += "</td><td>";
                    row += "<select class=\"form-control selecionDeTrabajador\"";
                    row += ("data-id=\"" + item.order_detail_id + "\" >");
                    row += "<option value=\"0\"> -- Selecciona un trabajador -- </option>";
                    for (index = 0; index < usuarios.length; index++) {
                        row += ("<option value=\"" + usuarios[index].value + "\" ");
                        if(usuarios[index].online == null) {
                            row += "disabled=\"true\"";
                        }
                        if( usuarios[index].value == item.usuario){
                            row += "selected >";
                        } else {
                            row += ">";
                        }
                        row += usuarios[index].label;
                        row += " </option>";
                    }
                    row += "</select>";
                    row += "</td></tr>";
                });
                $( '#lista_tareas' ).html(row);
            } else {
                var errorMsg = "<p>Error al obtener las tareas del pedido.<p><ul>";
                $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                errorMsg += "</ul>";
                erroresValidacion("erroresModalAsignarTareas", errorMsg);
            }
        }).fail(function (jqXHR, textStatus) {
            errorDetalle = "";
            // If req debug show errorDetalle
            $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
            erroresValidacion( "erroresModalAsignarTareas", "Error al obtener las tareas del pedido." );
        });
    }
    $(document).ready(function () {

        $( '.mostrarTareasPorCaja' ).click(function () {
            resetDefautlValuesAT();
            $( '#formAsignarTarea' ).hide();
            $( '#order_id' ).val( $(this).attr('data-id') );
            $( '#title' ).text('Productos');
            $( "#modalAsignarTareas" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'GET',
                url      : "{{ URL::to('usuarios/obtenerNombresJefe') }}/" + $( '#order_id' ).val(),
                dataType : 'json'
            }).done(function (data) {
                obtenerTareasPorCaja(data);
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresModalAsignarTareas", "Error al obtener la lista de trabajadores." );
            }).always(function() {
                $( '#loading_modal_assign_work' ).hide();
                $( '#formAsignarTarea'          ).show();
            });
        });

        $( '.mostrarTareasPorDetalle' ).click(function () {
            resetDefautlValuesAT();
            $( '#formAsignarTarea' ).hide();
            $( '#order_id' ).val( $(this).attr('data-id') );
            $( '#title' ).text('Cajas');
            $( "#modalAsignarTareas" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'GET',
                url      : "{{ URL::to('usuarios/obtenerNombresJefe') }}/" + $( '#order_id' ).val(),
                dataType : 'json'
            }).done(function (data) {
                obtenerTareas(data);
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresModalAsignarTareas", "Error al obtener la lista de trabajadores." );
            }).always(function() {
                $( '#loading_modal_assign_work' ).hide();
                $( '#formAsignarTarea'          ).show();
            });
        });

        $(document.body).on('change', ".selecionDeTrabajador", function() {
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.asignacionDetalle') }}",
                dataType : 'json',
                data     : {
                    id      : $(this).attr('data-id'),
                    usuario : $(this).val()
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    mensajeExito("erroresModalAsignarTareas", "Se asigno tarea");
                } else {
                    var errorMsg = "<p>Error al asignar la tarea.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresModalAsignarTareas", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresModalAsignarTareas", "Error al obtener la lista de trabajadores." );
            }).always(function() {
                $( '#loading_modal_assign_work' ).hide();
                $( '#formAsignarTarea'          ).show();
            });
        });

        $(document.body).on('change', ".selecionDeTrabajadorCaja", function() {
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.asignacionCaja') }}",
                dataType : 'json',
                data     : {
                    caja    : $(this).attr('data-id'),
                    usuario : $(this).val(),
                    pedido  : $(this).attr('data-order')
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    mensajeExito("erroresModalAsignarTareas", "Se asigno tarea");
                } else {
                    var errorMsg = "<p>Error al asignar la tarea.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresModalAsignarTareas", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresModalAsignarTareas", "Error al obtener la lista de trabajadores." );
            }).always(function() {
                $( '#loading_modal_assign_work' ).hide();
                $( '#formAsignarTarea'          ).show();
            });
        });
    });
</script>
<!-- Fin de Modal para mostar tareas por asignar -->