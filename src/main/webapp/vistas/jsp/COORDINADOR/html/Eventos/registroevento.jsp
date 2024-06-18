<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Coordinador</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../../assets/vendors/css/vendor.bundle.base.css">

    <!-- jQuery UI -->
    <link rel="stylesheet" href="../../css/Eventos/styles_registro.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../../LogoSM.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->
        
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
          <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;"><strong>Menú</strong> </h3>
          <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;"></h3>
        </div>
        
        
        <ul class="nav" style="position: fixed;">
          
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
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;"><strong>Adrian López</strong> </h2>
                      <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;"><strong>Coordinador de Cultura</strong> </h5>
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
            <div class="container">
              <div class="row">
                <div class="col-md-6">
                  <h4 class="center-text-reg mb-4"><i class="fas fa-pen-square mr-2"></i> Registro del Evento</h4>
                  <div class="custom-container rounded-3" id="container-image">
                    <div class="event-image-container">
                      <img id="preview" src="https://via.placeholder.com/800x500" alt="Vista previa de la imagen" class="event-image img-fluid mb-4">
                      <input type="file" id="upload" style="display: none;">
                      <button class="custom-btn" id="botoncarga" onclick="document.getElementById('upload').click();"><i class="fas fa-plus"></i>Cargar</button>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="custom-container rounded-3" style = "padding: 10px" id="fechas">
                    <h4 class="mb-4 center-text"><span id="nombre-seleccionado"><input type="text" id="nombre" name="texto" placeholder="[Nombre del evento]"></span><i class="fas fa-pencil-alt edit-icon"></i></h4>
                        <p><strong>Fecha:</strong> <span><input type="date" id="fecha" name="fecha" value="AAAA-MM-DD"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                        <p><strong>Hora:</strong> <span><input type="time" id="hora" name="hora" value="mm:hh"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                        <p><strong>Lugar:</strong> <span><input type="text" id="lugar" name="texto" placeholder="[Establecer lugar]"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                        <p><strong>Recurrencia:</strong> <span>
                            <select id="recurrencia" name="recurrencia">
                                <option value="seleccionaropcion" selected>--Selecionar opción--</option>
                                <option value="si">Sí</option>
                                <option value="no">No</option>
                            </select>
                            </span> 
                            <i class="fas fa-pencil-alt edit-icon"></i>
                        </p>
                      <button type="button" class="btn btn-primary custom-btn" id="btn-vacantes" onclick="VacantesPopUp()">Asignar Vacantes</button>
                      <div id="vacantesAsignadasContainer" style="display: inline-block; margin-left: 10px;"></div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="descripcion">
                    <h4 class="mb-4">Descripción del Evento <i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <textarea id="descripcion" name="texto" placeholder="[Ingrese la descripción aquí]" style="margin-bottom: 20px;"></textarea>
                    <h4 class="mb-4">Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <div>
                        <p>¿Se necesita material?</p>
                        <select id="necesita-material" name="necesita-material" onchange="mostrarOpcionMaterial()">
                            <option value="" selected>-- Seleccione una opción --</option>
                            <option value="si">Sí</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                    <br>
                    <div id="opcion-material" class="hidden">
                      <input type="text" id="nuevo-material" placeholder="Agregar material">
                      <button type="button" onclick="agregarMaterial()">Agregar</button>
                      <br>
                      <br>
                        <h4 class="mb-4">Lista de Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                        <ul id="lista-materiales"></ul> 
                    </div>

                    <p id="mensaje-no-material" class="hidden">No se requiere material.</p>
                    <h4 class="mb-4" id="profesores-link">
                      <a href="tabla_inscritos.jsp">Seleccionar profesor <i class="fas fa-external-link-alt"></i></a>
                   </h4>
                    <p>Elige el profesor para el evento...</p>
                    
                  </div>
                </div>
              </div>
            </div>
            <div class="fixed-buttons">
              <button class="btn btn-custom-success" id="success" onclick="registrar()">Registrar</button>
              <button class="btn btn-custom-danger" id="danger" onclick="anularRegistro()">Anular Registro</button>
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
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../../../../assets/js/off-canvas.js"></script>
    <script src="../../../../../assets/js/hoverable-collapse.js"></script>
    <script src="../../../../../assets/js/misc.js"></script>
    <script src="../../../../../assets/js/settings.js"></script>
    <script src="../../../../../assets/js/todolist.js"></script>
    <script src="../../../../../assets/js/paginas_princpales.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src = "../../js/Eventos/script_registro.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>