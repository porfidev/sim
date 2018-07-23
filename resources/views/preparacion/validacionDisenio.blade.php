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
            <form action="{{ route('preparacion.validar.disenio') }}"
                    method="POST"
                    id="validateForm">
                {{ csrf_field() }}
                <input type="hidden" name="id" value="{{ $pedido->id }}">
                <table class="table table-striped mb-0">
                    <tbody id="designTable">
                        <tr>
                            <td style="text-align: center;"
                                class="table-dark"
                                colspan="4">
                                <div class="row">
                                    <div class="col">
                                    </div>
                                    <div class="col">
                                        <h5>
                                            Dise&ntilde;o del pedido #{{ $pedido->codeOrder }}
                                        </h5>
                                        <small>
                                            {{ $pedido->client->name }}
                                        </small>
                                    </div>
                                    <div class="col"
                                        style="text-align: right;">
                                        <button class="btn btn-sm btn-primary"
                                                type="submit"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                title="Validar Diseño">
                                            <i class="material-icons">done_all</i>
                                        </button>
                                        <button class="btn btn-sm btn-success addBoxToDesign"
                                                type="button"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                title="Agregar Caja">
                                            <i class="material-icons">library_add</i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                @php
                    $caja = 0;
                    $listaCajas = array();
                @endphp
                @foreach( $listado as $item )
                    @if($caja != $item->sequence)
                        @php
                            $caja = $item->sequence;
                            $listaCajas[] = $item->sequence;
                        @endphp
                        <tr class="table-primary box_{{ $item->sequence }}">
                            <th scope="col" colspan="4">
                                <div class="row">
                                    <div class="col">
                                        Caja {{ $item->sequence }}
                                        <small>{{ $item->boxType->description }}</small>
                                    </div>
                                    <div class="col" style="text-align:right;">
                                        <button class="btn btn-sm btn-success freeItemsList"
                                                type="button"
                                                data-sequence="{{ $caja }}"
                                                data-type="{{ $item->boxType->id }}"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                title="Agregar Producto">
                                            <i class="material-icons">playlist_add</i>
                                        </button>
                                        <button class="btn btn-sm btn-danger removeBox"
                                                type="button"
                                                data-order={{ $pedido->id }}
                                                data-sequence="{{ $caja }}">
                                            <i class="material-icons">highlight_off</i>
                                        </button>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr class="box_{{ $item->sequence }}">
                            <th style="text-align:center;">Orden de empaque</th>
                            <th>Producto</th>
                            <th style="text-align:center;">Cantidad</th>
                            <th style="text-align:center;">Acciones</th>
                        </tr>
                    @endif
                        <tr class="box_{{ $item->sequence }}">
                            <td width="5%">
                                <input type="number"
                                    data-id="{{ $item->id }}"
                                    class="form-control changeOrder"
                                    value="{{ $item->packing_order }}">
                            </td>
                            <td width="60%">
                                {{ $item->orderDetail->product->sku }} - {{ $item->orderDetail->product->concept }}
                            </td>
                            <td width="25%">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-success addProduct"
                                                id="add_btn_{{ $item->orderDetail->product->sku }}"
                                                type="button"
                                                data-sku="{{ $item->orderDetail->product->sku }}"
                                                data-id="{{ $item->id }}"
                                                data-detail="{{ $item->order_detail_id }}">
                                            <i class="material-icons">add_circle_outline</i>
                                        </button>
                                        <button class="btn btn-danger removeProduct"
                                                id="remove_btn_{{ $item->orderDetail->product->sku }}"
                                                type="button"
                                                data-sku="{{ $item->orderDetail->product->sku }}"
                                                data-id="{{ $item->id }}"
                                                data-detail="{{ $item->order_detail_id }}">
                                            <i class="material-icons">remove_circle_outline</i>
                                        </button>
                                    </div>
                                    <input type="number"
                                        class="form-control inputQty"
                                        name="design[{{ $item->sequence }}][{{ $item->orderDetail->id }}][]"
                                        id="qty_{{ $item->orderDetail->product->sku }}"
                                        value="{{ $item->quantity }}"
                                        data-sku="{{ $item->orderDetail->product->sku }}"
                                        data-id="{{ $item->id }}"
                                        data-detail="{{ $item->order_detail_id }}">
                                    <div class="input-group-append">
                                        <span class="input-group-text">Piezas</span>
                                    </div>
                                </div>
                            </td>
                            <td width="10%"
                                style="text-align:center;">
                                <button class="btn btn-sm btn-danger removeRow"
                                        id="remove_row_btn_{{ $item->orderDetail->product->sku }}"
                                        type="button"
                                        data-id="{{ $item->id }}">
                                    <i class="material-icons">highlight_off</i>
                                </button>
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

    @include('preparacion.modalLibres')
    @include('preparacion.modalAgregarCaja')

    <script type="text/javascript">
        var cajas = @json($listaCajas);
        function addBox(box, box_id) {
            var sequence = parseInt(cajas[cajas.length-1], 10) + 1;
            cajas.push(sequence);
            var row = '<tr class="table-primary box_' + sequence + '">';
            row += '<th scope="col" colspan="4">';
            row += '<div class="row"><div class="col">';
            row += ('Caja ' + sequence);
            row += '<small>' + box + '</small>';
            row += '</div><div class="col" style="text-align:right;">';
            row += '<button class="btn btn-sm btn-success freeItemsList mr-1"';
            row += 'type="button"';
            row += 'data-sequence="' + sequence + '"';
            row += 'data-type="' + box_id +  '"';
            row += 'data-toggle="tooltip"';
            row += 'data-placement="top"';
            row += 'title="Agregar Producto">';
            row += '<i class="material-icons">playlist_add</i>';
            row += '</button>';
            row += '<button class="btn btn-sm btn-danger removeBox"'
            row += 'type="button"';
            row += 'data-sequence="' + sequence + '"';
            row += 'data-toggle="tooltip" data-placement="top" title="Quitar Caja" >';
            row += '<i class="material-icons">highlight_off</i>';
            row += '</button>';
            row += '</th>';
            row += '</tr>';
            row += '<tr class="box_' + sequence + '">'
            row += '<td colspan=4 style=text-align:center;>';
            row += 'No hay productos en la caja'
            row += '</td>';
            row += '</tr>';
            $( '#designTable' ).append(row);
        }
        function actualizarCantidad(id, detalle, cantidad, callback){
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.disenio.actualizar') }}",
                dataType : 'json',
                data     : {
                    id       : id,
                    detalle  : detalle,
                    cantidad : cantidad
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    showMensaje(
                        '&Eacute;xito',
                        'Se ha actualizado la cantidad del producto'
                    );
                    callback();
                } else {
                    var errorMsg = "<p>Error al actualizar la cantidad del producto.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacion", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacion", "Error al actualizar la cantidad del producto." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        }
        function quitarProducto(id, callback){
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.disenio.quitar') }}",
                dataType : 'json',
                data     : {
                    id       : id
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    showMensaje(
                        '&Eacute;xito',
                        'Se ha quitado el producto de la caja'
                    );
                    callback();
                } else {
                    var errorMsg = "<p>Error al quitar el producto.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacion", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacion", "Error al quitar el producto." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        }
        function agregarProductoAcaja(datos, callback){
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.disenio.agregar') }}",
                dataType : 'json',
                data     : datos
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    showMensaje(
                        '&Eacute;xito',
                        'Se ha agregado el producto a la caja'
                    );
                    callback();
                } else {
                    var errorMsg = "<p>Error al agregar el producto.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacion", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacion", "Error al agregar el producto." );
            }).always(function() {
                $( '#overlay' ).hide();
            });  
        }
        function quitarcaja(pedido, caja, callback){
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.disenio.quitar.caja') }}",
                dataType : 'json',
                data     : {
                    pedido    : pedido,
                    secuencia : caja
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    showMensaje(
                        '&Eacute;xito',
                        'Se ha eliminado la caja'
                    );
                    callback();
                } else {
                    var errorMsg = "<p>Error al eliminar la caja.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacion", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacion", "Error al eliminar la caja." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        }
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();

            $( '.removeProduct' ).click(function () {
                var sku = $(this).attr('data-sku');
                var qty = parseInt( $( '#qty_' + sku ).val(), 10 );
                var max = parseInt( $( '#max_' + sku ).text(), 10 );
                var id  = $(this).attr('data-id');
                var det = $(this).attr('data-detail');
                if(qty > 0) {
                    actualizarCantidad(id, det, qty-1, function () {
                        $( '#qty_' + sku ).val( qty - 1 );
                        var free = parseInt( $( '#free_' + sku ).text(), 10 );
                        if(free === 0){
                            $( '#add_btn_' + sku ).prop('disabled', false);
                        } else if( (free + 1) === max ) {
                            $( '#remove_btn_' + sku ).prop('disabled', true);
                        }
                        $( '#free_' + sku ).text( free + 1 );
                    })
                } else {
                    alert('No se pueden quitar mas elementos');
                    $( '#remove_btn_' + sku ).prop('disabled', true);
                }
            });

            $( '.addProduct' ).click(function () {
                var sku = $(this).attr('data-sku');
                var qty = parseInt( $( '#qty_' + sku ).val(), 10 );
                var max = parseInt( $( '#max_' + sku ).text(), 10 );
                var id  = $(this).attr('data-id');
                var det = $(this).attr('data-detail');
                if(qty < max) {
                    actualizarCantidad(id, det, qty, function () {
                        $( '#qty_' + sku ).val( qty + 1 );
                        var free = parseInt( $( '#free_' + sku ).text(), 10 );
                        $( '#free_' + sku ).text( free - 1 );
                        if( (qty + 1) === 1){
                            $( '#remove_btn_' + sku ).prop('disabled', false);
                        } else if( (free - 1) === 0 ) {
                            $( '#add_btn_' + sku ).prop('disabled', true);
                        }
                    });
                } else {
                    alert('No se pueden agregar mas elementos');
                    $( '#add_btn_' + sku ).prop('disabled', true);
                }
            });

            $( '.inputQty' ).change(function (){
                var sku = $(this).attr('data-sku');
                var qty = parseInt( $(this).val(), 10 );
                var max = parseInt( $( '#max_' + sku ).text(), 10 );
                var id  = $(this).attr('data-id');
                var det = $(this).attr('data-detail');
                var free = max - qty;
                actualizarCantidad(id, det, qty, function () {
                    $( '#free_' + sku ).text( free );
                    if( qty > 0 ){
                        $( '#remove_btn_' + sku ).prop('disabled', false);
                    } else {
                        $( '#remove_btn_' + sku ).prop('disabled', true);
                    }
                    if( free < max ) {
                        $( '#add_btn_' + sku ).prop('disabled', false);
                    } else {
                        $( '#add_btn_' + sku ).prop('disabled', true);
                    }
                });
            });

            $( '.removeRow' ).click(function (){
                var tr    = $( this ).parent().parent();
                var input = $( tr ).find( '.inputQty' );
                var sku   = $( input ).attr('data-sku');
                var qty   = parseInt( $( input ).val(), 10 );
                var free  = parseInt( $( '#free_' + sku ).text(), 10 );
                quitarProducto( $(this).attr('data-id'), function () {
                    free = free + qty;
                    $( '#free_' + sku ).text( free );
                    tr.remove();
                });
            });

            $( '.removeBox' ).click(function () {
                var sequence = $(this).attr('data-sequence');
                var pedido   = $(this).attr('data-order');
                var inputs = $( '.box_' + sequence + ' input' );
                quitarcaja(pedido, sequence, function (){
                    $( '#overlay' ).show();
                    location.reload();
                });
            });

            $( '.changeOrder' ).change(function (){
                var orden = $(this).val();
                var id = $(this).attr('data-id');
                $( '#overlay' ).show();
                $.ajax({
                    headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type     : 'POST',
                    url      : "{{ route('preparacion.disenio.orden') }}",
                    dataType : 'json',
                    data     : {
                        id    : id,
                        orden : orden
                    }
                }).done(function (data) {
                    if(data.resultado === 'OK') {
                        showMensaje(
                            '&Eacute;xito',
                            'Se ha actualizado el orden del producto'
                        );
                    } else {
                        var errorMsg = "<p>Error al actualizar el orden del producto.<p><ul>";
                        $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                        errorMsg += "</ul>";
                        erroresValidacion("erroresValidacion", errorMsg);
                    }
                }).fail(function (jqXHR, textStatus) {
                    errorDetalle = "";
                    // If req debug show errorDetalle
                    $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                    erroresValidacion( "erroresValidacion", "Error al actualizar el orden del producto." );
                }).always(function() {
                    $( '#overlay' ).hide();
                });
            });
        });
    </script>
@endsection