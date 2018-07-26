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
    <div id="erroresTrabajador" class="mt-3"></div>

    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            {{-- $listado->links('pagination.default') --}}
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <tbody>
            @php
                $caja  = 0;
                $orden = 0;
            @endphp
            @foreach ($listado as $pedido)
                @if( $caja != $pedido->sequence
                    || $orden != $pedido->order_id )
                @php
                    $caja  = $pedido->sequence;
                    $orden = $pedido->order_id;
                @endphp
                        <tr>
                            <th style="text-align: center;" class="table-dark">
                                <div class="row">
                                    <div class="col">
                                        Pedido: #{{ $pedido->codeOrder }}
                                        Caja {{ $pedido->sequence }} de {{ $pedido->max }}
                                        <br>
                                        <small>
                                            {{ $pedido->client }}
                                        </small>
                                    </div>
                                    <div class="col"
                                        id="finishBtn_{{ $pedido->order_id }}_{{ $pedido->sequence }}"
                            @if( !isset($pedido->label) )
                                        style="display: none;"
                            @endif>
                                        <button class="btn btn-sm btn-success terminaTarea"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                data-id="{{ $pedido->id }}"
                                                title="Terminar tarea">
                                            <i class="material-icons">offline_pin</i>
                                        </button>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr class="table-primary">
                            <th>
                                <input type="text"
                                    class="form-control registroCaja"
                                    placeholder="Registro de identificador de caja"
                                    data-order="{{ $pedido->order_id }}"
                                    data-id="{{ $pedido->sequence }}"
                                @isset($pedido->label)
                                    value="{{ $pedido->label }}"
                                @endisset>
                            </th>
                        </tr>
                        <tr class="table-primary">
                            <th>
                                <input type="text"
                                    class="form-control registroProductos"
                                    placeholder="Registro de productos"
                                    data-order="{{ $pedido->order_id }}">
                            </th>
                        </tr>
                @endif
                        <tr>
                            <td style="text-align: center;">
                                <div class="row">
                                    <div class="col">
                                        {{ $pedido->sku }} - {{ $pedido->concept }}
                                    </div>
                                    <div class="col">
                                        <span id="register_{{ $pedido->order_id }}_{{ $pedido->sku }}">0</span>
                                        de {{ $pedido->quantity }} piezas
                                    </div>
                                </div>
                            </td>
                        </tr>
            @endforeach
            @if(count($listado) == 0)
                        <tr style="text-align: center;">
                            <td>No hay tareas pendientes</td>
                        </tr>
            @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">
        function asignaCaja(sequence, label, order){
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.asigna.caja') }}",
                dataType : 'json',
                data     : {
                    caja     : sequence,
                    etiqueta : label,
                    pedido   : order
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    mensajeExito("erroresTrabajador", "Se asigno caja");
                    //$( "#finishBtn_" + order + "_" + sequence ).show();
                } else {
                    var errorMsg = "Error al asignar la caja. \n";
                    $.each(data.mensajes, function(i,val) { errorMsg += (" - " + val + "\n"); } );
                    alert(errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                alert( "Error al llamar el servicio para asignar la caja." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        }
        function terminaTarea(id) {
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.terminarTarea') }}",
                dataType : 'json',
                data     : {
                    tarea   : id
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    location.reload();
                } else {
                    var errorMsg = "Error al terminar la tarea. \n";
                    $.each(data.mensajes, function(i,val) { errorMsg += (" - " + val + "\n"); } );
                    alert(errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                alert("Error al llamar el servicio para terminar la tarea." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        }
        $(document).ready(function () {
            $( '[data-toggle="tooltip"]' ).tooltip();

            $( '.registroCaja' ).keyup(function(e){
                if(e.keyCode == 13) {
                    asignaCaja(
                        $(this).attr('data-id'),
                        $(this).val(),
                        $(this).attr('data-order')
                    );
                }
            });

            $( '.terminaTarea' ).click(function (){
                terminaTarea($(this).attr('data-id'));
            });
        });
    </script>
@endsection