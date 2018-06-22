<!-- Modal para Producto Nuevo -->
<div class="modal fade"
	id="modalBusqueda"
	tabindex="-1"
	role="dialog"
	aria-labelledby="modalBusquedaTitle"
	aria-hidden="true">

	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					B&uacute;squeda
				</h4>
				<button type="button"
					class="close"
					data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="erroresValidacionmodalBusqueda"></div>
				<div id="loading_modal_new_product"
					style="display: none;">
					<img src="{{ url('img/spinner_3.gif') }}"
						class="rounded mx-auto d-block"
						style="max-height: 90px;">
				</div>
				<form id="formGuardarmodalBusqueda">
					<div class="form-group row">
						<label for="inputFecha" class="col-sm-2 col-form-label">Fecha</label>
						<div class="col-sm-10">
						<input type="date" 
							   class="form-control" 
							   id="inputFecha" 
							   placeholder="Fecha"
							   name="fecha"
							   required>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputProveedor" class="col-sm-2 col-form-label">Proveedor</label>
						<div class="col-sm-10">
						<input type="text" 
							   class="form-control" 
							   id="inputProveedor" 
							   placeholder="Proveedor"
							   name="proveedor"
							   required>
						</div>
					</div>
				</form>
			  </div>
			<div class="modal-footer">
				<button type="button"
					class="btn btn-secondary"
					data-dismiss="modal">
					Cancelar
				</button>
				<button type="button"
					class="btn btn-primary",
					id="btnGuardarmodalBusqueda">
					Aceptar
				</button>
			</div>
		</div>
	</div>
</div>
<!-- Fin de Modal para Producto Nuevo -->



<!-- Script de Modal para Producto Nuevo -->
<script type="text/javascript">
	$(document).ready(function () {
		$( '.Busqueda' ).click(function () {
			$( '#erroresValidacionmodalBusqueda').text("");
			$( "#modalBusqueda" ).modal({
				keyboard : false,
				backdrop : 'static'
			});
		});
		$( '#btnGuardarmodalBusqueda' ).click(function () {
			$( '#formGuardarmodalBusqueda'  ).hide();
			$( '#loading_modal_new_product' ).show();
			$.ajax({
				url    : "{{ route('productos.agregar') }}",
				method : "POST",
				data   : $( '#formGuardarmodalBusqueda'  ).serialize()
			}).done(function( data ) {
				if(data.resultado === 'OK') {
					$('#modalBusqueda').modal('toggle');
					location.reload();
				} else {
					var errorMsg = "<p>Error al agregar el producto.<p><ul>";
					$.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
					errorMsg += "</ul>";
					erroresValidacion("erroresValidacionmodalBusqueda", errorMsg);
				}
			}).fail(function (jqXHR, textStatus) {
				errorDetalle = "";
				// If req debug show errorDetalle
				$.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
				erroresValidacion( "erroresValidacionmodalBusqueda", "Error al agregar el producto." );
			}).always(function() {
				$( '#loading_modal_new_product' ).hide();
				$( '#formGuardarmodalBusqueda'  ).show();
			});
		});
	});
</script>




<!-- Fin de Modal para Recepion HH -->