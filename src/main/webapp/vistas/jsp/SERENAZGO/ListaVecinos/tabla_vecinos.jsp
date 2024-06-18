<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("listaVecinos");
%>



<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lista de profesores</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaVecinos/styles_tabla.css">
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
                      <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default; text-align: right;">Ricardo Calderón Rodríguez</h2>
                      <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Serenazgo de San Miguel, Lima</h5>
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
          <div >
            <div class="content-wrapper" style ="background-color: #fffff6; margin-top:auto;"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->
            <div style="display: flex; justify-content: space-between;">
              <div style="display: flex; justify-content: space-between;">
                <div style="display: flex; flex-direction: column; margin-bottom: 80px;">
                  <h2 class="tabla-title" style ="color:#000f22;">Lista de vecinos</h2>  <!--Cambiar el titulo de la tabla-->
                    
                  <div style="display: flex; gap:30px;margin-top: 10px;">
 
                    <div style="display: flex; gap:10px;">

                      <p style ="color:black; align-self: center; margin-bottom: 0px;font-size: 15px">Filtrar por falsas alarmas :</p>
                      <select id="filtroEstado" style="border-color: #DFDFDF; border-radius: 6px; padding:5px; outline: none; height: 40px; margin-top: 10px;" >
                        <option value="">Mostrar Todos</option> <!--Cambiar el filtro de acuerdo a lo necesario-->
                        <option value="aptosBaneo">Aptos para baneo </option>
                        <option value="noAptosBaneo">No aptos</option>
                    
                      </select>
                    </div>
                    <div style="display: flex; align-items: center; justify-content: center;">
                      <button id="limpiarFiltros" class="btnTable" style="display: flex; align-items: center;">
                        Limpiar Filtros
                        <a class="mdi mdi-filter-remove" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                      </button> 
                    </div>
                    <div style="display: flex; align-items: center; justify-content: center;">
                    
                    </div>
                  </div>    
                </div>
              </div>
            </div>
            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Nombres</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Apellidos</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Correo</th>
                  <th style="width: 20px;color: white">Falsas alarmas</th>
                  <th style="width: 20px;color: white">Banear</th>
                </tr>
              </thead>
              <hr style="border: none; border-top: 3px solid black; margin-top: -55px; border-radius: 10px;">

              <tbody style="text-align: center; color: black;">
                <% if (lista != null && !lista.isEmpty()) {
                  for (Usuario usuario : lista) { %>

                <tr style="text-align: center;">
                  <td><%= usuario.getNombre() %></td>
                  <td><%= usuario.getApellido() %></td>
                  <td><a href="https://mail.google.com/mail/u/0/#inbox"><%= usuario.getCorreoE() %></a></td>
                  <td><%= usuario.getFalsasAlarmas() %></td>
                  <%
                    if (usuario.isBaneado()) { %>
                  <td style="color: red; font-weight: bold;">Usuario baneado</td>
                  <%
                  } else if (usuario.getFalsasAlarmas() > 5) { %>
                  <td><a href="#" onclick="return banear(<%= usuario.getId() %>,'<%= request.getContextPath() %>');" class="mdi mdi-account-remove" style="color: #6c7293; font-size: 20px;"></a></td>
                  <%
                  } else { %>
                  <td></td>
                  <%
                    }
                  %>
                </tr>
                <% }
                } else { %>
                <tr>
                  <td colspan="5">No hay vecinos registrados.</td>
                </tr>
                <% } %>
              </tbody>

          </table>
          
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
                window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaVecinos/script_tabla.js"></script>
    
    <!-- End custom js for this page -->
  </body>
</html>