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
					</td>
				</tr>
				@endforeach           
			</tbody>
		</table>
	</div>

@endsection



@section('final')

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
@endsection