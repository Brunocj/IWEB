<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Página Principal Admin</title>
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
<div class="container-scroller" styles="position:fixed;">
  <!-- partial:../../partials/_sidebar.html -->
  <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->

    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
      <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
      <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;">M</h3>
    </div>


    <ul class="nav" style = "position: fixed;">

      <!-- Codigo para un item de la barra lateral que no tiene sublista -->
      <li class="nav-item menu-items active"> <!-- la clase "active" solo se usa para la vista que está activa -->

        <a class="nav-link" href="#"> <!-- Cambiar href de acuerdo a lo necesario -->
          <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
          <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
        </a>
      </li>
      <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->


      <li class="nav-item menu-items">
        <a class="nav-link" href="Dashboard/dashboard.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
          <span class="menu-title" style="color: white;">Dashboard</span>
        </a>
      </li>
      <li class="nav-item menu-items ">
        <a class="nav-link" href="Serenazgo/tabla_serenazgo.jsp ">
              <span class="menu-icon">
                <i class="mdi mdi-security"></i>
              </span>
          <span class="menu-title" style="color: white;">Serenazgo</span>
        </a>
      </li>
      <li class="nav-item menu-items">
        <a class="nav-link" href="Profesores/tabla_profesor.jsp">
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

            <li class="nav-item  "> <a class="nav-link" href="Vecinos/Solicitudes_acceso/tabla_solicitudes.jsp" style="color: white;">
                  <span class="menu-icon">
                    <i class="mdi mdi-account-alert"></i>
                  </span>
              Sol. de acceso</a></li>
            <li class="nav-item "> <a class="nav-link " href="Vecinos/Postulaciones_coordinacion/tabla_postulaciones.jsp" style="color: white;">
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
                  <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Pedro Bustamante</h2>
                  <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Administrador de San Miguel, Lima</h5>
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
      <div class="content-wrapper" style="background-color: #f7d4d3;">
        <div class="title-pp">
          <h2>Bienvenido Admin Pedro!</h2>
        </div>
        <div class="RowWrapper">
          <div class="row-1">
            <div class="card-1" style="color:black;">
              <div class="font">
                <img src="../PRINCIPAL/adminn.jpg" alt="SanMiguel">
                <div class="card-content">
                  <h3>¿Cuál es la función del administrador?</h3>
                  <p>Al ser administrador, deberás velar por el bienestar de todos los san miguelinos y promover una mejora en nuestra comunidad.</p>
                </div>
              </div>
            </div>
            <div class="exclusive-card">
              <div class="exclusive-card-content">
                <div class="front">
                  <img src="../PRINCIPAL/logo_san_miguel_admin.png" alt="Logo">
                </div>
                <div class="back">
                  <img src="../PRINCIPAL/ahora_eres_admin.png" alt="Ahora eres admin">
                </div>
              </div>
            </div>
          </div>
          <h3 style="color: black;">A continuación, podrás visualizar las funciones a realizar como Administrador.<br>
            <span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
          <div class="row">
            <div class="col-md-4">
              <div class="card-2">
                <div class="font">
                  <img src="../PRINCIPAL/users.png" alt="Vecinos">
                </div>
                <div class="back" style="padding: 10px;">
                      <span style="font-size: 16px; color: black;"> Podrás visualizar las lista de solicitudes de acceso a la plataforma y la lista de solicitudes a coordinador.
                        Debes estar atento a ellas para no dejar ninguna solicitud pendiente <br>
                        <span style="font-size: 10px; text-decoration: underline;">Haga click en el nombre Vecino Sanmiguelino para dirigirse automáticamente a las listas.</span>
                      </span>
                  <img src="../PRINCIPAL/personas.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                </div>
              </div>
              <div class="card-name">
                <a class="underline-hover" onclick="return mostrarPopupVecino();" style="color: black; font-weight: bold;"> Vecino <br> Sanmiguelino </a>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-2">
                <div class="font">
                  <img src="../PRINCIPAL/pol.png" alt="Serenazgo">
                </div>
                <div class="back" style="padding: 10px;">
                      <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de serenazgos para organizar estratégicamente el personal de seguridad del distrito. <br>
                        <span style="font-size: 10px; text-decoration: underline;">Haga click en el nombre Serenazgo Dispatcher para dirigirse automáticamente a la lista.</span>
                      </span>
                  <img src="../PRINCIPAL/insignia.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                </div>
              </div>
              <div class="card-name">
                <a href="Serenazgo/tabla_serenazgo.jsp" style="color: black; font-weight: bold;"> Serenazgo <br> Dispatcher</a>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-2">
                <div class="font">
                  <img src="../PRINCIPAL/prof.png" alt="Profesores">
                </div>
                <div class="back" style="padding: 10px;">
                      <span style="font-size: 16px; color: black;"> Podrás visualizar las lista de profesores, donde podrás administrarlos y derivarlos para cada tipo de evento, ya sea para Cultura o Deporte <br>
                        <span style="font-size: 10px; text-decoration: underline;">Haga click en el nombre Profesores para dirigirse automáticamente a la lista.</span>
                      </span>
                  <img src="../PRINCIPAL/eventos.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                </div>
              </div>
              <div class="card-name">
                <a href="Profesores/tabla_profesor.jsp" style="color: black; font-weight: bold;">Profesores </a>
              </div>
            </div>
          </div>
        </div>
      </div>
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

<!-- End custom js for this page -->
</body>
</html>