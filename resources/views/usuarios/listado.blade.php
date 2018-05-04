@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Usuarios</h2>
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
                            <th scope="col" style="min-width: 270px;">
                                Nombre
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                Correo electr&oacute;nico
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Estatus
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoUsuario"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">add</i>
                                </button>
                            </th>
                        </tr>
                        <tr class="table-dark">
                            <th>
                                <input type="text" class="form-control" value="#">
                            </th>
                            <th>
                                <input type="text" class="form-control" value="Nombre">
                            </th>
                            <th>
                                <input type="text" class="form-control" value="Correo">
                            </th>
                            <th>
                                <select class="form-control">
                                    <option> --- Todos --- </option>
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>
                                </select>
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
            @foreach ($listado as $user)
                        <tr>
                            <td style="text-align: center;">
                                {{ $user->id }}
                            </td>
                            <td>
                                {{ $user->name }}
                            </td>
                            <td>
                                {{ $user->email }}
                            </td>
                            <td style="text-align: center;">
                    @if ($user->status == 0)
                                <span class="text-danger font-weight-bold">Inactivo</span>
                    @elseif ($user->status == 1)
                                <span class="text-success font-weight-bold">Activo</span>
                    @endif
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">mode_edit</i>
                                </button>
                            </td>
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="5">
                                No hay usuarios que mostrar
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
    @include('usuarios.modalNuevo')
    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@endsection