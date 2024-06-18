<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../css/Incidencias/styles_incidencia.css">
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
        
        
        <ul class="nav">
          <!-- Codigo para un item de la barra lateral que no tiene sublista -->
          <li class="nav-item menu-items "> <!-- la clase "active" solo se usa para la vista que está activa -->
            
            <a class="nav-link" href="../PaginaPrincipal/pagina_principal_coordinador.jsp"><!-- Cambiar href de acuerdo a lo necesario -->
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
          <li class="nav-item menu-items active">
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

            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
              <h2 class="tabla-title" style="color: #000f22; margin-bottom: 0px;">Incidencias</h2>
              <button class="btnTable" style="display: flex; align-items: center;" onclick="window.location.href='registrar_incidencia.jsp';">
                  Agregar Incidencia
                  <a class="mdi mdi-plus" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
              </button>
          </div>
          


            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo (claro) de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th style ="color: white;">Descripción</th>
                  <th style ="color: white;">Fecha</th>
                  <th style ="color: white;">Estado</th>
                  <th style="width: 20px; color: white;"></th>
                </tr>
              </thead>
              <tbody style="text-align: center; color: black;">
                <tr style="text-align: center;">
                  <td>Asalto a la altura de la puerta Riva Agüero de la PUCP</a></td>
                  <td>12/04/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Robo en el parque Juan Pablo II</a></td>
                  <td>13/03/2024</a></td>
                  <td>Pendiente</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Escape de los leones del Parque de las Leyendas</a></td>
                  <td>11/01/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Lab2 de IWEB y GTICS (los patos abusaron de los alumnos)</a></td>
                  <td>10/04/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Choque en el cruce de las avenidas Universitaria con La Marina</a></td>
                  <td>22/04/2024</a></td>
                  <td>Pendiente</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Lab2 de IWEB y GTICS (los patos abusaron de los alumnos)</a></td>
                  <td>10/04/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Lab2 de IWEB y GTICS (los patos abusaron de los alumnos)</a></td>
                  <td>10/04/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Lab2 de IWEB y GTICS (los patos abusaron de los alumnos)</a></td>
                  <td>10/04/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Lab2 de IWEB y GTICS (los patos abusaron de los alumnos)</a></td>
                  <td>10/04/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Lab2 de IWEB y GTICS (los patos abusaron de los alumnos)</td>
                  <td>10/04/2024</td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
                <tr>
                  <td>Lab2 de IWEB y GTICS (los patos abusaron de los alumnos)</a></td>
                  <td>10/04/2024</a></td>
                  <td>Resuelto</td>
                  <td><a href="incidencia_info.jsp"><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
                </tr>
              </tbody>
            </table>
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
    <script src="../../js/Incidencias/script_cerrar_sesion.js"></script>
    <!-- End custom js for this page -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src ="../../js/Incidencias/script_incidencia.js"></script>
  </body>
</html>