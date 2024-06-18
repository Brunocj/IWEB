
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Serenazgo</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/styles_pag_principales.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
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

        <ul class="nav" style="position: fixed;">
          
          <!-- Codigo para un item de la barra lateral que no tiene sublista -->
          <li class="nav-item menu-items active"> <!-- la clase "active" solo se usa para la vista que está activa -->
            
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=pagPrincipal"> <!-- Cambiar href de acuerdo a lo necesario -->
              <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
              <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
            </a>
          </li>
          <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->

          
          <li class="nav-item menu-items">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=perfil">
              <span class="menu-icon">
                <i class="mdi mdi-account"></i>
              </span>
              <span class="menu-title" style="color: white;">Perfil</span>
            </a>
          </li>

          <li class="nav-item menu-items ">
            <a class="nav-link" href="https://mail.google.com/mail/u/0/#inbox">
              <span class="menu-icon">
                <i class="mdi mdi-email"></i>
              </span>
              <span class="menu-title" style="color: white;">Correo</span>
            </a>
          </li>

          <li class="nav-item menu-items">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=dashboard">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
              <span class="menu-title" style="color: white;">Dashboard</span>
            </a>
          </li>

          <li class="nav-item menu-items">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidencias">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
              <span class="menu-title" style="color: white;">Lista de incidencias</span>
            </a>
          </li>


          <li class="nav-item menu-items">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=listaVecinos">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
              <span class="menu-title" style="color: white;">Lista de vecinos</span>
            </a>
          </li>

          <li class="nav-item menu-items">
            <a class="nav-link" href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidenciasPasadas">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
              <span class="menu-title" style="color: white;">Lista de incidencias <br> pasadas</span>
            </a>
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
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Ricardo Calderón Rodríguez</h2>
                      <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Serenazgo de Lima</h5>
                    </div>
                    <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" alt="" style ="height: 50px; width: 100%;"> <!--Cambiar la ubicacion para el logo de san miguel (no anden copiando y pegando la imagen a sus carpetas o bala)-->
                    
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
          <div class="content-wrapper" style ="background-color: #fffff6;"> <!--Cambiar al color mas claro-->
                <div class="title-pp">
                  <h2>Bienvenido Serenazgo Dispatcher!</h2>
                </div>
                <div  class="RowWrapper">
                  <div class="row-1">
                    <div class="card-1" style ="color:black;">
                      <div class="font">
                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/adminn.jpg" alt="SanMiguel">
                        <div class="card-content">
                          <h3>¿Cuál es la función del serenazgo?</h3>
                          <p>Estás a cargo de la seguridad en el distrito.Explora y resuelve las incidencias generadas por los vecinos y coordinadores, y visualiza gráficas con las estadísticas de ellas. Monitorea y restringe el registro de incidencias.
                            ¡Únete a nosotros y ayúdanos a tener una comunidad más segura!</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <h3 style="color: black;">A continuación, podrás visualizar las funciones a realizar como Serenazgo Dispatcher.<br><span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/dashboard_serenazgo.png" alt="Vecinos">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar el dashboard de incidencias, en el cual podrás visualizar distintas gráficas de las incidencias mediante filtros por mes, tipo, etc. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Dashboard de incidencias" para dirigirse automáticamente a las listas.</span>
                          </span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/dashboard_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="<%=request.getContextPath()%>/Serenazgo?action=dashboard" style="color: black; font-weight: bold;"> Dashboard de <br> Incidencias</a>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/inc_serenazgo.png" alt="Serenazgo">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de incidencias para controlar los inconvenientes que registren los vecinos sanmiguelinos en la plataforma. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Lista de Incidencias" para dirigirse automáticamente a la lista.</span>
                          </span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/insignia.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidencias" style="color: black; font-weight: bold;"> Lista de <br> Incidencias</a>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/descripciones_pasadas.png" alt="Descripciones Pasadas">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar las descripciones de incidencias pasadas que ya fueron resueltas, por lo que en el caso de tener una incidencia similar, tendrás una referencia de solución. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Descripciones Pasadas" para dirigirse automáticamente a la lista.</span>
                          </span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/descripciones2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidenciasPasadas" style="color: black; font-weight: bold;">Descripciones <br> pasadas </a>
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


    <!-- Descripción -->


      <script src="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"></script>
      <!-- endinject -->
      <!-- Plugin js for this page -->
      <!-- End plugin js for this page -->
      <!-- inject:js -->
      <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
      <script src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/paginas_principales.js"></script>
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
                window.location.href = "../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
    
    <!-- End custom js for this page -->
  </body>
</html>