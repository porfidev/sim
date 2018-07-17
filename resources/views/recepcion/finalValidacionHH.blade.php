@extends('layouts.simItemHH')

@section('content')



<br>
<b>Datos capturados por el trabajador:</b>
<br>
SKU: <b> {{ $data["itemCode"] }} </b>
<br>
ID del producto: <b> {{ $data["product_id"] }} </b>
<br>
Cantidad recibida: <b> {{ $data["quantity"] }}</b>
<br>
LOTE: <b> {{ $data["DistNumber"] }} </b>
<br>
Ultima Caducidad: <b> {{ $data["u_Caducidad"] }} </b>   
<br>
<br>
<b>Cantidad nueva capturada:</b>
<b> {{ $data["cantidadFinal"] }} </b> 

{{ $data["id"] }} !!



<form id="formCapturaDatos" data-toggle="validator" role="form" action="{{ URL::to('/hh/recepcion/actualizar')  }}"  >
    <div class="form-group row">
    </div>
    <br>
    <div class="form-group row">

        <input type="hidden" id="cantidadFinal" name="cantidadFinal" value= "{{ $data["cantidadFinal"] }}">  
        <input type="hidden" name="itemCode" value="{{ $data["itemCode"] }} ">
        <input type="hidden" name="id" value="{{ $data["id"] }}">
        <input type="hidden" name="purchaseid" value="{{ $data["purchaseid"] }} ">
        <input type="hidden" name="DistNumber" value="{{ $data["DistNumber"] }} ">
        <input type="hidden" name="u_Caducidad" value="{{ $data["u_Caducidad"] }} ">
        <input type="hidden" name="quantity" value="{{ $data["quantity"] }} ">
        <input type="hidden" name="product_id" value="{{ $data["product_id"] }} "> 

        <div class="col-sm-6">
            &nbsp;&nbsp;
            <button type="submit"
                    class="btn btn-primary"
                    id="btnActualizar">
                    Actualizar
            </button>
        </div>                 
    </div>
</form>





@endsection

@section('final')
