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
        <div class="card-body pl-0 pr-0 pb-0 pt-3">
            {{ $listado->links('pagination.default') }}
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <tbody>
            @foreach ($listado as $pedido)
                        <tr>
                            <td style="text-align: center;" class="table-primary">
                                <div class="row">
                                    <div class="col">
                                        Pedido: #{{ $pedido->codeOrder }}
                                        Caja {{ $pedido->order_design_id - $pedido->min + 1 }} de {{ $pedido->max - $pedido->min + 1 }}
                                    </div>
                                    <div class="col"
                                        id="finishBtn_{{ $pedido->id }}"
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
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                {{ $pedido->sku }} - {{ $pedido->concept }}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text"
                                    class="form-control registroCaja"
                                    placeholder="Registro de identificador de caja"
                                    data-find="{{ $pedido->id }}"
                                    data-id="{{ $pedido->order_design_id }}"
                                @isset($pedido->label)
                                    value="{{ $pedido->label }}"
                                @endisset>
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
        function asignaCaja(id, find, caja){
            $( '#overlay' ).show();
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.asigna.caja') }}",
                dataType : 'json',
                data     : {
                    id   : id,
                    caja : caja
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    mensajeExito("erroresTrabajador", "Se asigno caja");
                    $( "#finishBtn_" + find ).show();
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
                        $(this).attr('data-find'),
                        $(this).val()
                    );
                }
            });

            $( '.terminaTarea' ).click(function (){
                terminaTarea($(this).attr('data-id'));
            });
        });
    </script>
@endsection