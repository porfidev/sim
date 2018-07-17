<!-- Inicio de Modal para agregar caja a diseño de pedido -->
<div class="modal fade"
    id="modalAddBox"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalAddBoxTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <span id="modalAddBoxTitle">
                        Agregar caja
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
                <div id="erroresModalAddBox"></div>
                <div class="form-row">
                    <div class="col">
                        <select class="form-control"
                                id="selectedBoxType">
                            <option value="0"> -- Selecciona un tipo de caja -- </option>
            @foreach ( $cajas as $caja )
                            <option value="{{ $caja->id }}">
                                {{ $caja->description }}
                            </option>
            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary"
                    id="addBox">
                    Agregar
                </button>
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
        $( '.addBoxToDesign' ).click(function (){
            $( '#selectedBoxType' ).val(0);
            $( "#modalAddBox" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });

        $( '#addBox' ).click(function (){
            var selected = $( '#selectedBoxType' ).val();
            if(selected != 0) {
                addBox($("#selectedBoxType option[value='" + selected + "']").text());
                $('#modalAddBox').modal('toggle');
            }
        });
    });
</script>
<!-- Fin de Modal para agregar caja a diseño de pedido -->