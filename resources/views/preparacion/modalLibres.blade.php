<!-- Inicio de Modal para agregar caja a diseño de pedido -->
<div class="modal fade"
    id="modalFreeItems"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalFreeItemsTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <span id="modalFreeItemsTitle">
                        Agregar productos
                    </span>
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="erroresModalFreeItems"></div>
                <table class="table table-striped mb-0">
                    <tr>
                        <td style="text-align: center;"
                                class="table-dark"
                                colspan="3">
                            Lista de productos Pedido #{{ $pedido->codeOrder }}
                        </td>
                    </tr>
                    <tr class="table-primary">
                        <th scope="col">
                            Producto
                        </th>
                        <th scope="col">
                            Solicitado
                        </th>
                        <th scope="col">
                            Libres
                        </th>
                    </tr>
        @foreach( $productos as $item )
                    <tr>
                        <td>
                                {{ $item->product->sku }} - {{ $item->product->concept }}
                        </td>
                        <td>
                            <span id="max_{{ $item->product->sku }}">{{ $item->quantity }}</span> piezas
                        </td>
                        <td>
                            <span id="free_{{ $item->product->sku }}">0</span> piezas
                        </td>
                    </tr>
        @endforeach
                </table>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cerrar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Fin de Modal para agregar caja a diseño de pedido -->

<!-- Script de Modal para agregar caja a diseño de pedido -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.freeItemsList' ).click(function (){
            $( "#modalFreeItems" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });
    });
</script>
<!-- Fin de Modal para agregar caja a diseño de pedido -->