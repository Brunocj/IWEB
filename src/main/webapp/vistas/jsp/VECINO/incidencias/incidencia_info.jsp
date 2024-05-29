<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="styles_info.css">
    <link rel="stylesheet" href="../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../assets/css/style.css">

    <!-- End layout styles -->
    <link rel="shortcut icon" href="../LogoSM.png" />
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
                <a class="nav-link" href="../solicitarCoordinador.jsp">
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
                <a class="nav-link" href="../incidencias/incidencia_vecino.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
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
                                <img class="img-xs rounded-circle" src="../LogoSM.png" alt="" style ="height: 50px; width: 100%;"> <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->

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
                <div class="card" style="background-color: white; color: black;">
                    <h2 style="color: black;">Información de la incidencia:</h2>
                    <div class="card-table">
                        <div class="card-body">
                            <table>
                                <tbody>
                                <tr>
                                    <td>Nombre de la incidencia</td>
                                    <td>:</td>
                                    <td>Asalto en el condominio Arica a Juan Flores</td>
                                </tr>
                                <tr>
                                    <td>Lugar exacto</td>
                                    <td>:</td>
                                    <td>Jr. Arica, Condominio Arica, Torre 1</td>
                                </tr>
                                <tr>
                                    <td>Referencia</td>
                                    <td>:</td>
                                    <td>Cerca del área de estacionamiento</td>
                                </tr>
                                <tr>
                                    <td>Contacto (o)</td>
                                    <td>:</td>
                                    <td>Jorge Barraza - 924 151 366</td>
                                </tr>
                                <tr>
                                    <td>Requiere ambulancia?</td>
                                    <td>:</td>
                                    <td>No</td>
                                </tr>
                                <tr td colspan="3">
                                    <td style="border-bottom: none;">Imagen de referencia:</td>
                                    <td style="border-bottom: none;"></td>
                                    <td style="border-bottom: none;"></td>
                                </tr>
                                <tr>
                                    <td class = "info" colspan="3" style="text-align: center;">
                                        <img src="asalto.jpg" alt="Imagen" style="max-width: 750px; height: auto; border-radius: 5px;">  <!--Imagen de referencia de la incidencia -->
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="button-container">
                        <!-- Botón con enlace "#" -->
                        <a href="incidencia_vecino.jsp" class="button" style =" background-color: #000f22;" >Regresar</a>
                    </div>
                </div>

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
<script src ="script_incidencia.js"></script>
</body>
</html>