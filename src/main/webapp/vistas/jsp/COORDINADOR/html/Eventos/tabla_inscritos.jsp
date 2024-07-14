<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_tabla_inscritos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
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

      <jsp:include page="<%= menuvecino %>">
        <jsp:param name="activePage" value="eventos"/>
      </jsp:include>
      <div class="main-panel">
        <div class="content-wrapper" style ="background-color: #bdf1f5;">
          <div style="display: flex; justify-content: space-between;">
            <div style="display: flex; justify-content: space-between;">
              <div style="display: flex; flex-direction: column; margin-bottom: 20px">
                <h2 class="tabla-title" style ="color:#000f22;">Lista de Inscritos</h2>
              </div>
            </div>
          </div>
          <table id="miTabla" class="table" style="margin-bottom:15px;">
            <thead style="background-color: #000f22;">
              <tr style="text-align: center; font-weight:800;">
                <th style="width: 100px; color: white;">Turno</th>
                <th style="color: white;">Nombre</th>
                <th style="width: 100px;color: white;">Ajustes</th>
              </tr>
            </thead>
            <tbody style="text-align: center;">
              <%
                ArrayList<Usuario> listaInscritos = (ArrayList<Usuario>) request.getAttribute("listaInscritos");
                int turno = 1; // Contador de turnos
                int idEvento = (Integer) request.getAttribute("idEvento"); // Obtener el idEvento
                if (listaInscritos != null) {
                  for (Usuario usuario : listaInscritos) {
              %>
              <tr style="text-align: center;">
                <td><%= turno++ %></td>
                <td><%= usuario.getNombre() + " " + usuario.getApellido() %></td>
                <td><a href="#" onclick="return Eliminacion(<%= usuario.getId() %>,<%= idEvento %>,'<%= request.getContextPath() %>');" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <%
                }
              } else {
              %>
              <tr>
                <td colspan="3">No hay inscritos en este evento.</td>
              </tr>
              <%
                }
              %>
            </tbody>
          </table>
          <br>
          <br>
          <br>
          <div class="button-container">
            <button class="button" onclick="goBack()" style ="background-color:#000f22">Regresar</button>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_tabla_incsritos.js"></script>
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
            window.location.href = "../../../LOGIN/login.html";
          }
        });
      }

      function Eliminacion(idUsuario, idEvento, contextPath) {


        Swal.fire({
          title: "¿Estás seguro?",
          text: "Una vez eliminado, el usuario inscrito no accederá al evento",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#00913f",
          cancelButtonColor: "#d33",
          confirmButtonText: "Sí, eliminar",
        }).then((result) => {
          if (result.isConfirmed) {


            const form = document.createElement('form');
            form.method = 'post';
            form.action = contextPath + '/Coordinador?action=eliminarInscrito';

            const inputIdUsuario = document.createElement('input');
            inputIdUsuario.type = 'hidden';
            inputIdUsuario.name = 'idUsuario';
            inputIdUsuario.value = idUsuario;

            const inputIdEvento = document.createElement('input');
            inputIdEvento.type = 'hidden';
            inputIdEvento.name = 'idEvento';
            inputIdEvento.value = idEvento;

            form.appendChild(inputIdUsuario);
            form.appendChild(inputIdEvento);



            document.body.appendChild(form);
            form.submit();
          }
        });

        return false;
      }

      function goBack() {
        window.history.back();
      }
    </script>
  </body>
</html>
