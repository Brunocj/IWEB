<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Vecino</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../PRINCIPAL/styles_pag_principales.css">
    <link rel="stylesheet" href="../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../assets/css/style.css">
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


        <ul class="nav" style="position: fixed">
            <!-- Codigo para un item de la barra lateral que no tiene sublista -->
            <li class="nav-item menu-items active"> <!-- la clase "active" solo se usa para la vista que está activa -->

                <a class="nav-link" href="#"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
                </a>
            </li>
            <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->
            <!-- Codigo para un item de la barra lateral que no tiene sublista -->
            <li class="nav-item menu-items">
                <a class="nav-link" href="Miperfil.jsp">
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
                <a class="nav-link" href="solicitud/solicitarCoordinador.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-key-change"></i>
              </span>
                    <span class="menu-title" style="color: white;">Sol. coordinador(a)</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="eventos/eventos.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-earth"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Eventos</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="incidencias/incidencia_vecino.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
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
                                    <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Manuel Yarlequé</h2>
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
                <div class="title-pp">
                    <h2>Bienvenido Vecino San Miguelino!</h2>
                </div>
                <div  class="RowWrapper">
                    <div class="row-1">
                        <div class="card-1" style ="color:black;">
                            <div class="font">
                                <img src="../PRINCIPAL/adminn.jpg" alt="SanMiguel">
                                <div class="card-content">
                                    <h3>¿Cuál es tu función como vecino?</h3>
                                    <p>Tu función como vecino se basa en brindar todo tu apoyo para mantener un ambiente armonioso y agradable en nuestro distrito. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row-2">
                        <div class="card-ma" style ="color:black;" >
                            <div class="font">
                                <img src="../PRINCIPAL/medio_ambiente_vecino.png" alt="Cuidado Ambientes" style= "max-width: 100%; max-height: 100px; margin-top: 10px;">
                                <span style="font-size: 16px; font-weight: bold;">¡Cuidemos nuestras áreas verdes para una mejor imagen de nuestra comunidad!</span>
                            </div>
                            <div class="back" style="background-color: white; padding: 10px;">
                                <span style="font-size: 16px;"> Ayúdanos a mantener nuestros distintos ambientes libres de basura.</span>
                                <img src="../PRINCIPAL/no_botar_basura.png" alt="No Botar Basura" style= "max-width: 100%; max-height: 100px; margin-top: 10px;">
                            </div>
                        </div>
                        <div class="card-mv" style ="color:black;">
                            <div class="font">
                                <img src="../PRINCIPAL/unidad_vecinal_1.png" alt="Vecinos">
                                <span style="font-size: 16px; font-weight: bold;">¡Consolidemos nuestra unión como distrito apoyándonos unos a otros!</span>
                            </div>
                            <div class="back" style="background-color: white; padding: 10px;">
                                <span style="font-size: 16px;"> Avisemos cualquier problema o inconveniente que observemos, así no seamos nosotros los afectados.</span>
                                <img src="../PRINCIPAL/unidad_vecinal_2.png" alt="Small Image" style= "max-width: 100%; max-height: 100px; margin-top: 10px;">
                            </div>
                        </div>
                    </div>
                    <h3 style="color: black; padding: 25px; margin-bottom: -20px;">A continuación, podrás visualizar las acciones que puedes realizar en la plataforma como vecino.<br><span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card-2">
                                <div class="font">
                                    <img src="../PRINCIPAL/solicitud2.png" alt="Solicitud Coordinador">
                                </div>
                                <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás enviar una solicitud al administrador para volverte coordinador de una de las dos áreas y comenzar a organizar eventos. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Solicitud para coordinador" para dirigirse automáticamente a la página de la solicitud.</span>
                          </span>
                                    <img src="../PRINCIPAL/solicitud_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                                </div>
                            </div>
                            <div class="card-name">
                                <a href="solicitarCoordinador.jsp" style="color: black; font-weight: bold;"> Solicitud para <br> Coordinador</a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-2">
                                <div class="font">
                                    <img src="../PRINCIPAL/eventoo.png" alt="Eventos">
                                </div>
                                <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de eventos para que puedas inscribirte y participar en los eventos que te agraden.<br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Visualizar eventos" para dirigirse automáticamente a la lista de eventos.</span>
                          </span>
                                    <img src="../PRINCIPAL/eventos_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                                </div>
                            </div>
                            <div class="card-name">
                                <a href="eventos/eventos.jsp" style="color: black; font-weight: bold;"> Visualizar <br> Eventos</a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-2">
                                <div class="font">
                                    <img src="../PRINCIPAL/registro_incidencia.png" alt="Incidencias">
                                </div>
                                <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de incidencias donde podrás registrar una incidencia si has sufrido o visto algún problema en el distrito.<br><span style="color: red;">No olvides que serás penalizado si registras más de 5 falsas alarmas.</span>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Registrar Incidencia" para dirigirse automáticamente a la lista de incidencias.</span>
                          </span>
                                    <img src="../PRINCIPAL/incidencia_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                                </div>
                            </div>
                            <div class="card-name">
                                <a href="incidencias/incidencia_vecino.jsp" style="color: black; font-weight: bold;">Registrar <br> Incidencia </a>
                            </div>
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
    <script src="../../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../../assets/js/off-canvas.js"></script>
    <script src="../../../assets/js/hoverable-collapse.js"></script>
    <script src="../../../assets/js/misc.js"></script>
    <script src="../../../assets/js/settings.js"></script>
    <script src="../../../assets/js/todolist.js"></script>
    <script src="../PRINCIPAL/paginas_principales.js"></script>
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
                    window.location.href = "../LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                }
            });
        }
    </script>


</body>
</html>
