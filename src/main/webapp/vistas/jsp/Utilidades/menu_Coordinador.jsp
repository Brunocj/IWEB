<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page import="org.example.webappsm.model.daos.ProfesorDao" %>
<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int idProvisional = 12; //poosteriormente, obtener el id con query
    ProfesorDao profesorDao = new ProfesorDao();
%>
<%Usuario usuariologueado= (Usuario) session.getAttribute("usuarioLogueado");%>o

<nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->

    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
        <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
        <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;">M</h3>
    </div>


    <ul class="nav" style="position: fixed">
        <!-- Codigo para un item de la barra lateral que no tiene sublista -->
        <li class="nav-item menu-items ${"pagPrincipal".equals(request.getParameter("action")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Coordinador?action=pagPrincipal"> <!-- Cambiar href de acuerdo a lo necesario -->
                <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
            </a>
        </li>

        <li class="nav-item menu-items ${"miPerfil".equals(request.getParameter("action")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Coordinador?action=miPerfil&id=<%=usuariologueado.getId()%>">
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
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-earth"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                <span class="menu-title vecinos" style="color: white;">Eventos</span>
                <i class="menu-arrow" style="color: white;"></i>
            </a>

            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu"><!-- Colocar items de la sublista -->

                    <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/Coordinador?action=eventos&id=<%=usuariologueado.getId()%>">
                  <span class="menu-icon">
                    <i class="mdi mdi-calendar-plus"></i>
                  </span>
                        Eventos creados</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/Coordinador?action=EventosNota&id=<%=usuariologueado.getId()%>">
                    <span class="menu-icon">
                    <i class="mdi mdi-calendar-text"></i>
                  </span>
                        Eventos pendientes</a></li>
                </ul>
            </div>
        </li>




        <li class="nav-item menu-items ${"incidencias".equals(request.getParameter("action")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Coordinador?action=incidencias"> <!-- Cambiar href de acuerdo a lo necesario -->
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

            <ul class="navbar-nav navbar-nav-right">


                <li class="nav-item dropdown">
                    <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                        <div class="navbar-profile">
                            <div class="Header-nav-item">
                                <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;"><%=usuariologueado.getNombre() +" "+usuariologueado.getApellido()%></h2> <!--Posteriormente obtener mediante querys -->
                                <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Coordinador de <%=profesorDao.obtenerNombreAreaPorId(usuariologueado.getIdArea())%></h5>
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
                    window.location.href = "${pageContext.request.contextPath}/sys?action=logout"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                }
            });
        }
    </script>


