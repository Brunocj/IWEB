<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página Principal Coordinador</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_agregarnota.css">
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
        <jsp:param name="activePage" value="eventos"/>
      </jsp:include>
      <!-- partial -->
      <div class="main-panel">
        <%
          Evento evento = (Evento) request.getAttribute("eventoNota");
          int idEvento = evento.getIdEvento();
        %>
        <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
          <h4 class="center-text-reg mb-4" ><i class="fas fa-pen-square mr-2"></i> Nota del evento</h4>
          <div class="container" id="contenedor">
            <form id="notaForm" action="${pageContext.request.contextPath}/Coordinador?action=pasoEventoPasado" method="post" enctype="multipart/form-data">
              <input type="hidden" name="idEvento" value="<%= idEvento %>">
              <!-- Contenedor de Nota -->
              <div class="custom-container">
                <h4>Nota:</h4>
                <textarea id="notaEvento" name="texto" placeholder="Escribe tu nota aquí..."></textarea>
              </div>
              <!-- Contenedor de Fotos -->
              <div class="custom-container">
                <h4>Subir Fotos:</h4>
                <input type="file" id="foto1" accept="image/*" class="form-control mb-3" name="img1" required style="background-color: white; color: black; border: none;">
                <input type="file" id="foto2" accept="image/*" class="form-control mb-3" name="img2" required style="background-color: white; color: black; border: none;">
                <small>Sube las dos mejores fotos del evento.</small>
              </div>
            </form>
            <div class="fixed-buttons">
              <button class="btn btn-custom-success" id="success" onclick="return GuardarPopUp('<%= request.getContextPath() %>');">Agregar Nota</button>
              <button class="btn btn-custom-danger" id="danger" onclick="goBack()">Retroceder</button>
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
    <!-- End Plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/paginas_princpales.js"></script>
    <!-- endinject -->
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom js for this page -->
    <script src = "${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_agregarnota.js"></script>
    <!-- End custom js for this page -->
    <script>
      function GuardarPopUp(contextPath) {
        Swal.fire({
          title: '¿Estás seguro de que deseas guardar los cambios?',
          icon: 'question',
          showCancelButton: true,
          confirmButtonColor: '#00913f',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Confirmar',
          cancelButtonText: 'Cancelar'
        }).then((result) => {
          if (result.isConfirmed) {
            // Enviar el formulario
            var form = document.getElementById('notaForm');
            var formData = new FormData(form);
            var missingFields = [];

            if (!formData.get("texto")) missingFields.push("Nota del Evento");
            if (document.getElementById('foto1').files.length === 0) missingFields.push("Primera Imagen");
            if (document.getElementById('foto2').files.length === 0) missingFields.push("Segunda Imagen");

            if (missingFields.length > 0) {
              var message = "Los siguientes campos son obligatorios: " + missingFields.join(", ");
              if (missingFields.length === 3) {
                message = "Rellenar todos los parámetros necesarios";
              }
              Swal.fire("Error", message, "error");
            } else {
              // Enviar el formulario usando Fetch API
              fetch(form.action, {
                method: 'POST',
                body: formData,
              }).then(response => response.text())
                      .then(data => {
                        console.log(data); // Puedes usar esto para depurar la respuesta del servidor
                        Swal.fire("Éxito", "La nota ha sido registrada correctamente", "success")
                                .then(() => {
                                  window.location.href = contextPath + "/Coordinador?action=eventos";
                                });
                      })
                      .catch(error => {
                        console.error("Error:", error);
                        Swal.fire("Error", "Hubo un problema al registrar la nota", "error");
                      });
            }
          }
        });
        return false; // Evitar el comportamiento predeterminado del botón
      }

      function goBack() {
        window.history.back();
      }
    </script>
  </body>
</html>
