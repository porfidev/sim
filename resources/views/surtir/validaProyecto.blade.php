@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2" style="text-align: center;">
        <button class="btn btn-sm btn-secondary atrasPed"
                data-toggle="tooltip"
                data-placement="top"
                title="Regresar">
            <i class="material-icons">reply</i>
        </button>

        Pedido: #{{ $cod }}

        @if($statusPed < \App\Repositories\OrderRepository::SURTIDO_VALIDO)
        <button class="btn btn-sm btn-success cierraPed"
                data-toggle="tooltip"
                data-placement="top"
                data-id="{{ $idP }}"
                id="btnCerrar"
                style="display:block;"
                title="Validar pedido">
            <i class="material-icons">offline_pin</i>
        </button><br><br>
        <div class="form-group">
            <input class="codigines form-control"
                onkeypress="return runScript(
                event,
                {{ $idP }})"
                id="cod{{ $idP }}"
                placeholder="C&oacute;digo de barras">
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
                                @if( !empty($ped->nom ))
                                   {{ $ped->itemcode }} - {{ $ped->nom }} 
                                @else
                                   {{ $ped->itemcode }} - {{ $ped->con }} 
                                @endif

                            </td>
                        </tr>
                                <?php $cantU = 0; $cantT = 0; $cantB =0; $uni = "" ?>
                                @if( $ped->pres_req == "BOX")

                                     <?php  
                                            $uni = "cajas"; ?>

                                @elseif ($ped->pres_req == "DSP")

                                     <?php  
                                            $uni = "displays"; ?>

                                @else

                                      <?php 
                                            $uni = "piezas"; ?>

                                @endif

                                @if ( !empty($ped->quantity))

                                        @if( $ped->pres_req == "BOX")

                                     <?php  
                                            $cantT = ($ped->quantity / $ped->itemsDisp) / $ped->dispBox; ?>

                                        @elseif ($ped->pres_req == "DSP")

                                     <?php  
                                            $cantT = ($ped->quantity / $ped->itemsDisp); ?>

                                        @else

                                      <?php 
                                            $cantT = $ped->quantity; ?>

                                        @endif
                                @endif
                         <tr>
                            <td style="text-align: center;">
                                

                                    @if ( !empty($ped->quantity_boss))

                                        @if( $ped->pres_req == "BOX")

                                     <?php  
                                            $cantB = ($ped->quantity_boss / $ped->itemsDisp) / $ped->dispBox; ?>

                                        @elseif ($ped->pres_req == "DSP")

                                     <?php  
                                            $cantB = ($ped->quantity_boss / $ped->itemsDisp); ?>

                                        @else

                                      <?php 
                                            $cantB = $ped->quantity_boss; ?>

                                        @endif
                        
                                    @endif
                                <input type="hidden" id="cantU{{ $ped->id }}" value="
                                   @if ( empty($cantB))

                                        0
                        
                                    @endif

                                    @if ( !empty($cantB))

                                        {{ $cantB }}
                        
                                    @endif 
                                ">
                                <span id='canti{{ $ped->id }}'>
                                    @if ( empty($cantB))

                                        0
                        
                                    @endif

                                    @if ( !empty($cantB))

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

    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();

            $(".cierraPed").click(function() {

                  var parametros = [];
                    parametros["id"] = $(this).attr( "data-id" );
                     abrirConfirmacion(
                        "Confirmaci&oacute;n",
                        "¿Estás seguro de que deseas validar este pedido?",
                        "{{ route('surtir.cierraPedJ') }}",
                        parametros
                    );

            });

            $(".atrasPed").click(function() {

                  location.href = " {{ route('listadoPedidosJefe') }} ";

            });

        });  

        


        function runScript(e,id) {

            //presReq = (presReq == undefined)?"":presReq;

            //alert("id: "+id);

            //cantUsu = $("#cantU"+id).val();

            if (e.keyCode == 13) {

                var codigo = $("#cod"+id).val();

                if(codigo == ""){

                    alert("codigo vacio");
                    return;
                }
        
                console.log("entro, id: "+id);

                $("#cod"+id).val("");

                $.ajax({
                    url     : "{{ URL::to('addDetJ') }}",
                    method  : "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data    : {
                        idOrd  : id,
                        cod : codigo
                              }
                }).done(function( data ) {

                    if(data.resultado == "ERROR"){

                        alert(data.mensajes);
                        return;

                    }

                    console.log("Datitos regreso: "+data.resultado);

                    $("#canti"+data.resultado.idDet).html(data.resultado.cantEsp);

                    if(data.mensajes == "Terminado"){

                        $("#btnCerrar").show();

                    }

                });

                return false;
            }
        }

    </script>
@endsection