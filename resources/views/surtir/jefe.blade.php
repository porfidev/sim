@extends('layouts.sim')

@section('content')
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
                            <th scope="col" style="min-width: 270px;">
                                Encargados
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Estatus
                            </th>
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Fecha Programada
                            </th>
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Inicio de Vigencia
                            </th>
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Fin de Vigencia
                            </th>
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Prioridad
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                Acci&oacute;n
                            </th>
                        </tr>
                        <tr class="table-dark">
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaId"
                                        placeholder="#"
                                    @if ( Session::has('sc_id') && Session::get('sc_id') != '0' )
                                        value="{{ Session::get('sc_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formaCliente"
                                        placeholder="cliente"
                                    @if ( Session::has('sc_cliente') && Session::get('sc_cliente') != '-' )
                                        value="{{ Session::get('sc_cliente') }}"
                                    @endif>
                            </th>
                            <th> &nbsp; </th>
                            <th>
                                <input type="hidden" id="grupoSelEsp" value="{{ Session::get('sc_estatus') }}">
                                <select class="form-control" id="grupoEst">
                                    <option value="-1"> --- Todos --- </option>
                                    <option value="1">En espera</option>
                                    <option value="2">En proceso</option>
                                    <option value="3">Por validar</option>
                                    <option value="4">Surtido</option>
                                    <option value="0">Faltan datos</option>
                                </select>
                            </th>
                            <th>
                                <input type="date"
                                       class="form-control inputFiltro"
                                       id="formaFecProg"
                                    @if ( Session::has('sc_fec_prog') && Session::get('sc_fec_prog') != 'NA' )
                                        value="{{ Session::get('sc_fec_prog') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="date" 
                                       class="form-control inputFiltro"
                                       id="formaFecIni"
                                    @if ( Session::has('sc_fec_ini') && Session::get('sc_fec_ini') != 'NA' )
                                        value="{{ Session::get('sc_fec_ini') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="date" 
                                       class="form-control inputFiltro"
                                       id="formaFecFin"
                                    @if ( Session::has('sc_fec_fin') && Session::get('sc_fec_fin') != 'NA' )
                                        value="{{ Session::get('sc_fec_fin') }}"
                                    @endif>
                            </th>
                            <th> &nbsp; </th>
                            <th style="text-align: center;">
                                <button class="btn btn-sm btn-info"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">search</i>
                                </button>

                                <button class="btn btn-sm btn-warning btnLimpiar"
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
                                <span class="assiU" data-status="{{ $ped->ordStatus }}" 
                                    data-id="{{ $ped->idOrd }}" id="assi{{ $ped->idOrd }}">-</span>
                            </td>
                            <td>

                                @if ($ped->ordStatus == 1)
                                    En espera
                                @endif

                                @if ($ped->ordStatus == 2)
                                    En Proceso
                                @endif

                                @if ($ped->ordStatus == 3)

                                    Por validar Surtido
                                @endif

                                @if ($ped->ordStatus == 4)
                                    Surtido
                                @endif

                                @if ($ped->ordStatus == 0)
                                    Faltan datos
                                @endif
                            </td>
                            <td>
                                {{ $ped->FP }}
                            </td>
                            <td>
                                {{ $ped->start }}
                            </td>
                            <td>
                                {{ $ped->end }}
                            </td>
                            <td style="text-align: center;">
                                <a class="btn btn-sm btn-info"
                                    role="button"
                                    data-toggle="popover"
                                    title="C&aacute;lculos"
                                    data-content="P: {{ $ped->P }}
                                                 D: {{ $ped->D }}
                                                 V: {{ $ped->V }}">
                                    {{ $ped->priority }}
                                </a>
                            </td>
                            <td style="text-align: center;">

                                @if ($ped->ordStatus < 2)

                                        <button class="btn btn-sm btn-success asignarPersonal"
                                                data-id="{{ $ped->idOrd }}"                                        
                                                data-codeOrd="{{ $ped->codeOrder }}"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                title="Asignar Personal">
                                            <i class="material-icons">person_add</i>
                                        </button>

                                @endif
                                @if ($ped->ordStatus == 3)

                                    <button class="btn btn-sm btn-success checarProyecto"
                                        data-id="{{ $ped->idOrd }}"                                        
                                        data-codeOrd="{{ $ped->codeOrder }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Validar Pedido">
                                    <i class="material-icons">done_all</i>
                                    </button>
                        
                                @endif
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
    <form id="searchForm"
        method="POST"
        action="{{ route('listadoPedidosJefe') }}">
        {{ csrf_field() }}
        <input type="hidden" name="sc_id"       id="busquedaId"       value="0">
        <input type="hidden" name="sc_cliente"  id="busquedaCliente"  value="-">
        <input type="hidden" name="sc_estatus"  id="busquedaEstatus"  value="-1">
        <input type="hidden" name="sc_fec_prog" id="busquedafecProg"  value="0">
        <input type="hidden" name="sc_fec_ini"  id="busquedafecIni"   value="NA">
        <input type="hidden" name="sc_fec_fin"  id="busquedafecFin"   value="NA">
    </form>
@endsection

@section('final')
   
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('surtir.asignaUsuarios')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">

        function ejecutaBusquedasFiltros() {

            //alert("Fecha: "+$( '#formaFecProg'    ).val());

            $( '#busquedaId'       ).val( $( '#formaId'       ).val() ? $( '#formaId'       ).val() : '0'  );
            $( '#busquedaCliente' ).val( $( '#formaCliente' ).val() ? $( '#formaCliente' ).val() : '-' );
            $( '#busquedaEstatus'    ).val( $( '#grupoEst'    ).val() ? $( '#grupoEst'    ).val() : '-1' );
            $( '#busquedafecProg'    ).val( $( '#formaFecProg'    ).val() ? $( '#formaFecProg'    ).val() : '0'  );
            $( '#busquedafecIni'  ).val( $( '#formaFecIni'  ).val() ? $( '#formaFecIni'  ).val() : 'NA' );
            $( '#busquedafecFin'  ).val( $( '#formaFecFin'  ).val() ? $( '#formaFecFin'  ).val() : 'NA' );
            $( '#searchForm' ).submit();
        }

        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();

            $( '.btnLimpiar' ).click(function () {
                $( '#busquedaId'       ).val( '0'  );
                $( '#busquedaCliente' ).val( '-' );
                $( '#busquedafecProg'    ).val( 'NA'  );
                $( '#busquedafecIni'    ).val( 'NA'  );
                $( '#busquedafecFin'    ).val( 'NA'  );
                $( '#busquedaEstatus'  ).val( '-1' );
                $( '#searchForm' ).submit();
            });

            $( '.inputFiltro' ).keyup(function(e){
                if(e.keyCode == 13) {
                    ejecutaBusquedasFiltros();
                }
            });

            $('#grupoEst').val($('#grupoSelEsp').val());

            $( "#grupoEst" ).change(function() {
                ejecutaBusquedasFiltros();
            });

            $( "#formaFecProg" ).change(function() {
                ejecutaBusquedasFiltros();
            });

            $( "#formaFecIni" ).change(function() {
                ejecutaBusquedasFiltros();
            });

            $( "#formaFecFin" ).change(function() {
                ejecutaBusquedasFiltros();
            });

            $( '#btnBuscar' ).click(ejecutaBusquedasFiltros);

            $(".assiU").each(function(){

                var idOrd = $(this).attr( "data-id" );
                var status = $(this).attr( "data-status" );

                //console.log(status);
                $.ajax({
                    url     : "{{ URL::to('usuarios/listaAsig') }}",
                    method  : "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data    : {
                        ord  : idOrd
                              }
                }).done(function( data ) {
                    //console.log(data);
                    var tt = "";
                    data.forEach(function(element) {
                        //console.log(element);
                        tt += element.name;
                              /*if(status == 1){
                                tt += ' <button class="btn btn-sm btn-danger borrarAsignado"'+
                                        'onclick="desasigna('+element.id+')"'+
                                        'data-toggle="tooltip"'+
                                        'data-placement="top"'+
                                        'title="Eliminar">'+
                                    '<i class="material-icons">delete</i>'+
                                '</button>';
                              }*/
                        tt += "<br><br>";
                    });

                    $("#assi"+idOrd).html(tt);
                });
            });

            $( '.checarProyecto' ).click(function () {
                idPed = $(this).attr( "data-id" );
                window.location.href = "listadoTareasJ/"+idPed;
            });
        });

        function desasigna(idO) {
            //console.log("idAssi: "+idO);
            var parametros = [];
            parametros["id"] = idO;
            abrirConfirmacion(
                "Confirmaci&oacute;n",
                "¿Estás seguro de desasignar este usuario?",
                "{{ route('usuarios.desasignar') }}",
                parametros
            );
        }
    </script>
@endsection