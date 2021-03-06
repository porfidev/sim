@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2" style="text-align: center;">
        <a href="{{ route('preparacion.listado') }}"
                class="btn btn-sm btn-secondary"
                data-toggle="tooltip"
                data-placement="top"
                title="Regresar">
            <i class="material-icons">reply</i>
        </a>

        Pedido: #{{ $order->codeOrder }}

    @if($order->status <  \App\Repositories\OrderRepository::PREPARADO_VALIDADO )
        @if($terminado == 0)
        <button class="btn btn-sm btn-success validaPedido"
                data-toggle="tooltip"
                data-placement="top"
                data-id="{{ $order->id }}"
                id="btnCerrar"
                title="Validar pedido">
            <i class="material-icons">offline_pin</i>
        </button>
        @endif
        <br><br>
        <div class="form-group">
            <input class="form-control addBoxEvent"
                data-id="{{ $order->id }}"
                placeholder="Identificador de la caja">
        </div>
    @endif
    </h2>

    <br>
    <div class="card">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped">
                    <tbody>
            @foreach ($listado as $ped)
                        <tr>
                            <td style="text-align: center;">
                                @if( isset($ped->product)
                                    && !empty($ped->product->concept ))
                                    {{ $ped->itemcode }} - {{ $ped->product->concept }}
                                @elseif(isset($ped->product)
                                    && !empty($ped->product->alias ))
                                    {{ $ped->itemcode }} - {{ $ped->product->alias }}
                                @else
                                    {{ $ped->itemcode }}
                                @endif
                            </td>
                        </tr>
                        <?php $cantU = 0; $cantT = 0; $cantB =0; $uni = "" ?>
                        @if( $ped->pres_req == "BOX")
                            <?php $uni = "cajas"; ?>
                        @elseif ($ped->pres_req == "DSP")
                            <?php $uni = "displays"; ?>
                        @else
                            <?php $uni = "piezas"; ?>
                        @endif

                        @if (!empty($ped->quantity))
                            @if( $ped->pres_req == "BOX")
                                <?php $cantT = ($ped->quantity / $ped->product->items_per_display) / $ped->product->display_per_box; ?>
                            @elseif ($ped->pres_req == "DSP")
                                <?php $cantT = ($ped->quantity / $ped->product->items_per_display); ?>
                            @else
                                <?php $cantT = $ped->quantity; ?>
                            @endif
                        @endif
                         <tr>
                            <td style="text-align: center;">
                        @if ( !empty($ped->quantity_op_boss))
                            @if( $ped->pres_req == "BOX")
                                <?php $cantB = ($ped->quantity_op_boss / $ped->product->items_per_display) / $ped->product->display_per_box; ?>
                            @elseif ($ped->pres_req == "DSP")
                                <?php $cantB = ($ped->quantity_op_boss / $ped->product->items_per_display); ?>
                            @else
                                <?php $cantB = $ped->quantity_op_boss; ?>
                            @endif
                        @endif
                                <input type="hidden" id="cantU{{ $ped->id }}" value="
                                @if (empty($cantB))
                                    0
                                @else
                                    {{ $cantB }}
                                @endif">
                                <span id='canti{{ $ped->id }}'>
                                @if ( empty($cantB))
                                    0
                                @else
                                    {{ $cantB }}
                                @endif
                                </span> / {{ $cantT }} {{ $uni }}
                            </td>
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td>
                                No hay detalles que mostrar
                            </td>
                        </tr>
            @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('final')
<script type="text/javascript">
    function registraCaja(orden, caja){
        $( '#overlay' ).show();
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.agregar.caja') }}",
                dataType : 'json',
                data     : {
                    pedido : orden,
                    caja   : caja
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
        $('[data-toggle="tooltip"]').tooltip();

        $( '.addBoxEvent' ).keyup(function(e){
                if(e.keyCode == 13) {
                    registraCaja(
                        $(this).attr('data-id'),
                        $(this).val()
                    );
                }
            }
        );
    });
</script>
@endsection
