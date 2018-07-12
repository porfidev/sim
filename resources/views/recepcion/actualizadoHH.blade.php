@extends('layouts.simItemHH')

@section('content')


{{ $data["mensajes"] }}
<br>
<br>
SKU: <b> {{ $data["sku"] }} </b>
<br>
Cantidad total: <b> {{ $data["total"] }} </b>
<br>
Cantidad recibida: <b> {{ $data["cantidad"] }} </b>
<br>
LOTE: <b> {{ $data["lote"] }} </b>
<br>
Caducidad: <b> {{ $data["caducidad"] }} </b>

<form id="formCapturaDatos" data-toggle="validator" role="form" action="{{ route('ordenes.listadoItemsHH') }}" novalidate>
    <div class="form-group row">
    </div>
    <br>
    <div class="form-group row">
        <div class="col-sm-6">
            &nbsp;&nbsp;
            <button type="button"
                    class="btn btn-primary"
                    id="btnGuardarCaptura"
                    onclick="guarda()">
                    Aceptar
            </button>
        </div>                 
    </div>
</form>

@endsection

@section('final')

<script type="text/javascript">
    $(document).ready(function () {
       $('#formCapturaDatos').validator()
    });
</script>

	<script type="text/javascript">
		$(document).ready(function () {
			$( '.regresa' ).click(function () {
				window.history.back();
			});

		});
	</script>


<script>
function guarda() {
    $( '#formCapturaDatos'  ).submit()   
}
</script>

@endsection


