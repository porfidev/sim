@extends('layouts.sim')

@section('content')

<meta name="csrf-token" content="{{ csrf_token() }}">
    <br>
    <h2 class="mt-2">
        Listado de Pedidos
        <button class="btn btn-sm btn-success cierraPed"
                data-toggle="tooltip"
                data-placement="top"
                data-id="{{ $idP }}"
                title="Cerrar pedido">
            <i class="material-icons">offline_pin</i>
        </button>
    </h2>
    <br>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                Sku
                            </th>
                            <th scope="col" style="">
                                Cantidad Trabajador
                            </th>
                            <th scope="col" style="">
                                Cantidad Jefe
                            </th>                              
                            <th scope="col" style="">
                                Codigo
                            </th>
                        </tr>                        
                    </thead>
                    <tbody>
                        @foreach ($listado as $ped)
                        <tr>
                            <td style="text-align: center;">
                                {{ $ped->itemcode }}
                            </td>
                            <td>
                                @if ( empty($ped->quantity_user))

                                        0
                        
                                    @endif

                                    @if ( !empty($ped->quantity_user))

                                        {{ $ped->quantity_user }}
                        
                                    @endif

                                     / {{ $ped->quantity }}

                            </td>
                            <td>
                                {{ $ped->quan }}
                                <span id='canti{{ $ped->id }}'>
                                    @if ( empty($ped->quantity_boss))

                                        0
                        
                                    @endif

                                    @if ( !empty($ped->quantity_boss))

                                        {{ $ped->quantity_boss }}
                        
                                    @endif
                                    
                                </span> / {{ $ped->quantity }}
                            </td>
                            <td>
                                <input class="codigines" 
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
                                '{{ $ped->itemcode }}')"
                                id="cod{{ $ped->id }}">
                            </td>
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="10">
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

        });  


        function runScript(e,id,cantidad,cantUsu,skus) {

            //alert("id: "+id+" cantidad: "+cantidad+" cantaJefe: "+cantUsu+" sku: "+skus);

            //cantUsu = $("#cantiU"+id).val();

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

                    console.log("Datitos regreso: "+data.resultado);

                    $("#canti"+id).html(data.resultado);
                    $("#cantiU"+id).val(data.resultado);

                });

                return false;
            }
        }

    </script>
@endsection