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
    <link rel="stylesheet" href="../../../../../assets/css/styles_pag_principales.css">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="../../css/Eventos/styles_editar.css">
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
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Adrian López</h2>
                      <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Coordinador de Cultura</h5>
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
                <div class="container-fluid mt-5"> <!-- Cambié container por container-fluid -->
                    <div class="options-bar d-flex justify-content-center align-items-center">
                        <div class="option verde" onclick="verInscritos()">
                            <i class="fas fa-users me-2"></i> Ver Inscritos
                        </div>
                        <div class="option azul" onclick="seleccionarFoto()">
                            <i class="fas fa-address-book me-2"></i> Registrar Entrada
                        </div>
                        <div class="option rojo" onclick="borrarEvento()">
                            <i class="fas fa-trash-alt me-2"></i> Borrar Evento
                        </div>
                    </div>
                </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="container-image">
                    <div class="event-image-container">
                      <img id="preview" src="https://via.placeholder.com/800x500" alt="Vista previa de la imagen" class="event-image img-fluid mb-4">
                      <input type="file" id="upload" style="display: none;">
                      <button class="custom-btn" id="botoncarga" onclick="document.getElementById('upload').click();"><i class="fas fa-plus"></i>Cargar</button>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="custom-container rounded-3" style = "padding: 10px;" id="fechas">
                        <h4 class="mb-4 center-text"><span id="nombre-seleccionado"><input type="text" id="nombre" name="texto" value="Futbolito"></span><i class="fas fa-pencil-alt edit-icon"></i></h4>
                        <p><strong>Fecha:</strong> <span><input type="date" id="fecha" name="fecha" value="2024-05-25"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                        <p><strong>Hora:</strong> <span><input type="time" id="hora" name="hora" value="18:30"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                        <p><strong>Lugar:</strong> <span><input type="text" id="lugar" name="texto" value="Cancha de minas"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                        <p><strong>Recurrencia:</strong> <span>
                            <select id="recurrencia" name="recurrencia">
                                <option value="si" selected>Sí</option>
                                <option value="no">No</option>
                            </select>
                            </span> 
                            <i class="fas fa-pencil-alt edit-icon"></i>
                        </p>
                    
                        <div class="d-flex justify-content-start vacantes" id="boton">
                            <!-- El nuevo botón -->
                            
                            <p><strong>Vacantes:</strong> <span id="btn-vacantes" >8/10</span> </p>
                            <!-- Espacio entre botones -->
                            <div style="width: 20px;"></div>
                            
                            <!-- El botón "Inscribirse" -->
                            <button type="button" class="btn btn-primary custom-btn" id="btn-inscribirse" onclick="AmpliarVacantesPopUp()">Ampliar vacantes</button>
                          </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="descripcion">
                    <h4 class="mb-4">Descripción del Evento <i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <textarea id="descripcion" name="texto">Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum Lorem impsum</textarea>
                    <h4 class="mb-4">Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <div>
                      <p>¿Se necesita material?</p>
                      <select id="necesita-material" name="necesita-material" onchange="mostrarOpcionMaterial()">
                          <option value="si" selected>Sí</option>
                          <option value="no">No</option>
                      </select>
                  </div>
                  <br>
                  <div id="opcion-material">
                      <input type="text" id="nuevo-material" placeholder="Agregar material">
                      <button type="button" onclick="agregarMaterial()">Agregar</button>
                      <br>
                      <br>
                      <h4 class="mb-4">Lista de Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                      <ul id="lista-materiales">
                          <li class="material-item"><span>Primer material</span><button class="remove-btn" onclick="eliminarMaterial(this)">X</button></li>
                          <li class="material-item"><span>Segundo material</span><button class="remove-btn" onclick="eliminarMaterial(this)">X</button></li>
                      </ul>
                  </div>
      
                  <p id="mensaje-no-material" class="hidden">No se requiere material.</p>

                    <h4 class="mb-4" id="profesores-link">
                      <a href="tabla_docentes.jsp">Seleccionar nuevo profesor <i class="fas fa-external-link-alt"></i></a>
                   </h4>
                    <p>Manuel Yarleque</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="fixed-buttons">
              <button class="btn btn-custom-success" id="success" onclick="GuardarPopUp()">Guardar cambios</button>
              <button class="btn btn-custom-danger" id="danger" onclick="CancelarPopUp()">Descartar cambios</button>
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
    <script src = "../../js/Eventos/script_editar.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>