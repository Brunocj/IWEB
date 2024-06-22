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
                    <h2 style ="color:#000f22; font-size: 30px; font-weight: bold; margin-bottom: 20px;">Eventos | Eventos pasados</h2>
                </section>
                <hr style="color:#000f22; border: none; border-top: 3px solid black; margin-top: -15px; border-radius: 10px;">
                <section class="py-5" >
                    <div class="container" style ="padding-top: 0px;">
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                            <div class="col">
                                <div class="cardEvent" data-event-id="16">
                                    <img src="fotos/foto5.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <!-- Botón en la parte inferior derecha -->
                                        <a href ="detalles_eventos_pasados.jsp?eventId=16" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col">
                                <div class="cardEvent" data-event-id="17" >
                                    <img src="fotos/foto5.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href ="detalles_eventos_pasados.jsp?eventId=17" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="cardEvent" data-event-id="18">

                                    <img src="fotos/foto5.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=18" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="cardEvent" data-event-id="19">

                                    <img src="fotos/foto5.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=19" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="container">
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                            <div class="col">
                                <div class="cardEvent" data-event-id="20">

                                    <img src="fotos/foto6.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=20" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="cardEvent" data-event-id="21">

                                    <img src="fotos/foto6.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=21" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="cardEvent" data-event-id="22">

                                    <img src="fotos/foto6.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=22" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="cardEvent" data-event-id="23">

                                    <img src="fotos/foto6.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=23" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="container">
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                            <div class="col">
                                <div class="cardEvent" data-event-id="9">

                                    <img src="fotos/foto3.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=9" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="cardEvent" data-event-id="10">

                                    <img src="fotos/foto3.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=10" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="cardEvent" data-event-id="11">

                                    <img src="fotos/foto3.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="card-title">Título de la Tarjeta</h5>
                                        </div>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="detalles_eventos_pasados.jsp?eventId=11" class="btn btn-primary btn-sm btn-bottom-right">Ver nota</a>
                                    </div>
                                </div>
                            </div>
                        </div>

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





