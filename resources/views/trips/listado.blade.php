@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Viajes</h2>
    <br>
    <div class="card">
        <div class="card-body">
            {{ $trips->links('pagination.default') }}
            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                #
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                Camion
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                Placa
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevoViaje"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">add</i>
                                </button>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
            @foreach ($trips as $tp)
                        <tr>
                            <td style="text-align: center;">
                                {{ $tp->id }}
                            </td>
                            <td>
                                {{ $tp->truck->brand }} - {{ $tp->truck->model }}
                            </td>
                            <td>
                                {{ $tp->truck->plates }}
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-danger borrarViaje"
                                        data-id="{{ $tp->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Eliminar">
                                    <i class="material-icons">delete</i>
                                </button>
                            </td>
                        </tr>
            @endforeach
            @if (count($trips) === 0)
                        <tr style="text-align: center;">
                            <td colspan="4">
                                No hay viajes que mostrar
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

            

        });
    </script>
@endsection