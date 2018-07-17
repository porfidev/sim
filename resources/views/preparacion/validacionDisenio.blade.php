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
    <a href="{{ route('preparacion.listado') }}"
        class="btn btn-sm btn-secondary mt-3"
        data-toggle="tooltip"
        data-placement="top"
        title="Regresar">
        <i class="material-icons">reply</i>
    </a>
    <div id="erroresValidacion" class="mt-3"></div>

    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <table class="table table-striped mb-0">
                <tr>
                    <td style="text-align: center;"
                            class="table-dark"
                            colspan="3">
                        Lista de productos Pedido #{{ $pedido->codeOrder }}
                    </td>
                </tr>
                <tr class="table-primary">
                    <th scope="col">
                        Producto
                    </th>
                    <th scope="col">
                        Libres
                    </th>
                    <th scope="col">
                        Solicitado
                    </th>
                </tr>
    @foreach( $productos as $item )
                <tr>
                    <td>
                            {{ $item->product->sku }} - {{ $item->product->concept }}
                    </td>
                    <td>
                        <span id="free_{{ $item->product->sku }}">0</span> piezas
                    </td>
                    <td>
                        <span id="max_{{ $item->product->sku }}">{{ $item->quantity }}</span> piezas
                    </td>
                </tr>
    @endforeach
            </table>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <form action="{{ route('preparacion.validar.disenio') }}" method="POST">
            <input type="hidden" name="pedido" value="{{ $pedido->id }}">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td style="text-align: center;"
                            class="table-dark"
                            colspan="2">
                            <h5>
                                Dise&ntilde;o del pedido #{{ $pedido->codeOrder }}
                            </h5>
                            <small>
                                {{ $pedido->client->name }}
                            </small>
                        </td>
                    </tr>
            @php
                $caja = 0;
            @endphp
            @foreach( $listado as $item )
                @if($caja != $item->sequence)
                    @php
                        $caja = $item->sequence
                    @endphp
                    <tr class="table-primary">
                        <th scope="col" colspan="2">
                            Caja {{ $item->sequence }}
                            <small>{{ $item->boxType->description }}</small>
                        </th>
                    </tr>
                @endif
                <tr>
                    <td width="70%">
                        {{ $item->orderDetail->product->sku }} - {{ $item->orderDetail->product->concept }}
                    </td>
                    <td width="30%">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button class="btn btn-success addProduct"
                                        id="add_btn_{{ $item->orderDetail->product->sku }}"
                                        type="button"
                                        data-sku="{{ $item->orderDetail->product->sku }}"
                                        disabled>
                                    <i class="material-icons">add_circle_outline</i>
                                </button>
                                <button class="btn btn-danger removeProduct"
                                        id="remove_btn_{{ $item->orderDetail->product->sku }}"
                                        type="button"
                                        data-sku="{{ $item->orderDetail->product->sku }}">
                                    <i class="material-icons">remove_circle_outline</i>
                                </button>
                            </div>
                            <input type="number"
                                class="form-control inputQty"
                                name="design[{{ $item->sequence }}][{{ $item->orderDetail->id }}][]"
                                id="qty_{{ $item->orderDetail->product->sku }}"
                                value="{{ $item->quantity }}">
                            <div class="input-group-append">
                                <span class="input-group-text">Piezas</span>
                            </div>
                        </div>
                    </td>
                </tr>
            @endforeach
                </tbody>
            </table>
            </form>
        </div>
    </div>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();

            $( '.removeProduct' ).click(function () {
                var sku = $(this).attr('data-sku');
                var qty = parseInt( $( '#qty_' + sku ).val(), 10 );
                if(qty > 0) {
                    $( '#qty_' + sku ).val( qty - 1 );
                    var free = parseInt( $( '#free_' + sku ).text(), 10 );
                    if(free === 0){
                        $( '#add_btn_' + sku ).prop('disabled', false);
                    }
                    $( '#free_' + sku ).text( free + 1 );
                } else {
                    alert('No se pueden quitar mas elementos');
                    $( '#remove_btn_' + sku ).prop('disabled', true);
                }
            });

            $( '.addProduct' ).click(function () {
                var sku = $(this).attr('data-sku');
                var qty = parseInt( $( '#qty_' + sku ).val(), 10 );
                var max = parseInt( $( '#max_' + sku ).text(), 10 );
                if(qty < max) {
                    $( '#qty_' + sku ).val( qty + 1 );
                    var free = parseInt( $( '#free_' + sku ).text(), 10 );
                    $( '#free_' + sku ).text( free - 1 );
                    if( free === max ){
                        $( '#remove_btn_' + sku ).prop('disabled', true);
                    }
                } else {
                    alert('No se pueden agregar mas elementos');
                    $( '#add_btn_' + sku ).prop('disabled', false);
                }
            });
        });
    </script>
@endsection