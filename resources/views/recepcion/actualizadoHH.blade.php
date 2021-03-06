@extends('layouts.simItemHH')

@section('content')


<div class="card">
    <div class="card-body">
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
        Caducidad: <b> {{ Carbon\Carbon::parse($data["caducidad"] )->format('Y-m-d') }}       </b>  
                                                                                                 
        <form id="formRecepcion" data-toggle="validator" role="form" action="{{ URL::to('/hh/recepcion/listadoItemsHH')  }}/{{  $data["purchaseid"] }} "  >
            <div class="form-group row">
            </div>
            <br>
            <input type="hidden" name="purchaseid" id="purchaseid" value="{{ $data["purchaseid"] }} ">
            <input type="hidden" name="sku" id="sku" value="{{ $data["sku"] }} ">
            <div class="form-group row">
                <div class="col-sm-12">
                    &nbsp;&nbsp;
                    <button type="submit"
                            class="btn btn-primary"
                            id="enviar">
                            Nueva captura
                    </button>
                    <button type="button"
                            class="btn btn-success"
                            id="cerrar">
                            Terminar captura
                    </button>
                </div>                 
            </div>
        </form>

    <div>
<div>

@endsection

@section('final')

@include('partials.modalComun')
@include('partials.modalMensaje')
@include('partials.modalConfirmacion')


<script type="text/javascript">
$(document).ready(function () {
    $("#cerrar").click(function(event) {   
        
            var parametros = [];
                parametros["idcompra"] = $('#purchaseid').val();
                parametros["sku"] = $('#sku').val();

                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "??Deseas concluir la captura?",
                    "{{ URL::to('/hh/recepcion/updateStatusPurchaseItems/') }}",
                    parametros
                );

            //window.location.href =  "{{ URL::to('/hh/recepcion/listadoItemsHH')  }}/{{  $data["purchaseid"] }}";    
        });            
});
</script>



















@endsection


