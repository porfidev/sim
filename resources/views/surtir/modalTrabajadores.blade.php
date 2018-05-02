<!-- Modal para Equipo de trabajo -->
<div class="modal fade"
    id="modalTrabajadores"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalTrabajadoresTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Equipo de trabajo
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="table-responsive mt-2">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">
                                </th>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Estatus</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox"
                                            value="">
                                    </div>
                                </td>
                                <td>
                                    236
                                </td>
                                <td>
                                    Persona 1
                                </td>
                                <td>
                                    <span class="text-danger">
                                        Desocupado
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    237
                                </td>
                                <td>
                                    Persona 2
                                </td>
                                <td>
                                    <span class="text-info">
                                        Ocupado
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox"
                                            value="">
                                    </div>
                                </td>
                                <td>
                                    238
                                </td>
                                <td>
                                    Persona 4
                                </td>
                                <td>
                                    <span class="text-danger">
                                        Desocupado
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox"
                                            value=""
                                            checked>
                                    </div>
                                </td>
                                <td>
                                    239
                                </td>
                                <td>
                                    Persona 5
                                </td>
                                <td>
                                    <span class="text-success">
                                        Asignado
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button"
                    class="btn btn-primary",
                    id="btnGuardarBorrar">
                    Aceptar
                </button>
                <button type="button"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cancelar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Fin de Modal para Equipo de trabajo -->

<!-- Script de Modal para Equipo de trabajo -->
<script type="text/javascript">
    $(document).ready(function () {
        $( '.creacionEquipo' ).click(function () {
            $( "#modalTrabajadores" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
        });
    });
</script>
<!-- Fin de Modal para Equipo de trabajo -->