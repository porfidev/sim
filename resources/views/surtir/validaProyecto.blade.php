@extends('layouts.sim')

@section('content')

<meta name="csrf-token" content="{{ csrf_token() }}">
    <br>
    <h2 class="mt-2" style="text-align: center;">
        <button class="btn btn-sm btn-secondary atrasPed"
                data-toggle="tooltip"
                data-placement="top"
                title="Regresar">
            <i class="material-icons">reply</i>
        </button>

        Pedido: #{{ $cod }}

        @if($statusPed < 4)
        <button class="btn btn-sm btn-success cierraPed"
                data-toggle="tooltip"
                data-placement="top"
                data-id="{{ $idP }}"
                title="Cerrar pedido">
            <i class="material-icons">offline_pin</i>
        </button>
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
                            <td style="text-align: center;" colspan=2>
                                @if( !empty($ped->nom ))
                                    {{ $ped->nom }} 
                                @else
                                    {{ $ped->con }} 
                                @endif

                            </td>
                        </tr><tr>
                            <td style="text-align: center;">
                                {{ $ped->itemcode }}
                            </td>
                            <td style="text-align: center;">
                                <?php $cantU = 0; $cantT = 0; $cantB =0; ?>
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
                                @if ( empty($ped->quantity_user))

                                        0
                        
                                    @endif

                                    @if ( !empty($ped->quantity_user))

                                        @if( $ped->pres_req == "BOX")

                                     <?php  $cantU = ($ped->quantity_user / $ped->itemsDisp) / $ped->dispBox;
                                            $cantT = ($ped->quantity / $ped->itemsDisp) / $ped->dispBox;
                                            $cantB = ($ped->quantity_boss / $ped->itemsDisp) / $ped->dispBox; ?>

                                        @elseif ($ped->pres_req == "DSP")

                                     <?php  $cantU = ($ped->quantity_user / $ped->itemsDisp);
                                            $cantT = ($ped->quantity / $ped->itemsDisp);
                                            $cantB = ($ped->quantity_boss / $ped->itemsDisp); ?>

                                        @else

                                      <?php $cantU = $ped->quantity_user;
                                            $cantT = $ped->quantity;
                                            $cantB = $ped->quantity_boss; ?>

                                        @endif

                                        {{ $cantU }}
                        
                                    @endif

                                     / {{ $cantT }}
                                

                            </td>
                        </tr>
                            <td style="text-align: center;" colspan=2>
                                

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
                                    
                                </span> / {{ $cantT }}
                            </td>
                        </tr><tr>
                            <td style="text-align: center;" colspan=2>
                                @if( $ped->sta < 4)
                                <div class="form-group">
                                    <input class="codigines form-control"
                                        onkeypress="return runScript(
                                        event,
                                    {{ $ped->id }},
                                    {{ $ped->quantity }},
                                    @if ( empty($ped->quantity_boss))
                                            0
                                        @endif

                                        @if ( !empty($ped->quantity_boss))
                                            {{ $ped->quantity_boss }}
                                        @endif
                                        ,
                                    '{{ $ped->itemcode }}',
                                    '{{ $ped->pres_req }}',
                                    {{ $ped->itemsDisp }},
                                    {{ $ped->dispBox }})"
                                    id="cod{{ $ped->id }}">
                                </div>
                                @endif
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
                        "¿Estás seguro de que deseas cerrar este pedido?",
                        "{{ route('surtir.cierraPedJ') }}",
                        parametros
                    );

            });

            $(".atrasPed").click(function() {

                  location.href = " {{ route('listadoPedidosJefe') }} ";

            });

        });  

        


        function runScript(e,id,cantidad,cantUsu,skus,presReq,disp,box) {

            presReq = (presReq == undefined)?"":presReq;

            //alert("id: "+id+" cantidad: "+cantidad+" cantaJefe: "+cantUsu+" sku: "+skus);

            cantUsu = $("#cantU"+id).val();

            if (e.keyCode == 13) {

                var codigo = $("#cod"+id).val();

                if(codigo == ""){

                    alert("codigo vacio");
                    return;
                }
        
                console.log("entro, id: "+id+", codigo: "+codigo+" cantidad: "+cantidad+" cantUsu: "+cantUsu+" sku: "+skus);

                $("#cod"+id).val("");

                $.ajax({
                    url     : "{{ URL::to('addDetJ') }}",
                    method  : "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data    : {
                        idDet  : id,
                        sku    : skus,
                        cod    : codigo,
                        cant   : cantidad,
                        cantU  : cantUsu
                              }
                }).done(function( data ) {

                    if(data.resultado == "ERROR"){

                        alert(data.mensajes);
                        return;

                    }

                    cantUser = 0;

                    if(presReq == "BOX"){
                            
                        cantUser = (data.resultado / disp) / box;

                    }else if(presReq == "DSP"){

                        cantUser = (data.resultado / disp);

                    }else{

                        cantUser = data.resultado;
                    }

                    console.log("Datitos regreso: "+data.resultado);

                    $("#canti"+id).html(cantUser);
                    $("#cantU"+id).val(cantUser);

                });

                return false;
            }
        }

    </script>
@endsection