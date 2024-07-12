<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idProvisional = 12; //poosteriormente, obtener el id con query
%>
<%Usuario usuariologueado= (Usuario) session.getAttribute("usuarioLogueado");%>
<nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->

    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
        <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200; cursor: default;">Menú</h3>
        <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200; cursor: default;">M</h3>
    </div>
    <ul class="nav" style = "position: fixed;">

        <!-- Codigo para un item de la barra lateral que no tiene sublista -->
        <li class="nav-item menu-items ${"pagPrincipal".equals(request.getParameter("activePage")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=pagPrincipal">
        <span class="menu-icon">
            <i class="mdi mdi-home"></i>
        </span>
                <span class="menu-title" style="color: white;">Página principal</span>
            </a>
        </li>
        <li class="nav-item menu-items ${"dashboard".equals(request.getParameter("activePage")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=dashboard">
        <span class="menu-icon">
            <i class="mdi mdi-chart-bar"></i>
        </span>
                <span class="menu-title" style="color: white;">Dashboard</span>
            </a>
        </li>
        <li class="nav-item menu-items ${"tablaSerenazgo".equals(request.getParameter("activePage")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=tablaSerenazgo">
        <span class="menu-icon">
            <i class="mdi mdi-security"></i>
        </span>
                <span class="menu-title" style="color: white;">Serenazgo</span>
            </a>
        </li>
        <li class="nav-item menu-items ${"tablaProfesores".equals(request.getParameter("activePage")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=tablaProfesores">
        <span class="menu-icon">
            <i class="mdi mdi-teach"></i>
        </span>
                <span class="menu-title" style="color: white;">Profesores</span>
            </a>
        </li>

        <!-- Codigo para un item de la barra lateral que SI tiene sublista -->
        <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-nature-people"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                <span class="menu-title vecinos" style="color: white;">Vecinos</span>
                <i class="menu-arrow" style="color: white;"></i>
            </a>

            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu"><!-- Colocar items de la sublista -->

                    <li class="nav-item ${"tablaAcceso".equals(request.getParameter("activePage")) ? "active" : ""}"> <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=tablaAcceso" style="color: white;">
                  <span class="menu-icon">
                    <i class="mdi mdi-account-alert"></i>
                  </span>
                        Sol. de acceso</a></li>
                    <li class="nav-item ${"tablaCoordinador".equals(request.getParameter("activePage")) ? "active" : ""}"> <a class="nav-link " href="<%=request.getContextPath()%>/Admin?action=tablaCoordinador" style="color: white;">
                  <span class="menu-icon ">
                    <i class="mdi mdi-account-alert "></i>
                  </span>
                        Sol. a coordinación</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item menu-items" onclick="return mostrarPopupCerrarSesion();">
            <a class="nav-link" href="#"> <!-- Cambiar href de acuerdo a lo necesario -->
                <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                <span class="menu-title" style="color: white;">Cerrar sesión</span>
            </a>
        </li>
    </ul>
</nav>
<!-- partial -->
<div class="container-fluid page-body-wrapper">
    <!-- partial:../../partials/_navbar.html -->
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
                                <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;"><%=usuariologueado.getNombre() + " " + usuariologueado.getApellido()%></h2>
                                <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Administrador de San Miguel, Lima</h5>
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
