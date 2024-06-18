<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Mi perfil</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../../assets/css/style.css">
    <link rel="stylesheet" href="../../css/MiPerfil/styles_perfil.css">
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
        
        
        <ul class="nav">
          <!-- Codigo para un item de la barra lateral que no tiene sublista -->
          <li class="nav-item menu-items "> <!-- la clase "active" solo se usa para la vista que está activa -->
            
            <a class="nav-link" href="../PaginaPrincipal/pagina_principal_coordinador.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
              <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
            </a>
          </li>
          <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->

          
          <li class="nav-item menu-items ">
            <a class="nav-link" href="../MiPerfil/Miperfil.html">
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
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Adrian Lopez</h2>
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
            <!--CONTENIDO-->
            <div class="main-table">
              <h2>Datos personales:</h2>
              <div class="card-table">
                <div class="card-body">
                  <table>
                    <tbody>
                      <tr>
                        <td>Nombre(s)</td>
                        <td>:</td>
                        <td>Manuel Augusto</td>
                      </tr>
                      <tr>
                        <td>Apellidos</td>
                        <td>:</td>
                        <td>Yarlequé Medina</td>
                      </tr>
                      <tr>
                        <td>Correo</td>
                        <td>:</td>
                        <td>yarleque.thanos@gmail.com</td>
                      </tr>
                      <tr>
                        <td>DNI</td>
                        <td>:</td>
                        <td>53856284</td>
                      </tr>
                      <tr>
                        <td>Número telefónico</td>
                        <td>:</td>
                        <td>998503948</td>
                      </tr>   
                    </tbody>
                  </table>
                </div>
              </div>
      
              <h2>Actualizar datos:</h2>
              <div class="card-table">
                <div class="card-body">
                  <table>
                    <tbody>
                      <tr>
                        <td><i class="mdi mdi-lock" style="font-size:25px"></i></td>
                        <td><a href="../../../LOGIN/chPass.html" style ="color: black;">Cambiar contraseña</a></td>
                      </tr>
                      <tr>
                        <td><i class="mdi mdi-phone" style="font-size:25px"></i></td> 
                        <td><a href="../../../LOGIN/chPhone.html" style ="color: black;">Cambiar número telefónico</a></td>
                      </tr>
                    </tbody>
                  </table>
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
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="../../js/MiPerfil/script_cerrar_sesion.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>