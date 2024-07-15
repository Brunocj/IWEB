<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String totalBaneados = (String) request.getAttribute("totalbaneados");
    String avgIncidencias = (String) request.getAttribute("avgincidencias");
    String totalIncidencias = (String) request.getAttribute("totalincidencias");
    String incidenciasComunMax = (String) request.getAttribute("incidenciascomunmax");
    String incidenciasComunMin = (String) request.getAttribute("incidenciascomunmin");
    String incidenciasPorAtender = (String) request.getAttribute("incidenciasatender");
    String incidenciasUrbMax = (String) request.getAttribute("incidenciasurbmax");
    String incidenciasUrbMin = (String) request.getAttribute("incidenciasurbmin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Dashboard/styles_tabla.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">

    <!-- Montserrat Font -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Dashboard/styles_dashboard.css">

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" /> <!--Cambiar la ubicacion del logo de la pagina aca tmb-->
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
            <li class="nav-item menu-items "> <!-- la clase "active" solo se usa para la vista que está activa -->

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

                        <li class="nav-item  "> <a class="nav-link" href="<%=request.getContextPath()%>/Admin?action=tablaAcceso" style="color: white;">
                  <span class="menu-icon">
                    <i class="mdi mdi-account-alert"></i>
                  </span>
                            Sol. de acceso</a></li>
                        <li class="nav-item "> <a class="nav-link " href="<%=request.getContextPath()%>/Admin?action=tablaCoordinador" style="color: white;">
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
            <!-- Codigo para un item de la barra lateral que SI tiene sublista -->

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
                                    <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: -30px; font-size: 23px; font-weight:500; cursor: default; text-align: right;">ADMIN</h2>
                                    <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: -30px; font-size: 15px; font-weight:500; cursor: default;">Administrador de San Miguel</h5>
                                </div>
                                <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" alt="" style ="height: 50px; width: 100%;margin-right: -17px;"> <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->

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
            <div >
                <div class="content-wrapper" style ="background-color: #FFEBEE;"> <!--Cambiar al color mas claro-->

                    <!--CONTENIDO-->
                    <div class="main-panel">
                        <div class="content-wrapper" style ="background-color: #FFEBEE; margin-top: -90px;"> <!--Cambiar al color mas claro-->
                            <h2 class="tabla-title" style ="color:#000f22;">Dashboard</h2>  <!--Cambiar el titulo de la tabla-->
                            <hr style="border: none; border-top: 3px solid black; margin-top: 0px; border-radius: 10px; margin-bottom: -50px;">
                            <main class="main-container">
                                <div class="main-cards" >
                                    <!-- primer card -->

                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 25px; text-align: center;">Cantidad total de incidencias </h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">addchart</span>
                                        </div>
                                        <h1 style="margin-top: 20px;text-align: center; color: #000f22;"><%=totalIncidencias%> incidencias</h1>
                                    </div>


                                    <!-- segundo card -->

                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 25px; text-align: center;">Promedio de incidencias por día</h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">query_stats</span>
                                        </div>
                                        <h1 style="margin-top: 20px; text-align: center;"><%=avgIncidencias%> incidencias</h1>
                                    </div>

                                    <!-- tercer card -->
                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 25px; text-align: center;">Urbanización con mayor incidencia</h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">maps_home_work</span>
                                        </div>
                                        <h1 style="margin-top: 20px; text-align: center;font-size: 30px;">Urbanización <%=incidenciasUrbMax%></h1>
                                    </div>

                                    <!-- cuarto card -->
                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 25px; text-align: center;">Urbanización con menor incidencias</h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">maps_home_work</span>
                                        </div>
                                        <h1 style="margin-top: 50px; text-align: center; font-size: 30px;">Urbanización <%=incidenciasUrbMin%></h1>
                                    </div>

                                    <!-- quinto card -->
                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 50px;margin-top: 10px; text-align: center;">Cantidad de solicitudes por atender</h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">error</span>
                                        </div>
                                        <h1 style="margin-top: 40px; text-align: center;"><%=incidenciasPorAtender%> solicitudes</h1>
                                    </div>

                                    <!-- sexto card -->
                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 50px; margin-top: 10px;text-align: center;">Tipo de incidencia más comun</h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">trending_up</span>
                                        </div>
                                        <h1 style="margin-top: 40px; text-align: center;"><%=incidenciasComunMax%></h1>
                                    </div>

                                    <!-- sétimo card -->
                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 40px; margin-top: 10px;text-align: center;">Tipo de incidencia más comun</h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">trending_down</span>
                                        </div>
                                        <h1 style="margin-top: 40px; text-align: center;"><%=incidenciasComunMin%></h1>

                                    </div>
                                    <!-- octavo card -->
                                    <div class="card">
                                        <div class="card-inner">
                                            <h3 style="margin-bottom: 40px; margin-top: 10px;text-align: center;">Cantidad de vecinos sancionados</h3>
                                            <span class="material-icons-outlined" style="display: flex; justify-content: center; align-items: center;">person_off
                    </span>
                                            </span>
                                        </div>
                                        <h1 style="margin-top: 40px; text-align: center;"><%=totalBaneados%> vecinos</h1>
                                    </div>

                                </div>



                                <div class="charts">
                                    <!-- primer cuadro-->
                                    <div class="charts-card " style="background-color:rgb(121, 105, 214)">
                                        <div id="filterBar" class="filter">
                                            <label for="period">Periodo:</label>
                                            <select id="periodBarChart">
                                                <option value="mes">Mes</option>
                                                <option value="semana">Semana</option>
                                                <option value="dia">Día</option>
                                            </select>
                                        </div>
                                        <h2 class="chart-title">Tipos incidencias reportadas</h2>
                                        <div id="bar-chart"></div>
                                    </div>

                                    <!-- segundo cuadro -->
                                    <div class="charts-card " style="background-color:rgb(144, 146, 163)">
                                        <div id="filterArea" class="filter">
                                            <label for="period">Periodo:</label>
                                            <select id="periodAreaChart">
                                                <option value="mes">Mes</option>
                                                <option value="semana">Semana</option>
                                                <option value="dia">Día</option>
                                            </select>
                                        </div>
                                        <h2 class="chart-title">Cantidad de incidencias</h2>
                                        <div id="area-chart"></div>
                                    </div>

                                    <!-- tercer cuadro -->
                                    <div class="charts-card " style="background-color:rgb(105, 167, 115)">
                                        <div id="filterPie" class="filter">
                                            <label for="period">Periodo:</label>
                                            <select id="periodPieChart">
                                                <option value="mes">Mes</option>
                                                <option value="semana">Semana</option>
                                                <option value="dia">Día</option>
                                            </select>
                                        </div>
                                        <h2 class="chart-title">Distribución de incidencias</h2>
                                        <div id="pie-chart"></div>
                                    </div>

                                    <!-- cuarto cuadro -->
                                    <div class="charts-card " style="background-color:rgb(231, 129, 206)">
                                        <div id="filterBar2" class="filter">
                                            <label for="period">Periodo:</label>
                                            <select id="periodBarChart2">
                                                <option value="mes">Mes</option>
                                                <option value="semana">Semana</option>
                                                <option value="dia">Día</option>
                                            </select>
                                        </div>
                                        <h2 class="chart-title">Cantidad de incidencias por urbanización</h2>
                                        <div id="bar-chart2"></div>
                                    </div>
                                </div>

                                <hr style="border: none; border-top: 3px solid black; margin-top: 30px; border-radius: 10px;">
                                <!--dashboard-->

                                <div style="display: flex; justify-content: space-between;">
                                    <div style="display: flex; justify-content: space-between;">
                                        <div style="display: flex; flex-direction: column; ">
                                            <h2 class="tabla-title" style ="color:#000f22;">Usuarios sancionados por falsas alarmas</h2>  <!--Cambiar el titulo de la tabla-->


                                        </div>
                                    </div>
                                </div>


                                <table id="miTabla" class="table" style="margin-bottom:50px;">
                                    <thead style="background-color: #e9290c44;"> <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                                    <tr style="text-align: center; font-weight:800;">
                                        <th style ="color: white;font-size: 17px;cursor: pointer;">Apellidos</th>
                                        <th style ="color: white;font-size: 17px;cursor: pointer;">Nombres</th>
                                        <th style ="color: white;font-size: 17px;cursor: pointer;">DNI</th>
                                        <th style ="color: white;font-size: 17px;cursor: pointer;">Administrar sanción</th>

                                    </tr>
                                    </thead>

                                    <tbody style="text-align: center;color: black;">
                                    <tr style="text-align: center;">
                                        <td><a>Yarleque Medina</a></td>
                                        <td><a>Manuel Augusto</a></td>
                                        <td>75849544</td>
                                        <td><a class = "mdi mdi-lock-open" style="color:black;"></a></td>
                                    </tr>
                                    </tbody>
                                </table>


                        </div>

                        <!-- main-panel ends -->
                    </div>
                    <!-- page-body-wrapper ends -->
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
                <script src="../../../../assets/js/misc.js"></script>
                <script src="<%=request.getContextPath()%>/assets/js/settings.js"></script>
                <script src="<%=request.getContextPath()%>/assets/js/todolist.js"></script>




                <!-- scripts de los cuadros -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
                <script src="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Dashboard/scripts_dashboard.js"></script>


                <!-- acaba sripts cuadro -->


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
                                window.location.href = "${pageContext.request.contextPath}/LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                            }
                        });
                    }
                </script>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
                <script src = "${pageContext.request.contextPath}/vistas/jsp/ADMIN/Dashboard/script_tabla.js"></script>

                <!-- End custom js for this page -->
</body>
</html>