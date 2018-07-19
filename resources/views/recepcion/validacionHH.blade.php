@extends('layouts.simItemHH')

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
                        Orden
                    </th>
                    <th scope="col" style="min-width: 250px;">
                        Descripci&oacute;n de los productos recibidos
                    </th>
					<th>
					</th>
					</tr>
            </thead>
            <tbody>
                <tr >
                
                @foreach ($data as $item)
						<td style="text-align: center;">
								 {{ $item->purchase_id }}
							</td>
							<td >
								<b>Lote: {{ $item->DistNumber}}</b>
								<br>
								<b> Ultima caducidad: {{ $item->u_Caducidad}} </b>
								<p>
								SKU: {{ $item->ItemCode}}
								<br>
								Cantidad total recibida: {{ $item->quantity}}
								<br>
								Id del producto: {{ $item->product_id}}
								</p>
							</td>
							
                            <td>
                            <form action="{{ URL::to('/hh/recepcion/validacionRecepcionesHH/') }}">
                                <input type="hidden" name="ItemCode" value="{{ $item->ItemCode }}">
                                <input type="hidden" name="id" value="{{ $item->id }}">
                                <input type="hidden" name="purchaseid" value="{{ $item->purchase_id }}">
                                <input type="hidden" name="DistNumber" value="{{ $item->DistNumber }}">
                                <input type="hidden" name="u_Caducidad" value="{{ $item->u_Caducidad }}">
                                <input type="hidden" name="quantity" value="{{ $item->quantity }}">
                                <input type="hidden" name="product_id" value="{{ $item->product_id }}">
                                <button class="btn btn-sm btn-primary "
                                    data-toggle="tooltip"
                                    data-placement="top"
                                    title="Verificar Item"
                                    type="submit"
                                    >
                                <i class="material-icons">radio_button_checked</i>
                                </button>
                            </form>
                            </td>	
                </tr>
                @endforeach

            </tbody>
        </table>
    </div>



@endsection

@section('final')

    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')
    
    @include('recepcion.modalValidacionHH')
    @include('recepcion.modalBusquedaHH')



       <script type="text/javascript">
        $(document).ready(function () {
            $( '.validacionR' ).click(function () {
                window.location.href =  "{{ URL::to('/hh/recepcion/validacionRecepcionesHH/') }}";
               
            });
        });
    </script>



    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

@endsection