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
    <a href="{{ route('preparacion.listado') }}"
        class="btn btn-sm btn-secondary mt-3"
        data-toggle="tooltip"
        data-placement="top"
        title="Regresar">
        <i class="material-icons">reply</i>
    </a>
    <div id="erroresValidacion" class="mt-3"></div>
    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td style="text-align: center;"
                            class="table-dark"
                            colspan="2">
                            <h5>
                                Dise&ntilde;o del pedido #{{ $pedido->codeOrder }} <br>
                                <small>
                                    {{ $pedido->client->name }}
                                </small>
                            </h5>
                        </td>
                    </tr>
            @php
                $caja = 0;
            @endphp
            @foreach( $listado as $item )
                @if($caja != $item->sequence)
                    @php
                        $caja = $item->sequence
                    @endphp
                    <tr class="table-dark">
                        <td colspan="2">
                            <h6>Caja {{ $item->sequence }}
                                <small>{{ $item->boxType->description }}</small>
                            </h6>
                        </td>
                    </tr>
                @endif
                <tr>
                    <td>
                        {{ $item->orderDetail->product->concept }}
                    </td>
                    <td>
                        {{ $item->quantity }} piezas
                    </td>
                </tr>
            @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection

@section('final')
    @include('partials.modalComun')
    @include('partials.modalMensaje')
    @include('partials.modalConfirmacion')

    <script type="text/javascript">
        $('[data-toggle="tooltip"]').tooltip();
    </script>
@endsection