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

	<div class="text-right">
	<button class="btn btn-sm btn-secondary regresa"
			data-toggle="tooltip"
			data-placement="top"
			title="Ordenes de compra">
			<i class="material-icons" style="color:white"  align="center" >reply</i>
	</button>
		<button class="btn btn-sm btn-success terminar"
				data-toggle="tooltip"
				data-placement="top"
				id="terminar"
				name="terminar"
				title="Terminar recepci&oacute;n"
				>
				<i class="material-icons" style="color:white"  align="center" >done_all</i>
		</button>
	</div>

	<div class="table-responsive mt-2">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col" style="text-align: center;">
						#
					</th>
					<th scope="col" style="min-width: 150px;">
						Descripci&oacute;n
					</th>
					<th>
					</th>
					</tr>
			</thead>
			<tbody>
				<tr>
				@foreach ($data as $item)
					<td style="text-align: center;">
							{{ $item->purchase_id }}
					</td>
					<td>
						{{ $item->concept}}
						<br>
						<p>
						<b>SKU: {{ $item->ItemCode}}
						<br>
						Cantidad requerida: {{ $item->u_CantReq}}
						</b></p>
					</td>
					<td>
					    
					    @if(  $item->status == 0  )
						<button class="btn btn-sm btn-primary nuevaRecepcion"
							data-toggle="tooltip"
							data-id="{{ $item->ItemCode }}"
							data-cmd="{{ $item->purchase_id }}"
							data-placement="top"
							title="Completar Item"
							type="reset"
							>
							<i class="material-icons">radio_button_checked</i>
						</button>
						@endif

						@if(  $item->status == 1  )
                                <button class="btn btn-sm btn-success "
                                    data-placement="top"
                                    title="Verificado"
                                    disabled
                                    >
                                <i class="material-icons">done</i>
                                </button>
								
                         @endif

					</td>
				</tr>
				@endforeach           
			</tbody>
		</table>
	</div>

    
	<form id="form">
	   <input type="hidden" name="el_id" id="el_id" value="{{ $item->purchase_id }} ">
	   <input type="hidden" name="num" id="num" value=2>
	</form>

@endsection

@section('final')

@include('partials.modalComun')
@include('partials.modalMensaje')
@include('partials.modalConfirmacion')
@include('recepcion.modalRecepcionHH')



	<script type="text/javascript">
		$(document).ready(function () {
			$( '.regresa' ).click(function () {
				window.location.href =  "{{ URL::to('/hh/recepcion/listadoHH') }}";
			});

		});
	</script>


	<script type="text/javascript">
		$(document).ready(function () {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>


	<script type="text/javascript">
	$(document).ready(function () {
		$(".terminar").click(function(event) {

			var parametros = [];
            parametros["identificador"] = $('#el_id').val();
			parametros["estatus"] = 2;

			abrirConfirmacion(
				"Confirmaci&oacute;n",
				"¿Estás seguro de concluir la recepci&oacute;n?",
				"{{ URL::to('/hh/recepcion/updateStatusPurchase/') }}",
				parametros
			);
			/*
			$.ajax({
				url    : "{{ URL::to('/hh/recepcion/updateStatusPurchase/') }}",
				method : "GET",
				data   : $( '#form'  ).serialize()
			}).done(function( data ) {
				console.log(data);
				$('terminar').prop('disabled', true);
				window.location.href =  "{{ URL::to('/hh/recepcion/listadoHH') }}";
			}).fail(function (jqXHR, textStatus, errorThrown) {
				errorDetalle = "ERROR: \n";
				//$.each(jqXHR, function(i,val) { errorDetalle += "\n\n" + i + " : " + val; } );
				alert(errorDetalle);
			}).always(function() {
				//alert('okkkkkkk always');
			});
			*/
		});            
	});
	</script>



@endsection