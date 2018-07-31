@extends('layouts.simHH')

@section('content')

<div class="card">
<div class="card-body">

<br>
SKU: <b> {{ $data["sku"] }}  </b>
<br>
Cantidad requerida: <b> {{ $data["cantidadRequerida"] }} </b>
<br>
Cantidad recibida: <b> {{ $data["cantidad"] }} </b>
<br>
Caducidad m&iacute;nima del producto: <b> {{ $data["caducidadMinima"] }}  meses</b>
<br>


        <form id="formCapturaDatos" data-toggle="validator" role="form" action="{{ route('ordenes.validaCaptura') }}" novalidate>
            <div class="form-group row">
                <label for="inputlote" class="col-sm-3 col-form-label">Lote</label>
                <div class="col-sm-6">
                    <input type="text" 
                            class="form-control" 
                            id="inputLote" 
                            placeholder="Lote"
                            name="lote"
                            required>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputCaducidad" class="col-sm-3 col-form-label">Caducidad</label>
                <div class="col-sm-6">
                    <input type="date" 
                            class="form-control" 
                            id="inputCaducidad" 
                            placeholder="Caducidad"
                            name="caducidad"
                            required>
                    <input type="hidden" 
                            class="form-control" 
                            id="inputSku" 
                            value= "{{ $data["sku"] }} "
                            name="sku">
                    <input type="hidden" 
                            class="form-control" 
                            id="inputCantidad" 
                            value= {{ $data["cantidad"] }}
                            name="recibida">    
                    <input type="hidden" 
                            class="form-control" 
                            id="inputPurchase" 
                            value= {{ $data["purchaseid"] }}
                            name="purchase">      
                </div>
            </div>
            <br>
            <div class="form-group row">
                <div class="col-sm-6">
                    <button type="button"
                            class="btn btn-secondary regresa"
                            title="Regresar">
                            Cancelar
                    </button>
                    &nbsp;&nbsp;
                    <button type="submit"
                            class="btn btn-primary"
                            id="btnGuardarCaptura"
                            >
                            Aceptar
                    </button>
                </div>                 
            </div>
        </form>
    </div>
</div>


@endsection

@section('final')



	<script type="text/javascript">
		$(document).ready(function () {
			$( '.regresa' ).click(function () {
                window.location.href =   "{{ URL::to('/hh/recepcion/listadoItemsHH')  }}/{{  $data["purchaseid"] }} ";
			});
		});
	</script>


<script>
function guarda() {
    $( '#formCapturaDatos'  ).submit()   
}
</script>

@endsection


