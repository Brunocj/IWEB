
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
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
    ArrayList<String> tipoIncidencias = (ArrayList<String>) request.getAttribute("tipoincidencias");
    ArrayList<Integer> cantidadTipo = (ArrayList<Integer>) request.getAttribute("cantidadtipo");
    ArrayList<String> urbanizaciones = (ArrayList<String>) request.getAttribute("urbanizaciones");
    ArrayList<Integer> cantidadUrbanizacion = (ArrayList<Integer>) request.getAttribute("cantidadurbanizacion");
    ArrayList<String> estados = (ArrayList<String>) request.getAttribute("estados");
    ArrayList<Double> porcentajes = (ArrayList<Double>) request.getAttribute("porcentajes");

    //JSON
    String tipoIncidenciasJSON = new Gson().toJson(tipoIncidencias);
    String cantidadTipoJSON = new Gson().toJson(cantidadTipo);
    String urbanizacionesJSON = new Gson().toJson(urbanizaciones);
    String cantidadUrbanizacionJSON = new Gson().toJson(cantidadUrbanizacion);
    String estadosJSON = new Gson().toJson(estados);
    String porcentajesJSON = new Gson().toJson(porcentajes);

%>
<%@ page import ="org.example.webappsm.model.beans.Usuario" %>
<%Usuario usuariologueado = (Usuario) session.getAttribute("usuarioLogueado");%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>
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
        <link rel="stylesheet" href="path-to/node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css" />
        <link rel="stylesheet" href="path-to/node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css" />

        <!--PRUEBA DE MEJORES CUADROS-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

        <!-- Incluir Bootstrap JS desde CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>


    </head>
    <body>
        <div class="container-scroller">
            <!-- partial:../../partials/_sidebar.html -->

            <%
                String userRole = (String) session.getAttribute("userRole");
                if (userRole == null) {
                    userRole = "Serenazgo"; // Por defecto, si no hay rol en la sesión
                }
                String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
            %>


            <jsp:include page="<%= menuadmin %>">
                <jsp:param name="activePage" value="dashboard"/>
            </jsp:include>

            <!-- partial -->
                <div class="main-panel">
                    <div>
                        <div class="content-wrapper" style="background-color: #fffff6;"> <!--Cambiar al color mas claro-->
                            <!--CONTENIDO-->
                            <div class="main-panel">
                                <div class="content-wrapper" style="background-color: #fffff6; margin-top: -90px;"> <!--Cambiar al color mas claro-->
                                    <h2 class="tabla-title" style="color:#000f22;">Dashboard</h2>  <!--Cambiar el titulo de la tabla-->
                                    <hr style="border: none; border-top: 3px solid black; margin-top: 0px; border-radius: 10px; margin-bottom: -50px;">
                                    <main class="main-container">


                                        <div class="row" style="margin-top: 10vh;">

                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card-shadow">
                                                    <div class="card1" style="border-radius: 15px; overflow: hidden; background: linear-gradient(135deg, #FFB3BA, #FFDFBA); color: #fff;">
                                                        <div class="card-header" style="padding: 0;">
                                                            <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/promedios1.png" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                        </div>
                                                        <div class="card-body" style="flex: 1; padding: 20px;">
                                                            <div class="d-flex align-items-center justify-content-between">
                                                                <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Incidencias</span>
                                                                <h1 style="margin: 0;"><span class="mdi mdi-chart-areaspline" style="font-size: 2.5rem; color:#062779;"></span></h1>
                                                            </div>
                                                            <div class="d-flex align-items-center justify-content-center">
                                                                <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color:black; margin-top: 10px;"><%= totalIncidencias != null ? totalIncidencias : '0' %></h3>
                                                            </div>
                                                            <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Cantidad total de incidencias</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card1" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden;background: linear-gradient(135deg, #FFDFBA, #FFFFBA); color: #fff;">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/promedio2.png" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                    </div>
                                                    <div class="card-body" style="flex: 1;">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Promedio</span>
                                                            <h1 style="margin: 0;"><span class="mdi mdi-chart-bar" style="font-size: 2.5rem; color:#062779;"></span></h1>

                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-center">
                                                            <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color: black; margin-top: 10px;"><%= avgIncidencias != null ? avgIncidencias : '0' %></h3>
                                                        </div>
                                                        <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Promedio de incidencias por día</h4>
                                                    </div>
                                                </div>
                                            </div>





                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card1" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; background: linear-gradient(135deg, #FFFFBA, #BAFFC9); color: #fff;">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/urbanizacion2.jpg" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                    </div>
                                                    <div class="card-body" style="flex: 1;">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Urbanización</span>
                                                            <h1 style="margin: 0;"><span class="mdi mdi-home-modern" style="font-size: 2.5rem; color:#062779;"></span></h1>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-9">

                                                                <div class="d-flex align-items-center align-self-start">
                                                                    <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color:black; margin-left: 40px;">
                                                                        <%= incidenciasUrbMax != null && !incidenciasUrbMax.isEmpty() ? incidenciasUrbMax : "No hay" %>
                                                                    </h3>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Urbanización con más incidencias</h4>
                                                    </div>
                                                </div>
                                            </div>




                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card1" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; background: linear-gradient(135deg, #BAFFC9, #BAE1FF); color: #fff;">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/urbanizacion1.jpg" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                    </div>
                                                    <div class="card-body" style="flex: 1;">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Urbanización</span>
                                                            <h1 style="margin: 0;"><span class="mdi mdi-home-modern" style="font-size: 2.5rem; color:#062779;"></span></h1>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-9">
                                                                <div class="d-flex align-items-center align-self-start">

                                                                    <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color:black; margin-left: 40px;">
                                                                        <%= incidenciasUrbMin != null && !incidenciasUrbMin.isEmpty() ? incidenciasUrbMin : "No hay" %>
                                                                    </h3>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Urbanización con menos incidencias</h4>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>


                                        <div class="row">


                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card1" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; background: linear-gradient(135deg, #FFB347, #FFDFBA); color: #fff;">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/incidenciaAtender.jpg" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                    </div>
                                                    <div class="card-body" style="flex: 1;">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Incidencias</span>
                                                            <h1 style="margin: 0;"><span class="mdi mdi-alert" style="font-size: 2.5rem; color:#062779;"></span></h1>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12 d-flex justify-content-center">
                                                                <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color:black;"><%= incidenciasPorAtender != null ? incidenciasPorAtender : "0" %></h3>
                                                            </div>
                                                        </div>
                                                        <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Cantidad de incidencias por atender</h4>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card1" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; background: linear-gradient(135deg, #FFD1DC, #FFB3BA); color: #fff;">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/incidenciaComun.jpg" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                    </div>
                                                    <div class="card-body" style="flex: 1;">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Incidencias</span>
                                                            <h1 style="margin: 0;"><span class="mdi mdi-arrow-top-right" style="font-size: 2.5rem; color:#062779;"></span></h1>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12 d-flex justify-content-center">
                                                                <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color:black;"><%= incidenciasComunMax != null ? incidenciasComunMax : "No hay" %></h3>
                                                            </div>
                                                        </div>
                                                        <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Tipo de incidencia más común</h4>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card1" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; background: linear-gradient(135deg, #C3B1E1, #BAE1FF); color: #fff;">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/sancionados2.jpg" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                    </div>
                                                    <div class="card-body" style="flex: 1;">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Incidencias</span>
                                                            <h1 style="margin: 0;"><span class="mdi mdi-arrow-bottom-right" style="font-size: 2.5rem; color:#062779;"></span></h1>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12 d-flex justify-content-center">
                                                                <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color:black;"><%= incidenciasComunMin != null ? incidenciasComunMin : "No hay" %></h3>
                                                            </div>
                                                        </div>
                                                        <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Tipo de incidencia menos común</h4>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                                <div class="card1" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; background: linear-gradient(135deg, #FFB3FF, #FFD1DC); color: #fff;">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/sancionados.jpg" alt="header image" style="width: 100%; height: 210px; object-fit: cover;">
                                                    </div>
                                                    <div class="card-body" style="flex: 1;">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="badge bg-warning" style="margin-bottom: 10px; color: white; border-radius: 10px;">Sancionados</span>
                                                            <h1 style="margin: 0;"><span class="mdi mdi-account-off" style="font-size: 2.5rem; color:#062779;"></span></h1>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12 d-flex justify-content-center">
                                                                <h3 class="mb-0" style="font-size: 2.5rem; font-weight: bold; color:black;"><%= totalBaneados != null ? totalBaneados : "0" %></h3>
                                                            </div>
                                                        </div>
                                                        <h4 class="text-muted font-weight-normal mt-2 text-center" style="color: black !important; font-size: 1.5rem !important; font-weight: 500 !important;">Cantidad de vecinos sancionados</h4>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-lg-6 grid-margin stretch-card">
                                                <div class="card" style="background: linear-gradient(135deg, #B0EACD, #C9FFCF);">
                                                    <div class="card-body">
                                                        <h2 class="card-title text-center" style="color: #000000;">Tipos de incidencias reportadas</h2>
                                                        <canvas id="barChart" style="height:230px"></canvas>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 grid-margin stretch-card">
                                                <div class="card" style="background: linear-gradient(135deg, #B2F0E8, #BAE1FF);">
                                                    <div class="card-body">
                                                        <h2 class="card-title text-center" style="color: #000000">Cantidad de incidencias</h2>
                                                        <canvas id="areachartMulti" style="height:250px"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6 grid-margin stretch-card">
                                                <div class="card" style="background: linear-gradient(135deg, #FFC4E1, #FFD1DC);">
                                                    <div class="card-body">
                                                        <h2 class="card-title text-center" style="color: #000000">Distribución de incidencias</h2>
                                                        <canvas id="doughnutChart" style="height:250px"></canvas>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 grid-margin stretch-card">
                                                <div class="card" style="background: linear-gradient(139deg, #b398f6, #eedecc);">
                                                    <div class="card-body">
                                                        <h2 class="card-title text-center" style="color: #000000">Cantidad de incidencias por urbanizacion</h2>
                                                        <canvas id="barChart2" style="height:230px"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </main>
                                </div>


                            </div>
                            <!-- main-panel ends -->
                        </div>
                        <!-- page-body-wrapper ends -->
                    </div>
                </div>
                <!-- container-scroller -->
                <!-- plugins:js -->
            <script src="../../../../assets/vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="../../../../assets/js/off-canvas.js"></script>
            <script src="../../../../assets/js/hoverable-collapse.js"></script>
            <script src="../../../../assets/js/misc.js"></script>
            <script src="../../../../assets/js/settings.js"></script>
            <script src="../../../../assets/js/todolist.js"></script>
                <!-- scripts de los cuadros -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
                <!-- acaba scripts cuadro -->
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
                <script src="${pageContext.request.contextPath}/assets/vendors/js/Chart.min.js"></script>
                <script src="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Dashboard/script_tabla.js"></script>
                <script>

                    $(function() {
                        /* ChartJS
                         * -------
                         * Data and config for chartjs
                         */
                        'use strict';

                        var data1 = {
                            labels: JSON.parse('<%= tipoIncidenciasJSON%>'),
                            datasets: [{
                                label: '# incidencias: ',
                                data: JSON.parse('<%= cantidadTipoJSON %>'),
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 1,
                                fill: false
                            }]
                        };

                        var data2 = {
                            labels: JSON.parse('<%= urbanizacionesJSON%>'),
                            datasets: [{
                                label: '# of Votes',
                                data: JSON.parse('<%= cantidadUrbanizacionJSON %>'),
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 1,
                                fill: false
                            }]
                        };

                        var options = {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    },
                                    gridLines: {
                                        color: "rgba(0,0,0,0.20)"
                                    }
                                }],
                                xAxes: [{
                                    gridLines: {
                                        color: "rgba(0,0,0,0.20)"
                                    }
                                }]
                            },
                            legend: {
                                display: false
                            },
                            elements: {
                                point: {
                                    radius: 0
                                }
                            }
                        };


                        var doughnutPieData = {
                            datasets: [{
                                data: JSON.parse('<%= porcentajesJSON%>'),
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.5)',
                                    'rgba(54, 162, 235, 0.5)',
                                    'rgba(255, 206, 86, 0.5)',
                                    'rgba(75, 192, 192, 0.5)',
                                    'rgba(153, 102, 255, 0.5)',
                                    'rgba(255, 159, 64, 0.5)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
                                ],
                            }],

                            // These labels appear in the legend and in the tooltips when hovering different arcs
                            labels: JSON.parse('<%= estadosJSON%>')
                        };
                        var doughnutPieOptions = {
                            responsive: true,
                            animation: {
                                animateScale: true,
                                animateRotate: true
                            }
                        };




                        var multiAreaData = {
                            labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"],
                            datasets: [{
                                label: 'Facebook',
                                data: [8, 11, 13, 15, 12, 13, 16, 15, 13, 19, 11, 14],
                                borderColor: ['rgba(255, 99, 132, 0.5)'],
                                backgroundColor: ['rgba(255, 99, 132, 0.5)'],
                                borderWidth: 1,
                                fill: true
                            },
                                {
                                    label: 'Twitter',
                                    data: [7, 17, 12, 16, 14, 18, 16, 12, 15, 11, 13, 9],
                                    borderColor: ['rgba(54, 162, 235, 0.5)'],
                                    backgroundColor: ['rgba(54, 162, 235, 0.5)'],
                                    borderWidth: 1,
                                    fill: true
                                }
                            ]
                        };

                        var multiAreaOptions = {
                            plugins: {
                                filler: {
                                    propagate: true
                                }
                            },
                            elements: {
                                point: {
                                    radius: 0
                                }
                            },
                            scales: {
                                xAxes: [{
                                    gridLines: {
                                        color: "rgba(0,0,0,0.20)"
                                    }
                                }],
                                yAxes: [{
                                    gridLines: {
                                        color: "rgba(0,0,0,0.20)"
                                    }
                                }]
                            }
                        }




                        // Get context with jQuery - using jQuery's .get() method.
                        if ($("#barChart").length) {
                            var barChartCanvas = $("#barChart").get(0).getContext("2d");
                            // This will get the first returned node in the jQuery collection.
                            var barChart = new Chart(barChartCanvas, {
                                type: 'bar',
                                data: data1,
                                options: options
                            });
                        }

                        if ($("#barChart2").length) {
                            var barChartCanvas = $("#barChart2").get(0).getContext("2d");
                            // This will get the first returned node in the jQuery collection.
                            var barChart = new Chart(barChartCanvas, {
                                type: 'bar',
                                data: data2,
                                options: options
                            });
                        }




                        if ($("#areachartMulti").length) {
                            var multiAreaCanvas = $("#areachartMulti").get(0).getContext("2d");
                            var areachartMulti = new Chart(multiAreaCanvas, {
                                type: 'line',
                                data: multiAreaData,
                                options: multiAreaOptions
                            });
                        }

                        if ($("#doughnutChart").length) {
                            var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
                            var doughnutChart = new Chart(doughnutChartCanvas, {
                                type: 'doughnut',
                                data: doughnutPieData,
                                options: doughnutPieOptions
                            });
                        }




                    });

                </script>

            </div>
    </body>
</html>
