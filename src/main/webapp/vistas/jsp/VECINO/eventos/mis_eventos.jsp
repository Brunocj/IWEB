<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page import="java.util.ArrayList" %><%--
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
        <div class="content-wrapper" style ="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
            <!-- Sección de contenido -->
            <section class="py-3">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-4">
                            <a href="${pageContext.request.contextPath}/Vecino?action=misEventos" class="btn btn-primary btn-lg d-block mb-3" style ="background-color:  #183d6c;">Mis Eventos</a>
                        </div>
                        <div class="col-md-4">
                            <a href="${pageContext.request.contextPath}/Vecino?action=eventos" class="btn btn-primary btn-lg d-block mb-3 topBtn" style ="background-color: #000f22;">Eventos</a> <!--Cambiar el color de acuerdo al que este seleccionado (el codigo de color de estalinea es el que se debe usar para cuando se encuentra una pestaña seleccionada; en coordinador, usar otro color, pero que sea más oscuro)-->
                        </div>
                        <div class="col-md-4">
                            <a href= "eventos_pasados.jsp" class="btn btn-primary btn-lg d-block mb-3" style ="background-color:  #000f22;">Eventos Pasados</a>
                        </div>
                    </div>
                </div>
            </section>
            <section class="py-5" >
                <%
                    // Suponiendo que eventos es un ArrayList<Evento> que proviene del servlet o controlador
                    ArrayList<Evento> eventos = (ArrayList<Evento>) request.getAttribute("listaMisEventos");

                    int columnasPorFila = 4;
                    int contador = 0;

                    // Iterar sobre la lista de eventos
                    for (Evento evento : eventos) {
                        // Abrir un nuevo container y row cada 4 eventos
                        if (contador % columnasPorFila == 0) {
                %>
                <div class="container" style ="padding-top: 0px;">
                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                        <% } %>
                        <div class="col">
                            <div class="cardEvent" data-event-id="<%= evento.getIdEvento() %>">
                                <img  src="data:image/jpeg;base64, <%= new String(org.apache.commons.codec.binary.Base64.encodeBase64(evento.getImagenes())) %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5 class="card-title"><%= evento.getTitulo() %></h5>
                                    </div>
                                    <p class="card-text"><%= evento.getDescripcion() %></p>
                                    <!-- Botón en la parte inferior derecha -->
                                    <a href ="${pageContext.request.contextPath}/Vecino?action=verMiEvento&id=<%= evento.getIdEvento() %>" class="btn btn-primary btn-sm btn-bottom-right">Ver mi evento</a>
                                </div>
                            </div>
                        </div>
                        <% if ((contador + 1) % columnasPorFila == 0 || contador == eventos.size() - 1) { %>
                    </div>
                </div>
                <% } %>

                <% contador++;
                } %>
            </section>
            <nav>
                <ul class="pagination justify-content-center">
                    <li class="page-item" id="previousPage">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Anterior</a>
                    </li>
                    <li class="page-item active"><a class="page-link page-button" href="#" data-page="1">1</a></li>
                    <li class="page-item"><a class="page-link page-button" href="#" data-page="2">2</a></li>

                    <!-- Repite este bloque para más números de página si es necesario -->
                    <li class="page-item" id="nextPage">
                        <a class="page-link" href="#">Siguiente</a>
                    </li>
                </ul>
            </nav>
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
<script src = "${pageContext.request.contextPath}/vistas/jsp/VECINO/eventos/script_eventos.js"></script>
<!-- End custom js for this page -->
</body>
</html>





