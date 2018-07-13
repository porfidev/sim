@extends('layouts.sim')

@section('content')
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
    <div id="erroresValidacion" class="mt-3"></div>
    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
        </div>
    </div>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">
    </script>
@endsection