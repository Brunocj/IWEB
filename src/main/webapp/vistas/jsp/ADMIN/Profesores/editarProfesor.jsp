<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.webappsm.model.beans.Profesor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Profesores/styles_tabla.css">
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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" /> <!--Cambiar la ubicacion del logo de la pagina aca tmb-->
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->

    <%
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Admin"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>


    <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="tablaProfesores"/>
    </jsp:include>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #FFEBEE;margin-top: -30px"> <!--Cambiar al color mas claro-->
                <!--CONTENIDO-->
                <!--CONTENIDO-->

                <div class="card1">
                    <div class = "wrapper" id="formContent">
                        <!-- Tabs Titles -->
                        <h2 style="margin-top: 0; margin-bottom: 20px; text-align: left;font-size: 30px;">Editar Docente</h2>
                        <a href="tabla_profesor.jsp" class="button" onclick="return Cancelar();">Regresar</a>
                        <hr style="border: none; border-top: 2px solid black;">
                        <!-- Icon -->
                        <%
                            Profesor profesor = (Profesor) request.getAttribute("profesor");
                            if (profesor == null) {
                                out.print("<p>Error: No se encontró el profesor.</p>");
                            } else {
                        %>
                        <form action="${pageContext.request.contextPath}/Admin?action=actualizarProfesor" method="post">
                            <input type="hidden" name="action" value="actualizarProfesor">
                            <input type="hidden" name="idProfesor" value="<%= profesor.getIdProfesor() %>">
                            <div class="inputs">
                                <label for="nombre">Nombre:</label>
                                <input type="text" id="nombre" name="nombre" value="<%= profesor.getNombre() %>" style="margin-bottom: 0px;">

                                <label for="apellido">Apellidos:</label>
                                <input type="text" id="apellido" name="apellido" value="<%= profesor.getApellido() %>" style="margin-bottom: 0px;">

                                <label for="curso">Curso/Actividad:</label>
                                <input type="text" id="curso" name="curso" value="<%= profesor.getCurso() %>" style="margin-bottom: 0px;">

                                <label for="area">Área:</label>
                                <%
                                    // Suponiendo que 'profesor' ya está inicializado correctamente
                                    Integer idArea = profesor.getIdArea();
                                %>

                                <select name="area">
                                    <option value="1" <%= idArea != null && idArea == 1 ? "selected" : "" %>>Cultura</option>
                                    <option value="2" <%= idArea != null && idArea == 2 ? "selected" : "" %>>Deportes</option>
                                </select>

                            </div>
                            <div class="buttons">
                                <input type="submit" class="green" value="Actualizar personal" onclick="return Actualizar();">
                                <input type="submit" class="red" value="Cancelar" onclick="return Cancelar();">
                            </div>
                        </form>
                        <% } %>

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
                        window.location.href = "${pageContext.request.contextPath}/Admin?action=tablaProfesores";

                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
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
    <script src = "script_tabla.js"></script>
    <script src="cancelaciones.js"></script>
    <!-- End custom js for this page -->
</body>
</html>
