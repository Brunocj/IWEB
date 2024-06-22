<%@ page import="org.example.webappsm.model.beans.Evento" %><%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idProvisional = 10;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Mi perfil</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/VECINO/eventos/styles_eventos.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->
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
            <%
                Evento evento = (Evento) request.getAttribute("evento");
                if (evento == null) {
                    out.print("<p>Error: No se encontró el evento.</p>");
                } else {
            %>
            <div class="content-wrapper" style ="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="custom-container rounded-3" id="container-image">
                                <div class="event-image-container">
                                    <img id="evento-imagen" src="data:image/jpeg;base64, <%= new String(org.apache.commons.codec.binary.Base64.encodeBase64(evento.getImagenes())) %>" alt="Imagen del Evento" class="event-image img-fluid mb-4">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="custom-container rounded-3" id="fechas" style="font-size: 28px;">
                                <h4 class="mb-4 center-text"><%=evento.getTitulo()%></h4>
                                <p><strong>Fecha:</strong> <%=evento.getFecha()%></p>
                                <p><strong>Hora:</strong> <%=evento.getHora()%> </p>
                                <p><strong>Lugar:</strong> <%=evento.getUbicacion()%></p>
                                <p><strong>Recurrencia:</strong><%=evento.getRecurrencia()%></p>
                                <div class="text-center">
                                    <form id="inscripcionForm" action="<%= request.getContextPath() %>/Vecino" method="POST" style="display:none;">
                                        <input type="hidden" name="action" value="inscribir">
                                        <input type="hidden" name="idUsuario" value="<%= idProvisional %>">
                                        <input type="hidden" name="idEvento" value="<%= evento.getIdEvento() %>">
                                    </form>
                                    <button type="button" class="btn btn-primary custom-btn" style="right: 1px; font-size: 18px; font-weight: bold;" id="btn-inscribirse" onclick="return InscribirPopUp();">Inscribirse</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="custom-container rounded-3" id="descripcion">
                                <h4 class="mb-4">Descripción del Evento</h4>
                                <p><%=evento.getDescripcion()%></p>
                                <h4 class="mb-4">Materiales</h4>
                                <p>Pelota de futbol</p>
                                <h4 class="mb-4">Profesor</h4>
                                <p><%=evento.getIdProfesor()%></p>
                            </div>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/Vecino?action=eventos" class="btn btn-primary fixed-button" style="position: absolute; bottom: 20px; right: 20px; font-size: 18px; font-weight: bold;">Volver a Eventos</a> <!-- Alineación del botón a la derecha -->
                </div>

            </div>
            <% } %>

        </div>


    </div>
    </div>
    </div>
    </div>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>



<script src="${pageContext.request.contextPath}/vistas/jsp/VECINO/eventos/scripts_detalles_evento.js">  </script>
<!-- End custom js for this page -->



</body>
</html>
