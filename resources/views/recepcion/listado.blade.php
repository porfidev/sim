@extends('layouts.sim')

@section('content')
    <br>
    <h2 class="mt-2">Listado de Ordenes de Compra</h2>
    <br>
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
    <input id="rolcin" type="hidden" value="{{ Session::get('rol') }}">

    <span id="mensajeHist"></span>

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
    <div class="card">
        <div class="card-body">
        
          <!--   {{ $listado->links('pagination.default') }}  -->

            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                #
                            </th>
                            <th scope="col" style="min-width: 250px;">
                                Proveedor
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Estatus
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Fecha de Entrega
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Due Date
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Codigo
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                Acci&oacute;n
                            </th>
                          </tr>
                        <tr class="table-dark">
                            <th>
                                <input type="text" 
                                       class="form-control inputFiltro" 
                                       id="formID"
                                       placeholder="#"
                                    @if ( Session::has('scl_id') && Session::get('scl_id') != '0' )
                                        value="{{ Session::get('scl_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formProveedor"
                                        placeholder="Proveedor"
                                    @if ( Session::has('scl_proveedor') && Session::get('scl_proveedor') != 'NA' )
                                        value="{{ Session::get('scl_proveedor') }}"
                                    @endif>
                            </th>
                            <th>
                                <select class="form-control">
                                    <option> --- Todos --- </option>
                                    <option>En espera</option>
                                    <option>En proceso</option>
                                    <option>Recibido</option>
                                </select>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formDate"
                                        placeholder="Fecha de entrega"
                                    @if ( Session::has('scl_date') && Session::get('scl_date') != 'NA' )
                                        value="{{ Session::get('scl_date') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formDueDate"
                                        placeholder="Due Date"
                                    @if ( Session::has('scl_DueDate') && Session::get('scl_DueDate') != 'NA' )
                                        value="{{ Session::get('scl_DueDate') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formCodigo"
                                        placeholder="Codigo"
                                    @if ( Session::has('scl_codigo') && Session::get('scl_codigo') != 'NA' )
                                        value="{{ Session::get('scl_codigo') }}"
                                    @endif>
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
                       <!--   @foreach ($listado as $cli)  -->
                            <td style="text-align: center;">
                                 {{ $cli->id }}
                            </td>
                            <td>
                                {{ $cli->proveedor }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $cli->estatus}}
                            </td>
                            <td style="text-align: center;">
                                {{ $cli->date }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $cli->duedate }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $cli->codigo }}
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-primary"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Asignar equipo de trabajo">
                                    <i class="material-icons">assignment_ind</i>
                                </button>
                            </td>
                        </tr>
                        @endforeach
                        <!-- 
                        @if (count($listado) === 0)
                        <tr style="text-align: center;">
                            <td colspan="10">
                                No hay ordenes que mostrar
                            </td>
                        </tr>
                        @endif
                        -->
                 </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection



@section('final')
    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@endsection