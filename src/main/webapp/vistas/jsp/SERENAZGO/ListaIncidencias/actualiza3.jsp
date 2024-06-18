
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="styles_tabla.css">
    <link rel="stylesheet" href="../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="styles_actualiza3.css">
    
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
      <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->
        
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
          <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
          <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;">M</h3>
        </div>
        
        
        <ul class="nav"style="position: fixed;">
          
          <!-- Codigo para un item de la barra lateral que no tiene sublista -->
          <li class="nav-item menu-items "> <!-- la clase "active" solo se usa para la vista que está activa -->
            
            <a class="nav-link" href="../pagina_principal_serenazgo.html"> <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
              <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
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
            <a class="nav-link" href="../Dashboard/dashboard.html"onclick="return CancelarDashboard();">
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
            <a class="nav-link" href="#"> <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
              <span class="menu-title" style="color: white;">Cerrar sesión</span>
            </a>
          </li>
          <!-- Codigo para un item de la barra lateral que SI tiene sublista -->
          
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
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default; text-align: right;">Ricardo Calderón Rodríguez</h2>
                      <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Serenazgo de San Miguel, Lima</h5>
                    </div>
                    <img class="img-xs rounded-circle" src="../../LogoSM.png" alt="" style ="height: 50px; width: 100%;"> <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->
                    
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
            <div class="content-wrapper" style ="background-color: #fffff6;margin-top: -30px"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->  
        </div>
        
        

        <div class="container">
          <div class="card">
            <h1 style="text-align: center;">Actualización de incidencias</h1>
            <h3>Bienvenido, en este apartado podrá actualizar la incidencia seleccionada en una de las siguientes categorías:</h3>
            
            <!-- Radios de categorías -->
            
            <div class="opciones">
              <div class="opcion">
                  <input type="radio" id="categoriaLeve" name="categoria" value="leve">
                  <label for="categoriaLeve">Leve</label>
              </div>
              <div class="opcion">
                  <input type="radio" id="categoriaModerada" name="categoria" value="moderada">
                  <label for="categoriaModerada">Moderada</label>
              </div>
              <div class="opcion">
                  <input type="radio" id="categoriaGrave" name="categoria" value="grave">
                  <label for="categoriaGrave">Grave</label>
              </div>
          </div>
           
        <div>
            <label for="nombre">Ingrese una descripción del porqué actualiza a esta opción:</label>
            <br>
            <textarea id="nombre" name="nombre" placeholder="Opcional" required></textarea>
        </div>
        
        <div class="botones-container">
            <button href="#" onclick="return aceptar();" class="boton-confirmar">actualizar</button>
            <button href="#" onclick="return cancelar();" class="boton-cancelar">Cancelar</button>
            
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
                  // Aquí puedes poner el código para cerrar sesión
                  // Por ejemplo, redirigir a la página de inicio de sesión
                  window.location.href = "../LOGIN/login.html"; 
              }
          });
      }
      function cancelar() {
            Swal.fire({
                title: "¿Estás seguro de que deseas cancelar la actualización?",
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
                        title: "Se canceló la actualización",
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
                title: "¿Estás seguro de que deseas confirmar la actualización?",
                text: "Una vez clasificado, los datos del sistema serán actualizados",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                cancelButtonText: "Cancelar",
                confirmButtonText: "Sí, actualizar"
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "La incidencia fue actualizada exitosamente",
                        icon: "success"
                    }).then(() => {
                        window.location.href = "tabla_incidencias.html";
                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }


  </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "script_tabla.js"></script>
    <script src="cancelaciones.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>