<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="org.example.webappsm.model.beans.Serenazgo" %>
<%@ page import ="org.example.webappsm.model.beans.Turno" %>
<%@ page import ="org.example.webappsm.model.beans.TipoSerenazgo" %>
<%@ page import="java.util.ArrayList" %>

<% Serenazgo serenazgo = (Serenazgo) request.getAttribute("serenazgoEdit"); %>
<% ArrayList<Turno> listaTurnos = (ArrayList<Turno>) request.getAttribute("listaTurnos"); %>
<% ArrayList<TipoSerenazgo> listaTipos = (ArrayList<TipoSerenazgo>) request.getAttribute("listaTipos"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Registrar Serenazgo</title>
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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
        <!-- JS para los popups -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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
                <div class="content-wrapper" style ="background-color: #FFEBEE;margin-top: -30px">
                    <!--CONTENIDO-->

                    <div class="card1">
                        <div class="wrapper" id="formContent">
                            <!-- Tabs Titles -->
                            <h2 style="margin-top: 0; margin-bottom: 20px; text-align: left;font-size: 30px;">Registrar Serenazgo</h2>
                            <a href="#" class="button" onclick="return Cancelar1('<%= request.getContextPath() %>');">Regresar</a>
                            <hr style="border: none; border-top: 2px solid black;">
                            <!-- Icon -->

                            <!-- Mostrar errores -->
                            <% String[] errorAttributes = {"err1", "err2", "err3", "err4", "err5", "err6", "err7", "err8"};
                                String firstError = null;

                                // Buscar el primer error que esté presente
                                for (String errorAttr : errorAttributes) {
                                    if (request.getAttribute(errorAttr) != null) {
                                        firstError = (String) request.getAttribute(errorAttr);
                                        break;  // Salir del bucle al encontrar el primer error
                                    }
                                }
                            %>

                            <% if (firstError != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= firstError %>
                            </div>
                            <% } %>

                            <!-- Formulario de Registro -->
                            <form action="${pageContext.request.contextPath}/Admin?action=registrarSerenazgo" method="post">
                                <div class="inputs">
                                    <label for="nombre">Nombre:</label>
                                    <input type="text" id="nombre" name="nombreS" placeholder="Nombre" value="<%= (request.getAttribute("nombreS") != null) ? request.getAttribute("nombreS") : ((serenazgo != null) ? serenazgo.getNombre() : "") %>" required>

                                    <label for="apellido">Apellidos:</label>
                                    <input type="text" id="apellido" name="apellidoS" placeholder="Apellidos" value="<%= (request.getAttribute("apellidoS") != null) ? request.getAttribute("apellidoS") : ((serenazgo != null) ? serenazgo.getApellido() : "") %>" required>

                                    <label for="dni">DNI:</label>
                                    <input type="text" id="dni" name="dniS" placeholder="DNI" value="<%= (request.getAttribute("dniS") != null) ? request.getAttribute("dniS") : ((serenazgo != null) ? serenazgo.getDni() : "") %>" required>

                                    <label for="direccion">Dirección:</label>
                                    <input type="text" id="direccion" name="direccionS" placeholder="Dirección" value="<%= (request.getAttribute("direccionS") != null) ? request.getAttribute("direccionS") : ((serenazgo != null) ? serenazgo.getDireccion() : "") %>" required>

                                    <label for="telefono">Teléfono:</label>
                                    <input type="text" id="telefono" name="telefonoS" placeholder="Teléfono" value="<%= (request.getAttribute("telefonoS") != null) ? request.getAttribute("telefonoS") : ((serenazgo != null) ? serenazgo.getTelefono() : "") %>" required>

                                    <div class="form-group">
                                        <label for="turnoS">Turno:</label>
                                        <select id="turnoS" name="turnoS" class="form-combo" required>
                                            <option value="">--Seleccione un turno--</option>
                                            <%
                                                for (Turno turno : listaTurnos) {
                                            %>
                                            <option value="<%= turno.getIdTurno() %>"><%= turno.getNombreTurno() %></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="tipoS">Tipo:</label>
                                        <select id="tipoS" name="tipoS" class="form-combo" required>
                                            <option value="">--Seleccione un tipo de serenazgo--</option>
                                            <%
                                                for (TipoSerenazgo tipo : listaTipos) {
                                            %>
                                            <option value="<%= tipo.getIdTipoSerenazgo() %>"><%= tipo.getNombreTipo() %></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <label for="nacimiento">Fecha de nacimiento:</label>
                                    <input type="date" id="nacimiento" name="fNacimientoS" required>
                                </div>

                                <div class="buttons">
                                    <input type="submit" class="green" value="Registrar personal">
                                    <input type="submit" class="red" value="Cancelar" onclick="return Cancelar1('<%= request.getContextPath() %>');">

                                </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>


            <script>
                <% if (request.getAttribute("msg") != null && "confirmacion".equals(request.getAttribute("msg"))) { %>
                Swal.fire({
                    title: "Registro exitoso",
                    text: "Se ha registrado correctamente al personal de serenazgo",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = '<%= request.getContextPath() %>/Admin?action=tablaSerenazgo';
                    }
                });
                <% } %>
            </script>

            <!-- container-scroller -->
            <!-- plugins:js -->
            <script src="<%= request.getContextPath() %>/assets/vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="<%= request.getContextPath() %>/assets/js/off-canvas.js"></script>
            <script src="<%= request.getContextPath() %>/assets/js/hoverable-collapse.js"></script>
            <script src="../../../../assets/js/misc.js"></script>
            <script src="<%= request.getContextPath() %>/assets/js/settings.js"></script>
            <script src="<%= request.getContextPath() %>/assets/js/todolist.js"></script>
            <!-- endinject -->
            <!-- Custom js for this page -->
            <script>
                function Confirmacion() {
                    Swal.fire({
                        title: "Estás seguro?",
                        text: "El proceso no podrá ser reversible",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#00913f",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Sí, registrar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: "¡Registrado!",
                                text: "El personal ha sido registrado con éxito",
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
            <script src="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Serenazgo/script_tabla.js"></script>
            <!-- End custom js for this page -->
    </body>
</html>
