@extends('layouts.sim')

@section('content')
@if(Session::has('errores'))
    <div class="alert alert-danger alert-dismissible fade show mt-3 mb-2"
        role="alert">
        <button type="button"
            class="close"
            data-dismiss="alert"
            aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
        </button>
        {{ Session::get('errores') }}
    </div>
@endif
    <div id="erroresValidacion" class="mt-3"></div>

    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <tbody>
                        <tr>
                            <td style="text-align: center;"
                                class="table-primary">
                                <h5>
                                    Consulta de informaci&oacute;n
                                </h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="text"
                                        class="form-control"
                                        id="searchBox">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary"
                                            type="button"
                                            id="searchBoxBtn">
                                            <i class="material-icons">search</i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <tbody id="searchResults">
                        <tr>
                            <td style="text-align: center;">
                                Sin informaci&oacute;n
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">
        function obtenerFila(item){
            var row = "<tr>";
            row += "<td width=\"80%\">";
            row += (item.order_detail.product.sku
                + " - " + item.order_detail.product.concept);
            row += "</td>";
            row += "<td width=\"20%\">";
            row += (item.quantity);
            row += "</td>";
            row += "</tr>";
            return row;
        }
        function buscaInformacion(caja) {
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.obtenerInformacion') }}",
                dataType : 'json',
                data     : {
                    caja : caja
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    $( "#searchResults tr" ).remove();
                    if(data.datos.length > 0){
                        item = data.datos[0];
                        var row = "<tr>";
                        row += "<td class=\"table-primary\" colspan=2 style=\"text-align: center;\">";
                        row += ("<div class=\"row\"><div class=\"col\">Pedido: #" + item.order.codeOrder + "</div>");
                        row += ("<div class=\"col\"><button class=\"btn btn-sm btn-success validaPedido\"");
                        row += ("data-toggle=\"tooltip\" data-placement=\"top\" data-id=\"" + item.order_id + "\"");
                        row += "title=\"Validar Pedido\"><i class=\"material-icons\">offline_pin</i></button></div>";
                        row += "</td>";
                        row += "</tr>";
                        $( "#searchResults" ).append(row);
                        for (var index = 0; index < data.datos.length; index++) {
                            $( "#searchResults" ).append(obtenerFila(data.datos[index]));
                        }
                    } else {
                        var row = "<tr>";
                        row += "<td style=\"text-align: center;\">";
                        row += "Sin informaci&oacute;n";
                        row += "</td>";
                        row += "</tr>";
                    }
                    $( '[data-toggle="tooltip"]' ).tooltip();
                } else {
                    var errorMsg = "Error al obtner información de la caja. \n";
                    $.each(data.mensajes, function(i,val) { errorMsg += (" - " + val + "\n"); } );
                    alert(errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                alert("Error al llamar el servicio para obtener información de la caja." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        }
        $(document).ready(function () {
            $( "#searchBoxBtn" ).click(function () {
                var id = $( "#searchBox" ).val()
                if(id.length > 0){
                    buscaInformacion(id);
                }
            });

            $( '#searchBox' ).keyup(function(e){
                if(e.keyCode == 13) {
                    var id = $( "#searchBox" ).val()
                    if(id.length > 0){
                        buscaInformacion(id);
                    }
                }
            });

            $(document.body).on('click', '.validaPedido', function (){
                $( '#overlay' ).show();
                var pedido = $(this).attr("data-id");
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type     : 'POST',
                    url      : "{{ route('preparacion.validar') }}",
                    dataType : 'json',
                    data     : {
                        pedido : pedido
                    }
                }).done(function (data) {
                    if(data.resultado === 'OK') {
                        alert('Se ha validado el pedido');
                    } else {
                        var errorMsg = "Error al validar el pedido. \n";
                        $.each(data.mensajes, function(i,val) { errorMsg += (" - " + val + "\n"); } );
                        alert(errorMsg);
                    }
                }).fail(function (jqXHR, textStatus) {
                    errorDetalle = "";
                    // If req debug show errorDetalle
                    $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                    alert("Error al llamar el servicio para validar el pedido." );
                }).always(function() {
                    $( '#overlay' ).hide();
                });
            });
        });
    </script>
@endsection