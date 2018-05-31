@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Validaci&oacute;n de Recepci&oacute;n de Mercanc&iacute;a</h2>
    <br>
    <div class="card">
        <div class="card-body">
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>
                            No de Pedido
                        </label>
                        <input type="text"
                            class="form-control"
                            placeholder="No de Pedido"
                            value="345674"
                            disabled>
                    </div>
                    <div class="col">
                        <label>
                            Fecha de entrega
                        </label>
                        <input type="date"
                            class="form-control"
                            placeholder="DD/MM/YYYY"
                            value="2018-10-10"
                            disabled>
                    </div>
                </div>
            </form>
            <div class="table-responsive mt-3">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                #
                            </th>
                            <th scope="col" style="min-width: 250px;">
                                Producto
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Cantidad Solicitada
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Cantidad Recibida
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Lote
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Caducidad
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                Acci&oacute;n
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="table-danger">
                            <td>
                                ACT-0101
                            </td>
                            <td>
                                PALOMITAS CARAMELO
                            </td>
                            <td style="text-align: center;">
                                120
                            </td>
                            <td style="text-align: center;">
                                80
                            </td>
                            <td style="text-align: center;">
                                543223
                            </td>
                            <td style="text-align: center;">
                                12/05/2020
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-info">
                                    <i class="material-icons">zoom_in</i>
                                </button>
                            </td>
                        </tr>
                        <tr class="table-danger">
                            <td>
                                BAL-0102
                            </td>
                            <td>
                                CACAHUATE ACARAMELADO
                            </td>
                            <td style="text-align: center;">
                                220
                            </td>
                            <td style="text-align: center;">
                                100
                            </td>
                            <td style="text-align: center;">
                                5097523
                            </td>
                            <td style="text-align: center;">
                                20/04/2019
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-info">
                                    <i class="material-icons">zoom_in</i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                BRE-0106
                            </td>
                            <td>
                                CERECETS
                            </td>
                            <td style="text-align: center;">
                                150
                            </td>
                            <td style="text-align: center;">
                                150
                            </td>
                            <td style="text-align: center;">
                                65427523
                            </td>
                            <td style="text-align: center;">
                                18/06/2021
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-info">
                                    <i class="material-icons">zoom_in</i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection