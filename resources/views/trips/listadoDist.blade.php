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
                <table class="table table-striped table-fixed mb-0">
                    <thead>
                        <tr class="table-secondary">
                            <th>
                                <h5>Pedidos en Etapa de Preparado Validado</h5>
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
                            <th scope="col"
                                class="col-sm-2">
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
                    <tbody>
                @foreach ($preDist as $pedido)
                        <tr>
                            <td class="col-sm-1">
                                {{ $pedido->codeOrder }}
                            </td>
                            <td class="col-sm-3">
                                {{ $pedido->client->name }}
                            </td>
                            <td class="col-sm-2">
                                Preparado Validado
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
                                    data-content="<ul style='padding-left: 20px;'><li>Prioridad: {{ $pedido->calculation->P }}</li>
                                                 <li>Dificultad del pedido: {{ $pedido->calculation->D }}</li>
                                                 <li>Vigencia: {{ $pedido->calculation->V }}</li></ul>">
                                {{ $pedido->calculation->priority }}
                                </button>
                            </td>
                            <td class="col-sm-1" style="text-align: center;">
                                <button type="button"
                                    class="btn btn-sm btn-primary recibePed"
                                    data-id="{{ $pedido->id }}">
                                    Recibir
                                </button>
                            </td>
                        </tr>
                @endforeach
                @if (count($preDist) === 0)
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
                            <th scope="col" class="col-sm-10">
                                <h5>Pedidos en Etapa de Distribuci&oacute;n</h5>
                            </th>
                            <th scope="col" class="col-sm-2">
                                <button type="button"
                                    class="btn btn-sm btn-primary text-white nuevoViaje"
                                    role="button">
                                Nuevo viaje
                                </button>
                            </th>
                        </tr>
                        <tr>
                            <th scope="col" style="text-align: center;"
                                class="col-sm-1">
                                #
                            </th>
                            <th scope="col"
                                class="col-sm-2">
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
                                class="col-sm-2">
                                Acci&oacute;n
                            </th>
                        </tr>
                    </thead>
                    <tbody class="size-2">
                            @foreach ($dist as $pedido)
                            <tr>
                                <td class="col-sm-1">
                                    {{ $pedido->codeOrder }}
                                </td>
                                <td class="col-sm-2">
                                    {{ $pedido->client->name }}
                                </td>
                                <td class="col-sm-2">
                                    Distribuci&oacute;n recibido
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
                                        data-content="<ul style='padding-left: 20px;'><li>Prioridad: {{ $pedido->calculation->P }}</li>
                                                 <li>Dificultad del pedido: {{ $pedido->calculation->D }}</li>
                                                 <li>Vigencia: {{ $pedido->calculation->V }}</li></ul>">
                                        {{ $pedido->calculation->priority }}
                                    </button>
                                </td>
                                <td class="col-sm-2" style="text-align: center;">
                                    <input type="checkbox" 
                                           class="checkEsp" 
                                           style="margin-top: 5%;" 
                                           data-id="{{$pedido->id}}" 
                                           data-cita="{{$pedido->client_appointment}}"
                                           data-citaB="{{$pedido->client->appointment}}">
                                </td>
                            </tr>
                    @endforeach
                    @if (count($dist) === 0)
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

@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')
    @include('trips.modalNuevo')

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();

            $(".recibePed").click(function() {

                //alert($(this).attr( "data-id" ));

                  var parametros = [];
                    parametros["id"] = $(this).attr( "data-id" );
                     abrirConfirmacion(
                        "Confirmaci&oacute;n",
                        "¿Estás seguro de que deseas recibir este pedido?",
                        "{{ route('trips.recibir') }}",
                        parametros
                    );

            });
        });
    </script>
@endsection