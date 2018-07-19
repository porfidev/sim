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
                                colspan="4">
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
                        <th></th>
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
                            <span id="free_{{ $item->product->sku }}"> {{ $item->quantity - $item->used }} </span> piezas
                        </td>
                        <td>
                @if ( $item->quantity - $item->used > 0)
                            <button class="btn btn-sm btn-primary addToDesign"
                                    data-order="{{ $pedido->id }}"
                                    data-detail="{{ $item->id }}"
                                    data-sku="{{ $item->product->sku }}">
                                <i class="material-icons">add</i>
                            </button>
                @endif
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
    var selectedBox = 0;
    var typeBox     = 0;
    $(document).ready(function () {
        $( '.freeItemsList' ).click(function (){
            selectedBox = $(this).attr("data-sequence");
            typeBox     = $(this).attr("data-type");
            $( "#modalFreeItems" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '.addToDesign' ).click(function (){
            $( '#overlay' ).show();
            var sku = $(this).attr("data-sku");
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type     : 'POST',
                url      : "{{ route('preparacion.disenio.agregar') }}",
                dataType : 'json',
                data     : {
                    detalle   : $(this).attr("data-detail"),
                    pedido    : $(this).attr("data-order"),
                    caja      : typeBox,
                    cantidad  : $( '#free_' + sku ).text(),
                    secuencia : selectedBox
                }
            }).done(function (data) {
                if(data.resultado === 'OK') {
                    $( "#modalFreeItems" ).modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el producto.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresModalFreeItems", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresModalFreeItems", "Error al agregar el producto." );
            }).always(function() {
                $( '#overlay' ).hide();
            });
        });
    });
</script>
<!-- Fin de Modal para agregar caja a diseño de pedido -->