<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%@ page import="org.example.webappsm.model.beans.TipoSerenazgo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Usuario usuariologueado = (Usuario) session.getAttribute("usuarioLogueado");
    ArrayList<TipoSerenazgo> listaTipos = (ArrayList<TipoSerenazgo>) request.getAttribute("listaTipos");
    int idIncidencia = (request.getAttribute("idIncidencia") != null) ? (int) request.getAttribute("idIncidencia") : 0;
    Incidencia incidencia = (Incidencia) request.getAttribute("incidencia");
    int policia = (request.getAttribute("policia") != null) ? (int) request.getAttribute("policia") : 0;
    int ambulancia = (request.getAttribute("ambulancia") != null) ? (int) request.getAttribute("ambulancia") : 0;

    // Depuración
    System.out.println("idIncidencia: " + idIncidencia);
    System.out.println("incidencia: " + incidencia);
    System.out.println("policia: " + policia);
    System.out.println("ambulancia: " + ambulancia);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Proceder con la Incidencia</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_tabla.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_proceder.css">
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>

        .descripcion-container {
            flex: 1 1 100%; /* Ocupa toda la anchura en pantallas pequeñas */
        }

        .descripcion-container textarea {
            width: 960px;
            height: 150px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
            margin-bottom: 100px;
            margin-left: 50px;
        }
    </style>

</head>
<body>
<div class="container-scroller">
    <% String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Serenazgo"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>
    <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="listaIncidencias"/>
    </jsp:include>

    <div class="main-panel">
        <form id="gestionarForm" action="${pageContext.request.contextPath}/Serenazgo?action=gestionarIncidencia" method="post">

            <input type="hidden" name="id" value="<%= idIncidencia %>">

            <div class="content-wrapper" style="background-color: #fffff6; margin-top: -30px">
                <div class="opciones-container">

                    <!-- TITULO -->
                    <div class="autoridad">
                        <h1 style="text-align: left;">Proceder con la incidencia</h1>
                        <hr style="border: none; border-top: 3px solid #000; margin: 10px 0;">
                    </div>

                    <div class="autoridad">
                        <h1 style="text-align: left;">Clasificación de la incidencia</h1>
                    </div>

                    <!-- para la clasificacion -->
                    <div class="opcion">
                        <label style="font-size: 18px; display: block; margin-bottom: 10px;">
                            <input type="radio" name="clasificacion" value="1" style="transform: scale(1.5); vertical-align: middle; margin-right: 5px;" <% if (incidencia.getClasificacion().equals("Leve")) { %> checked <% } %>> Leve
                        </label>
                    </div>

                    <div class="opcion">
                        <label style="font-size: 18px; display: block; margin-bottom: 10px;">
                            <input type="radio" name="clasificacion" value="2" style="transform: scale(1.5); vertical-align: middle; margin-right: 5px;" <% if (incidencia.getClasificacion().equals("Moderada")) { %> checked <% } %>> Moderada
                        </label>
                    </div>

                    <div class="opcion">
                        <label style="font-size: 18px; display: block; margin-bottom: 10px;">
                            <input type="radio" name="clasificacion" value="3" style="transform: scale(1.5); vertical-align: middle; margin-right: 5px;" <% if (incidencia.getClasificacion().equals("Grave")) { %> checked <% } %>> Grave
                        </label>
                    </div>

                    <div style="margin-top: 20px; margin-bottom: 50px;">
                        <hr style="border: none; border-top: 1px solid #000;">
                    </div>

                    <!-- Checkboxes de categorías -->
                    <div class="autoridad">
                        <h1 style="text-align: left;">Seleccione el tipo de serenazgo asignado</h1>
                    </div>

                    <div class="opcion">
                        <!-- Formulario de serenazgo -->
                        <div class="serenazgoSelector">
                            <select id="SerenazgoSelect" name="tipoS" class="form-combo" disabled>
                                <option value="null">--Escoja el tipo de serenazgo--</option>
                                <% for (TipoSerenazgo tipoSerenazgo : listaTipos) { %>
                                <option value="<%= tipoSerenazgo.getIdTipoSerenazgo() %>" <% if (tipoSerenazgo.getIdTipoSerenazgo() == incidencia.getIdTipoSerenazgo()) { %> selected <% } %>><%= tipoSerenazgo.getNombreTipo() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="autoridad">
                        <h1 style="text-align: left;">Seleccione la autoridad requerida</h1>
                    </div>

                    <div class="opcion">
                        <label>
                            <input type="checkbox" name="opcion" value="ambulancia" <%= (ambulancia == 1) ? "checked" : "" %> disabled> Ambulancia
                        </label>
                        <% if (ambulancia == 1) { %>
                        <div class="form-ambulancia non-editable">
                            <div class="inWrapper">
                                <div class="form-section">
                                    <input type="text" id="nombre" name="nombre" placeholder="Nombre del personal de turno" value="<%= incidencia.getPersonalAmbulancia() %>" readonly>
                                </div>
                                <div class="form-section">
                                    <input type="text" id="motivoSol" name="motivoSol" placeholder="Motivo de la solicitud" value="<%= incidencia.getMotivoAmbulancia() %>" readonly>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>


                    <div class="opcion">
                        <label>
                            <input type="checkbox" name="opcion" value="policia" <%= (policia == 1) ? "checked" : "" %> disabled> Policía
                        </label>
                        <% if (policia == 1) { %>
                        <div class="form-policia non-editable">
                            <div class="inputs">
                                <select id="comisaria" name="nombreComisaria" disabled>
                                    <option value="default">Escoja una comisaría</option>
                                    <option value="Maranga" <%= (incidencia.getIdComisaria() == 1) ? "selected" : "" %>>Maranga</option>
                                    <option value="San Miguel" <%= (incidencia.getIdComisaria() == 2) ? "selected" : "" %>>San Miguel</option>
                                </select>
                            </div>
                            <div class="inWrapper">
                                <div class="inputs">
                                    <input type="text" id="motivo" name="motivo" placeholder="Motivo de la solicitud" value="<%= incidencia.getMotivoPolicia() %>" readonly>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>

                    <div class="opcion">
                        <label>
                            <input type="checkbox" name="bomberos" value="bomberos" <%= (incidencia.isBomberoI()) ? "checked" : "" %> disabled> Bomberos
                        </label>
                    </div>
                </div>
            </div>

            <div class="opcion descripcion-container">
                <label for="descripcion">Ingrese una breve descripción de la solución a dar:</label>
                <textarea id="descripcion" name="descripcion" placeholder="Ingrese aquí la descripción" required><%= incidencia.getDescripcion() %></textarea>
            </div>

            <div class="botones-container">
                <input type="submit" onclick="return aceptar();" class="boton-confirmar" value="Actualizar">
                <input type="submit" onclick="return cancelar();" class="boton-cancelar" value="Cancelar">
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/script_tabla.js"></script>
<script src="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/script_proceder.js"></script>

<script>
    function cancelar() {
        Swal.fire({
            title: "¿Estás seguro de que deseas cancelar?",
            text: "Una vez cancelado, no se guardarán los cambios en el sistema",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#00913f",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "Sí"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Se canceló el proceso con éxito",
                    icon: "success"
                }).then(() => {
                    window.location.href = "<%= request.getContextPath() %>/Serenazgo?action=listaIncidencias";
                });
            }
        });
        return false;
    }

    function aceptar() {
        var descripcion = document.getElementById('descripcion').value.trim();
        var clasificacionSeleccionada = false;

        var checkboxes = document.getElementsByName('clasificacion');
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                clasificacionSeleccionada = true;
            }
        });

        if (!clasificacionSeleccionada) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Por favor, clasifique la incidencia antes de confirmar.'
            });
            return false;
        }

        if (descripcion === '') {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Por favor, rellene el campo de la descripción.'
            });
            return false;
        }

        Swal.fire({
            title: "¿Estás seguro de que deseas confirmar?",
            text: "Los datos ingresados se actualizarán automáticamente.",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#00913f",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "Sí"
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('gestionarForm').submit();
            }
        });
        return false;
    }
</script>

</body>
</html>
