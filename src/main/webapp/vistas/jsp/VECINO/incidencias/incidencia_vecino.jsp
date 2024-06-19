<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.beans.Incidencia" %><%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idProvisional = 10;
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaincidencias");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/VECINO/incidencias/styles_incidencia.css">
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


        <ul class="nav">

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
            <li class="nav-item menu-items">
                <a class="nav-link" href="../eventos/eventos.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-earth"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Eventos</span>
                </a>
            </li>
            <li class="nav-item menu-items active">
                <a class="nav-link" href="#"> <!-- Cambiar href de acuerdo a lo necesario -->
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

                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2 class="tabla-title" style="color: #000f22; margin-bottom: 0px;">Incidencias</h2>
                    <button class="btnTable" style="display: flex; align-items: center;" onclick="window.location.href='registrar_incidencia.jsp';">
                        Agregar Incidencia
                        <a class="mdi mdi-plus" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                    </button>
                </div>



                <table id="miTabla" class="table" style="margin-bottom:15px;">
                    <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo (claro) de la pagina, pero un poco mas oscuro-->
                    <tr style="text-align: center; font-weight:800;">
                        <th style ="color: white;">Descripción</th>
                        <th style ="color: white;">Fecha</th>
                        <th style ="color: white;">Estado</th>
                        <th style="width: 20px; color: white;"></th>
                    </tr>
                    </thead>
                    <tbody style="text-align: center; color: black;">
                    <%
                        if (listaIncidencias == null || listaIncidencias.isEmpty()) {
                    %>
                    <p>No hay incidencias registradas</p>
                    <%
                    } else {
                            for(Incidencia incidencia : listaIncidencias){
                                String fechaFormateada = sdf.format(incidencia.getFechaIncidencia());

                    %>
                    <tr style="text-align: center;">
                        <td><%=incidencia.getNombre()%></td>
                        <td><%=fechaFormateada %></td>
                        <td><%=incidencia.getEstado()%></td>
                        <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                    </tr>
                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>
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
</script>
<!-- End custom js for this page -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src ="${pageContext.request.contextPath}/vistas/jsp/VECINO/incidencias/script_incidencia.js"></script>
</body>
</html>
