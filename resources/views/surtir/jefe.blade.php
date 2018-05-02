@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Pedidos</h2>
    <br>
    <div class="card">
        <div class="card-body">
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
                                Fecha de Entrega
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
                                    <option> --- Todos --- </option>
                                    <option>En espera</option>
                                    <option>En proceso</option>
                                    <option>Por validar</option>
                                    <option>Surtido</option>
                                </select>
                            </th>
                            <th>
                                <input type="date" class="form-control">
                            </th>
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
                        <tr>
                            <td style="text-align: center;">
                                2356
                            </td>
                            <td>
                                Sears
                            </td>
                            <td>
                                <ul>
                                    <li>
                                        Nombre Apellido Paterno 1
                                    </li>
                                    <li>
                                        Nombre Apellido Paterno 4
                                    </li>
                                </ul>
                            </td>
                            <td style="text-align: center;">
                                En proceso
                            </td>
                            <td style="text-align: center;">
                                12/05/2018
                            </td>
                            <td style="text-align: center;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                2380
                            </td>
                            <td>
                                Liverpool
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td style="text-align: center;">
                                En espera
                            </td>
                            <td style="text-align: center;">
                                12/05/2018
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-primary creacionEquipo"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Asignar equipo de trabajo">
                                    <i class="material-icons">add_shopping_cart</i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                2390
                            </td>
                            <td>
                                Home Depot
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td style="text-align: center;">
                                En espera
                            </td>
                            <td style="text-align: center;">
                                12/05/2018
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-primary creacionEquipo"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Asignar equipo de trabajo">
                                    <i class="material-icons">add_shopping_cart</i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                2392
                            </td>
                            <td>
                                Oxxo
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td style="text-align: center;">
                                En espera
                            </td>
                            <td style="text-align: center;">
                                12/05/2018
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-primary creacionEquipo"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Asignar equipo de trabajo">
                                    <i class="material-icons">add_shopping_cart</i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('final')

    @include('surtir.modalTrabajadores')
    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@endsection