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
    <div class="card mb-3">
        <div class="card-body pl-0 pr-0 pb-0 pt-0">
            <div class="table-responsive">
                <table class="table table-striped table-fixed mb-0">
                    <tbody>
            @foreach ($listado as $pedido)
                        <tr>
                            <td style="text-align: center;" class="table-primary">
                                <div class="row">
                                    <div class="col">
                                        Pedido: #{{ $pedido->codeOrder }}
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-sm btn-success terminaTareas"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                data-id="{{ $pedido->codeOrder }}"
                                                title="Cerrar pedido">
                                            <i class="material-icons">offline_pin</i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tareasDelPedido"
                                data-id="{{ $pedido->id }}"
                                style="text-align: center;">
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

@endsection