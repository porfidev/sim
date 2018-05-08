@extends('layouts.sim')

@section('content')
<div class="container mt-4">
    <div class="row justify-content-sm-center">
        <div class="col-12 col-sm-8 col-md-6 col-lg-5">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                            Entrada SIM
                    </h5>
                    <form class="form-horizontal"
                            method="POST"
                            action="{{ route('login') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email">
                                E-Mail
                            </label>
                            <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus>
                        @if ($errors->has('email'))
                            <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password">
                                Contrase&ntilde;a
                            </label>
                            <input id="password" type="password" class="form-control" name="password" required>
                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
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
