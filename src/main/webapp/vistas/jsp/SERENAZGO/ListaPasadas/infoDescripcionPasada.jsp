<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%@ page import="org.example.webappsm.model.beans.Serenazgo" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Incidencia incidencia = (Incidencia) request.getAttribute("incidencia");
%>

<%
    String serenazgoEncargado = (String) request.getAttribute("serenazgo");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Solicitud</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaPasadas/styles_info.css">
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

            <%
                String userRole = (String) session.getAttribute("userRole");
                if (userRole == null) {
                    userRole = "Serenazgo"; // Por defecto, si no hay rol en la sesión
                }
                String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
            %>


            <jsp:include page="<%= menuadmin %>">
                <jsp:param name="activePage" value="listaIncidenciasPasadas"/>
            </jsp:include>

            <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper" style ="background-color: #fffff6;"> <!--Cambiar al color mas claro-->
                        <!--CONTENIDO-->
                        <div class="card" style="background-color: white; color: black;">
                            <h2 style="color: black;">Información de la incidencia:</h2>
                            <div class="card-table">
                                <div class="card-body">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Nombre de la incidencia</td>
                                                <td>:</td>
                                                <td><%= incidencia.getNombre() %></td>
                                            </tr>
                                            <tr>
                                                <td>Lugar exacto</td>
                                                <td>:</td>
                                                <td><%= incidencia.getLugar() %></td>
                                            </tr>
                                                <%
                                            Timestamp timestamp = new Timestamp(System.currentTimeMillis());

                                            // Convertir Timestamp a Date
                                            Date date = new Date(timestamp.getTime());

                                            // Formatear la fecha
                                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                            String formattedDate = sdf.format(date);
                                                %>
                                            <tr>
                                                <td>Fecha de la incidencia</td>
                                                <td>:</td>
                                                <td><%= formattedDate %></td>
                                            </tr>
                                            <tr>
                                                <td>Tipo de serenazgo Encargado</td>
                                                <td>:</td>
                                                <td><%= serenazgoEncargado %></td>
                                            </tr>
                                            <tr>
                                                <td>Se necesitó Ambulancia?</td>
                                                <td>:</td>
                                                <td><%= incidencia.isAmbulanciaI() ? "Sí" : "No" %></td>
                                            </tr>
                                            <tr>
                                                <td>Descripción final</td>
                                                <td>:</td>
                                                <td><%= incidencia.getDescripcion() %></td>
                                            </tr>
                                            <tr td colspan="3">
                                                <td style="border-bottom: none;">Imagen de referencia:</td>
                                                <td style="border-bottom: none;"></td>
                                                <td style="border-bottom: none;"></td>
                                            </tr>
                                            <tr>
                                                <td class = "info" colspan="3" style="text-align: center;">
                                                    <div class="image-container">
                                                        <img src="data:image/jpeg;base64, <%= new String(org.apache.commons.codec.binary.Base64.encodeBase64(incidencia.getImgEvidencia())) %>">
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="button-container">
                                <!-- Botón con enlace "#" -->
                                <a href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidenciasPasadas" class="button" style =" background-color: #000f22;" >Regresar</a>
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
                    confirmButtonText: 'Sí, cerrar sesión',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                    }
                });
            }
        </script>
        <!-- End custom js for this page -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

    </body>
</html>