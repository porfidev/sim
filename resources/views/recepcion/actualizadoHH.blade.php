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
                                                                                                    
<form id="formCapturaDatos" data-toggle="validator" role="form" action="{{ URL::to('/hh/recepcion/listadoItemsHH')  }}/{{  $data["purchaseid"] }} "  >
    <div class="form-group row">
    </div>
    <br>
    <div class="form-group row">
        <div class="col-sm-6">
            &nbsp;&nbsp;
            <button type="submit"
                    class="btn btn-primary"
                    id="enviar">
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




@endsection


