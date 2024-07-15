<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%Usuario usuariologueado = (Usuario) session.getAttribute("usuarioLogueado");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaincidencias");
  SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
<%
  String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Incidencias/styles_incidencia.css">
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
          userRole = "Coordinador"; // Por defecto, si no hay rol en la sesión
        }

        String menuvecino = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
      %>

      <%-- Incluir el menú y pasar el parámetro de la página activa --%>
      <jsp:include page="<%= menuvecino %>">
        <jsp:param name="activePage" value="incidencias"/>
      </jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->
            <%
              // Obtener si el usuario está baneado
              boolean isUserBanned = usuariologueado.isBaneado();
            %>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
              <h2 class="tabla-title" style="color: #000f22; margin-bottom: 0px;">Incidencias</h2>
              <button class="btnTable" style="display: flex; align-items: center;" onclick="checkUserStatus(<%= isUserBanned %>);">
                  Agregar Incidencia
                  <a class="mdi mdi-plus" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
              </button>
          </div>



            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo (claro) de la pagina, pero un poco mas oscuro-->
              <tr style="text-align: center; font-weight:800;">
                <th style ="color: white;">Descripción</th>
                <th style ="color: white;">Fecha</th>
                <th style ="color: white;">Estado</th>
                <th style="width: 20px; color: white;"></th>
              </tr>
              </thead>
              <tbody style="text-align: center; color: black;">
              <%
                if (listaIncidencias == null || listaIncidencias.isEmpty()) {
              %>
              <p>No hay incidencias registradas</p>
              <%
              } else {
                for(Incidencia incidencia : listaIncidencias){
                  String fechaFormateada = sdf.format(incidencia.getFechaIncidencia());

              %>
              <tr style="text-align: center;">
                <td><%=incidencia.getNombre()%></td>
                <td><%=fechaFormateada %></td>
                <td><%=incidencia.getEstado()%></td>
                <td><a href='<%=request.getContextPath()%>/Coordinador?action=infoIncidencia&idIncidencia=<%=incidencia.getIdIncidencia()%>'><span class="menu-icon"><i class="mdi mdi-eye"></i> </span></a></td>
              </tr>
              <%
                  }
                }
              %>

              </tbody>
            </table>
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
    <script src="../assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Incidencias/script_cerrar_sesion.js"></script>
    <script>
      <% if (msg != null) { %>
      // Mostrar el popup con SweetAlert si la variable error no es null
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: '<%= msg %>'
      });
      <% } %>
      function checkUserStatus(isUserBanned) {
        if (isUserBanned) {
          Swal.fire({
            icon: 'error',
            title: 'Acceso Denegado',
            text: 'No puedes registrar una incidencia porque estás baneado.',
          });
        } else {
          window.location.href = '<%=request.getContextPath()%>/Coordinador?action=registroIncidencia';
        }
      }
    </script>
    <!-- End custom js for this page -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src ="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Incidencias/script_incidencia.js"></script>
  </body>
</html>