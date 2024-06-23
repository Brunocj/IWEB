
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sección Proceder</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="styles_tabla.css">
    <link rel="stylesheet" href="../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="styles_proceder.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../LogoSM.png" /><!--Cambiar la ubicacion del logo de la pagina aca tmb-->
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar" style="background-color: #000f22;">
        <!--Cambiar al color mas oscuro-->
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style="background-color: #000f22;">
          <h3 class="sidebar-brand brand-logo" style="color:white; font-weight: 200px; cursor: default;">Menú</h3>
          <h3 class="sidebar-brand brand-logo-mini" style="color:white; font-weight: 200px; cursor: default;">M</h3>
        </div>
        <ul class="nav" style="position: fixed;">
          <!-- Codigo para un item de la barra lateral que no tiene sublista -->
          <li class="nav-item menu-items">
            <!-- la clase "active" solo se usa para la vista que está activa -->
            <a class="nav-link" href="../pag_blanco.html">
              <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-home"></i>
                <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
              <span class="menu-title" style="color: white;">Página principal</span>
              <!-- Cambiar color de texto de acuerdo a lo necesario -->
            </a>
          </li>
          <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->
          <li class="nav-item menu-items">
            <a class="nav-link" href="../ListaIncidencias/tabla_incidencias.html">
              <span class="menu-icon">
                <i class="mdi mdi-account"></i>
              </span>
              <span class="menu-title" style="color: white;">Perfil</span>
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
            <a class="nav-link" href="../Dashboard/dashboard.html" onclick="return CancelarDashboard();">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
              <span class="menu-title" style="color: white;">Dashboard</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="../ListaIncidencias/tabla_incidencias.html">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
              <span class="menu-title" style="color: white;">Lista de incidencias</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="../ListaVecinos/tabla_vecinos.html">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
              <span class="menu-title" style="color: white;">Lista de vecinos</span>
            </a>
          </li>
          <!-- Codigo para un item de la barra lateral que SI tiene sublista -->
          <li class="nav-item menu-items" onclick="return mostrarPopupCerrarSesion();">
            <a class="nav-link" href="#">
              <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
                <!-- Cambiar icono de acuerdo a lo necesario -->
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
          <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch" style="background-color: #000f22">
            <!--Cambiar al color mas oscuro-->
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu" style="color: white;"></span>
              <!--Cambiar el color de las 3 rayas de acuerdo a lo necesario (a negro en todo caso)-->
            </button>
            <ul class="navbar-nav navbar-nav-right">
              <li class="nav-item dropdown">
                <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                  <div class="navbar-profile">
                    <div class="Header-nav-item">
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default; text-align: right;">Ricardo Calderón Rodríguez</h2>
                      <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Serenazgo de San Miguel, Lima</h5>
                    </div>
                    <img class="img-xs rounded-circle" src="../../LogoSM.png" alt="" style="height: 50px; width: 100%;">
                    <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->
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
          <div class="content-wrapper" style="background-color: #fffff6; margin-top: -30px">
            <div class="opciones-container">

              <!-- TITULO -->
              <div class="autoridad">
                <h1 style="text-align: left;">Proceder con la incidencia</h1>
                <hr style="border: none; border-top: 3px solid #000; margin: 10px 0;">
              </div>

              <div class="autoridad">
                <h1 style="text-align: left;">Clasificación de la incidencia</h1>
              </div>

              <!-- para la clasificacion -->

              <div class="opcion">
                <label style="font-size: 18px; display: block; margin-bottom: 10px;">
                  <input type="checkbox" name="opcion" value="leve" style="transform: scale(1.5); vertical-align: middle;"> Leve
                </label>

              </div>

              <div class="opcion">
                <label style="font-size: 18px; display: block; margin-bottom: 10px;">
                  <input type="checkbox" name="opcion" value="moderada" style="transform: scale(1.5); vertical-align: middle;"> Moderada
                </label>

              </div>

              <div class="opcion">
                <label style="font-size: 18px; display: block; margin-bottom: 10px;">
                  <input type="checkbox" name="opcion" value="grave" style="transform: scale(1.5); vertical-align: middle;"> Grave
                </label>

              </div>

              <div style="margin-top: 20px; margin-bottom: 50px;">
                <hr style="border: none; border-top: 1px solid #000;">
              </div>


              <!-- Checkboxes de categorías -->
              <div class ="autoridad" >
                <h1 style="text-align: left;" >Seleccione el tipo de serenazgo asignado</h1>
              </div>

              <div class ="opcion">
                <!-- Formulario de serenazgo -->
                <div class ="serenazgoSelector">
                  <select id="tipoSerenazgo">
                    <option value="default">Escoja el tipo de serenazgo</option>
                    <option value="bicicleta">Bicicleta</option>
                    <option value="a pie">A pie</option>
                    <option value="canino">Canino</option>
                    <option value="vehiculo">Vehículo</option>
                  </select>
                </div>
              </div>

              <div class ="autoridad">
                <h1 style="text-align: left;">Seleccione la autoridad requerida</h1>
              </div>

              <div class ="opcion">
                <label>
                  <input type="checkbox" name="opcion" value="ambulancia" onchange="mostrarFormulario()"> Ambulancia
                </label>
                <!-- Formulario de ambulancia -->
                <div class="form-ambulancia" style="display: none;">
                  <div class ="inWrapper">
                    <div class="form-section">
                      <input type="text" id="nombre" placeholder="Nombre del personal de turno">
                    </div>
                    <div class="form-section">
                      <input type="text" id="motivo" placeholder="Motivo de la solicitud">
                    </div>
                  </div>
                </div>
              </div>
              <div class ="opcion">
                <label>
                  <input type="checkbox" name="opcion" value="policia" onchange="mostrarFormulario()"> Policia
                </label>
                <!-- Formulario de policía -->
                <div class="form-policia" style="display: none;">
                  <div class ="inputs">
                    <select id="comisaría">
                      <option value="default">Escoja una comisaría</option>
                      <option value="Maranga">Maranga</option>
                      <option value="San Miguel">San Miguel</option>
                    </select>
                  </div>
                  <div class="inWrapper">
                    <div class ="inputs">
                      <input type="text" id="tipo" placeholder="Ingrese el tipo de vehículo">
                    </div>
                    <div class ="inputs">
                      <input type="text" id="tipo" placeholder="Motivo de la solicitud">
                    </div>
                  </div>
                </div>
              </div>
              <div class ="opcion">
                <div>
                  <label>
                    <input type="checkbox" name="opcion" value="bomberos"> Bomberos
                  </label>


                </div>
              </div>
              <!-- Agrega más opciones si es necesario -->
            </div>
          </div>
          <div class="botones-container">
            <button href="#" onclick="return aceptar();" class="boton-confirmar">Confirmar</button>
            <button href="#" onclick="return cancelar();" class="boton-cancelar">Cancelar</button>

          </div>
        </div>
      </div>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="script_tabla.js"></script>
    <script src="script_proceder.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>


<script>
  function cancelar() {
    Swal.fire({
      title: "¿Estás seguro de que deseas cancelar?",
      text: "Una vez cancelado, no se guardarán los cambios en el sistema",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#00913f",
      cancelButtonColor: "#d33",
      cancelButtonText: "Cancelar",
      confirmButtonText: "Sí"
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Se canceló la el procesamiento con éxito",
          icon: "success"
        }).then(() => {
          window.location.href ="tabla_incidencias.html";
        });
      }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
  }

  function aceptar() {
    Swal.fire({
      title: "¿Estás seguro de que deseas confirmar?",
      text: "Una vez inicie el procedimiento, el estado de la incidencia cambiará y se solicitarán las autoridades seleccionadas",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#00913f",
      cancelButtonColor: "#d33",
      cancelButtonText: "Cancelar",
      confirmButtonText: "Sí, confirmar"
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Se inició el proceso de esta incidencia",
          icon: "success"
        }).then(() => {
          window.location.href = "tabla_incidencias.html";
        });
      }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
  }
</script>ript>