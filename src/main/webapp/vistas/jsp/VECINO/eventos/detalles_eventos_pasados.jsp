<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page import="org.example.webappsm.model.daos.CoordinadorDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
        <style>
            .carousel-control-prev-icon, .carousel-control-next-icon {
                background-color: rgba(0, 0, 0, 0.5);
                border-radius: 50%;
                width: 50px;
                height: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .carousel-control-prev-icon:after, .carousel-control-next-icon:after {
                font-family: 'Font Awesome 5 Free';
                font-weight: 900;
                font-size: 20px;
                color: white;
            }

            .carousel-control-prev-icon:after {
                content: '\f053';
            }

            .carousel-control-next-icon:after {
                content: '\f054';
            }

            .carousel-item img {
                height: 320px;
                object-fit: cover;

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
                <jsp:param name="activePage" value="eventosPasados"/>
            </jsp:include>

            <!-- partial -->
            <div class="main-panel">
                <%
                    Evento evento = (Evento) request.getAttribute("evento");
                    ArrayList<String> imagenesEvento = (ArrayList<String>) request.getAttribute("imagenesEvento");
                    if (evento == null) {
                        out.print("<p class='alert alert-danger'>Error: No se encontró el evento.</p>");
                    } else {
                %>
                <div class="content-wrapper" style="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div id="eventCarousel" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <%
                                            if (imagenesEvento != null && !imagenesEvento.isEmpty()) {
                                                boolean first = true;
                                                for (String imagen : imagenesEvento) {
                                        %>
                                        <div class="carousel-item <%= first ? "active" : "" %>">
                                            <img src="data:image/jpeg;base64,<%= imagen %>" class="d-block w-100" alt="Foto del evento">
                                        </div>
                                        <%
                                                    first = false;
                                                }
                                            }
                                        %>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#eventCarousel" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden"></span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#eventCarousel" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden"></span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="custom-container rounded-3" id="fechas">
                                    <h4 class="datos-evento mb-4">Descripción del Evento</h4>
                                    <p class="datos-evento mb-4"><%= evento.getDescripcion() %></p>
                                    <h4 class="datos-evento mb-4">Notas del Evento</h4>
                                    <p class="datos-evento mb-4"><%= evento.getResumen() %></p>
                                    <h4 class="datos-evento mb-4">Staff del Evento</h4>
                                    <%
                                        CoordinadorDao coordinadorDao = new CoordinadorDao();
                                        Integer idProfesor = evento.getIdProfesor();
                                        String nombreProfesor = coordinadorDao.obtenerNombreCompletoPorId(idProfesor);
                                    %>
                                    <p class="datos-evento mb-4"><%= nombreProfesor %></p>
                                </div>
                            </div>
                        </div>

                        <% } %>

                        <a href="${pageContext.request.contextPath}/Vecino?action=eventosPasados&id=<%=idUsuario%> " class="btn custom-btn fixed-button" style="padding: 12px 24px; font-size: 27px ; float: right; backgroundcolor: #00913f ;margin-top: 303px;">Volver a Eventos Pasados</a> <!-- Alineación del botón a la derecha -->
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
        <!-- End Plugin js for this page -->
        <!-- inject:js -->
        <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
        <script src="../assets/js/misc.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
        <!-- endinject -->
        <!-- SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- jQuery UI -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom js for this page -->
        <script src="${pageContext.request.contextPath}/vistas/jsp/VECINO/eventos/scripts_detalles_evento.js"></script>
        <!-- End custom js for this page -->
    </body>
</html>
