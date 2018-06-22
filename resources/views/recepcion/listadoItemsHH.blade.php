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
	<div class="card">
		<div class="card-header">
		
			<div class="float-right">
				<nav aria-label="Paginacion" class="mr-2">
					<button class="btn btn-sm btn-primary regresa"
							data-toggle="tooltip"
							data-placement="top"
							title="Ordenes de compra">
								<i class="material-icons"  align="center" >keyboard_backspace</i>
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
								Cantidad solicitada: {{ $item->quantity}}
								</b></p>
							</td>
							<td>
								<button class="btn btn-sm btn-primary nuevaRecepcion"
									data-toggle="tooltip"
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
		</div>
	</div>
@endsection

@section('final')

@include('recepcion.modalRecepcionHH')

	<!-- Script de Modal para Usuario Editar -->
	<script type="text/javascript">
		$(document).ready(function () {
			$( '.regresa' ).click(function () {
				window.history.back();
			});

		});
	</script>


	<script type="text/javascript">
		$(document).ready(function () {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
@endsection