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
                            <th scope="col" style="min-width: 270px;">
                                Fecha estimada
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                Caja o Tarima
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                Validar
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
                                {{ $tp->brand }} - {{ $tp->model }}
                            </td>
                            <td>
                                {{ $tp->plates }}
                            </td>
                            <td>
                                {{ $tp->arrive_date }}
                            </td>
                            <td>
                                <input class="codigines form-control"
                                    onkeypress="return runScript(
                                    event,{{ $tp->id }})"
                                    id="cod{{ $tp->id }}"
                                    placeholder="C&oacute;digo de caja o tarima">
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-danger validaViaje"
                                        data-id="{{ $tp->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Eliminar">
                                    <i class="material-icons">done_all</i>
                                </button>
                            </td>
                        </tr>
            @endforeach
            @if (count($trips) === 0)
                        <tr style="text-align: center;">
                            <td colspan="6">
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
    <script type="text/javascript">

        $(document).ready(function () {
            
            $(".validaViaje").click(function() {

                //alert($(this).attr( "data-id" ));

                  var parametros = [];
                    parametros["id"] = $(this).attr( "data-id" );
                     abrirConfirmacion(
                        "Confirmaci&oacute;n",
                        "¿Estás seguro de que deseas validar este viaje?",
                        "{{ route('trips.cerrar') }}",
                        parametros
                    );

            });

        });
    </script>
@endsection