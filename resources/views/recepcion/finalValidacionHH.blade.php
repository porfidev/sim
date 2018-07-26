@extends('layouts.simItemHH')

@section('content')

<div class="card">
<div class="card-body">

        <br>
        <b>Datos capturados por el trabajador:</b>
        <br>
        SKU: <b> {{ $data["ItemCode"] }} </b>
        <br>
        ID del producto: <b> {{ $data["product_id"] }} </b>
        <br>
        Cantidad recibida: <b> {{ $data["quantity"] }}</b>
        <br>
        LOTE: <b> {{ $data["DistNumber"] }} </b>
        <br>
        Ultima Caducidad: <b> {{ $data["u_Caducidad"] }} </b>   
        <br>
        Status: <b> {{ $data["status"] }} </b>   
        <br>
        <b>Cantidad nueva capturada:</b>
        <b> {{ $data["cantidadFinal"] }} </b> 




        <form id="formCapturaDatos" data-toggle="validator" role="form" action="{{ URL::to('/hh/recepcion/actualizar')  }}"  >
            <div class="form-group row">
            </div>
            <br>
            <div class="form-group row">

                <input type="hidden" id="cantidadFinal" name="cantidadFinal" value= "{{ $data["cantidadFinal"] }}">  
                <input type="hidden" name="ItemCode" value="{{ $data["ItemCode"] }} ">
                <input type="hidden" name="id" value="{{ $data["id"] }}">
                <input type="hidden" name="purchaseid" value="{{ $data["purchaseid"] }} ">
                <input type="hidden" name="DistNumber" value="{{ $data["DistNumber"] }} ">
                <input type="hidden" name="u_Caducidad" value="{{ $data["u_Caducidad"] }} ">
                <input type="hidden" name="quantity" value="{{ $data["quantity"] }} ">
                <input type="hidden" name="product_id" value="{{ $data["product_id"] }} "> 
                <input type="hidden" name="status" value="{{ $data["status"] }} "> 

                <div class="col-sm-6">
                    &nbsp;&nbsp;
                    <button type="button"
                            class="btn btn-secondary regresa"
                            title="Regresar">
                            Cancelar
                    </button>
                    <button type="submit"
                            class="btn btn-primary "
                            id="btnActualizar">
                            Actualizar
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
            window.location.href =  "{{ URL::to('/hh/recepcion/validacionHH/') }}";
        });

    });
</script>

@endsection
