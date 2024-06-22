
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
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
    String incidenciasMes = (String) request.getAttribute("incidenciasmes");
    String incidenciasSemana = (String) request.getAttribute("incidenciassemana");
    String incidenciasHoy = (String) request.getAttribute("incidenciashoy");
    String incidenciasPorAtender = (String) request.getAttribute("incidenciasatender");
    String incidenciasUrbMax = (String) request.getAttribute("incidenciasurbmax");
    String incidenciasUrbMin = (String) request.getAttribute("incidenciasurbmin");
    ArrayList<Usuario> listaBaneados = (ArrayList<Usuario>) request.getAttribute("listabaneados");
    ArrayList<String> tipoIncidencias = (ArrayList<String>) request.getAttribute("tipoincidencias");
    ArrayList<Integer> cantidadTipo = (ArrayList<Integer>) request.getAttribute("cantidadtipo");
    ArrayList<String> urbanizaciones = (ArrayList<String>) request.getAttribute("urbanizaciones");
    ArrayList<Integer> cantidadUrbanizacion = (ArrayList<Integer>) request.getAttribute("cantidadurbanizacion");
    ArrayList<String> estados = (ArrayList<String>) request.getAttribute("estados");
    ArrayList<Double> porcentajes = (ArrayList<Double>) request.getAttribute("porcentajes");
    ArrayList<String> labelsCh = (ArrayList<String>) request.getAttribute("labels");
    ArrayList<Integer> incidenciasReportadas = (ArrayList<Integer>) request.getAttribute("incidenciasReportadas");
    ArrayList<Integer> incidenciasResueltas = (ArrayList<Integer>) request.getAttribute("incidenciasResueltas");
    //JSON
    String tipoIncidenciasJSON = new Gson().toJson(tipoIncidencias);
    String cantidadTipoJSON = new Gson().toJson(cantidadTipo);
    String urbanizacionesJSON = new Gson().toJson(urbanizaciones);
    String cantidadUrbanizacionJSON = new Gson().toJson(cantidadUrbanizacion);
    String estadosJSON = new Gson().toJson(estados);
    String porcentajesJSON = new Gson().toJson(porcentajes);
    String labelsChJSON = new Gson().toJson(labelsCh);
    String incidenciasReportadasJSON = new Gson().toJson(incidenciasReportadas);
    String incidenciasResueltasJSON = new Gson().toJson(incidenciasResueltas);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Dashboard Admin</title>
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
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->
    <%
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Admin"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>


    <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="dashboard"/>
    </jsp:include>

        <div class="main-panel">
            <div>
                <div class="content-wrapper" style="background-color: #FFEBEE;"> <!--Cambiar al color mas claro-->
                    <!--CONTENIDO-->
                    <div class="main-panel">
                        <div class="content-wrapper" style="background-color: #FFEBEE; margin-top: -90px;"> <!--Cambiar al color mas claro-->
                            <h2 class="tabla-title" style="color:#000f22;">Dashboard</h2>  <!--Cambiar el titulo de la tabla-->
                            <hr style="border: none; border-top: 3px solid black; margin-top: 0px; border-radius: 10px; margin-bottom: -50px;">
                            <main class="main-container">
                                <div class="row" style="margin-top: 5vh;">
                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=incidenciasMes%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-calendar-blank" ></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;">Incidencias en el último mes</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=incidenciasSemana%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-calendar-blank"></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;">Incidencias en la última semana</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=incidenciasHoy%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-calendar-blank"></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;">Incidencias hoy</h4>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=avgIncidencias%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-chart-bar"></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;" >Promedio de incidencias por día</h4>
                                            </div>
                                        </div>
                                    </div>



                                </div>


                                <div class="row">
                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=incidenciasUrbMax%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-home-modern"></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;">Urbanizacion con más incidencias</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=incidenciasUrbMin%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-home-modern"></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;">Urbanizacion con menos incidencias</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=incidenciasPorAtender%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-alert"></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;">Cantidad de incidencias por atender</h4>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="d-flex align-items-center align-self-start">
                                                            <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 3vh !important; font-weight: 500 !important;"><%=totalBaneados%></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <h1 style="margin-bottom: 20px;"><span class="mdi mdi-account-off"></span></h1>
                                                    </div>
                                                </div>
                                                <h4 class="text-muted font-weight-normal" style="color: #000000 !important; font-size: 2.7vh !important; font-weight: 500 !important;">Cantidad de vecinos sancionados</h4>
                                            </div>
                                        </div>
                                    </div>



                                </div>


                                <div class="row">

                                    <div class="col-lg-6 grid-margin stretch-card">
                                        <div class="card" >
                                            <div class="card-body">
                                                <h2 class="card-title" style="color: #000000">Tipo de incidencias reportadas</h2>
                                                <canvas id="barChart" style="height:230px"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h2 class="card-title" style="color: #000000">Cantidad de incidencias</h2>
                                                <canvas id="areachartMulti" style="height:250px"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">

                                    <div class="col-lg-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h2 class="card-title" style="color: #000000">Distribución de incidencias</h2>
                                                <canvas id="doughnutChart" style="height:250px"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h2 class="card-title" style="color: #000000">Cantidad de incidencias por urbanizacion</h2>
                                                <canvas id="barChart2" style="height:230px"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                            </main>
                        </div>



                        <hr style="border: none; border-top: 3px solid black; margin-top: 30px; border-radius: 10px;">
                        <!--dashboard-->
                        <div style="display: flex; justify-content: space-between;">
                            <div style="display: flex; justify-content: space-between;">
                                <div style="display: flex; flex-direction: column;">
                                    <h2 class="tabla-title" style="color:#000f22;">Usuarios sancionados por falsas alarmas</h2>  <!--Cambiar el titulo de la tabla-->
                                </div>
                            </div>
                        </div>
                        <table id="miTabla" class="table" style="margin-bottom:50px;">
                            <thead style="background-color: #e9290c44;"> <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                            <tr style="text-align: center; font-weight:800;">
                                <th style="color: white;font-size: 17px;cursor: pointer;">Apellidos</th>
                                <th style="color: white;font-size: 17px;cursor: pointer;">Nombres</th>
                                <th style="color: white;font-size: 17px;cursor: pointer;">DNI</th>
                                <th style="color: white;font-size: 17px;cursor: pointer;">Administrar sanción</th>
                            </tr>
                            </thead>
                            <tbody style="text-align: center;color: black;">
                            <%
                                if (listaBaneados != null) {
                                    for (Usuario usuario : listaBaneados) {
                            %>
                            <tr style="text-align: center;">
                                <td><a><%= usuario.getApellido() %></a></td>
                                <td><a><%= usuario.getNombre() %></a></td>
                                <td><a><%= usuario.getDocumento() %></a></td>
                                <td><a class="mdi mdi-lock-open" style="color:black;"></a></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5">No hay usuarios baneados.</td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
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
                    labels: JSON.parse('<%= labelsChJSON%>'),
                    datasets: [{
                        label: 'Incidencias Reportadas',
                        data: JSON.parse('<%= incidenciasReportadasJSON%>'),
                        borderColor: ['rgba(255, 99, 132, 0.5)'],
                        backgroundColor: ['rgba(255, 99, 132, 0.5)'],
                        borderWidth: 1,
                        fill: true
                    },
                        {
                            label: 'Incidencias Resueltas',
                            data: JSON.parse('<%= incidenciasResueltasJSON%>'),
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
