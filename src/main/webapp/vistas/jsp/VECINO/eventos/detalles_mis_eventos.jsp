<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page import="org.example.webappsm.model.daos.CoordinadorDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%Usuario usuariologueado= (Usuario) session.getAttribute("usuarioLogueado");%>
<% int idUsuario = usuariologueado.getId(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
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
    <style>
        .event-image-container img {
            width: 800px;
            height: 300px;
            object-fit: cover;
        }
        .custom-container {
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .event-image-container img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .titulo-evento {
            font-size: 36px; /* Aumentado el tamaño de la fuente */
            font-weight: bold;
            color: #333;
            text-align: center; /* Centrado */
            margin-bottom: 20px;
        }
        .datos-evento {
            font-size: 24px; /* Aumentado el tamaño de la fuente */
            color: #333;

            text-align: left;
        }
        .custom-btn {
            background-color: #00913f;
            color: #fff;
            font-size: 50px;
            font-weight: bold;
            border: none;
            border-radius: 50px;
            padding: 12px 24px;
            transition: background-color 0.3s ease;
        }
        .custom-btn:hover {
            background-color:#193255;
        }

    </style>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.jsp -->
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
                                <h4 class="titulo-evento mb-4 center-text"><%=evento.getTitulo()%></h4>
                                <p class="datos-evento"><strong>Fecha:</strong> <%=evento.getFecha()%></p>
                                <p class="datos-evento"><strong>Hora:</strong> <%=evento.getFecha()%></p>
                                <p class="datos-evento"><strong>Lugar:</strong> <%=evento.getUbicacion()%></p>
                                <p class="datos-evento"><strong>Recurrencia:</strong> <span id="recurrencia-seleccionada">
  <%
      Integer recurrencia = evento.getRecurrencia();
      if (recurrencia != null) {
          if (recurrencia == 0) {
  %>
        Evento único
  <%
  } else if (recurrencia == 1) {
  %>
        Evento repetitivo
  <%
  } else {
  %>
        Valor desconocido
  <%
      }
  } else {
  %>
      Valor no disponible
  <%
      }
  %>
</span></p>
                                <div class="text-center">
                                    <form id="desinscripcionForm" action="<%= request.getContextPath() %>/Vecino" method="POST" style="display:none;">
                                        <input type="hidden" name="action" value="desinscribir">
                                        <input type="hidden" name="idUsuario" value="<%= idUsuario %>">
                                        <input type="hidden" name="idEvento" value="<%= evento.getIdEvento() %>">
                                    </form>
                                    <button type="button" class="btn btn-danger custom-btn" style="right: 1px; font-size: 28px; font-weight: bold;" id="btn-inscribirse" onclick="return AnularPopUp();">Anular Inscripción</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="custom-container rounded-3" id="descripcion">
                                <h4 class="datos-evento mb-4">Descripción del Evento</h4>
                                <p  class="datos-evento mb-4"><%=evento.getDescripcion()%></p>
                                <h4 class="datos-evento mb-4">Materiales para usar </h4>
                                <div id="opcion-material">
                                    <ul class="datos-evento mb-4">
                                        <%
                                            ArrayList<String> nombresMateriales = (ArrayList<String>) request.getAttribute("materiales");
                                            if (nombresMateriales != null && !nombresMateriales.isEmpty()) {
                                                for (String nombreMaterial : nombresMateriales) {
                                        %>
                                        <li class="datos-evento">
                                            <span><%= nombreMaterial %></span>
                                        </li>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <li>No se uso materiales</li>
                                        <%
                                            }
                                        %>
                                    </ul>


                                    <%
                                        }
                                    %>
                                </div>
                                <h4 class="datos-evento mb-4">Profesor asignado:</h4>
                                <%
                                    CoordinadorDao coordinadorDao = new CoordinadorDao();
                                    Integer idProfesor = evento.getIdProfesor();

                                    String nombreProfesor = coordinadorDao.obtenerNombreCompletoPorId(idProfesor);
                                %>
                                <p class="datos-evento"><%=nombreProfesor%></p>
                            </div>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/Vecino?action=misEventos&id=<%=idUsuario%>"class="btn custom-btn fixed-button" style="padding: 12px 24px; font-size: 27px ; float: right; backgroundcolor: #00913f ;">Volver a Mis Eventos</a> <!-- Alineación del botón a la derecha -->
                </div>

            </div>

        </div>


    </div>

    <!-- content-wrapper ends -->
    <!-- partial:../../partials/_footer.jsp -->
    <!-- partial -->
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>



<script src="${pageContext.request.contextPath}/vistas/jsp/VECINO/eventos/scripts_detalles_mi_evento.js">  </script>
<!-- End custom js for this page -->
</body>
</html>
