<%@ page import="org.example.webappsm.model.beans.Urbanizacion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.example.webappsm.model.beans.Tipos" %><%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idProvisional = 10;
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
    <!-- partial:../../partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->

        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
            <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
            <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;">M</h3>
        </div>


        <ul class="nav" style="position: fixed">
            <!-- Codigo para un item de la barra lateral que no tiene sublista -->
            <li class="nav-item menu-items ${"pagPrincipal".equals(request.getParameter("action")) ? "active" : ""}">
                <a class="nav-link" href="<%=request.getContextPath()%>/Vecino?action=pagPrincipal"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
                </a>
            </li>
            <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->
            <!-- Codigo para un item de la barra lateral que no tiene sublista -->
            <li class="nav-item menu-items ${"miPerfil".equals(request.getParameter("action")) ? "active" : ""}">
                <a class="nav-link" href="<%=request.getContextPath()%>/Vecino?action=miPerfil&id=<%=idProvisional%>">
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
            <li class="nav-item menu-items ${"solCoordinador".equals(request.getParameter("action")) ? "active" : ""}">
                <a class="nav-link" href="<%=request.getContextPath()%>/Vecino?action=solCoordinador">
              <span class="menu-icon">
                <i class="mdi mdi-key-change"></i>
              </span>
                    <span class="menu-title" style="color: white;">Sol. coordinador(a)</span>
                </a>
            </li>
            <li class="nav-item menu-items ${"eventos".equals(request.getParameter("action")) ? "active" : ""}">
                <a class="nav-link" href="<%=request.getContextPath()%>/Vecino?action=eventos"><!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-earth"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Eventos</span>
                </a>
            </li>
            <li class="nav-item menu-items ${"incidencias".equals(request.getParameter("action")) ? "active" : ""}">
                <a class="nav-link" href="<%=request.getContextPath()%>/Vecino?action=incidencias"> <!-- Cambiar href de acuerdo a lo necesario -->
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

            <!-- Codigo para un item de la barra lateral que SI tiene sublista FIN -->
            <!-- Codigo para un item de la barra lateral que SI tiene sublista FIN -->
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
                                <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" alt="" style ="height: 50px; width: 100%;"> <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->

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
            <div class="content-wrapper" style ="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
                <!--CONTENIDO-->
                <div class="container">
                    <div class="card" style="margin-top: 40px;">
                        <div class = "wrapper"id="formContent">
                            <!-- Tabs Titles -->
                            <center><h2 class="active" style="color: black;">Registro de incidencia</h2></center>
                            <!-- Icon -->
                            <!-- Login Form -->
                            <form id="incidenciaRegistro" action ="${pageContext.request.contextPath}/Vecino?action=registrarIncidencia" method="POST" enctype="multipart/form-data">
                                <div class="inputs">
                                    <input type="text" id="nombreIncidencia" name ="nombreIncidencia" class="input-field" placeholder="Nombre de la incidencia" required>
                                    <input type="text" id="lugar" name="lugar" class="input-field" placeholder="Lugar en dónde la incidencia" required>
                                    <input type="text" id="ref" name="ref" class="input-field" placeholder="Referencia" required>
                                    <input type="hidden" id ="fecha" name="fecha" value="<%= horaActual %>">
                                    <input type="hidden" id ="idUsuario" name="idUsuario" value="<%= idProvisional %>">
                                    <select id="idUrb" name="idUrb" class="input-field">
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
                                    <input type="submit" class="sbmt green" value="Registrar incidencia" onclick="return confirmarRegistro();">
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
            function mostrarPopupCerrarSesion() {
                Swal.fire({
                    title: 'Cerrar sesión',
                    text: '¿Estás seguro de que deseas cerrar sesión?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#00913f',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, cerrar sesión',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "../../LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                    }
                });
            }

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


