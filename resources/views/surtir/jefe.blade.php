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
                                Fecha Inicio
                            </th>
                            <th scope="col" style="min-width: 200px; text-align: center;">
                                Fecha Final
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
                                -
                            </td>
                            <td>
                                {{ $ped->ordStatus }}
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
                            <td>
                                {{ $ped->priority }}
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
    @include('surtir.asignaUsuarios')
    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@endsection