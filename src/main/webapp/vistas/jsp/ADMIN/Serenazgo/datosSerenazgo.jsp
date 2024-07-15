<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="org.example.webappsm.model.beans.Serenazgo" %>
<%Serenazgo serenazgo = (Serenazgo) request.getAttribute("serenazgoVer");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Datos Serenazgo</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Serenazgo/styles_tabla.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/Serenazgo/styles_datos_serenazgo.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png"/><!--Cambiar la ubicacion del logo de la pagina aca tmb-->
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

                <div class="card2">
                    <h2 style="margin-top: 0; margin-bottom: 20px; text-align: left;  font-size: 30px;">Datos de Serenazgo</h2>
                    <a class="button" onclick="return Cancelar();" style="cursor: pointer;">Regresar</a>
                    <hr style="border: none; border-top: 2px solid black;">
                    <div class="card-table">
                        <div class="card-body">
                            <table>
                                <tbody>
                                <tr>
                                    <td>Nombre(s)</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getNombre() %></td>
                                </tr>
                                <tr>
                                    <td>Apellidos</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getApellido() %></td>
                                </tr>
                                <tr>
                                    <td>DNI</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getDni() %></td>
                                </tr>
                                <tr>
                                    <td>Direccción</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getDireccion() %></td>
                                </tr>
                                <tr>
                                    <td>Número telefónico</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getTelefono() %></td>
                                </tr>
                                <tr>
                                    <td>Turno</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getTurno() %></td>
                                </tr>
                                <tr>
                                    <td>Tipo</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getTipo() %></td>
                                </tr>
                                <tr>
                                    <td>Fecha de Nacimiento</td>
                                    <td>:</td>
                                    <td><%= serenazgo.getFNacimiento() %></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
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
    <script src="../../../../assets/js/misc.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/settings.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/todolist.js"></script>


<!-- endinject -->
    <!-- Custom js for this page -->
    <script>


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
                        window.location.href = "${pageContext.request.contextPath}/Admin?action=tablaSerenazgo";

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

    <!-- End custom js for this page -->

</body>
</html>
