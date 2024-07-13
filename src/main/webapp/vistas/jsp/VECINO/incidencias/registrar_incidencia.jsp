<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.webappsm.model.beans.Urbanizacion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.example.webappsm.model.beans.Tipos" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="org.example.webappsm.model.beans.Usuario"/>
<%--

  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>

<%
    int idUsiario = usuarioLogueado.getId();
    ArrayList<Urbanizacion> listaUrbanizaciones = (ArrayList<Urbanizacion>) request.getAttribute("listaUrbanizaciones");
    ArrayList<Tipos> tiposIncidencias = (ArrayList<Tipos>) request.getAttribute("tiposIncidencias");

%>

<%
    // Obtener la hora actual
    Date fechaActual = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String horaActual = sdf.format(fechaActual);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/vistas/jsp/VECINO/incidencias/styles_registro.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-scroller">
        <%
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Vecino"; // Por defecto, si no hay rol en la sesión
        }

        String menuvecino = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>

    <%-- Incluir el menú y pasar el parámetro de la página activa --%>
    <jsp:include page="<%= menuvecino %>">
        <jsp:param name="activePage" value="eventos"/>
    </jsp:include>
    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper" style ="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->
            <div class="container">
                <div class="card" style="margin-top: 40px;">
                    <div class = "wrapper"id="formContent">
                        <!-- Tabs Titles -->
                        <center><h2 class="active" style="color: black;">Registro de incidencia</h2></center>
                        <!-- Icon -->
                        <!-- Login Form -->
                        <form id="incidenciaRegistro" action ="${pageContext.request.contextPath}/Vecino?action=registrarIncidenciaPOST" method="POST" enctype="multipart/form-data">
                            <div class="inputs">
                                <input type="text" id="nombreIncidencia" name ="nombreIncidencia" class="input-field" placeholder="Nombre de la incidencia" required>
                                <input type="text" id="lugar" name="lugar" class="input-field" placeholder="Lugar en dónde la incidencia" required>
                                <input type="text" id="ref" name="ref" class="input-field" placeholder="Referencia" required>
                                <input type="hidden" id ="fecha" name="fecha" value="<%= horaActual %>">
                                <input type="hidden" id ="idUsuario" name="idUsuario" value="<%= idUsiario %>">
                                <select id="idUrb" name="urbanizacionId" class="input-field">
                                    <option value="" disabled selected>Urbanizacion</option>
                                    <%
                                        for(Urbanizacion urbanizacion: listaUrbanizaciones){

                                    %>
                                    <option value ="<%=urbanizacion.getIdUrbanizacion()%>"><%=urbanizacion.getNombreUrbanizacion()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <input type="text" id="contacto" name="contacto" class="input-field" placeholder="Contacto (opcional)">
                                <select id="idTipoIncidencia" name ="idTipoIncidencia" class="input-field">
                                    <option value="" disabled selected>Tipo de incidencia</option>
                                    <%
                                        for(Tipos tipo: tiposIncidencias){

                                    %>
                                    <option value ="<%=tipo.getIdTipo()%>"><%=tipo.getNombreTipo()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <select id="ambulanciaSN" name="ambulanciaSN" class="input-field">
                                    <option value="" disabled selected>Requiere ambulancia (s/n)?</option>
                                    <option value="1">Sí</option>
                                    <option value="0">No</option>
                                </select>
                                <div class="formImg">
                                    <label style="color: rgba(0,0,0,0.6); margin-left: 5px;">Selecciona una foto:</label>
                                    <div class="foto-flex">
                                        <input type="file" id="upload" name="foto" accept="image/*">
                                    </div>
                                </div>
                            </div>
                            <div class="buttons">
                                <input type="submit" class="sbmt green" value="Registrar incidencia">
                                <input  type="submit" class="sbmt red" value="Cancelar" onclick="return cancelarRegistro();">
                            </div>
                        </form>

                    </div>

                </div>
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script>

        function cancelarRegistro() {
            Swal.fire({
                title: "¿Estás seguro de que deseas anular el registro de esta incidencia?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Confirmar",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {
                    // Redireccionar a evento.html
                    window.location.href = "<%=request.getContextPath()%>/Vecino?action=incidencias";
                }
            });



            return false;
        }

        function confirmarRegistro() {
            Swal.fire({
                title: "¿Estás seguro de que deseas registrar esta incidencia?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Confirmar",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById("incidenciaRegistro").submit(); // Envía el formulario
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }
    </script>
    <!-- End custom js for this page -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>
</html>


