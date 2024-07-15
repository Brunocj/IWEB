<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %><%--
<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("listaacceso");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Tabla de solicitudes</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/styles_tabla.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/css/vendor.bundle.base.css">
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

        <%
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Admin"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>


    <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="tablaAcceso"/>
    </jsp:include>

        <!-- partial -->
        <div class="main-panel">
            <div >
                <div class="content-wrapper" style ="background-color: #FFEBEE; margin-top:auto;"> <!--Cambiar al color mas claro-->
                    <!--CONTENIDO-->
                    <div style="display: flex; justify-content: space-between;">
                        <div style="display: flex; justify-content: space-between;">
                            <div style="display: flex; flex-direction: column; ">
                                <h2 class="tabla-title" style ="color:#000f22;">Vecinos/Solicitudes de acceso a la plataforma</h2>  <!--Cambiar el titulo de la tabla-->

                                <div style="display: flex; gap:30px;margin-top: 10px;">

                                    <div style="display: flex; gap:10px;">

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <table id="miTabla" class="table" style="margin-bottom:15px;">
                        <thead style="background-color: #ff8e9f;"> <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                        <tr style="text-align: center; font-weight:800;">
                            <th style ="color: white;font-size: 17px;cursor: pointer;">Apellidos y Nombres</th>
                            <th style ="color: white;font-size: 17px;cursor: pointer;">Documento</th>
                            <th style ="color: white;font-size: 17px;cursor: pointer;">e-mail</th>
                            <th style="color: white; font-size: 17px; cursor: pointer;">Ver Detalles
                                <a class="mdi mdi-magnify" style="color: #ffffff; font-size: 20px;"></a>
                            </th>
                        </tr>
                        </thead>
                        <hr style="border: none; border-top: 3px solid black; margin-top: -15px; border-radius: 10px;">
                        <tbody style="text-align: center;color: black;">
                        <%
                            if (lista != null) {
                                for (Usuario usuario : lista) {
                        %>
                        <tr style="text-align: center;">
                            <td><a><%=usuario.getApellido() %>, <%=usuario.getNombre() %></a></td>
                            <td><a><%=usuario.getDocumento() %></a></td>
                            <td><a><%=usuario.getCorreoE() %></a></td>
                            <td><a href="<%=request.getContextPath()%>/Admin?action=solicitudAcceso&id=<%=usuario.getId()%>" class="mdi mdi-account-details" style="color: #6c7293; font-size: 20px;"></a>

                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5">No hay Solicitudes pendientes.</td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.jsp -->
                    <!-- partial -->
                </div>

                <!-- main-panel ends -->
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
                        window.location.href = "../../../LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                    }
                });
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src = "<%=request.getContextPath()%>/vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/script_tabla.js"></script>

        <!-- End custom js for this page -->
</body>
</html>
