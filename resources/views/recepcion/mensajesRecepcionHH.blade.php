@extends('layouts.simItemHH')

@section('content')

<div class="form-group ">
            <div class="text-center">
            <br>
                <h2 class="mt-2"> {{  $data["resultado"] }}: {{  $data["mensajes"] }}
                </h2>
            <br>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="button"
                    class="btn btn-secondary regresa"
                    title="Regresar">
                    Regresar
                 </button>
                 @if( $data["resultado"] == "OK")
                 <button type="submit"
                    class="btn btn-primary aceptar"
                    title="Aceptar">
                    Aceptar
                 </button>
                @endif
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

       <script type="text/javascript">
		$(document).ready(function () {            
			$( '.aceptar' ).click(function () {
                window.location.href =  "{{ URL::to('/hh/recepcion/validacionHH/') }}";
			});
		});
	</script>





@endsection




