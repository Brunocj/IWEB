<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Usuario usuario =(Usuario) request.getAttribute("usuarioVerCoordi");%>
<% int idPostulacion =(int) request.getAttribute("id");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Postulación a coordinador: <%=usuario.getNombre()%></title>
    <!-- plugins:css -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/styles_detalles_solicitudes.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/vistas/jsp/LogoSM.png" /> <!--Cambiar la ubicacion del logo de la pagina aca tmb-->
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>


<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->
    <!-- partial:../../partials/_sidebar.html -->
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
                                    <h2 class="mb-0 d-none d-sm-block navbar-profile-name"
                                        style="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default; text-align: right;">
                                        ADMIN
                                    </h2>
                                    <h5 class="mb-0 d-none d-sm-block navbar-profile-name"
                                        style="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">
                                        Administrador de San Miguel
                                    </h5>
                                </div>
                                <img class="img-xs rounded-circle" src="<%=request.getContextPath()%>/vistas/jsp/LogoSM.png" alt=""
                                     style="height: 50px; width: 100%;">
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
            <div class="content-wrapper" style ="background-color: #FFEBEE;margin-top: -30px"> <!--Cambiar al color mas claro-->
                <!--CONTENIDO-->

                <div class="card1">
                    <div class = "wrapper"id="formContent">
                        <!-- Tabs Titles -->
                        <div class="header-container">
                            <h2 style="margin-top: 0; margin-bottom: 20px; text-align: left;font-size: 25px;">Solicitud a coordinación</h2>
                            <a href="tabla_postulaciones.jsp" class="button"onclick="return Cancelar();">Regresar</a>
                        </div>
                        <hr style="border: none; border-top: 2px solid black;">
                        <!-- Icon -->

                        <!-- Login Form -->
                        <form id="miFormularioPostulacion" action="${pageContext.request.contextPath}/Admin?action=opcionSoli" method="post">
                            <input type="hidden" name="action" value="opcionSoli">
                            <input type="hidden" id="idUser" name="idUser" value="<%=idPostulacion%>">
                            <%
                                int idArea;
                                if(usuario.getArea().equals("Cultura")){
                                    idArea = 1;
                                }else{
                                    idArea = 2;
                                }
                            %>
                            <input type="hidden" id="idArea" name="idArea" value="<%=idArea%>">
                            <input type="hidden" id="opcionSeleccionada" name="opcionSeleccionada" value="">
                            <div class="inputs">
                                <label for="nombre" style="font-size: 12px; color: gray;">Nombres:</label>
                                <input type="text" id="nombre" value="<%=usuario.getNombre()%>" disabled style="margin-bottom: 5px; background-color: rgb(241, 241, 241);">

                                <label for="apellido" style="font-size: 12px; color: gray;">Apellidos:</label>
                                <input type="text" id="apellido" value="<%=usuario.getApellido()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="dni" style="font-size: 12px; color: gray;">DNI-peruano:</label>
                                <input type="text" id="dni" value="<%=usuario.getDocumento()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="direccion" style="font-size: 12px; color: gray;">Distrito:</label>
                                <input type="text" id="direccion" value="<%=usuario.getDistrito()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="telefono" style="font-size: 12px; color: gray;">Urbanización:</label>
                                <input type="text" id="telefono" value="<%=usuario.getNumContacto()%>" style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="correo" style="font-size: 12px; color: gray;">Correo(gmail):</label>
                                <input type="text" id="correo" value="<%=usuario.getCorreoE()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">


                                <label for="nacimiento" style="font-size: 12px; color: gray;">Coordinación [Deporte/Cultura]</label>
                                <input type="text" id="nacimiento" value="<%=usuario.getArea() %>" disabled style="margin-bottom: -15px;background-color: rgb(236, 243, 207);">
                            </div>

                            <label for="solicitud" style="font-size: 16px; color: rgb(5, 0, 0); padding: 5px; float:left; font-weight: bold;">Solicitud a Coordinación:</label>
                            <hr style="margin-top: 60px;margin-bottom: 0px; ">

                            <label style="color: black; float:left; cursor: pointer;">
                                <input type="radio" name="opcion" value="aprobar" style="margin-top: 15px;cursor: pointer;" onclick="showApproveContent()"> Aprobar
                            </label>

                            <label style="color: black; float:left; margin-left: 20px; cursor: pointer;">
                                <input type="radio" name="opcion" value="denegar" style="margin-left: 5px;margin-top: 15px;cursor: pointer;" onclick="showDenyContent()"> Denegar
                            </label>
                            <br>
                            <br>

                            <a class="mdi mdi-alert-box" style="color: rgb(182, 1, 1); font-size: 20px; vertical-align: middle; float:left;"></a>
                            <label for="solicitud" style="font-size: 14px; color: rgb(182, 1, 1); padding: 5px; float:left;">Deberá rellenar/modificar obligatoriamente los siguientes campos:</label>

                            <div class="inputs">
                                <label for="titulo" style="font-size: 12px; color: gray; margin-top:35px;">Asunto de correo:</label>
                                <input type="text" id="titulo" value="Marca una opción por favor" disabled style="margin-bottom: 2px; font-size: 16px; color: rgb(156, 150, 150); background-color: white;">

                                <label for="cuerpo" style="font-size: 12px; color: gray;">Cuerpo del correo:</label>
                                <textarea id="cuerpo" class="correo-cuerpo" disabled style="color: rgb(156, 150, 150); font-size: 16px; background-color: white;">
    Marca una opción por favor
                        </textarea>
                                </textarea>
                            </div>





                            <div class = "buttons">
                                <input type="submit" class="green" value="Guardar y enviar" onclick="return Guardar();">
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
    <script src="<%=request.getContextPath()%>/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<%=request.getContextPath()%>/assets/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/hoverable-collapse.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/misc.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/settings.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/todolist.js"></script>
    <script>

        /* Funciones para que el texto cambie de acuerdo a lo indicado*/

        function showApproveContent() {
            document.getElementById("opcionSeleccionada").value = "aprobar";
            var titulo = document.getElementById("titulo");
            var cuerpo = document.getElementById("cuerpo");

            titulo.style.color = "black"; // Cambiar color del texto a negro
            titulo.value = "SOLICITUD ACEPTADA- Solicitud para coordinación de [deporte/cultura] exitosa (Eventos- San Miguel)";

            cuerpo.style.color = "black"; // Cambiar color del texto a negro
            cuerpo.style.fontSize = "14px"; // Cambiar tamaño de letra del cuerpo del correo
            cuerpo.value = "Estimado [Nombre del Usuario],\n\nNos complace informarte que tu solicitud para el rol de coordinador en [cultura/deporte] ha sido aceptada. Esperamos con entusiasmo trabajar contigo para fortalecer nuestra comunidad y llevar a cabo diversos proyectos.\n\nTu nueva contraseña para acceder al sistema es: ZAXB#17%W. Reinicia la página y cambia a una contraseña segura tan pronto como sea posible. Si tienes alguna pregunta o necesitas asistencia, no dudes en contactarnos.\nBienvenido coordinador y gracias por tu compromiso con el distrito de San Miguel.\n\nAtentamente,\nLa administración";
            titulo.removeAttribute("disabled"); // Quitar el atributo disabled

            cuerpo.removeAttribute("disabled"); // Quitar el atributo disabled
        }

        function showDenyContent() {
            document.getElementById("opcionSeleccionada").value = "denegar";
            var titulo = document.getElementById("titulo");
            var cuerpo = document.getElementById("cuerpo");

            titulo.style.color = "black"; // Cambiar color del texto a negro
            titulo.value = "SOLICITUD DENEGADA- Solicitud para coordinación de [deporte/cultura] fallida (Eventos- San Miguel)";

            cuerpo.style.color = "black"; // Cambiar color del texto a negro
            cuerpo.style.fontSize = "14px"; // Cambiar tamaño de letra del cuerpo del correo
            cuerpo.value = "Estimado [Nombre],\n\nLamentamos informarte que tu solicitud para el rol de coordinador en el área de [cultura/deporte] ha sido rechazada en esta ocasión. Apreciamos tu interés en contribuir al bienestar de nuestra comunidad, y te animamos a explorar otras oportunidades de participación en otra ocasión. Si tienes alguna pregunta o necesitas más información, no dudes en contactar a nosotros.\n\nAtentamente,\nLa administración";
            titulo.removeAttribute("disabled"); // Quitar el atributo disabled

            cuerpo.removeAttribute("disabled"); // Quitar el atributo disabled
        }

        /* aqui muere*/


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
                    window.location.href = "LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                }
            });
        }

        function Cancelar() {
            Swal.fire({
                title: "Estás seguro?",
                text: "Perdera todo su progreso",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Sí, cancelar",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Cancelado!",
                        text: "Se ha cancelado satisfactoriamente",
                        icon: "success"
                    }).then(() => {
                        window.location.href = "${pageContext.request.contextPath}/Admin?action=tablaCoordinador";
                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }

        function Guardar() {
            var opcionSeleccionada = document.getElementById("opcionSeleccionada").value;
            console.log("Opción seleccionada:", opcionSeleccionada);
            var id = document.getElementById("idUser").value;
            // Verificar si se ha seleccionado alguna opción
            if (!opcionSeleccionada) {
                // Mostrar un mensaje de error si no se ha seleccionado ninguna opción
                console.log("Error: No se ha seleccionado ninguna opción.");
                Swal.fire({
                    title: "Error",
                    text: "Por favor, selecciona una opción antes de guardar",
                    icon: "error",
                    confirmButtonColor: "#00913f",
                });
                return false; // Prevenir el envío del formulario
            }

            // Mostrar el popup de confirmación
            console.log("Mostrando pop-up de confirmación...");
            Swal.fire({
                title: "Estás seguro?",
                text: "El proceso no podrá ser reversible",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Si, guardar y enviar"
            }).then((result) => {
                if (result.isConfirmed) {
                    // Enviar el formulario
                    var idInput = document.createElement("input");
                    idInput.type = "hidden";
                    idInput.name = "id";
                    idInput.value = id;
                    document.getElementById("miFormularioPostulacion").appendChild(idInput);
                    console.log("Enviando formulario...");
                    document.getElementById("miFormularioPostulacion").submit();
                } else {
                    console.log("Operación cancelada.");
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
