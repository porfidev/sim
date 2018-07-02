@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Pedidos</h2>
    <br>
    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped table-fixed mb-0">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;"
                                class="col-1">
                                #
                            </th>
                            <th scope="col"
                                class="col-3">
                                Cliente
                            </th>
                            <th scope="col" style="text-align: center;"
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
                        <td style="text-align: center;"
                            class="col">
                            No hay pedidos que mostrar
                        </td>
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
                        <tr>
                            <th scope="col" style="text-align: center;"
                                class="col-1">
                                #
                            </th>
                            <th scope="col"
                                class="col-3">
                                Cliente
                            </th>
                            <th scope="col" style="text-align: center;"
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
                    <tbody class="size-2">
                        <td class="col" style="text-align: center;">
                            No hay pedidos que mostrar
                        </td>
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
        });
    </script>
@endsection