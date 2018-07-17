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
                            <th colspan="3" style="text-align: center;">
                                <h5>Mis pedidos</h5>
                            </th>
                        </tr>
                        <tr>
                            <th style="text-align: center;">
                                #
                            </th>
                            <th>
                                Cliente
                            </th>
                            <th style="text-align: center;">
                                Acci&oacute;n
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                @foreach ($listadoU as $pedido)
                        <tr>
                            <td>
                                {{ $pedido->order->codeOrder }}
                            </td>
                            <td>
                                {{ $pedido->cliente->name }}
                            </td>
                            <td style="text-align: center;">
                            @if ($pedido->client_status == 1)
                                <button type="button"
                                    class="btn btn-sm btn-primary arreglarCliente"
                                    data-name="{{ $pedido->cliente->name }}"
                                    data-id="{{ $pedido->client_id }}"
                                    data-code="{{ $pedido->cliente->code }}"
                                    data-p="{{ $pedido->cliente->P }}"
                                    data-tienda="{{ $pedido->cliente->shops }}"
                                    data-sku="{{ $pedido->cliente->sku }}"
                                    data-d2="{{ $pedido->cliente->D2 }}"
                                    data-tp="{{ $pedido->cliente->TP }}"
                                    data-te="{{ $pedido->cliente->TE }}"
                                    data-idPed="{{ $pedido->order->id }}"
                                    data-promedio="{{ $pedido->cliente->average }}"
                                    data-nombre="{{ $pedido->cliente->name }}"
                                    data-appo="{{ $pedido->cliente->appointment }}">
                                    Cliente
                                </button>
                            @endif
                            @if ($pedido->cat_status == 1)
                                <button type="button"
                                    class="btn btn-sm btn-primary arreglarCatalogo"
                                    data-id="{{ $pedido->cat_id }}"
                                    data-etiqueta="{{ $pedido->distance->label }}"
                                    data-valor="{{ $pedido->distance->value }}">
                                    Distancia
                                </button>
                            @endif
                            </td>
                        </tr>
                @endforeach
                @if (count($listadoU) === 0)
                        <tr>
                            <td style="text-align: center;" colspan="3">
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
                <table class="table table-striped">
                    <thead>
                        <tr class="table-secondary">
                            <th colspan="3" style="text-align: center;">
                                <h5>Pedidos pendientes</h5>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                #
                            </th>
                            <th>
                                Cliente
                            </th>
                            <th style="text-align: center;">
                                Acci&oacute;n
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                            @foreach ($listado as $pedido)
                            <tr>
                                 <td>
                                    {{ $pedido->order->codeOrder }}
                                </td>
                                <td>
                                    {{ $pedido->cliente->name }}
                                </td>
                                <td style="text-align: center;">
                                    <button type="button"
                                        class="btn btn-sm btn-primary apartaPedido"
                                        data-id="{{ $pedido->id }}"
                                        data-pedido="{{ $pedido->order->id }}">
                                        Apartar
                                    </button>
                                </td>
                            </tr>
                    @endforeach
                    @if (count($listado) === 0)
                            <tr>
                                <td colspan="3" style="text-align: center;">
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
    @include('pendings.modalEditar')
    @include('pendings.modalEditarDist')

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();

            $( '.apartaPedido' ).click(function () {
                var parametros = [];
                parametros["id"] = $(this).attr("data-id");
                parametros["idP"] = $(this).attr("data-pedido");
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro que deseas apartar este pedido?",
                    "{{ route('pendiente.apartar') }}",
                    parametros
                );
            });
           
        });
    </script>
@endsection