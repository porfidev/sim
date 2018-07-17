@extends('layouts.simItemHH')

@section('content')

<!-- Modal para validar  -->

    <br><br>
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
                <form id="validaBarcode" style="display:block" action="{{ URL::to('/hh/recepcion/finalValidacionHH/') }}">
                    <div class="form-group">
                        {{ csrf_field() }}
                        <input type="hidden" name="itemCode" id="itemCode" value="TOP-0102">
                        <input type="hidden" name="purchaseid" id="purchaseid" value="42">
                        <input type="text"
                                class="form-control"
                                placeholder="C&oacute;digo de barras"
                                name="codigo" 
                                id="codigo"
                                required
                                class="visible">
                        <br>
                        <span class="custom-control-indicator" id="cantidad" style="font-size: 24px; font-weight: bold;">0</span>
                            <input type="hidden" id="cantidadFinal" name="cantidadFinal" value= "">  
                            <input type="hidden" name="ItemCode" value="{{ $data["ItemCode"] }} ">
                            <input type="hidden" name="id" value="{{ $data["id"] }}">
                            <input type="hidden" name="purchaseid" value="{{ $data["purchaseid"] }} ">
                            <input type="hidden" name="DistNumber" value="{{ $data["DistNumber"] }} ">
                            <input type="hidden" name="u_Caducidad" value="{{ $data["u_Caducidad"] }} ">
                            <input type="hidden" name="quantity" value="{{ $data["quantity"] }} ">
                            <input type="hidden" name="product_id" value="{{ $data["product_id"] }} ">
                        <div class="modal-footer d-flex justify-content-center">
                            <button type="input"
                                class="btn btn-primary" >
                                Aceptar        
                            </button>
                            <button type="button"
                                class="btn btn-secondary regresa" >
                                Cancelar        
                            </button>
                        </div>
                    </div>
                </form>
           </div>
        </div>
    </div>


<!-- Fin de modales -->

@endsection

@section('final')

<!-- Script de Modal para Nueva recepcion -->

	<script type="text/javascript">
		$(document).ready(function () {
			$( '.regresa' ).click(function () {
				window.history.back();
			});

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
                    url    : "{{ URL::to('/hh/recepcion/valida/') }}",
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

@endsection

