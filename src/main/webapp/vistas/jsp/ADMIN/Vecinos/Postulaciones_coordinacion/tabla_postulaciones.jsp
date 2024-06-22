<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("listacoord");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Tabla de postulaciones</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vistas/jsp/ADMIN/Vecinos/Postulaciones_coordinacion/styles_tabla.css">
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
        <jsp:param name="activePage" value="tablaCoordinador"/>
    </jsp:include>

        <div class="main-panel">
            <div >
                <div class="content-wrapper" style ="background-color: #FFEBEE;"> <!--Cambiar al color mas claro-->
                    <!--CONTENIDO-->
                    <div style="display: flex; justify-content: space-between;">
                        <div style="display: flex; justify-content: space-between;">
                            <div style="display: flex; flex-direction: column; ">
                                <h2 class="tabla-title" style ="color:#000f22;">Vecinos/Solicitudes a coordinacion</h2>  <!--Cambiar el titulo de la tabla-->

                                <div style="display: flex; gap:30px;margin-top: 10px;">

                                    <div style="display: flex; gap:10px;">

                                        <p style ="color:black; align-self: center; margin-bottom: 0px;font-size: 15px">Filtrar por área :</p>
                                        <select id="filtroEstado" style="border-color: #DFDFDF; border-radius: 6px; padding:5px; outline: none; height: 40px; margin-top: 10px;" >
                                            <option value="">Mostrar Todos</option> <!--Cambiar el filtro de acuerdo a lo necesario-->
                                            <option value="Deporte">Deporte</option>
                                            <option value="Cultura">Cultura</option>
                                        </select>
                                    </div>
                                    <div style="display: flex; align-items: center; justify-content: center;">
                                        <button id="limpiarFiltros" class="btnTable" style="display: flex; align-items: center;">
                                            Limpiar Filtros
                                            <a class="mdi mdi-filter-remove" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                                        </button>
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
                                <th style ="color: white;font-size: 17px;cursor: pointer;">Área</th>
                                <th style="color: white; font-size: 17px; cursor: pointer;">Ver Detalles
                                    <a class="mdi mdi-magnify" style="color: #ffffff; font-size: 20px;"></a>
                                </th>

                            </tr>
                        </thead>
                        <hr style="border: none; border-top: 3px solid black; margin-top: -55px; border-radius: 10px;">

                        <tbody style="text-align: center;color: black;">
                            <%
                                if (lista != null) {
                                    for (Usuario usuario : lista) {
                            %>
                            <tr style="text-align: center;">
                                <td><a><%=usuario.getApellido() %>, <%=usuario.getNombre() %></a></td>
                                <td><a><%=usuario.getDocumento()%></a></td>
                                <td><a><%=usuario.getArea() %></a></td>

                                <td><a href="<%=request.getContextPath()%>/Admin?action=solicitudCoordi&id=<%=usuario.getId()%>" class="mdi mdi-account-details" style="color: #6c7293; font-size: 20px;"></a>
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
        <script src="<%=request.getContextPath()%>/assets/js/misc.js"></script>
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
        <script src = "<%=request.getContextPath()%>/vistas/jsp/ADMIN/Vecinos/Postulaciones_coordinacion/script_tabla.js"></script>

        <!-- End custom js for this page -->
</body>
</html>
