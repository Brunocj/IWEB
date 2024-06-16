<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="org.example.webappsm.model.beans.Serenazgo" %>
<%@ page import ="org.example.webappsm.model.beans.Turno" %>
<%@ page import ="org.example.webappsm.model.beans.TipoSerenazgo" %>
<%@ page import="java.util.ArrayList" %>
<%Serenazgo serenazgo = (Serenazgo) request.getAttribute("serenazgoEdit");%>
<%ArrayList<Turno> listaTurnos= (ArrayList<Turno>) request.getAttribute("listaTurnos");%>
<%ArrayList<TipoSerenazgo> listaTipos= (ArrayList<TipoSerenazgo>) request.getAttribute("listaTipos");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Profesores/styles_profesor_registro.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" /><!--Cambiar la ubicacion del logo de la pagina aca tmb-->
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">  <!--Cambiar al color mas oscuro-->

        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
            <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200; cursor: default;">Menú</h3>
            <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200; cursor: default;">M</h3>
        </div>


        <ul class="nav">

            <!-- Codigo para un item de la barra lateral que no tiene sublista -->
            <li class="nav-item menu-items "> <!-- la clase "active" solo se usa para la vista que está activa -->

                <a class="nav-link" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/pagina_principal_admin.jsp" onclick="return CancelarPagPrincipal();"> <!-- Cambiar href de acuerdo a lo necesario -->
                    <span class="menu-icon">
                <i class="mdi mdi-home"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title" style="color: white;">Página principal</span> <!-- Cambiar color de texto de acuerdo a lo necesario -->
                </a>
            </li>
            <!-- Codigo para un item de la barra lateral que no tiene sublista FIN-->


            <li class="nav-item menu-items">
                <a class="nav-link" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Dashboard/dashboard.jsp" onclick="return CancelarDashboard();">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
                    <span class="menu-title" style="color: white;">Dashboard</span>
                </a>
            </li>
            <li class="nav-item menu-items active">
                <a class="nav-link" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Serenazgo/tabla_serenazgo.jsp" onclick="return CancelarSerenazgo();">
              <span class="menu-icon">
                <i class="mdi mdi-security"></i>
              </span>
                    <span class="menu-title" style="color: white;">Serenazgo</span>
                </a>
            </li>
            <li class="nav-item menu-items ">
                <a class="nav-link" href="${pageContext.request.contextPath}/Admin?action=tablaProfesores" onclick="return CancelarProfesores();">
              <span class="menu-icon">
                <i class="mdi mdi-teach"></i>
              </span>
                    <span class="menu-title" style="color: white;">Profesores</span>
                </a>
            </li>
            <!-- Codigo para un item de la barra lateral que SI tiene sublista -->
            <li class="nav-item menu-items">
                <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-nature-people"></i> <!-- Cambiar icono de acuerdo a lo necesario -->
              </span>
                    <span class="menu-title vecinos" style="color: white;">Vecinos</span>
                    <i class="menu-arrow" style="color: white;"></i>
                </a>

                <div class="collapse" id="ui-basic">
                    <ul class="nav flex-column sub-menu"><!-- Colocar items de la sublista -->

                        <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Vecinos/Postulaciones_coordinacion/tabla_postulaciones.jsp" style="color: white;"onclick="return CancelarSolAcceso();">
                  <span class="menu-icon">
                    <i class="mdi mdi-account-alert"></i>
                  </span>
                            Solicitudes de acceso</a></li>
                        <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/tabla_solicitudes.jsp" style="color: white;"onclick="return CancelarSolCoordinacion();">
                    <span class="menu-icon">
                    <i class="mdi mdi-account-alert"></i>
                  </span>
                            Solicitudes a coordinación</a></li>
                    </ul>
                </div>
            </li>
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
        <!-- partial:../../partials/_navbar.jsp -->
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
                                    <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default; text-align: right;">ADMIN</h2>
                                    <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Administrador de San Miguel</h5>
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
            <div class="content-wrapper" style ="background-color: #FFEBEE;margin-top: -30px"> <!--Cambiar al color mas claro-->
                <!--CONTENIDO-->

                <div class="card1">
                    <div class = "wrapper"id="formContent">
                        <!-- Tabs Titles -->
                        <h2 style="margin-top: 0; margin-bottom: 20px; text-align: left;font-size: 30px;">Editar Serenazgo</h2>
                        <a href="tabla_serenazgo.jsp" class="button" onclick="return Cancelar();">Regresar</a>
                        <hr style="border: none; border-top: 2px solid black;">
                        <!-- Icon -->

                        <!-- Login Form -->
                        <form action="${pageContext.request.contextPath}/Admin?action=editarSerenazgo" method="post">
                            <input type="hidden" name="action" value="editarSerenazgo">
                            <input type="hidden" name="idSerenazgo"  value="<%= serenazgo.getIdSerenazgo() %>">
                            <div class="inputs">
                                <label for="nombre">Nombre:</label>
                                <input type="text" id="nombre" name="nombreS" value="<%= serenazgo.getNombre() %>" style="margin-bottom: 0px;">

                                <label for="apellido">Apellidos:</label>
                                <input type="text" id="apellido" name="apellidoS" value="<%= serenazgo.getApellido() %>" style="margin-bottom: 0px;">

                                <label for="dni">DNI:</label>
                                <input type="text" id="dni" name="dniS" value="<%= serenazgo.getDni() %>" style="margin-bottom: 0px;">

                                <label for="direccion">Dirección:</label>
                                <input type="text" id="direccion" name="direccionS" value="<%= serenazgo.getDireccion() %>" style="margin-bottom: 0px;">

                                <label for="telefono">Teléfono:</label>
                                <input type="text" id="telefono" name="telefonoS" value="<%= serenazgo.getTelefono() %>" style="margin-bottom: 0px;">

                                <div class="form-group">
                                    <label for="turnoS">Turno:</label>
                                    <select id="turnoS" name="turnoS" class="form-combo" required>
                                        <% for (Turno turno : listaTurnos) { %>
                                            <option value="<%= turno.getIdTurno() %>" <%= serenazgo.getTurno().equals(turno.getNombreTurno()) ? "selected" : "" %>><%=turno.getNombreTurno()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="tipoS">Tipo:</label>
                                    <select id="tipoS" name="tipoS" class="form-combo" required>
                                        <% for (TipoSerenazgo tipo : listaTipos) { %>
                                        <option value="<%= tipo.getIdTipoSerenazgo() %>" <%= serenazgo.getTipo().equals(tipo.getNombreTipo()) ? "selected" : "" %>><%=tipo.getNombreTipo()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>


                                <label for="nacimiento">Fecha de nacimiento:</label>
                                <input type="text" id="nacimiento" name="fNacimientoS" value="<%= serenazgo.getFNacimiento() %>" style="margin-bottom: 15px;">
                            </div>

                            <div class = "buttons">
                                <input type="submit" class="green" value="Actualizar personal" onclick="return Actualizar();">
                                <input type="submit" class="red" value="Cancelar" onclick="return Cancelar();">
                            </div>

                        </form>

                    </div>


                </div>


            </div>

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
                    window.location.href = "../../LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                }
            });
        }

        function Actualizar() {
            Swal.fire({
                title: "Estás seguro?",
                text: "El proceso no podrá ser reversible",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Si, actualizar"
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Actualizado!",
                        text: "El personal ha sido actualizado con exito",
                        icon: "success"
                    }).then(() => {
                        document.querySelector("form").submit();
                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }


    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src ="script_tabla.js"></script>
    <script src="cancelaciones.js"></script>
    <!-- End custom js for this page -->
</body>
</html>
