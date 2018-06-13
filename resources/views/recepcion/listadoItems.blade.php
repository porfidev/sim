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
        

            <div class="table-responsive mt-2">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                DocEntry
                            </th>
                            <th scope="col" style="min-width: 250px;">
                                LineNum
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                ItemCode
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Quantity
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Lote
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                Pedimiento
                            </th>
                            <th scope="col" style="min-width: 130px; text-align: center;">
                                Caducidad
                            </th>
                          </tr>
                        <tr class="table-dark">
                            <th>
                                <input type="text" 
                                       class="form-control inputFiltro" 
                                       id="formID"
                                       placeholder="DocNum"
                                    @if ( Session::has('scl_id') && Session::get('scl_id') != '0' )
                                        value="{{ Session::get('scl_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formProveedor"
                                        placeholder="LineNum"
                                    @if ( Session::has('scl_proveedor') && Session::get('scl_proveedor') != 'NA' )
                                        value="{{ Session::get('scl_proveedor') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formDate"
                                        placeholder="ItemCode"
                                    @if ( Session::has('scl_date') && Session::get('scl_date') != 'NA' )
                                        value="{{ Session::get('scl_date') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formDate"
                                        placeholder="Quantity"
                                    @if ( Session::has('scl_date') && Session::get('scl_date') != 'NA' )
                                        value="{{ Session::get('scl_date') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formDueDate"
                                        placeholder="Lote"
                                    @if ( Session::has('scl_DueDate') && Session::get('scl_DueDate') != 'NA' )
                                        value="{{ Session::get('scl_DueDate') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formCodigo"
                                        placeholder="Pedimento"
                                    @if ( Session::has('scl_codigo') && Session::get('scl_codigo') != 'NA' )
                                        value="{{ Session::get('scl_codigo') }}"
                                    @endif>
                            </th>
                            <th style="text-align: center;">
                                    <input type="text"
                                        class="form-control inputFiltro"
                                        id="formCaducidad"
                                        placeholder="Caducidad"
                                    @if ( Session::has('scl_caducidad') && Session::get('scl_caducidad') != 'NA' )
                                        value="{{ Session::get('scl_caducidad') }}"
                                    @endif>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                       
                       @foreach ($data as $item)
                            <td style="text-align: center;">
                                 {{ $item->DocEntry }}
                            </td>
                            <td>
                                {{ $item->LineNum}}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->ItemCode}}
                            </td>
                            <td style="text-align: center;">
                                {{ $item->quantity}}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->Lote }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->Pedimento }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->Caducidad }}
                            </td>
                            <td style="text-align: center;">
                        
                            </td>
                        </tr>
                        @endforeach
                        
                       
                 </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('final')

    <!-- Script de Modal para Usuario Editar -->
    <script type="text/javascript">
        $(document).ready(function () {
            $( '.irADetalle' ).click(function () {
                window.location.href = "/ordenes/listadoItems/" + $(this).attr( "data-id" );
            });
        });
    </script>


    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@endsection