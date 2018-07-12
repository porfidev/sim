@extends('layouts.simHH')

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


    <style type="text/css">
        tr a {
        display: block;
        }
    </style>

    <button class="btn btn-sm btn-info Busqueda"
                data-toggle="tooltip"
                data-placement="top"
                title="Buscar"
                >
            <i class="material-icons">search</i>
    </button>
    <button class="btn btn-sm btn-warning"
                data-toggle="tooltip"
                data-placement="top"
                title="Limpiar filtros"
                id="btnLimpiar">
                <i class="material-icons">settings_backup_restore</i>
    </button>

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
                    </tr>
            </thead>
            <tbody>
                <tr >
                
                @foreach ($data as $item)
                    <td style="text-align: center;">
                            {{ $item->DocNum }}
                    </td>
                    <td> 
                        <a class="irADetalleHH" data-id="{{ $item->id }}" >
                        {{ $item->CardName }}
                        <br>
                        <h6>{{ $item->created_at->format('Y-m-d') }}</h6>
                        <a>
                    </td>
                </tr>
                @endforeach

            </tbody>
        </table>
    </div>

    <form id="searchForm"
        method="POST"
        action="{{ route('ordenes.listadoHH') }}">
        {{ csrf_field() }}
        <input type="hidden" name="su_id"        id="busquedaId"         value="0">
        <input type="hidden" name="su_proveedor" id="busquedaProveedor"  value="NA">
        <input type="hidden" name="su_reception" id="busquedaRecepcion"  value="NA">
        <input type="hidden" name="su_entrega"   id="busquedaEntrega"    value="0">
        <input type="hidden" name="su_codigo"    id="busquedaCodigo"     value="0">
    </form>

@endsection

@section('final')

    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')
    
    @include('recepcion.modalRecepcionHH')
    @include('recepcion.modalBusquedaHH')

    <!-- Script de Modal para Usuario Editar -->
    <script type="text/javascript">
        $(document).ready(function () {
            $( '.irADetalleHH' ).click(function () {
                window.location.href = "/hh/recepcion/listadoItemsHH/" + $(this).attr( "data-id" );
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

    </script>
@endsection