<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Usuario usuariologueado= (Usuario) session.getAttribute("usuarioLogueado");%>
<% int idCoordinador = usuariologueado.getId(); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Coordinador</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/styles_pag_principales.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->

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
          userRole = "Coordinador"; // Por defecto, si no hay rol en la sesión
        }

        String menuvecino = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
      %>

      <%-- Incluir el menú y pasar el parámetro de la página activa --%>
      <jsp:include page="<%= menuvecino %>">
        <jsp:param name="activePage" value="eventos"/>
      </jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
                <div class="title-pp">
                  <h2>Bienvenido Coordinador <%=usuariologueado.getNombre()+" "+usuariologueado.getApellido()%>>!</h2>
                </div>
                <div  class="RowWrapper">
                  <div class="row-1">
                    <div class="card-1" style ="color:black;">
                      <div class="font">
                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/adminn.jpg" alt="SanMiguel">
                        <div class="card-content">
                          <h3>¿Cuál es la función del coordinador?</h3>
                          <p>Al ser coordinador, podrás organizar distintos eventos relacionados a tu área, la cual puede ser de cultura o de deportes.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <h3 style="color: black;">A continuación, podrás visualizar a detalle las funciones que puedes realizar como Coordinador.<br><span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/eventoo.png" alt="Eventos">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la sección de eventos para que puedas crear un nuevo evento, revisar algunos detalles de tus eventos creados y visualizar eventos pasados que quieras tomar
                            como referencia.<br><span style="font-size: 10px; text-decoration: underline;">Haga click en "Sección eventos" para dirigirse automáticamente a la sección de eventos.</span></span>
                          </span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/eventos_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="${pageContext.request.contextPath}/Coordinador?action=eventos&id=<%=usuariologueado.getId()%>" style="color: black; font-weight: bold;"> Sección <br> Eventos</a>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/registro_incidencia.png" alt="Incidencias">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de incidencias donde podrás registrar una incidencia si has sufrido o visto algún problema en el distrito.<br><span style="color: red;">No olvides que serás penalizado si registras
                             más de 5 falsas alarmas.</span> <br><span style="font-size: 10px; text-decoration: underline;">Haga click en "Registrar Incidencia" para dirigirse automáticamente a la lista de incidencias.</span></span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/incidencia_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="${pageContext.request.contextPath}/Coordinador?action=incidencias" style="color: black; font-weight: bold;">Registrar <br> Incidencia </a>
                    </div>
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
    <script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/PaginaPrincipal/script_cerrar_sesion.js"></script>

    <!-- End custom js for this page -->
  </body>
</html>