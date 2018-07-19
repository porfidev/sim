<!-- Modal para Producto Nuevo -->
<div class="modal fade"
    id="modalRecepcion"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalNuevaRecepcionTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                   Recepci&oacute;n
                </h4>
            </div>
            <div class="modal-body">
                <div id="erroresValidacionmodalNuevaRecepcion"></div>
                    <div id="loading_modal_recepcion"
                        style="display: none;"
                        >
                        <img src="{{ url('img/spinner_3.gif') }}"
                            class="rounded mx-auto d-block"
                            style="max-height: 90px;">
                </div>
                <form id="validaBarcode" style="display:block" action="{{ route('ordenes.captura') }}">
                    <div class="form-group">
                        {{ csrf_field() }}
                        <input type="hidden" name="ItemCode" id="ItemCode" value="">
                        <input type="hidden" name="purchaseid" id="purchaseid" value="">
                        <input type="text"
                                class="form-control"
                                placeholder="C&oacute;digo de barras"
                                name="codigo" 
                                id="codigo"
                                required
                                class="visible">
                         <div class="modal-footer d-flex justify-content-center">
                            <button type="button"
                                class="btn btn-secondary"
                                data-dismiss="modal">
                                Cancelar        
                            </button>
                        </div>
                    </div>
                </form>
           </div>
        </div>
    </div>


</div>
<!-- Fin de modales -->


<!-- Script de Modal para Nueva recepcion -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.nuevaRecepcion' ).click(function () {
            //var parametros = [];
            //parametros["ItemCode"] = $(this).attr("data-ItemCode");
            $("#codigo").val(" ");
            $("#purchaseid").val($(this).attr("data-cmd"));
            $("#ItemCode").val($(this).attr("data-id"));
            $( '#erroresValidacionmodalNuevaRecepcion').text("");
            $( "#modalRecepcion" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });
        $('#modalRecepcion').on('shown.bs.modal', function () {
             $('#codigo').trigger('focus')
        })
    });
</script>

<script type="text/javascript">


<!-- Fin de Modal para Recepion HH -->