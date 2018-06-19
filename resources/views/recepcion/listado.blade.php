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
        
        {{ $data->links('pagination.default') }}
        
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
                                F. Recepci&oacute;n
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                              Fecha de entrega
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
                                       placeholder=""
                                    @if ( Session::has('su_id') && Session::get('su_id') != '0' )
                                        value="{{ Session::get('su_id') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formProveedor"
                                        placeholder="Proveedor"
                                    @if ( Session::has('su_proveedor') && Session::get('su_proveedor') != 'NA' )
                                        value="{{ Session::get('su_proveedor') }}"
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
                                        id="formRecepcion"
                                        placeholder="Fecha de recepcion"
                                    @if ( Session::has('su_reception') && Session::get('su_reception') != 'NA' )
                                        value="{{ Session::get('su_reception') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formEntrega"
                                        placeholder="Fecha de entrega"
                                    @if ( Session::has('su_entrega') && Session::get('su_entrega') != 'NA' )
                                        value="{{ Session::get('su_entrega') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formCodigo"
                                        placeholder="Codigo"
                                    @if ( Session::has('su_codigo') && Session::get('su_codigo') != 'NA' )
                                        value="{{ Session::get('su_codigo') }}"
                                    @endif>
                            </th>
                            <th style="text-align: center;">
                                <button class="btn btn-sm btn-info"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Buscar"
                                        id="btnBuscar">
                                    <i class="material-icons">search</i>
                                </button>

                                <button class="btn btn-sm btn-warning"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Limpiar filtros"
                                        id="btnLimpiar">
                                    <i class="material-icons">settings_backup_restore</i>
                                </button>

                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                       
                       @foreach ($data as $item)
                            <td style="text-align: center;">
                                 {{ $item->DocNum }}
                            </td>
                            <td>
                                {{ $item->CardName }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->status}}
                            </td>
                            <td style="text-align: center;">
                                {{ $item->Arrival }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->DocDueDate }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->CardCode }}
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-sm btn-success irADetalle"
                                            data-id="{{ $item->id }}"                                        
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Ver detalle">
                                        <i class="material-icons">assignment_ind</i>
                                </button>  
                            </td>
                        </tr>
                        @endforeach
                        
                       
                 </tbody>
                </table>
            </div>
        </div>
    </div>
      <form id="searchForm"
        method="POST"
        action="{{ route('ordenes.listado') }}">
        {{ csrf_field() }}
        <input type="hidden" name="su_id"     id="busquedaId"      value="0">
        <input type="hidden" name="su_proveedor" id="busquedaProveedor"  value="NA">
        <input type="hidden" name="su_reception"  id="busquedaRecepcion"   value="NA">
        <input type="hidden" name="su_entrega"    id="busquedaEntrega"     value="0">
        <input type="hidden" name="su_codigo"    id="busquedaCodigo"     value="0">
    </form>

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
          function ejecutaBusquedasFiltros() {
            $( '#busquedaId'      ).val( $( '#formID'      ).val() ? $( '#formID'      ).val() : '0'  );
            $( '#busquedaProveedor'  ).val( $( '#formProveedor'  ).val() ? $( '#formProveedor'  ).val() : ' ' );
            $( '#busquedaRecepcion'     ).val( $( '#formRecepecion'     ).val() ? $( '#formRecepecion'     ).val() : ' '  );
            $( '#busquedaEntrega'     ).val( $( '#formEntrega'     ).val() ? $( '#formEntrega'     ).val() : ' '  );
            $( '#busquedaCodigo' ).val( $( '#formCodigo' ).val() ? $( '#formCodigo' ).val() : ' ' );
            $( '#searchForm' ).submit();
        }

        $(document).ready(function () {
            $( '[data-toggle="tooltip"]' ).tooltip();
            $( '#btnLimpiar' ).click(function () {
                $( '#busquedaId').val( '0'  );
                $( '#formProveedor').val( ' ' );
                $( '#busquedaRecepcion').val( ' ' );
                $( '#busquedaEntrega').val( ' ' );
                $( '#busquedaCodigo').val( '0'  );
                $( '#searchForm' ).submit();
            });
            $( '#btnBuscar' ).click(ejecutaBusquedasFiltros);

             $( '.inputFiltro' ).keyup(function(e){
                if(e.keyCode == 13) {
                    ejecutaBusquedasFiltros();
                }
            });


        });

        

    </script>


    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@endsection