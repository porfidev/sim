<div class="modal fade"
    id="CSVModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="listaModalTitle"
    aria-hidden="true">

    {{
        Form::open(
            array(
                'url'    => 'preparacion/CSVReparto',
                'id'     => 'CsvForm',
                'method' => 'POST',
                'enctype'=> 'multipart/form-data'
            )
        )
    }}
    <!-- MODAL PARA CSV -->
    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="listaModalTitle">
                        Archivo CSV
                </h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file"
                            name="CSVFile3"
                            id="CSVFile3"
                            accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
                            class="custom-file-input">
                        <label class="custom-file-label"
                                id="labelCSV"
                                for="CSVFile3">
                            Selecciona un archivo CSV
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button
                    type="submit"
                    class="btn btn-primary">
                    Guardar
                </button>
                <button type="button"
                    id="btnCerrar"
                    class="btn btn-secondary"
                    data-dismiss="modal">
                    Cerrar
                </button>
            </div>
        </div>
    </div>
    {{ Form::close() }}
</div>