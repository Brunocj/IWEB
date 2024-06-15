<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Coordinador</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../../PRINCIPAL/styles_pag_principales.css">
    <link rel="stylesheet" href="../../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../../LogoSM.png" />
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
        
        
        <ul class="nav" style ="position: fixed;">
          <!-- Codigo para un item de la barra lateral que no tiene sublista -->
          <li class="nav-item menu-items active"> <!-- la clase "active" solo se usa para la vista que está activa -->
            
            <a class="nav-link" href="../PaginaPrincipal/pagina_principal_coordinador.html"> <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
              <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
            </a>
          </li>
          <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->

          
          <li class="nav-item menu-items ">
            <a class="nav-link" href="../MiPerfil/Miperfil.jsp">
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
            <a class="nav-link" href="../Eventos/eventos.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-earth"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
              <span class="menu-title" style="color: white;">Eventos</span>
            </a>
          </li>
          <li class="nav-item menu-items ">
            <a class="nav-link" href="../Incidencias/incidencia_coordinador.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
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
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Adrián López</h2>
                      <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Coordinador de cultura</h5>
                    </div>
                    <img class="img-xs rounded-circle" src="../../../LogoSM.png" alt="" style ="height: 50px; width: 100%;"> <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->
                    
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
          <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
                <div class="title-pp">
                  <h2>Bienvenido Coordinador Adrián!</h2>
                </div>
                <div  class="RowWrapper">
                  <div class="row-1">
                    <div class="card-1" style ="color:black;">
                      <div class="font">
                        <img src="../../../PRINCIPAL/adminn.jpg" alt="SanMiguel">
                        <div class="card-content">
                          <h3>¿Cuál es la función del coordinador?</h3>
                          <p>Al ser coordinador, podrás organizar distintos eventos relacionados a tu área, la cual puede ser de cultura o de deportes.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <h3 style="color: black;">A continuación, podrás visualizar a detalle las funciones que puedes realizar como Coordinador.<br><span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="../../../PRINCIPAL/eventoo.png" alt="Eventos">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la sección de eventos para que puedas crear un nuevo evento, revisar algunos detalles de tus eventos creados y visualizar eventos pasados que quieras tomar 
                            como referencia.<br><span style="font-size: 10px; text-decoration: underline;">Haga click en "Sección eventos" para dirigirse automáticamente a la sección de eventos.</span></span>
                          </span>
                          <img src="../../../PRINCIPAL/eventos_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="../Eventos/eventos.jsp" style="color: black; font-weight: bold;"> Sección <br> Eventos</a>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="../../../PRINCIPAL/registro_incidencia.png" alt="Incidencias">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de incidencias donde podrás registrar una incidencia si has sufrido o visto algún problema en el distrito.<br><span style="color: red;">No olvides que serás penalizado si registras
                             más de 5 falsas alarmas.</span> <br><span style="font-size: 10px; text-decoration: underline;">Haga click en "Registrar Incidencia" para dirigirse automáticamente a la lista de incidencias.</span></span>
                          <img src="../../../PRINCIPAL/incidencia_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="../Incidencias/incidencia_coordinador.jsp" style="color: black; font-weight: bold;">Registrar <br> Incidencia </a>
                    </div>
              </div>
            </div>
          </div>
              <!-- content-wrapper ends -->
              <!-- partial:../../partials/_footer.html -->
              <!-- partial -->
              
        </div>
            <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../../../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../../../../assets/js/off-canvas.js"></script>
    <script src="../../../../../assets/js/hoverable-collapse.js"></script>
    <script src="../../../../../assets/js/misc.js"></script>
    <script src="../../../../../assets/js/settings.js"></script>
    <script src="../../../../../assets/js/todolist.js"></script>
    <script src="../../../PRINCIPAL/paginas_principales.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="../../js/PaginaPrincipal/script_cerrar_sesion.js"></script>
    
    <!-- End custom js for this page -->
  </body>
</html>