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
        <div class="card-header">
        {{ $data->links('pagination.default') }}
        
            <div class="float-right">
                <nav aria-label="Paginacion" class="mr-2">
                    <button class="btn btn-sm btn-secondary regresa"
                            data-toggle="tooltip"
                            data-placement="top"
                            title="Ordenes de compra">
                                <i class="material-icons" style="color:white"  align="center" >reply</i>
                    </button>
                </nav>  
            </div>

        </div>
        <div class="card-body">

        
        
            <div class="table-responsive mt-2">
           

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="text-align: center;">
                                #
                            </th>
                            <th scope="col" style="min-width: 150px; text-align: center;">
                                SKU
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
                                Pedimiento
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
                                    @if ( Session::has('scl_id') && Session::get('scl_id') != '0' )
                                        value="{{ Session::get('scl_id') }}"
                                    @endif>
                            </th>              
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="ItemCode"
                                        placeholder="SKU"
                                    @if ( Session::has('scl_ItemCode') && Session::get('scl_ItemCode') != 'NA' )
                                        value="{{ Session::get('scl_ItemCode') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formCantidad"
                                        placeholder="Cantidad Solicitada"
                                    @if ( Session::has('scl_cantidad') && Session::get('scl_cantidad') != 'NA' )
                                        value="{{ Session::get('scl_cantidad') }}"
                                    @endif>
                            </th>
                            <th>
                                <input type="text"
                                        class="form-control inputFiltro"
                                        id="formCantidadR"
                                        placeholder="Cantidad Recibida"
                                    @if ( Session::has('scl_cantidadR') && Session::get('scl_cantidadR') != 'NA' )
                                        value="{{ Session::get('scl_cantidadR') }}"
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
                                        id="caducidad"
                                        placeholder="Caducidad"
                                    @if ( Session::has('scl_pedimento') && Session::get('scl_pedimento') != 'NA' )
                                        value="{{ Session::get('scl_pedimento') }}"
                                    @endif>
                            </th>
                            <th style="text-align: center;">
                                    <input type="text"
                                        class="form-control inputFiltro"
                                        id="pedimento"
                                        placeholder="Pedimento"
                                    @if ( Session::has('scl_pedimento') && Session::get('scl_pedimento') != 'NA' )
                                        value="{{ Session::get('scl_pedimento') }}"
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
                       
                       @foreach ($data as $item)
                            <td style="text-align: center;">
                            <b>
                                 {{ $item->DocEntry }}
                            </b>
                            </td>
                            <td style="text-align: center;">
                            <b>
                                 {{ $item->ItemCode}}
                            </b>
                            </td>
                            <td style="text-align: center;">
                            <b>
                                {{ $item->u_CantReq}}
                            <b>    
                            </td>
                            <td style="text-align: center;">
                            <b>
                                {{ $item->quantity}}
                            </b>    
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->Lote }}
                                 
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->Caducidad }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->Pedimento }}
                            </td>
                            <td style="text-align: center;">
                                
                            </td>
                        </tr>
                        @endforeach
                 
                         
                         @foreach ($data2 as $item)
                         @if(  $item->status == "validado"  )
                            <td style="text-align: center;">
                                
                            </td>
                            <td style="text-align: center;">
                                {{ $item->ItemCode}} 
                            </td>
                            <td style="text-align: center;">
                                {{ $item->cantidad_rec }}
                            </td>
                            <td style="text-align: center;">
                                {{ $item->quantity }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->DistNumber }}
                                 
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->u_Caducidad }}
                            </td>
                            <td style="text-align: center;">
                                 {{ $item->pedimento }}
                            </td>
                            <td style="text-align: center;">
                                
                            </td>
                        </tr>
                        @endif
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
            $( '.regresa' ).click(function () {
                window.location.href =  "{{ URL::to('/ordenes/listado/') }}";
            });

        });
    </script>


    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@endsection