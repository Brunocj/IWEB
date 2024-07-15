<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page import="java.util.ArrayList" %><%--
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Eventos</title>

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
        .badge-success {
            background-color: #28a745;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
            display: inline-block;
            margin-bottom: 10px;
        }

        .badge-finished {
            background-color: #ff0000; /* Red color */
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
            display: inline-block;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .cardEvent {
            width: 100%;
            max-width: 300px;
            height: 250px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            margin: auto;
        }

        .cardEvent img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .cardEvent .card-body {
            padding: 15px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .cardEvent .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .cardEvent .card-text {
            flex: 1;
            font-size: 14px;
            color: #555;
        }

        .cardEvent .btn-bottom-right {
            margin-top: 10px;
            align-self: flex-end;
        }

        .row-cols-1 > .col,
        .row-cols-md-2 > .col,
        .row-cols-lg-4 > .col {
            padding: 15px;
        }
    </style>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->
    <%
        //String userRole = (String) session.getAttribute("userRole"); ->Usar cuando empecemos con las sessions

        String userRole = "Vecino"; //Cambiar de acuerdo al rol (hasta que obtengamos el userRole mediante querys
        String menu = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>

    <%-- Incluir el menú y pasar el parámetro de la página activa --%>
    <jsp:include page="<%= menu %>">
        <jsp:param name="activePage" value="eventos"/>
    </jsp:include>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
                <!-- Sección de contenido -->
                <section class="py-3">
                    <h2 style ="color:#000f22; font-size: 30px; font-weight: bold; margin-bottom: 20px;">Eventos | Eventos por elegir</h2>
                </section>
                <hr style="color:#000f22; border: none; border-top: 3px solid black; margin-top: -15px; border-radius: 10px;">
                <section class="py-5" >
                    <%
                        // Suponiendo que eventos es un ArrayList<Evento> que proviene del servlet o controlador
                        ArrayList<Evento> eventos = (ArrayList<Evento>) request.getAttribute("listaEventos");

                        int columnasPorFila = 4;
                        int contador = 0;

                        // Iterar sobre la lista de eventos
                        for (Evento evento : eventos) {
                            // Abrir un nuevo container y row cada 4 eventos
                            if (contador % columnasPorFila == 0) {
                    %>
                    <div class="container" style="padding-top: 0px;">
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                            <% } %>

                            <%-- Inicio de una columna para cada evento --%>
                            <div class="col">
                                <div class="cardEvent" data-event-id="<%= evento.getIdEvento() %>">
                                    <img src="data:image/jpeg;base64, <%= new String(org.apache.commons.codec.binary.Base64.encodeBase64(evento.getImagenes())) %>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title"><%= evento.getTitulo() %></h5>
                                        </div>
                                        <div class="event-date">
                                            <i class="mdi mdi-calendar"></i> <%= evento.getFecha() %> - <i class="mdi mdi-clock"></i> <%= evento.getHora() %>
                                        </div>
                                        <a href ="${pageContext.request.contextPath}/Vecino?action=verEvento&id=<%= evento.getIdEvento() %>" class="btn btn-primary btn-sm btn-bottom-right">Ver evento</a>
                                    </div>
                                </div>
                            </div>

                            <%-- Cerrar el container y row al final de cada grupo de 4 eventos o al final de la lista --%>
                            <% if ((contador + 1) % columnasPorFila == 0 || contador == eventos.size() - 1) { %>
                        </div> <!-- Cerrar row -->
                    </div> <!-- Cerrar container -->
                    <% } %>

                    <% contador++;
                    } %>


                </section>
                <nav>
                    <ul class="pagination justify-content-center">

                        <li class="page-item active"><a class="page-link page-button" href="#" data-page="1">1</a></li>
                        <li class="page-item"><a class="page-link page-button" href="#" data-page="2">2</a></li>

                    </ul>
                </nav>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
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

<script src = "${pageContext.request.contextPath}/vistas/jsp/VECINO/eventos/script_eventos.js"></script>

<!-- End custom js for this page -->
</body>
</html>




