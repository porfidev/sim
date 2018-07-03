@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Catalogos</h2>
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
                            <th scope="col" style="min-width: 270px;">
                                Descripci&oacute;n
                            </th>
                            <th scope="col" style="min-width: 270px;">
                                width
                            </th>
                            <th scope="col" style="min-width: 220px;">
                                height
                            </th>
                            <th scope="col" style="min-width: 220px;">
                                depth
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                <button class="btn btn-sm btn-primary nuevaCaja"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar">
                                    <i class="material-icons">add</i>
                                </button>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
            @foreach ($listado as $cat)
                        <tr>
                            <td style="text-align: center;">
                                {{ $cat->id }}
                            </td>
                            <td>
                                {{ $cat->description }}
                            </td>
                            <td>
                                {{ $cat->width }}
                            </td>
                            <td>
                                {{ $cat->height }}
                            </td>
                            <td>
                                {{ $cat->depth }}
                            </td>
                            <td style="text-align: center;">                          
                                <button class="btn btn-sm btn-danger borrarBox"
                                        data-id="{{ $cat->id }}"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Editar">
                                    <i class="material-icons">delete</i>
                                </button>
                            </td>
                        </tr>
            @endforeach
            @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="6">
                                No hay cajas que mostrar
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
@include('boxes.modalNuevo')
@include('partials.modalConfirmacion')
    <script type="text/javascript">

        $(document).ready(function () {

            $( '[data-toggle="tooltip"]' ).tooltip();

            $( '.borrarBox' ).click(function () {
                var parametros = [];
                parametros["id"] = $(this).attr("data-id");
                abrirConfirmacion(
                    "Confirmaci&oacute;n",
                    "¿Estás seguro de eliminar esta caja?",
                    "{{ route('cajas.eliminar') }}",
                    parametros
                );
            });
            
        });
    </script>
@endsection