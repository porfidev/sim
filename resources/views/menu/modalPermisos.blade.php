<!-- Modal para Agregar Permisos -->
<div class="modal fade"
    id="modalPermisos"
    tabindex="-1"
    role="dialog"
    aria-labelledby="modalPermisosTitle"
    aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Agregar Permisos a <span id="modalPermisosTitle">&nbsp;</span>
                </h4>
                <button type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="erroresValidacionPermisos"></div>
                <div id="loading_modal_profiles"
                        style="display: none;">
                    <img src="{{ url('img/spinner_3.gif') }}"
                        class="rounded mx-auto d-block"
                        style="max-height: 90px;">
                </div>
                <form id="formGuardarPermisos">
                    {{ csrf_field() }}
                    <input type="hidden"
                            name="menu"
                            id="modalProfileMenu">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"
                                    id="modalProfilesRol">
                                Rol
                            </span>
                        </div>
                        <select class="custom-select"
                                id="modalProfileRol"
                                name="rol">
                            <option value="0">
                                --- Selecciona un rol ---
                            </option>
                    @foreach ($roles as $item)
                            <option value="{{ $item->id }}">
                                {{ $item->description }}
                            </option>
                    @endforeach
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-primary"
                                    id="addProfile"
                                    type="button">
                                Agregar
                            </button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th width="80%">
                                        Rol
                                    </th>
                                    <th width="20%" style="text-align: center;">
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="modalProfilesTable">
                                <tr style="text-align: center;">
                                    <td colspan="3">
                                        No hay permisos definidos
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
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
<!-- Fin de Modal para Agregar Permisos -->

<!-- Script de Modal para Agregar Permisos -->
<script type="text/javascript">
    var rolesList = [];
    function addProfileTr(rol) {
        if(rolesList.length === 0) {
            $( '#modalProfilesTable tr' ).remove();
        }
        var row = "<tr>";
        row += ("<td>" + rol.description + "</td>");
        row += "<td style=\"text-align: center;\">";
        row += ("<button type=\"button\" class=\"btn btn-sm btn-danger removeProfile\" data-id=\"" + rol.profile + "\">");
        row += "<i class=\"material-icons\">delete</i></button>";
        row += "</tr>";
        $( '#modalProfilesTable' ).append(row);
        rolesList.push(rol);
    }
    function addProfile (rol) {
        $( '#loading_modal_profiles' ).show();
        $( '#formGuardarPermisos'   ).hide();
        $.ajax({
            url    : "{{ route('menu.agregar.permiso') }}",
            method : "POST",
            data: $( "#formGuardarPermisos" ).serialize()
        }).done(function( data ) {
            if(data.resultado === 'OK') {
                rol.profile = data.datos;
                addProfileTr(rol);
                $( '#modalProfileRol' ).val(0);
            } else {
                var errorMsg = "<p>Error al agregar el permiso.<p><ul>";
                $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                errorMsg += "</ul>";
                erroresValidacion("erroresValidacionPermisos", errorMsg);
            }
        }).fail(function (jqXHR, textStatus) {
            errorDetalle = "";
            // If req debug show errorDetalle
            $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
            erroresValidacion( "erroresValidacionPermisos", "Error al dar de alta el permiso del elemento del menu." );
        }).always(function() {
            $( '#loading_modal_profiles' ).hide();
            $( '#formGuardarPermisos'   ).show();
        });
    }
    function resetProfileTable() {
        rolesList = [];
        $( "#erroresValidacionPermisos" ).html("");
        $( '#modalProfileRol' ).val(0);
        $( '#modalProfilesTable tr' ).remove();
        var row = "<tr style=\"text-align: center;\">";
        row += "<td colspan=\"3\"> No hay permisos definidos </td>";
        row += "</tr>";
        $( '#modalProfilesTable' ).append(row);
    }
    function getProfileList() {
        $( '#loading_modal_profiles' ).show();
        $( '#formGuardarPermisos'   ).hide();
        $.ajax({
            headers: {
                      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url    : "{{ route('menu.consultar.permiso') }}",
            method : "POST",
            data   : {
                id : $( "#modalProfileMenu" ).val()
            }
        }).done(function( data ) {
            if(data.resultado === 'OK') {
                $.each(data.datos, function(key, value) {
                    var rol = {
                        "description" : value.description,
                        "id"          : value.id,
                        "profile"     : value.profile_id
                    };
                    addProfileTr(rol);
                });
            } else {
                var errorMsg = "<p>Error al consultar permisos.<p><ul>";
                $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                errorMsg += "</ul>";
                erroresValidacion("erroresValidacionPermisos", errorMsg);
            }
        }).fail(function (jqXHR, textStatus) {
            errorDetalle = "";
            // If req debug show errorDetalle
            $.each(jqXHR, function(i,val) { errorDetalle += "<br>" + i + " : " + val; } );
            erroresValidacion( "erroresValidacionPermisos", "Error al consultar los permisos del elemento del menu." );
        }).always(function() {
            $( '#loading_modal_profiles' ).hide();
            $( '#formGuardarPermisos'   ).show();
        });
    }
    $(document).ready(function () {
        $( '.profiles' ).click(function () {
            resetProfileTable();
            $( "#modalPermisosTitle" ).text( $( this ).attr( "data-title" ) );
            $( "#modalProfileMenu" ).val( $( this ).attr( "data-id" ) );
            $( "#modalPermisos" ).modal({
                keyboard : false,
                backdrop : 'static'
            });
            getProfileList();
        });
        $( '#addProfile' ).click(function () {
            var id = $( '#modalProfileRol' ).val();
            if( id == 0 ) {
                erroresValidacion( "erroresValidacionPermisos", "Selecciona un rol");
                return;
            }
            var index = buscaEnArreglo(rolesList, 'profile', id);
            if(index > -1) {
                erroresValidacion( "erroresValidacionPermisos", "Este rol ya tiene permisos");
                return;
            }
            var rol = {
                "description" : $("#modalProfileRol option:selected").text(),
                "id"          : id,
                "profile"     : 0
            }
            addProfile(rol);
        });
        $(document.body).on('click', ".removeProfile", function() {
			if(!confirm('¿Estás seguro de eliminar este permiso?')){
				return;
			}
            var tr = $(this).parent().parent();
            var id = $(this).attr("data-id");
            $( '#loading_modal_profiles' ).show();
            $( '#formGuardarPermisos'   ).hide();
            $.ajax({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url    : "{{ route('menu.eliminar.permiso') }}",
                method : "POST",
                data   : {
                    id : id
                }
            }).done(function( data ) {
                if(data.resultado === 'OK') {
                    tr.remove();
                    var index = buscaEnArreglo(rolesList, 'profile', id);
                    if(index > -1) {
                        rolesList.splice(index, 1);
                    }
                    if(rolesList.length === 0) {
                        var row = "<tr style=\"text-align: center;\">";
                        row += "<td colspan=\"3\"> No hay permisos definidos </td>";
                        row += "</tr>";
                        $( '#modalProfilesTable' ).append(row);
                    }
                    mensajeExito("erroresValidacionPermisos", "Se ha eliminado el permiso.");
                } else {
                    var errorMsg = "<p>Error al eliminar el permiso.<p><ul>";
                    $.each(data.mensajes, function(i,val) { errorMsg += ("<li>" + val + "</li>"); } );
                    errorMsg += "</ul>";
                    erroresValidacion("erroresValidacionPermisos", errorMsg);
                }
            }).always(function() {
                $( '#loading_modal_profiles' ).hide();
                $( '#formGuardarPermisos'   ).show();
            });
        });
    });
</script>
<!-- Fin de Modal para Agregar Permisos -->