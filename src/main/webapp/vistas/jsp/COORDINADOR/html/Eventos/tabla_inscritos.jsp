<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../css/Eventos/styles_tabla_inscritos.css">
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
    <link rel="shortcut icon" href="../../../LogoSM.png" /> <!--Cambiar la ubicacion del logo de la pagina aca tmb-->
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->
        
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
          <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
          <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;"></h3>
        </div>
        
        
        <ul class="nav">
          <!-- Codigo para un item de la barra lateral que no tiene sublista -->
          <li class="nav-item menu-items"> <!-- la clase "active" solo se usa para la vista que está activa -->
            
            <a class="nav-link" href="../PaginaPrincipal/pagina_principal_coordinador.jsp"> <!-- Cambiar href de acuerdo a lo necesario -->
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
          <li class="nav-item menu-items active">
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
            <!--CONTENIDO-->
            <div style="display: flex; justify-content: space-between;">
              <div style="display: flex; justify-content: space-between;">
                <div style="display: flex; flex-direction: column; margin-bottom: 20px">
                  <h2 class="tabla-title" style ="color:#000f22;">Lista de Inscritos</h2>  <!--Cambiar el titulo de la tabla-->
                   
                </div>
              </div>
            </div>
            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo (claro) de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th style="width: 100px; color: white;">Turno</th>
                  <th style="color: white;">Nombre</th>
                  <th style="width: 100px;color: white;">Ajustes</th>
                  
                </tr>
              </thead>
              <tbody style="text-align: center;">
                <tr style="text-align: center;">
                  <td><a>01</a></td>
                  <td><a>Tacuri Flores, Brandon Rafael</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr style="text-align: center;">
                  <td><a>02</a></td>
                  <td><a>Luján Carrión, Jesús Andrés</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr style="text-align: center;">
                  <td><a>03</a></td>
                  <td><a>Vilchez Campos, Carlos Eduardo</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr style="text-align: center;">
                  <td><a>04</a></td>
                  <td><a>Domínguez Alvarado, Christian</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr>
                  <td><a>05</a></td>
                  <td><a>Camarena Jáuregui, Bruno Imanol</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>06</a></td>
                  <td><a>Garay Cruz, Eduardo Daniel</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>07</a></td>
                  <td><a>Calderón Rodríguez, José Ricardo</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>08</a></td>
                  <td><a>Bustamante Melo, Pedro Miguel</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>09</a></td>
                  <td><a>Lopez Pascual, Álvaro Adrián</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              </tbody>
            </table>
            <br>
            <br>
            <br>
            <div class="button-container">
              <!-- Botón con enlace "#" -->
              <button class="button" onclick="goBack()" style ="background-color:#000f22">Regresar</button>
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
                window.location.href = "../../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "../../js/Eventos/script_tabla_incsritos.js"></script>
    
    <!-- End custom js for this page -->
  </body>
</html>