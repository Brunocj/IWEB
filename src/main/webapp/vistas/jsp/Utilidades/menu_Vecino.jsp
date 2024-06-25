<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:useBean id="usuarioLogueado" scope="session" type="org.example.webappsm.model.beans.Usuario"/>
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

        <li class="nav-item menu-items ${"miPerfil".equals(request.getParameter("action")) ? "active" : ""}">
            <a class="nav-link" href="<%=request.getContextPath()%>/Vecino?action=miPerfil&id=<%=usuarioLogueado.getId()%>">
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
                                <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;"><%=usuarioLogueado.getNombre()%> <%=usuarioLogueado.getApellido()%></h2> <!--Posteriormente obtener mediante querys -->
                                <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Vecino Sanmiguelino</h5>
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
