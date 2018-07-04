@extends('layouts.sim')

@section('content')

<meta name="csrf-token" content="{{ csrf_token() }}">
    <div class="card">
        <div class="card-body pl-0 pr-0 pb-0 pt-3">
            {{ $listado->links('pagination.default') }}
            <div class="table-responsive">
                <table class="table table-striped">

                    <tbody>
                        @foreach ($listado as $ped)
                        <tr>
                            <td style="text-align: center;" class="table-primary">
                                <div class="row">
                                    <div class="col">
                                        Pedido: #{{ $ped->codeOrder }}
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-sm btn-success cierraPed btnCierra{{ $ped->idOrdW }}"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                data-id="{{ $ped->idOrdW }}"
                                                title="Cerrar pedido">
                                            <i class="material-icons">offline_pin</i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="proAssi"
                                data-id="{{ $ped->id }}"
                                id="prod{{ $ped->id }}"
                                style="text-align: center;">
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
                //console.log(status);
                $.ajax({
                    url     : "{{ URL::to('pedidos/listaAsig') }}",
                    method  : "POST",
                    headers : {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data    : {
                        ord : idOrd
                    }
                }).done(function( data ) {

                    //console.log(data);
                    var tt = "<table style='width:100%;'>";

                    data.forEach(function(element) {

                        var cantUsr = (((element.quantity_user) == null)?0:element.quantity_user);

                        var cantTotal = 0;
                        var cantUser  = 0;
                        var etiqueta  = "Piezas";

                        if(element.pres_req == "BOX") {
                            etiqueta  = "Cajas"
                            cantTotal = (element.quantity / element.itemsDisp) / element.dispBox;
                            cantUser  = (cantUsr / element.itemsDisp) / element.dispBox;

                        } else if(element.pres_req == "DSP") {
                            etiqueta  = "Displays"
                            cantTotal = (element.quantity / element.itemsDisp);
                            cantUser  = (cantUsr / element.itemsDisp);

                        } else {
                            cantTotal = element.quantity;
                            cantUser  = cantUsr;

                        }

                        //console.log(element.sta);

                        if(element.nom == null) {
                            tt += "<tr><td colspan=2 class=\"table-dark\">"+element.con+"</td></tr>";
                        } else {
                            tt += "<tr><td colspan=2 class=\"table-dark\">"+element.nom+"</td></tr>";
                        }

                        tt += "<tr><td style='width:50%;'>"+element.itemcode+"</td>"+
                              "<td style='width:50%;'><span id='canti"+element.id+"'>"+cantUser+
                              "</span> / "+cantTotal + " " + etiqueta + "<input type='hidden' value='"+cantUsr+"' id='cantiU"+element.id+"'></td></tr>";

                        if(element.sta > 2){
                            //tt += ' style="display:none;"></td></tr>';
                            $(".btnCierra"+element.idD).hide();
                        } else {
                            tt += '<tr><td colspan=2 style="text-align:center;"><input class="form-control codigines codeSku'+element.idD+'" '+
                              'onkeypress="return runScript(event,'+element.id+','+element.quantity+','+cantUsr+
                              ',\''+element.itemcode+'\''+',\''+element.pres_req+'\','+element.itemsDisp+','+element.dispBox+')"'+
                              ' id="cod'+element.id+'" ';
                            tt += '></td></tr>';
                        }
                    });
                    tt += "</table>";
                    $("#prod"+idOrd).html(tt);
                });
            });

            var codEsp = "";
            $(".cierraPed").click(function() {
                var parametros = [];
                parametros["id"] = $(this).attr( "data-id" );
                parametros["borra"] = $(this).attr( "data-id" );
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro de que deseas cerrar este pedido?",
                    "{{ route('surtir.cierraPed') }}",
                    parametros
                );
            });
        });


        function runScript(e,id,cantidad,cantUsu,skus,presReq,disp,box) {

            presReq = (presReq == undefined)?"":presReq;

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

                    cantUser = 0;

                    console.log("Datitos regreso: "+data.resultado);

                    if(presReq == "BOX") {
                        cantUser = (data.resultado / disp) / box;
                    } else if(presReq == "DSP") {
                        cantUser = (data.resultado / disp);
                    } else {
                        cantUser = data.resultado;
                    }

                    $("#canti"+id).html(cantUser);
                    $("#cantiU"+id).val(data.resultado);

                    if(data.cerrado != 0){
                        alert(data.mensajes);
                        $(".btnCierra"+data.cerrado).hide();
                        $(".codeSku"+data.cerrado).hide();
                    }
                });
                return false;
            }
        }
    </script>
@endsection