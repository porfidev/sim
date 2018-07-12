@extends('layouts.simItemHH')

@section('content')

<div class="form-group ">
            <div class="text-center">
            <br>
                <h2 class="mt-2"> ERROR: {{ $data["mensajes"] }} </h2>
            <br>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="button"
                    class="btn btn-secondary regresa"
                    title="Regresar">
                    Regresar
                 </button>
             </div>
</div>


@endsection

@section('final')

	<script type="text/javascript">
		$(document).ready(function () {
			$( '.regresa' ).click(function () {
				window.history.back();
			});

		});
	</script>



@endsection




