@extends('layouts.sim')

@section('content')
<div class="container mt-4">
    <div class="row justify-content-md-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                    <h5 class="card-title">
                        Bienvenid@
                    </h5>
                    Has iniciado sesi&oacute;n correctamente
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
