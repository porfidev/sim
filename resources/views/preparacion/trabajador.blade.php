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
                                    </div>
                                @isset($pedido->box_id)
                                    <div class="col">
                                        <button class="btn btn-sm btn-success terminaTarea"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                data-id="{{ $pedido->id }}"
                                                title="Terminar tarea">
                                            <i class="material-icons">offline_pin</i>
                                        </button>
                                    </div>
                                @endisset
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
                                    data-id="{{ $pedido->order_design_id }}"
                                @isset($pedido->box_id)
                                    value="{{ $pedido->box_id }}"
                                @endisset>
                            </td>
                        </tr>
            @endforeach
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
        function asignaCaja(id, caja){
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
                } else {
                    var errorMsg = "<p>Error al asignar la caja.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresTrabajador", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresTrabajador", "Error al asignar la caja." );
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
                    var errorMsg = "<p>Error al terminar la tarea.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresTrabajador", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresTrabajador", "Error al terminar la tarea." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        }
        $(document).ready(function () {
            $( '[data-toggle="tooltip"]' ).tooltip();

            $( '.registroCaja' ).keyup(function(e){
                if(e.keyCode == 13) {
                    asignaCaja($(this).attr('data-id'), $(this).val());
                }
            });

            $( '.terminaTarea' ).click(function (){
                terminaTarea($(this).attr('data-id'));
            });
        });
    </script>
@endsection