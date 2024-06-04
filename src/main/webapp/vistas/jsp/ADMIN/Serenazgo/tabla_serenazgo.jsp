<%@ page import="org.example.webappsm.model.beans.Serenazgo" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Serenazgo> lista = (ArrayList<Serenazgo>) request.getAttribute("listaserenazgo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vistas/jsp/ADMIN/Serenazgo/styles_tabla.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/vistas/jsp/LogoSM.png"/>
    <!--Cambiar la ubicacion del logo de la pagina aca tmb-->
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->

    <nav class="sidebar sidebar-offcanvas" id="sidebar" style="background-color: #000f22;">
        <!--Cambiar al color mas oscuro-->

        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top"
             style="background-color: #000f22;">
            <h3 class="sidebar-brand brand-logo" style="color:white; font-weight: 200; cursor: default;">Menú</h3>
            <h3 class="sidebar-brand brand-logo-mini" style="color:white; font-weight: 200; cursor: default;">M</h3>
        </div>

        <ul class="nav" style="position: fixed;">
            <!-- Codigo para un item de la barra lateral que no tiene sublista -->
            <li class="nav-item menu-items ${"pagPrincipal".equals(request.getParameter("action")) ? "active" : ""}"> <!-- la clase "active" solo se usa para la vista que está activa -->
                <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=pagPrincipal"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                        <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
                    </span>
                    <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
                </a>
            </li>
            <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->

            <li class="nav-item menu-items">
                <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=dashboard">
                    <span class="menu-icon">
                        <i class="mdi mdi-chart-bar"></i>
                    </span>
                    <span class="menu-title" style="color: white;">Dashboard</span>
                </a>
            </li>
            <li class="nav-item menu-items ">
                <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=tablaSerenazgo">
                    <span class="menu-icon">
                        <i class="mdi mdi-security"></i>
                    </span>
                    <span class="menu-title" style="color: white;">Serenazgo</span>
                </a>
            </li>
            <li class="nav-item menu-items">
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
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=tablaAcceso" style="color: white;">
                                <span class="menu-icon">
                                    <i class="mdi mdi-account-alert"></i>
                                </span>
                                Sol. de acceso
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=tablaCoordinador" style="color: white;">
                                <span class="menu-icon">
                                    <i class="mdi mdi-account-alert"></i>
                                </span>
                                Sol. a coordinación
                            </a>
                        </li>
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
            <!-- Codigo para un item de la barra lateral que SI tiene sublista FIN -->
        </ul>
    </nav>
    <!-- partial -->

    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.jsp -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">
            <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch" style="background-color: #000f22">
                <!--Cambiar al color mas oscuro-->
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="mdi mdi-menu" style="color: white;"></span>
                    <!--Cambiar el color de las 3 rayas de acuerdo a lo necesario (a negro en todo caso)-->
                </button>

                <ul class="navbar-nav navbar-nav-right">
                    <li class="nav-item dropdown">
                        <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                            <div class="navbar-profile">
                                <div class="Header-nav-item">
                                    <h2 class="mb-0 d-none d-sm-block navbar-profile-name"
                                        style="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default; text-align: right;">
                                        ADMIN
                                    </h2>
                                    <h5 class="mb-0 d-none d-sm-block navbar-profile-name"
                                        style="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">
                                        Administrador de San Miguel
                                    </h5>
                                </div>
                                <img class="img-xs rounded-circle" src="<%=request.getContextPath()%>/vistas/jsp/LogoSM.png" alt=""
                                     style="height: 50px; width: 100%;">
                                <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->
                            </div>
                        </a>
                    </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                        data-toggle="offcanvas">
                    <span class="mdi mdi-format-line-spacing"></span>
                </button>
            </div>
        </nav>
        <!-- partial -->

        <div class="main-panel">
            <div>
                <div class="content-wrapper" style="background-color: #FFEBEE;"> <!--Cambiar al color mas claro-->
                    <!--CONTENIDO-->
                    <div style="display: flex; justify-content: space-between;">
                        <div style="display: flex; justify-content: space-between;">
                            <div style="display: flex; flex-direction: column;">
                                <h2 class="tabla-title" style="color:#000f22;">Personal de Serenazgo</h2>
                                <!--Cambiar el titulo de la tabla-->

                                <div style="display: flex; gap:30px; margin-top: 10px;">
                                    <div style="display: flex; gap:10px;">
                                        <p style="color:black; align-self: center; margin-bottom: 0px; font-size: 15px">
                                            Filtrar por turno :
                                        </p>
                                        <select id="filtroEstado"
                                                style="border-color: #DFDFDF; border-radius: 6px; padding:5px; outline: none; height: 40px; margin-top: 10px;">
                                            <option value="">Mostrar Todos</option>
                                            <!--Cambiar el filtro de acuerdo a lo necesario-->
                                            <option value="Mañana">Mañana</option>
                                            <option value="Tarde">Tarde</option>
                                            <option value="Noche">Noche</option>
                                        </select>
                                    </div>
                                    <div style="display: flex; align-items: center; justify-content: center;">
                                        <button id="limpiarFiltros" class="btnTable" style="display: flex; align-items: center;">
                                            Limpiar Filtros
                                            <a class="mdi mdi-filter-remove" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                                        </button>
                                    </div>
                                    <div style="display: flex; align-items: center; justify-content: center;">
                                        <button id="agregarPersonal" class="btnTable" style="display: flex; align-items: center;" onclick="window.location.href='serenazgoRegistro.jsp'">
                                            Agregar Personal
                                            <a class="mdi mdi-account-plus" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table id="miTabla" class="table" style="margin-bottom:15px;">
                        <thead style="background-color: #ff8e9f;">
                        <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                        <tr style="text-align: center; font-weight:800;">
                            <th style="color: white; font-size: 17px; cursor: pointer;">Apellidos</th>
                            <th style="color: white; font-size: 17px; cursor: pointer;">Nombres</th>
                            <th style="color: white; font-size: 17px; cursor: pointer;">Turno</th>
                            <th style="color: white; font-size: 17px; cursor: pointer;">Tipo</th>
                            <th style="width: 20px; color: white;"></th>
                            <th style="width: 20px; color: white;"></th>
                            <th style="width: 20px; color: white;"></th>
                        </tr>
                        </thead>
                        <hr style="border: none; border-top: 3px solid black; margin-top: -55px; border-radius: 10px;">
                        <tbody style="text-align: center; color: black;">
                        <%
                            if (lista != null) {
                                for (Serenazgo serenazgo : lista) {
                        %>
                        <tr style="text-align: center;">
                            <td><a><%= serenazgo.getApellido() %></a></td>
                            <td><a><%= serenazgo.getNombre() %></a></td>
                            <td><%= serenazgo.getTurno() %></td>
                            <td><%= serenazgo.getTipo() %></td>
                            <td><a href="<%=request.getContextPath()%>/Admin?action=verSerenazgo&idVer=<%= serenazgo.getIdSerenazgo() %>" class="mdi mdi-eye" style="color: #6c7293; font-size: 20px;"></a></td>
                            <td><a href="<%= request.getContextPath() %>/Admin?action=editarSerenazgo?idEditar=<%= serenazgo.getIdSerenazgo() %>" class="mdi mdi-lead-pencil" style="color: #6c7293; font-size: 20px;"></a></td>
                            <td><a href="#" onclick="eliminarSerenazgo(<%= serenazgo.getIdSerenazgo() %>)" class="mdi mdi-delete" style="color: #6c7293; font-size: 20px;"></a></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5">No hay personal de serenazgo disponible.</td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <div id="contadorTurnos"></div>
                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.jsp -->
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
    </div>
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="<%=request.getContextPath()%>/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="<%=request.getContextPath()%>/assets/js/off-canvas.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/hoverable-collapse.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/misc.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/settings.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/todolist.js"></script>
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
            confirmButtonText: 'Sí, cerrar sesión'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "../../LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/vistas/jsp/ADMIN/Serenazgo/script_tabla.js"></script>
<!-- End custom js for this page -->
</body>
</html>