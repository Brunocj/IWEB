<%@ page import="org.example.webappsm.model.beans.Evento" %><%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 19:16
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}assets/vendors/mdi/css/materialdesignicons.min.css">
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
    <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->

        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
            <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
            <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;">M</h3>
        </div>


        <ul class="nav" style="position: fixed;">

            <!-- Codigo para un item de la barra lateral que no tiene sublista -->
            <li class="nav-item menu-items"> <!-- la clase "active" solo se usa para la vista que está activa -->

                <a class="nav-link" href="../pagina_principal_vecino.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
                </a>
            </li>
            <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->


            <li class="nav-item menu-items">
                <a class="nav-link" href="../Miperfil.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-account"></i>
              </span>
                    <span class="menu-title" style="color: white;">Mi perfil</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="https://mail.google.com/mail/u/0/#inbox">
              <span class="menu-icon">
                <i class="mdi mdi-email"></i>
              </span>
                    <span class="menu-title" style="color: white;">Correo</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="../solicitud/solicitarCoordinador.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-key-change"></i>
              </span>
                    <span class="menu-title" style="color: white;">Sol. coordinador(a)</span>
                </a>
            </li>
            <li class="nav-item menu-items active">
                <a class="nav-link" href="../eventos/eventos.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-earth"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Eventos</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="../incidencias/incidencia_vecino.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-alert"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Incidencias</span>
                </a>
            </li>
            <li class="nav-item menu-items" onclick="return mostrarPopupCerrarSesion();">
                <a class="nav-link" href="#"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-logout"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Cerrar sesión</span>
                </a>
            </li>
        </ul>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.jsp -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">

            <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch" style ="background-color: #000f22"> <!--Cambiar al color mas oscuro-->
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="mdi mdi-menu" style="color: white;"></span> <!--Cambiar el color de las 3 rayas de acuerdo a lo necesario (a negro en todo caso)-->
                </button>

                <ul class="navbar-nav navbar-nav-right">


                    <li class="nav-item dropdown">
                        <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                            <div class="navbar-profile">
                                <div class="Header-nav-item">
                                    <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Manuel Yarleque</h2>
                                    <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Vecino sanmiguelino</h5>
                                </div>
                                <img class="img-xs rounded-circle" src="../LogoSM.png" alt="" style ="height: 50px; width: 100%;"> <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->

                            </div>
                        </a>

                    </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                    <span class="mdi mdi-format-line-spacing"></span>
                </button>
            </div>
        </nav>
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
                                <p><strong>Fecha:</strong> <%=evento.getFechaYHora()%></p>
                                <p><strong>Hora:</strong> 08:00 AM a 10:00 AM </p>
                                <p><strong>Lugar:</strong> <%=evento.getUbicacion()%></p>
                                <p><strong>Recurrencia:</strong><%=evento.getRecurrencia()%></p>
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary custom-btn" style="right: 1px; font-size: 18px; font-weight: bold;" id="btn-inscribirse" onclick="return InscribirPopUp();">Inscribirse</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="custom-container rounded-3" id="descripcion">
                                <h4 class="mb-4">Descripción del Evento</h4>
                                <p><%=evento.getDescripcion()%></p>
                                <h4 class="mb-4">Materiales</h4>
                                <p>Te odio Bruno has bien tus base de datos la csmr</p>
                                <h4 class="mb-4">Profesor</h4>
                                <p><%=evento.getIdProfesor()%></p>
                            </div>
                        </div>
                    </div>
                    <a href="eventos.jsp" class="btn btn-primary fixed-button" style="position: absolute; bottom: 20px; right: 20px; font-size: 18px; font-weight: bold;">Volver a Eventos</a> <!-- Alineación del botón a la derecha -->
                </div>

            </div>
            <% } %>
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



<script src="${pageContext.request.contextPath}/vistas/jsp/VECINO/eventos/scripts_detalles_evento.js">  </script>
<!-- End custom js for this page -->
</body>
</html>
