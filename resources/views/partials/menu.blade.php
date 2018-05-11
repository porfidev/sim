<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <!-- Branding Image -->
    <a class="navbar-brand"
        href="{{ url('/') }}">
        <img src="{{ url('img/logo.png') }}"
                width="auto"
                height="30"
                class="d-inline-block align-top"
                alt="Marco Polo">
        &nbsp;
        {{ config('app.name', 'SIM') }}
    </a>
    <button class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
    @auth
        @foreach (Session::get('menu') as $menuHeader)
            <li
            @if( $menuHeader['childs'] != null
                && count($menuHeader['childs']) > 0 )
                class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"
                    href="#"
                    id="navbarDropdown{{ $menuHeader['parent']->id }}"
                    role="button"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false">
                    {{ $menuHeader['parent']->label }}
                </a>
                <div class="dropdown-menu"
                        aria-labelledby="navbarDropdown{{ $menuHeader['parent']->id }}">
                    @foreach ($menuHeader['childs'] as $subMenuItem)
                    <a class="dropdown-item"
                        href="{{ url($subMenuItem->url) }}">
                        {{ $subMenuItem->label }}
                    </a>
                    @endforeach
                </div>
            @else
                class="nav-item">
                <a class="nav-link"
                    href="{{ url($menuHeader['parent']->url) }}">
                    {{ $menuHeader['parent']->label }}
                </a>
            @endif
            </li>
        @endforeach
    @endauth
        </ul>
        <ul class="navbar-nav ml-auto">
            <!-- Authentication Links -->
    @guest
            <li class="nav-item">
                <a class="nav-link"
                    href="{{ route('login') }}">
                    Entrar
                </a>
            </li>
    @else
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"
                    href="#"
                    id="navbarDropdown"
                    role="button"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false">
                    {{ Auth::user()->name }}
                </a>
                <div class="dropdown-menu"
                        aria-labelledby="navbarDropdown">
                    <a class="dropdown-item"
                        href="#">
                        Cambio de contrase&ntilde;a
                    </a>
                    <a class="dropdown-item"
                        href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();">
                        Salir
                    </a>
                    <form id="logout-form"
                            action="{{ route('logout') }}"
                            method="POST"
                            style="display: none;">
                        {{ csrf_field() }}
                    </form>
                </div>
            </li>
    @endguest
        </ul>
    </div>
</nav>