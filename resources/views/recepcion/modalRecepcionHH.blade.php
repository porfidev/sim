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
                    <div id="loading_modal_new_product"
                        style="display: none;"
                        >
                        <img src="{{ url('img/spinner_3.gif') }}"
                            class="rounded mx-auto d-block"
                            style="max-height: 90px;">
                </div>
                <form id="formGuardarmodalNuevaRecepcion" style="display:block">
                    <div class="form-group">
                        <input type="text"
                                class="form-control"
                                placeholder="C&oacute;digo de barras"
                                name="barcode"
                                id="barcode"
                                required
                                oninput="estaEnBase()"
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

                <!--Modal de captura de lote y caducidad-->

                <div id="capturaDatos" style="display:none">
                <form id="formCapturaDatos">
                    <div class="form-group row">
                        <label for="sku" class="col-sm-3 col-form-label">SKU</label>
                        <div class="col-sm-6">
                                PPR-0904 
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputlote" class="col-sm-3 col-form-label">Lote</label>
                        <div class="col-sm-6">
                        <input type="text" 
                               class="form-control" 
                               id="inputLote" 
                               placeholder="Lote"
                               name="lote"
                               required
                               >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputCaducidad" class="col-sm-3 col-form-label">Caducidad</label>
                        <div class="col-sm-6">
                        <input type="text" 
                               class="form-control" 
                               id="inputCaducidad" 
                               placeholder="Caducidad"
                               name="caducidad"
                               required
                               oninput="validaCaducidad()">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="cantreq" class="col-sm-3 col-form-label">Cantidad Requerida</label>
                                <div class="col-sm-6">
                                678
                                </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputRecibida" class="col-sm-3 col-form-label">Cantidad Recibida</label>
                        <div class="col-sm-6">
                        <input type="text" 
                               class="form-control" 
                               id="inputRecibida" 
                               placeholder="Cantidad Recibida"
                               name="recibida"
                               required>
                               <br>
                               <button type="button"
                                      class="btn btn-secondary"
                                        data-dismiss="modal">
                                        Cancelar
                                </button>
                                <button type="button"
                                        class="btn btn-primary",
                                        id="btnGuardarmodalCaptura">
                                        Aceptar
                               </button>
                        </div>

                    </div>
                </form>
            </div>
                <!--Modal 2-->
                <div id="success" style="display:none" >
                <form id="formDatosActualizados">
                <div class="form-group row">
                        <p class="text-justify col-sm-12">El producto <b> PULPATON PATRICIO </b> ha sido actualizado</p>
                    </div>
                    <div class="form-group row">  
                        <label for="sku_success" class="col-sm-3 col-form-label">SKU</label>
                        <div class="col-sm-6">
                                <b>PPR-0904 </b>
                        </div>
                    </div>
                    <div class="form-group row">
                       
                        <label for="lote_success" class="col-sm-3 col-form-label">Lote</label>
                        <div class="col-sm-6">
                                <b>01</b>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="caducidad_success" class="col-sm-3 col-form-label">Caducidad</label>
                        <div class="col-sm-6">
                                <b>2018-06-12</b>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="cantreq_success" class="col-sm-3 col-form-label">Cantidad Requerida</label>
                         <div class="col-sm-6">
                                <b>678</b>
                         </div>
                    </div>
                    <div class="form-group row">
                        <label for="cantrec_success" class="col-sm-3 col-form-label">Cantidad Recibida</label>
                        <div class="col-sm-6">
                                <b>679</b>
                         </div>
                    </div>
                        <button type="button"
                                    class="btn btn-primary float-right ",
                                    id="btnGuardarmodalSuccess"
                                    data-dismiss="modal">
                                    Aceptar
                        </button>
                        </div>

                    </div>
                </form>
                
                </div>
                <!--Modal error no existe producto-->
                 <div id="invalidCode" style="display:none" >
                <p class="text-justify">El producto <b> 123 </b> no existe</p>
                    <button type="button"
                            class="btn btn-primary float-right ",
                            id="btnGuardarmodalError1"
                            data-dismiss="modal">
                            Volver
                    </button>
                </div>
                <!--Modal error la caducidad es menor-->
                <div id="invalidCadM" style="display:none" >
                <p class="text-justify">La fecha de caducidad es menor a la caducidad del ultimo
                                       producto</p>
                    <button type="button"
                            class="btn btn-primary float-right ",
                            id="btnGuardarmodalError1"
                            data-dismiss="modal">
                             Volver
                    </button>
                </div>
                <!--Modal error excede la caducidad minima-->
                <div id="invalidCadT" style="display:none" >
                <p class="text-justify">Excede la caducidad minima</p>
                    <button type="button"
                            class="btn btn-primary float-right ",
                            id="btnGuardarmodalError1"
                            data-dismiss="modal">
                             Volver
                    </button>
                </div>
           </div>
        </div>
    </div>


</div>
<!-- Fin de modales -->


<!-- Script de Modal para Nueva recepcion -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.nuevaRecepcion' ).click(function () {
            $( '#erroresValidacionmodalNuevaRecepcion').text("");
            $( "#modalRecepcion" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });
        $( '#btnGuardarmodalNuevaRecepcion' ).click(function () {
            $( '#formGuardarmodalNuevaRecepcion'  ).hide();
            $( '#loading_modal_new_product' ).show();
            $.ajax({
                url    : "{{ route('productos.agregar') }}",
                method : "POST",
                data   : $( '#formGuardarmodalNuevaRecepcion'  ).serialize()
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    $('#modalRecepcion').modal('toggle');
                    location.reload();
                } else {
                    var errorMsg = "<p>Error al agregar el producto.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionmodalNuevaRecepcion", errorMsg);
                }
            }).fail(function (jqXHR, textStatus) {
                errorDetalle = "";
                // If req debug show errorDetalle
                $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
                erroresValidacion( "erroresValidacionmodalNuevaRecepcion", "Error al agregar el producto." );
            }).always(function() {
                $( '#loading_modal_new_product' ).hide();
                $( '#formGuardarmodalNuevaRecepcion'  ).show();
            });
        });
    });
</script>


<script>
function estaEnBase() {
    var capDat = document.getElementById("capturaDatos");
    var nuevaRec = document.getElementById("formGuardarmodalNuevaRecepcion");
    var invalidCode = document.getElementById("invalidCode");

    var x = document.getElementById("barcode").value;
    if (x == 123) {
        invalidCode.style.display = "block";
        nuevaRec.style.display = "none";
    }
    else if(x == 321) {
        capDat.style.display = "block";
        nuevaRec.style.display = "none";
    }   
}
</script>

<script>
function validaCaducidad() {
    var capDat = document.getElementById("capturaDatos");
    var success = document.getElementById("success");
    var cadM = document.getElementById("invalidCadM");
    var cadT = document.getElementById("invalidCadT");

    var x = document.getElementById("inputCaducidad").value;
    if (x == 8) {
        cadM.style.display = "block";
        capDat.style.display = "none";   
    }
    else if(x == 9) {
        cadT.style.display = "block";
        sampleElem.style.display = "none";   
    } 
    else if(x == 321) {
        success.style.display = "block";
        capDat.style.display = "none";   
    }   
}
</script>

<!-- Fin de Modal para Recepion HH -->