<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Eventos</title>

    <!-- plugins:css -->
    
    <link rel="stylesheet" href="../../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../../assets/vendors/css/vendor.bundle.base.css" >
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../../assets/css/style.css">
    <link rel="stylesheet" href="../../css/Eventos/styles_eventos.css">
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
            <a class="nav-link" href="../Eventos/eventos.html"> <!-- Cambiar href de acuerdo a lo necesario -->
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
            <!-- Sección de contenido -->
            <section class="py-3">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-4">
                    <a href="#" class="btn btn-primary btn-lg d-block mb-3 topBtn" style ="background-color: #183d6c;">Eventos Creados</a> <!--Cambiar el color de acuerdo al que este seleccionado (el codigo de color de estalinea es el que se debe usar para cuando se encuentra una pestaña seleccionada; en coordinador, usar otro color, pero que sea más oscuro)-->
                  </div>
                  <div class="col-md-4">
                    <a href="eventospasados.jsp" class="btn btn-primary btn-lg d-block mb-3" style ="background-color: #000f22;">Eventos por agregar nota</a>
                  </div>
                </div>
              </div>
            </section>
            <section class="py-5" >
              <div class="container" style ="padding-top: 0px;">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                  <div class="col">
                    <div class="cardEvent addEvent" data-event-id="1" >
                        <a href="registroevento.jsp" class="mdi mdi-plus-box"></a>
                        <div class="card-body">
                          <a href ="registroevento.jsp" class="btn btn-primary btn-sm btn-bottom-right">Agregar evento</a>
                        </div>
                    </div>
                  </div> 
                  <div class="col">
                    <div class="cardEvent" data-event-id="2">
                      <img src="../../img/Eventos/foto1.png" class="card-img-top" alt="...">
                      <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                          <h5 class="card-title">Título de la Tarjeta</h5>
                        </div>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <!-- Botón en la parte inferior derecha -->
                        <a href ="editar_evento.jsp?eventId=2" class="btn btn-primary btn-sm btn-bottom-right">Editar evento</a>
                        </div>
                    </div>
                  </div>
                  
                </div>
                
              </div>
            
            </section>
            <nav>
              <ul class="pagination justify-content-center">
                <li class="page-item" id="previousPage">
                  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Anterior</a>
                </li>
                <li class="page-item active"><a class="page-link page-button" href="#" data-page="1">1</a></li>
                <li class="page-item"><a class="page-link page-button" href="#" data-page="2">2</a></li>
          
                <!-- Repite este bloque para más números de página si es necesario -->
                <li class="page-item" id="nextPage">
                  <a class="page-link" href="#">Siguiente</a>
                </li>
              </ul>
            </nav>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src = "../../js/Eventos/script_eventos.js"></script>
    
    <!-- End custom js for this page -->
  </body>
</html>



