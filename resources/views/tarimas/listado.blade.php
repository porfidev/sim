@extends('layouts.sim')

@section('content')
    @if(Session::has('exito'))
    <div class="alert alert-success alert-dismissible fade show mt-3 mb-2"
        role="alert">
        <button type="button"
            class="close"
            data-dismiss="alert"
            aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
        </button>
        {{{ Session::get('exito') }}}
    </div>
    @endif
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
    <div class="card mb-3 mt-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <thead>
                        <tr class="table-secondary">
                            <th colspan="5" style="text-align: center;">
                                <h5>Tarimas</h5>
                            </th>
                        </tr>
                        <tr>
                            <th style="text-align: center;">
                                #
                            </th>
                            <th>
                                Codigo
                            </th>
                            <th>
                                Pedido id
                            </th>
                            <th>
                                Cajas
                            </th>
                            <th style="text-align: center;">
                                <button class="btn btn-sm btn-primary nuevaTarima"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">add</i>
                                </button>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                @foreach ($tarimas as $tar)
                        <tr>
                            <td>
                                {{ $tar->id }}
                            </td>
                            <td>
                                {{ $tar->code }}
                            </td>
                            <td>
                                <span id="ord{{ $tar->id }}">{{ $tar->order_id}}</span>
                            </td>
                            <td>
                                <span id="cajas{{ $tar->id }}" 
                                      data-id="{{ $tar->id }}" 
                                      class="cajs"></span>
                            </td>
                            <td>
                                <input class="codigines form-control"
                                    onkeypress="return runScript(
                                    event,{{ $tar->id }},{{ $tar->order_id }})"
                                    id="cod{{ $tar->id }}"
                                    placeholder="C&oacute;digo de caja">
                            </td>
                        </tr>
                @endforeach
                @if (count($tarimas) === 0)
                        <tr>
                            <td style="text-align: center;" colspan="3">
                                No hay tarimas que mostrar
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

            $(".cajs").each(function(){

                var idTar = $(this).attr( "data-id" );
                
                $.ajax({
                    url     : "{{ route('tarimas.listaCajas') }}",
                    method  : "POST",
                    headers : {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data    : {
                        tar : idTar
                    }
                }).done(function( data ) {

                    var ter = "<ul>";
                    //console.log(data);
                    var tt = "<table style='width:100%;'>";

                    data.resultado.forEach(function(element) {

                        ter += "<li>"+element.boxId.label+"</li>"
                        
                    });

                    ter = "</ul>";

                    $("#cajas"+idTar).html(ter);
                });
            });

            $( '.nuevaTarima' ).click(function () {
                var parametros = [];
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro de crear una tarima?",
                    "{{ route('tarimas.nuevaTarima') }}",
                    parametros
                );
            });

        });

        function runScript(e,id,ord) {

            if (e.keyCode == 13) {

                var codigo = $("#cod"+id).val();

                if(codigo == ""){

                    alert("codigo vacio");
                    return;
                }
        
                console.log("entro, id: "+id+" id_order: "+ord);

                $("#cod"+id).val("");

                $.ajax({
                    url     : "{{ route('tarimas.asignaTarima') }}",
                    method  : "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data    : {
                        idTar  : id,
                        cod    : codigo,
                        idPed  : ord
                              }

                }).done(function( data ) {

                    if(data.resultado == "ERROR"){

                        alert(data.mensajes);
                        return;

                    }

                    console.log("Datitos regreso: "+data.resultado);

                    $("#ord"+id).html(data.resultado.idOrd);

                    var ter = "<ul>";

                    data.resultado.lista.forEach(function(element) {

                        ter += "<li>"+element.boxId.label+"</li>"

                    });

                    ter = "</ul>";

                    $("#cajas"+id).html(ter);

                });

                return false;
            }
        }
    </script>
@endsection