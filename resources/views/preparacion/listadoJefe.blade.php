@extends('layouts.sim')

@section('content')
    <br>
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
    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped table-fixed mb-0">
                    <thead>
                        <tr class="table-secondary">
                            <th>
                                <h5>Pedidos en Etapa de Surtido</h5>
                            </th>
                        </tr>
                        <tr>
                            <th scope="col" style="text-align: center;"
                                class="col-1">
                                #
                            </th>
                            <th scope="col"
                                class="col-3">
                                Cliente
                            </th>
                            <th scope="col"
                                class="col-2">
                                Estatus
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-2">
                                Inicio de Vigencia
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-2">
                                Fin de Vigencia
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-1">
                                Prioridad
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-1">
                                Acci&oacute;n
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                @foreach ($anteriores as $pedido)
                        <tr>
                            <td class="col-sm-1">
                                {{ $pedido->codeOrder }}
                            </td>
                            <td class="col-sm-3">
                                {{ $pedido->client->name }}
                            </td>
                            <td class="col-sm-2">
                        @if ($pedido->status == \App\Repositories\OrderRepository::SURTIDO_PROCESO)
                                En Proceso de Surtido
                        @endif

                        @if ($pedido->status == \App\Repositories\OrderRepository::SURTIDO_POR_V)
                                Por Validar Surtido
                        @endif

                        @if ($pedido->status == \App\Repositories\OrderRepository::SURTIDO_VALIDO)
                                Surtido
                        @endif
                            </td>
                            <td class="col-sm-2" style="text-align: center;">
                                {{ $pedido->start }}
                            </td>
                            <td class="col-sm-2" style="text-align: center;">
                                {{ $pedido->end }}
                            </td>
                            <td class="col-sm-1" style="text-align: center;">
                                <button type="button" 
                                    class="btn btn-sm btn-info text-white popoverEsp"
                                    role="button"
                                    data-toggle="popover"
                                    data-html="true"
                                    title="<div style='text-align:center;width:100$'>C&aacute;lculos</div>"
                                    data-content="<ul><li>Prioridad: {{ $pedido->calculation->P }}</li>
                                                 <li>Dificultad: {{ $pedido->calculation->D }}</li>
                                                 <li>Vigencia: {{ $pedido->calculation->V }}</li></ul>">
                                {{ $pedido->calculation->priority }}
                                </button>
                            </td>
                            <td class="col-sm-1" style="text-align: center;">
                        @if ($pedido->status == 4)
                                <button type="button"
                                    class="btn btn-sm btn-primary recibirSurtido"
                                    data-id="{{ $pedido->id }}">
                                    Recibir
                                </button>
                        @endif
                            </td>
                        </tr>
                @endforeach
                @if (count($anteriores) === 0)
                        <tr>
                            <td style="text-align: center;"
                                class="col">
                                No hay pedidos que mostrar
                            </td>
                        </tr>
                @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped table-fixed">
                    <thead>
                        <tr class="table-secondary">
                            <th class="col-12">
                                <h5>Pedidos en Etapa de Preparaci&oacute;n</h5>
                            </th>
                        </tr>
                        <tr>
                            <th scope="col" style="text-align: center;"
                                class="col-sm-1">
                                #
                            </th>
                            <th scope="col"
                                class="col-sm-3">
                                Cliente
                            </th>
                            <th scope="col" class="col-sm-2">
                                Estatus
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-sm-2">
                                Inicio de Vigencia
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-sm-2">
                                Fin de Vigencia
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-sm-1">
                                Prioridad
                            </th>
                            <th scope="col" style="text-align: center;"
                                class="col-sm-1">
                                Acci&oacute;n
                            </th>
                        </tr>
                    </thead>
                    <tbody class="size-2">
                            @foreach ($listado as $pedido)
                            <tr>
                                <td class="col-1">
                                    {{ $pedido->codeOrder }}
                                </td>
                                <td class="col-3">
                                    {{ $pedido->client->name }}
                                </td>
                                <td class="col-2">
                            @if ($pedido->status == \App\Repositories\OrderRepository::PREPARADO_RECIBIDO)
                                    Recibido en Preparaci&oacute;n
                            @endif

                            @if ($pedido->status == \App\Repositories\OrderRepository::PREPARADO_DISENIO)
                                    Por validar Dise&ntilde;o
                            @endif

                            @if ($pedido->status == \App\Repositories\OrderRepository::PREPARADO_ESPERA)
                                    En espera de Preparaci&oacute;n
                            @endif

                            @if ($pedido->status == \App\Repositories\OrderRepository::PREPARADO_PROCESO)
                                    En proceso de Preparaci&oacute;n
                            @endif

                            @if ($pedido->status == \App\Repositories\OrderRepository::PREPARADO_POR_V)
                                    Por validar Preparaci&oacute;n
                            @endif

                            @if ($pedido->status == \App\Repositories\OrderRepository::PREPARADO_VALIDADO)
                                    Validado
                            @endif
                                </td>
                                <td class="col-2" style="text-align: center;">
                                    {{ $pedido->start }}
                                </td>
                                <td class="col-2" style="text-align: center;">
                                    {{ $pedido->end }}
                                </td>
                                <td class="col-1" style="text-align: center;">                                  
                                    <button type="button" 
                                    class="btn btn-sm btn-info text-white popoverEsp"
                                    role="button"
                                    data-toggle="popover"
                                    data-html="true"
                                    title="<div style='text-align:center;width:100$'>C&aacute;lculos</div>"
                                    data-content="<ul><li>Prioridad: {{ $pedido->calculation->P }}</li>
                                                 <li>Dificultad: {{ $pedido->calculation->D }}</li>
                                                 <li>Vigencia: {{ $pedido->calculation->V }}</li></ul>">
                                    {{ $pedido->calculation->priority }}
                                    </button>
                                </td>                                
                                <td class="col-1" style="text-align: center;">
                                    @if($pedido->status == 12)
                                    <button class="btn btn-sm btn-success mostrarTareasPorDetalle"
                                            data-id="{{ $pedido->id }}"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Asignar personal">
                                        <i class="material-icons">person_add</i>
                                    </button>
                                    @endif
                                    <button class="btn btn-primary btn-sm cargaCSVReparto"
                                            data-id="{{ $pedido->id }}"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="subir reparto">
                                        <i class="material-icons">file_upload</i>
                                    </button>
                                </td>
                            </tr>
                    @endforeach
                    @if (count($listado) === 0)
                            <tr>
                                <td class="col" style="text-align: center;">
                                    No hay pedidos que mostrar
                                </td>
                            </tr>
                    @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade"
    id="CSVModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="listaModalTitle"
    aria-hidden="true">

    {{
        Form::open(
            array(
                'url'    => 'preparacion/CSVReparto',
                'id'     => 'CsvForm',
                'method' => 'POST',
                'enctype'=> 'multipart/form-data'
            )
        )
    }}
    <!-- MODAL PARA CSV -->
    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="listaModalTitle">
                        Archivo CSV
                </h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file"
                            name="CSVFile3"
                            id="CSVFile3"
                            accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
                            class="custom-file-input">
                        <label class="custom-file-label"
                                id="labelCSV"
                                for="CSVFile3">
                            Selecciona un archivo CSV
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button 
                    type="submit" 
                    class="btn btn-primary">
                    Guardar
                </button>
                <button type="button"
                    id="btnCerrar"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cerrar
                </button>
            </div>
        </div>
    </div>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    @include('preparacion.modalTareas')

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();

            $(".cargaCSVReparto").click(function () {
                $( "#labelCSV" ).text('Seleccina un archivo CSV');
                $( "#CSVModal" ).modal({
                    keyboard : false,
                    backdrop : 'static'
                });
            });

            $( "#CSVFile3" ).change(function () {
                $( "#labelCSV" ).text($( "#CSVFile3" ).val().replace(/C:\\fakepath\\/i, ''));
            });      

            $( '.recibirSurtido' ).click(function () {
                var parametros = [];
                parametros["id"] = $(this).attr("data-id");
                abrirConfirmacion(
                    'Recibir Pedido',
                    'Favor de verificar que la mercancía sea la correcta y corresponde al pedido. ¿Deseas recibir los productos?',
                    '{{ route("preparacion.recibir") }}',
                    parametros
                );
            });
        });
    </script>
@endsection