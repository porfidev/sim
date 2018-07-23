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
                            <th colspan="10" style="text-align: center;">
                                <h5>Camiones</h5>
                            </th>
                        </tr>
                        <tr>
                            <th style="text-align: center;">
                                Marca
                            </th>
                            <th>
                                Sub-Marca
                            </th>
                            <th>
                                Modelo
                            </th>
                            <th>
                                Placas
                            </th>
                            <th>
                                Capacidad
                            </th>
                            <th>
                                Operador
                            </th>
                            <th>
                                Serie
                            </th>                            
                            <th style="text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoCamion"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">add</i>
                                </button>
                            </th>
                        </tr>
                    </thead>
                    <tbody>

                @foreach ($camiones as $cam)
                        <tr>
                            <td>
                                {{ $cam->brand }}
                            </td>
                            <td>
                                {{ $cam->subBrand }}
                            </td>
                            <td>
                                {{ $cam->model }}
                            </td>
                            <td>
                                {{ $cam->plates }}
                            </td>
                            <td>
                                {{ $cam->capacity }}
                            </td>
                            <td>
                                {{ $cam->operator }}
                            </td>
                            <td>
                                {{ $cam->truck_series }}
                            </td>                            
                            <td>
                                <button class="btn btn-sm btn-success editarCamion"
                                        data-id="{{ $cam->id }}"
                                        data-marca="{{ $cam->brand }}"
                                        data-smarca="{{ $cam->subBrand }}"
                                        data-modelo="{{ $cam->model }}"
                                        data-placas="{{ $cam->plates }}"
                                        data-cap="{{ $cam->capacity }}"
                                        data-ope="{{ $cam->operator }}"
                                        data-serie="{{ $cam->truck_series }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">mode_edit</i>
                                </button>
                                <button class="btn btn-sm btn-danger borrarCamion"
                                        data-id="{{ $cam->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">delete</i>
                                </button>
                            </td>
                        </tr>
                @endforeach
                @if (count($camiones) === 0)
                        <tr>
                            <td style="text-align: center;" colspan="10">
                                No hay camiones que mostrar
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
    @include('camiones.modalNuevo')
    @include('camiones.modalEditar')

    <script type="text/javascript">
        $(document).ready(function () {

            $('[data-toggle="tooltip"]').tooltip();

            $( '.borrarCamion' ).click(function () {
                var parametros = [];
                parametros["id"] = $(this).attr("data-id");
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro de eliminar este cami&oacute;n?",
                    "{{ route('camiones.eliminar') }}",
                    parametros
                );
            });

            
        });
    </script>
@endsection