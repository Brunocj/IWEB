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
    <title>Editar Serenazgo</title>
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

    <%
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Admin"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>


    <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="tablaSerenazgo"/>
    </jsp:include>

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
