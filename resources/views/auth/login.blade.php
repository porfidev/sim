@extends('layouts.sim')

@section('content')
<div class="container mt-4">
    <div class="row justify-content-sm-center">
        <div class="col-12 col-sm-8 col-md-6 col-lg-5">
            <div class="card">
                <div class="card-body">
                @if(Session::has('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ Session::get('error')}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif
                    <h5 class="card-title">
                            Entrada SIM
                    </h5>
                    <form class="form-horizontal"
                            method="POST"
                            action="{{ route('login') }}">
                        {{ csrf_field() }}

                        <div class="form-group">
                            <label for="email">
                                E-Mail
                            </label>
                            <input id="email"
                                type="email"
                                class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"
                                name="email"
                                value="{{ old('email') }}"
                                required autofocus>
                        @if ($errors->has('email'))
                            <div class="invalid-feedback">
                                <strong>{{ $errors->first('email') }}</strong>
                            </div>
                        @endif
                        </div>

                        <div class="form-group">
                            <label for="password">
                                Contrase&ntilde;a
                            </label>
                            <input id="password"
                                type="password"
                                class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                name="password"
                                required>
                        @if ($errors->has('password'))
                            <div class="invalid-feedback">
                                <strong>{{ $errors->first('password') }}</strong>
                            </div>
                        @endif
                        </div>

                        <div class="form-group">
                            <div class="form-check">
                                <input type="checkbox"
                                        class="form-check-input"
                                        id="rememberCheck"
                                        name="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label class="form-check-label" for="rememberCheck">
                                    Recordar
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">
                                &nbsp;&nbsp;Entrar&nbsp;&nbsp;
                            </button>
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <a class="card-link"
                        href="{{ route('password.request') }}">
                        ¿Olvidaste tu contrase&ntilde;a?
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
