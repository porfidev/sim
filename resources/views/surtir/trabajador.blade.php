@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Tareas Asignadas</h2>
    <br>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"> Pedido: 1235 </h5>
            <h6 class="card-subtitle text-muted"> Cliente: Liverpool </h6>
            <div class="input-group mb-3 mt-3">
                <input type="text"
                        class="form-control"
                        placeholder="Clave o producto"
                        aria-label="Clave o producto"
                        aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-primary"
                            type="button">
                        Agregar
                    </button>
                </div>
            </div>
            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">
                                Clave
                            </th>
                            <th scope="col">
                                Producto
                            </th>
                            <th scope="col">
                                Cantidad
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                ACT-0101
                            </td>
                            <td>
                                PALOMITAS CARAMELO
                            </td>
                            <td>
                                0 de 20
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ACT-0102
                            </td>
                            <td>
                                PALOMITAS NATURAL
                            </td>
                            <td>
                                0 de 20
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ACT-0103
                            </td>
                            <td>
                                PALOMITAS MANTEQUILLA
                            </td>
                            <td>
                                0 de 20
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ACT-0104
                            </td>
                            <td>
                                PALOMITAS MANTEQUILLA EXTRA
                            </td>
                            <td>
                                0 de 20
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
