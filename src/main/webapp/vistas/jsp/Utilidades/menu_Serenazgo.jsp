<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import ="org.example.webappsm.model.beans.Usuario" %>
<%Usuario usuariologueado = (Usuario) session.getAttribute("usuarioLogueado");%>

<%
    int idProvisional = 10; //CAMBIAR ESTE ID POR EL DE UN USUARIO CON IDROL 2 (SI NO TIENEN EN SU DB, CREEN UNO)
    //CAMBIEN LOS ITEMS DE LA BARRA LATERAL DE ACUERDO A LO QUE VAYAN PONIENDO EN SU SERVLET DE SERENAZGO
    //GUIENSE DE eventos.jsp de VECINO, no se que significa esta linea
    //<jsp:param name="activePage" value="eventos"/>
    //pero tienen que buscar que hace y como adaptarla a cada vista que tienen en serenazgo.
%>

<%
    String activePage = request.getParameter("activePage"); // Obtener activePage de la petición
%>

<nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->

    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
        <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
        <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;">M</h3>
    </div>


    <ul class="nav" style="position: fixed;">

        <!-- Codigo para un item de la barra lateral que no tiene sublista -->
        <li class="nav-item menu-items <%= activePage.equals("pagPrincipal") ? "active" : "" %>"> <!-- la clase "active" solo se usa para la vista que está activa -->

            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=pagPrincipal"> <!-- Cambiar href de acuerdo a lo necesario -->
                <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
            </a>
        </li>
        <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->


        <li class="nav-item menu-items <%= activePage.equals("perfil") ? "active" : "" %>">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=perfil&id=<%=usuariologueado.getId()%>">
              <span class="menu-icon">
                <i class="mdi mdi-account"></i>
              </span>
                <span class="menu-title" style="color: white;">Perfil</span>
            </a>
        </li>

        <li class="nav-item menu-items ">
            <a class="nav-link" href="https://mail.google.com/mail/u/1/?ogbl#search/sm.4dmin">
              <span class="menu-icon">
                <i class="mdi mdi-email"></i>
              </span>
                <span class="menu-title" style="color: white;">Correo</span>
            </a>
        </li>

        <li class="nav-item menu-items <%= activePage.equals("dashboard") ? "active" : "" %>">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=dashboard">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
                <span class="menu-title" style="color: white;">Dashboard</span>
            </a>
        </li>

        <li class="nav-item menu-items <%= activePage.equals("listaIncidencias") ? "active" : "" %>">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidencias">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
                <span class="menu-title" style="color: white;">Lista de incidencias</span>
            </a>
        </li>


        <li class="nav-item menu-items <%= activePage.equals("listaVecinos") ? "active" : "" %>">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=listaVecinos">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
                <span class="menu-title" style="color: white;">Lista de vecinos</span>
            </a>
        </li>

        <li class="nav-item menu-items <%= activePage.equals("listaIncidenciasPasadas") ? "active" : "" %>">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidenciasPasadas">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
                <span class="menu-title" style="color: white;">Lista de incidencias <br> pasadas</span>
            </a>
        </li>

        <li class="nav-item menu-items" onclick="return mostrarPopupCerrarSesion();">
            <a class="nav-link" href="#"> <!-- Cambiar href de acuerdo a lo necesario -->
                <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                <span class="menu-title" style="color: white;">Cerrar sesión</span>
            </a>
        </li>

        <!-- Codigo para un item de la barra lateral que SI tiene sublista FIN -->
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
                                <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default; text-align: right;"><%= usuariologueado.getNombre() + " " + usuariologueado.getApellido() %>  </h2>
                                <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Serenazgo de San Miguel, Lima</h5>
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