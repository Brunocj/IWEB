<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%@ page import="java.util.Base64" %>
Created by IntelliJ IDEA.
User: bruno
Date: 28/05/2024
Time: 18:06
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Incidencia incidencia = (Incidencia) request.getAttribute("incidencia");
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/VECINO/incidencias/styles_info.css">
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
        //String userRole = (String) session.getAttribute("userRole"); ->Usar cuando empecemos con las sessions

        String userRole = "Vecino"; //Cambiar de acuerdo al rol (hasta que obtengamos el userRole mediante querys
        String menu = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>

    <%-- Incluir el menú y pasar el parámetro de la página activa --%>
    <jsp:include page="<%= menu %>">
        <jsp:param name="activePage" value="incidencias"/>
    </jsp:include>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
                <!--CONTENIDO-->
                <div class="card" style="background-color: white; color: black;">
                    <h2 style="color: black;">Información de la incidencia:</h2>
                    <div class="card-table">
                        <div class="card-body">
                            <table style="color: black;">
                                <tbody>
                                <tr>
                                    <td>Descripción de la incidencia</td>
                                    <td>:</td>
                                    <td><%=incidencia.getNombre()%></td>
                                </tr>
                                <tr>
                                    <td>Lugar exacto</td>
                                    <td>:</td>
                                    <td><%=incidencia.getLugar()%>, Urb. <%=incidencia.getUrbanizacion()%></td>
                                </tr>
                                <tr>
                                    <td>Referencia</td>
                                    <td>:</td>
                                    <td><%=incidencia.getReferencia()%></td>
                                </tr>
                                <tr>
                                    <td>Contacto (o)</td>
                                    <td>:</td>

                                    <%if (incidencia.getContactoO() == null){ %>
                                    <td>No se brindó información de contacto</td>
                                    <%} else{%>
                                    <td><%=incidencia.getContactoO()%></td>
                                    <%}%>



                                </tr>
                                <tr>
                                    <td>Requiere ambulancia?</td>
                                    <td>:</td>
                                    <%if (incidencia.isAmbulanciaI()){ %>
                                    <td>Sí</td>
                                    <%} else{%>
                                    <td>No</td>
                                    <%}%>
                                </tr>
                                <tr td colspan="3">
                                    <td style="border-bottom: none;">Imagen de referencia:</td>
                                    <td style="border-bottom: none;"></td>
                                    <td style="border-bottom: none;"></td>
                                </tr>
                                <tr>
                                    <td class = "info" colspan="3" style="text-align: center;">
                                        <div class="image-container">
                                            <img style="height: 35vh; max-width: 62.2vh; border-radius: 10px" src="data:image/jpeg;base64, <%= new String(org.apache.commons.codec.binary.Base64.encodeBase64(incidencia.getImgEvidencia())) %>">
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="button-container">
                        <!-- Botón con enlace "#" -->
                        <a href="<%=request.getContextPath()%>/Vecino?action=incidencias" class="button" style =" background-color: #000f22;" >Regresar</a>
                    </div>
                </div>

            </div>
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
<script src="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
<script src="../assets/js/misc.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->

<!-- End custom js for this page -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src ="${pageContext.request.contextPath}/vistas/jsp/VECINO/incidencias/script_incidencia.js"></script>
</body>
</html>


<%!
    private String base64Encode(byte[] data) {
        return Base64.getEncoder().encodeToString(data);
    }
%>

