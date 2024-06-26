<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
int idProvisional = 12;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Vecino</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/styles_pag_principales.css">
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
    <%
        //String userRole = (String) session.getAttribute("userRole"); ->Usar cuando empecemos con las sessions

        String userRole = "Vecino"; //Cambiar de acuerdo al rol (hasta que obtengamos el userRole mediante querys
        String menu = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>

    <%-- Incluir el menú y pasar el parámetro de la página activa --%>
    <jsp:include page="<%= menu %>">
        <jsp:param name="activePage" value="eventos"/>
    </jsp:include>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #d6e9ff;"> <!--Cambiar al color mas claro-->
                <div class="title-pp">
                    <h2>Bienvenido Vecino San Miguelino!</h2>
                </div>
                <div  class="RowWrapper">
                    <div class="row-1">
                        <div class="card-1" style ="color:black;">
                            <div class="font">
                                <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/adminn.jpg" alt="SanMiguel">
                                <div class="card-content">
                                    <h3>¿Cuál es tu función como vecino?</h3>
                                    <p>Tu función como vecino se basa en brindar todo tu apoyo para mantener un ambiente armonioso y agradable en nuestro distrito. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row-2">
                        <div class="card-ma" style ="color:black;" >
                            <div class="font">
                                <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/medio_ambiente_vecino.png" alt="Cuidado Ambientes" style= "max-width: 100%; max-height: 100px; margin-top: 10px;">
                                <span style="font-size: 16px; font-weight: bold;">¡Cuidemos nuestras áreas verdes para una mejor imagen de nuestra comunidad!</span>
                            </div>
                            <div class="back" style="background-color: white; padding: 10px;">
                                <span style="font-size: 16px;"> Ayúdanos a mantener nuestros distintos ambientes libres de basura.</span>
                                <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/no_botar_basura.png" alt="No Botar Basura" style= "max-width: 100%; max-height: 100px; margin-top: 10px;">
                            </div>
                        </div>
                        <div class="card-mv" style ="color:black;">
                            <div class="font">
                                <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/unidad_vecinal_1.png" alt="Vecinos">
                                <span style="font-size: 16px; font-weight: bold;">¡Consolidemos nuestra unión como distrito apoyándonos unos a otros!</span>
                            </div>
                            <div class="back" style="background-color: white; padding: 10px;">
                                <span style="font-size: 16px;"> Avisemos cualquier problema o inconveniente que observemos, así no seamos nosotros los afectados.</span>
                                <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/unidad_vecinal_2.png" alt="Small Image" style= "max-width: 100%; max-height: 100px; margin-top: 10px;">
                            </div>
                        </div>
                    </div>
                    <h3 style="color: black; padding: 25px; margin-bottom: -20px;">A continuación, podrás visualizar las acciones que puedes realizar en la plataforma como vecino.<br><span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card-2">
                                <div class="font">
                                    <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/solicitud2.png" alt="Solicitud Coordinador">
                                </div>
                                <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás enviar una solicitud al administrador para volverte coordinador de una de las dos áreas y comenzar a organizar eventos. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Solicitud para coordinador" para dirigirse automáticamente a la página de la solicitud.</span>
                          </span>
                                    <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/solicitud_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                                </div>
                            </div>
                            <div class="card-name">
                                <a href="solicitarCoordinador.jsp" style="color: black; font-weight: bold;"> Solicitud para <br> Coordinador</a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-2">
                                <div class="font">
                                    <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/eventoo.png" alt="Eventos">
                                </div>
                                <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de eventos para que puedas inscribirte y participar en los eventos que te agraden.<br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Visualizar eventos" para dirigirse automáticamente a la lista de eventos.</span>
                          </span>
                                    <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/eventos_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                                </div>
                            </div>
                            <div class="card-name">
                                <a href="eventos/eventos.jsp" style="color: black; font-weight: bold;"> Visualizar <br> Eventos</a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-2">
                                <div class="font">
                                    <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/registro_incidencia.png" alt="Incidencias">
                                </div>
                                <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de incidencias donde podrás registrar una incidencia si has sufrido o visto algún problema en el distrito.<br><span style="color: red;">No olvides que serás penalizado si registras más de 5 falsas alarmas.</span>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Registrar Incidencia" para dirigirse automáticamente a la lista de incidencias.</span>
                          </span>
                                    <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/incidencia_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                                </div>
                            </div>
                            <div class="card-name">
                                <a href="incidencias/incidencia_vecino.jsp" style="color: black; font-weight: bold;">Registrar <br> Incidencia </a>
                            </div>
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
    <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
    <script src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/paginas_principales.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->



</body>
</html>
