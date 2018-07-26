<!-- Modal para Producto Nuevo -->
<div class="modal fade"
    id="modalRecepcion"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevaRecepcionTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                   Recepci&oacute;n
                </h4>
            </div>
            <div class="modal-body">
                <div id="erroresValidacionmodalNuevaRecepcion"></div>
                    <div id="loading_modal_recepcion"
                        style="display: none;"
                        >
                        <img src="{{ url('img/spinner_3.gif') }}"
                            class="rounded mx-auto d-block"
                            style="max-height: 90px;">
                </div>
                <form id="validaBarcode" style="display:block" action="{{ route('ordenes.captura') }}">
                    <div class="form-group">
                        {{ csrf_field() }}
                        <input type="hidden" name="ItemCode" id="ItemCode" value="">
                        <input type="hidden" name="purchaseid" id="purchaseid" value="">
                        <input type="hidden" name="cantidadFinal" id="cantidadFinal" value="">
                        <input type="text"
                                class="form-control"
                                placeholder="C&oacute;digo de barras"
                                name="codigo" 
                                id="codigo"
                                required
                                class="visible">
                                <span class="custom-control-indicator" id="cantidad" name="cantidad" style="font-size: 24px; font-weight: bold;">0</span>       
                         <div class="modal-footer d-flex justify-content-center">
                            <button type="button"
                                class="btn btn-secondary"
                                data-dismiss="modal">
                                Cancelar        
                            </button>
                            <button type="input"
                                class="btn btn-primary" >
                                Aceptar        
                            </button>
                        </div>
                    </div>
                </form>
           </div>
        </div>
    </div>

</div>
<!-- Fin de modales -->


<!-- Script de Modal para Nueva recepcion -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.nuevaRecepcion' ).click(function () {
            //var parametros = [];
            //parametros["ItemCode"] = $(this).attr("data-ItemCode");
            $("#codigo").val("");
            $("#cantidad").html("0 items");
            $("#purchaseid").val($(this).attr("data-cmd"));
            $("#ItemCode").val($(this).attr("data-id"));
            $( '#erroresValidacionmodalNuevaRecepcion').text("");
            $( "#modalRecepcion" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });
        $('#modalRecepcion').on('shown.bs.modal', function () {
             $('#codigo').trigger('focus')
        })
    });
</script>

<script type="text/javascript">


$(document).ready(function () {
        cantidad = 0;

        $('#validaBarcode').on('keyup keypress', function(e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode === 13) { 
                e.preventDefault();
                return false;
            }
        });

        
        $("#codigo").focus();
        $("#codigo").keyup(function(event){
            if (event.which == 13 ) {
                event.preventDefault();
                $.ajax({
                    url    : "{{ URL::to('/hh/recepcion/obtenCantidadPorCodigo/') }}",
                    method : "POST",
                    data   : $( '#validaBarcode'  ).serialize()
                    }).done(function( data ) {
                        console.log(data);
                        if(data.cantidad > 0) {
                            cantidad += data.cantidad;
                            $("#cantidad").html(cantidad + " items");
                            $("#cantidadFinal").val(cantidad);
                        } else {
                            alert(data.mensajes);
                        }
                    }).fail(function (jqXHR, textStatus, errorThrown) {
                        errorDetalle = "ERROR: \n";
                        //$.each(jqXHR, function(i,val) { errorDetalle += "\n\n" + i + " : " + val; } );
                        alert(errorDetalle);
                    }).always(function() {
                        //alert('okkkkkkk always');
                    });
            } 
        });            
});

</script>






<!-- Fin de Modal para Recepion HH -->