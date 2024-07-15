
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="org.example.webappsm.model.beans.Usuario" %>
<%Usuario usuariologueado = (Usuario) session.getAttribute("usuarioLogueado");%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Serenazgo</title>
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
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
          userRole = "Serenazgo"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
      %>


      <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="pagPrincipal"/>
      </jsp:include>

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper" style ="background-color: #fffff6;"> <!--Cambiar al color mas claro-->
                <div class="title-pp">
                  <h2>Bienvenido Serenazgo <%=usuariologueado.getNombre()%>!</h2>
                </div>
                <div  class="RowWrapper">
                  <div class="row-1">
                    <div class="card-1" style ="color:black;">
                      <div class="font">
                        <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/adminn.jpg" alt="SanMiguel">
                        <div class="card-content">
                          <h3>¿Cuál es la función del serenazgo?</h3>
                          <p>Estás a cargo de la seguridad en el distrito.Explora y resuelve las incidencias generadas por los vecinos y coordinadores, y visualiza gráficas con las estadísticas de ellas. Monitorea y restringe el registro de incidencias.
                            ¡Únete a nosotros y ayúdanos a tener una comunidad más segura!</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <h3 style="color: black;">A continuación, podrás visualizar las funciones a realizar como Serenazgo Dispatcher.<br><span style="font-size: 14px;">Pase el mouse por las siguientes imágenes para más información.</span></h3>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/dashboard_serenazgo.png" alt="Vecinos">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar el dashboard de incidencias, en el cual podrás visualizar distintas gráficas de las incidencias mediante filtros por mes, tipo, etc. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Dashboard de incidencias" para dirigirse automáticamente a las listas.</span>
                          </span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/dashboard_2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="<%=request.getContextPath()%>/Serenazgo?action=dashboard" style="color: black; font-weight: bold;"> Dashboard de <br> Incidencias</a>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/inc_serenazgo.png" alt="Serenazgo">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar la lista de incidencias para controlar los inconvenientes que registren los vecinos sanmiguelinos en la plataforma. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Lista de Incidencias" para dirigirse automáticamente a la lista.</span>
                          </span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/insignia.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidencias" style="color: black; font-weight: bold;"> Lista de <br> Incidencias</a>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="card-2">
                        <div class="font">
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/descripciones_pasadas.png" alt="Descripciones Pasadas">
                        </div>
                        <div class="back" style="padding: 10px;">
                          <span style="font-size: 16px; color: black;"> Podrás visualizar las descripciones de incidencias pasadas que ya fueron resueltas, por lo que en el caso de tener una incidencia similar, tendrás una referencia de solución. <br>
                            <span style="font-size: 10px; text-decoration: underline;">Haga click en "Descripciones Pasadas" para dirigirse automáticamente a la lista.</span>
                          </span>
                          <img src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/descripciones2.png" alt="Small Image" style="max-width: 100%; max-height: 100px; margin-top: 10px;">
                        </div>
                      </div>
                      <div class="card-name">
                        <a href="<%=request.getContextPath()%>/Serenazgo?action=listaIncidenciasPasadas" style="color: black; font-weight: bold;">Descripciones <br> pasadas </a>
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


    <!-- Descripción -->


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
            confirmButtonText: 'Sí, cerrar sesión',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {

                window.location.href = "${pageContext.request.contextPath}/sys?action=logout"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
    
    <!-- End custom js for this page -->
  </body>
</html>