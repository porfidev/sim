@extends('layouts.sim')

@section('content')

<meta name="csrf-token" content="{{ csrf_token() }}">
    <br>
    <h2 class="mt-2">Listado de Pedidos</h2>
    <br>
    <div class="card">
        <div class="card-body">
            {{ $listado->links('pagination.default') }}
            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                #
                            </th>
                            <th scope="col" style="min-width: 250px;">
                                Cliente
                            </th>                            
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Fecha Programada
                            </th>                            
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Prioridad
                            </th>
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Productos
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                Acci&oacute;n
                            </th>
                        </tr>
                        <tr class="table-dark">
                            <th>
                                <input type="text" class="form-control" value="#">
                            </th>
                            <th>
                                <input type="text" class="form-control" value="Cliente">
                            </th>                            
                            <th>
                                <input type="date" class="form-control">
                            </th>
                            <th> &nbsp; </th>
                            <th> &nbsp; </th>
                            <th style="text-align: center;">
                                <button class="btn btn-sm btn-info"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">search</i>
                                </button>

                                <button class="btn btn-sm btn-warning"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Limpiar filtros">
                                    <i class="material-icons">settings_backup_restore</i>
                                </button>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($listado as $ped)
                        <tr>
                            <td style="text-align: center;">
                                {{ $ped->codeOrder }}
                            </td>
                            <td>
                                {{ $ped->name }}
                            </td>
                            <td>
                                {{ $ped->FP }}
                            </td>                             
                            <td>
                                {{ $ped->prio }}
                            </td>
                            <td>
                                <span class="proAssi"
                                    data-id="{{ $ped->id }}" id="prod{{ $ped->id }}">-</span>
                            </td>
                            <td style="text-align: center;"> 
                                <button class="btn btn-sm btn-success cierraPed"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        data-id="{{ $ped->idOrdW }}"
                                        title="Cerrar pedido">
                                    <i class="material-icons">offline_pin</i>
                                </button>
                            </td>                            
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="10">
                                No hay pedidos que mostrar
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

            $(".proAssi").each(function(){

                var idOrd = $(this).attr( "data-id" );

                console.log(status);

                $.ajax({
                    url     : "{{ URL::to('pedidos/listaAsig') }}",
                    method  : "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data    : {
                        ord  : idOrd
                              }
                }).done(function( data ) {

                    //console.log(data);

                    var tt = "<table><tr><th>SKU</th><th>cantidad</th><th>codigo</th></tr>";

                    
                    data.forEach(function(element) {

                        var cantUsr = (((element.quantity_user) == null)?0:element.quantity_user);
                        

                        console.log(element);

                        tt += "<tr><td>"+element.itemcode+"</td>"+
                              "<td><span id='canti"+element.id+"'>"+cantUsr+
                              "</span> / "+element.quantity+"<input type='hidden' value='"+cantUsr+"' id='cantiU"+element.id+"'></td>";

                        tt += '<td><input class="codigines" '+
                              'onkeypress="return runScript(event,'+element.id+','+element.quantity+','+cantUsr+',\''+element.itemcode+'\')"'+
                              ' id="cod'+element.id+'"></td></tr>';
                    
                    
                    });

                    tt += "</table>";

                    $("#prod"+idOrd).html(tt);


                });

            });

            $(".cierraPed").click(function() {

                  var parametros = [];
                    parametros["id"] = $(this).attr( "data-id" );
                     abrirConfirmacion(
                        "Confirmaci&oacute;n",
                        "¿Estás seguro de que deseas cerrar este pedido?",
                        "{{ route('surtir.cierraPed') }}",
                        parametros
                    );

            });

        });  


        function runScript(e,id,cantidad,cantUsu,skus) {

            cantUsu = $("#cantiU"+id).val();

            if (e.keyCode == 13) {

                var codigo = $("#cod"+id).val();

                if(codigo == ""){

                    alert("codigo vacio");
                    return;
                }
        
                console.log("entro, id: "+id+", codigo: "+codigo+" cantidad: "+cantidad+" cantUsu: "+cantUsu+" sku: "+skus);

                $("#cod"+id).val("");

                $.ajax({
                    url     : "{{ URL::to('addDet') }}",
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