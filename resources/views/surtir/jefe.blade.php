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
                                <input type="text" class="form-control" value="#">
                            </th>
                            <th>
                                <input type="text" class="form-control" value="Cliente">
                            </th>
                            <th> &nbsp; </th>
                            <th>
                                <select class="form-control">
                                    <option value="-1"> --- Todos --- </option>
                                    <option value="1">En espera</option>
                                    <option value="2">En proceso</option>
                                    <option value="3">Por validar</option>
                                    <option value="4">Surtido</option>
                                    <option value="0">Faltan datos</option>
                                </select>
                            </th>
                            <th>
                                <input type="date" class="form-control">
                            </th>
                            <th>
                                <input type="date" class="form-control">
                            </th>
                            <th>
                                <input type="date" class="form-control">
                            </th>
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
                                <a href="#" 
                                   data-toggle="popover" 
                                   title="Calculos" 
                                   data-content="P: {{ $ped->P }} 
                                                 D: {{ $ped->D }} 
                                                 V: {{ $ped->V }}">
                                    {{ $ped->priority }}
                                </a>
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success asignarPersonal"
                                        data-id="{{ $ped->idOrd }}"                                        
                                        data-codeOrd="{{ $ped->codeOrder }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Asignar personal">
                                    <i class="material-icons">person_add</i>
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

    @include('surtir.modalTrabajadores')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('surtir.asignaUsuarios')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover(); 


            

            $(".assiU").each(function(){

                var idOrd = $(this).attr( "data-id" );

                var status = $(this).attr( "data-status" );

                console.log(status);

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

                        console.log(element);

                        tt += element.name;
                              if(status == 1){


                                tt += ' <button class="btn btn-sm btn-danger borrarAsignado"'+
                                        'onclick="desasigna('+element.id+')"'+
                                        'data-toggle="tooltip"'+
                                        'data-placement="top"'+
                                        'title="Eliminar">'+
                                    '<i class="material-icons">delete</i>'+
                                '</button>';
                              }
                        tt += "<br><br>";

                    });

                    $("#assi"+idOrd).html(tt);
                    
                });

            });
        });

        function desasigna(idO) {

            console.log("idAssi: "+idO);

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