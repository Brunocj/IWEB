<%@ page import="org.example.webappsm.model.beans.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Página Principal Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/styles_pag_principales.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/ADMIN/styles.css"/>
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
<div class="container-scroller" styles="position:fixed;">
  <!-- partial:../../partials/_sidebar.html -->

  <%
    String userRole = (String) session.getAttribute("userRole");
    if (userRole == null) {
      userRole = "Admin"; // Por defecto, si no hay rol en la sesión
    }
    String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
  %>
  <%Usuario usuariologueado= (Usuario) session.getAttribute("usuarioLogueado");%>

  <jsp:include page="<%= menuadmin %>">
    <jsp:param name="activePage" value="pagPrincipal"/>
  </jsp:include>

    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper" style="background-color: #f7d4d3;">
        <div class="title-pp">
          <h2>Bienvenido Admin <%=usuariologueado.getNombre()%>!</h2>
        </div>
        <div class="RowWrapper">
          <div class="row-1">
            <div class="card-1" style="color:black;">
              <div class="font">
                <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/adminn.jpg" alt="SanMiguel">
                <div class="card-content">
                  <h3>¿Cuál es la función del administrador?</h3>
                  <p>Al ser administrador, deberás velar por el bienestar de todos los san miguelinos y promover una mejora en nuestra comunidad.</p>
                </div>
              </div>
            </div>
            <div class="exclusive-card">
              <div class="exclusive-card-content">
                <div class="front">
                  <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/logo_san_miguel_admin.png" alt="Logo">
                </div>
                <div class="back">
                  <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/ahora_eres_admin.png" alt="Ahora eres admin">
                </div>
              </div>
            </div>
          </div>
          <h3 style="color: black;">A continuación, podrás visualizar las funciones a realizar como Administrador.<br>
            <span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
          <div class="row">
            <div class="col-md-4">


              <div class="card-2">
                <div class="font">
                  <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/users.png" alt="Vecinos">
                </div>
                <div class="back" style="padding: 10px;">
                      <span style="font-size: 16px; color: black;"> Podrás visualizar las lista de solicitudes de acceso a la plataforma y la lista de solicitudes a coordinador.
                        Debes estar atento a ellas para no dejar ninguna solicitud pendiente <br>
                        <span style="font-size: 10px; color:red;text-decoration: underline;">Haga click en el nombre Vecino Sanmiguelino para dirigirse automáticamente a las listas.</span>
                      </span>
                      <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/personas.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                </div>

              </div>
              <div class="card-name">
                <a class="underline-hover" onclick="return mostrarPopupVecino();" style="color: black; font-weight: bold"> Vecino <br> Sanmiguelino </a>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-2">
                <div class="font">
                  <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/pol.png" alt="Serenazgo">
                </div>
                <div class="back" style="padding: 10px;">
                      <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de serenazgos para organizar estratégicamente el personal de seguridad del distrito. <br>
                        <span style="color:red;font-size: 10px; text-decoration: underline;">Haga click en el nombre Serenazgo Dispatcher para dirigirse automáticamente a la lista.</span>
                      </span>
                  <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/insignia.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                </div>
              </div>
              <div class="card-name">
                <a href="${pageContext.request.contextPath}/Admin?action=tablaSerenazgo" style="color: black; font-weight: bold;"> Serenazgo <br> Dispatcher</a>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-2">
                <div class="font">
                  <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/prof.png" alt="Profesores">
                </div>
                <div class="back" style="padding: 10px;">
                      <span style="font-size: 16px; color: black;"> Podrás visualizar las lista de profesores, donde podrás administrarlos y derivarlos para cada tipo de evento, ya sea para Cultura o Deporte <br>
                        <span style="color:red;font-size: 10px; text-decoration: underline;">Haga click en el nombre Profesores para dirigirse automáticamente a la lista.</span>
                      </span>
                  <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/eventos.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                </div>
              </div>
              <div class="card-name">
                <a href="${pageContext.request.contextPath}/Admin?action=tablaProfesores" style="color: black; font-weight: bold;">Profesores </a>
              </div>
            </div>
          </div>
        </div>
      </div>
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
  <script src = "${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/paginas_principales.js"></script>


<!-- endinject -->
<!-- Custom js for this page -->


<!-- End custom js for this page -->
</body>
</html>