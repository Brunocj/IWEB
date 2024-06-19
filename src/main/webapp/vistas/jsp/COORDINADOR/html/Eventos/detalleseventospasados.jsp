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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles_pag_principales.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_detallespasados.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/styles_pag_principales.css">
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
        <jsp:param name="activePage" value="eventos"/>
      </jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
            <div class="container">
              <div class="container-fluid mt-5"> <!-- Cambié container por container-fluid -->
                <div class="options-bar d-flex justify-content-center align-items-center">
                  <div class="option verde" onclick="window.location.href = 'agregarnota.html'">
                      <i class="fas fa-sticky-note me-2"></i> Agregar Nota
                  </div>
                  
                  
                  <div class="option azul" onclick="seleccionarFoto()">
                    <i class="fas fa-address-book me-2"></i> Registrar Salida
                  </div>
                  <div class="option rojo" onclick="borrarEvento()">
                    <i class="fas fa-trash-alt me-2"></i> Borrar Evento
                  </div>
                </div>
              </div>
          
              <div class="row">
                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="container-image">
                    <div class="event-image-container">
                      
                      <img id="preview" src="https://via.placeholder.com/800x500" alt="Vista previa de la imagen" class="event-image img-fluid mb-4">
                      <input type="file" id="upload" style="display: none;">
                      
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="fechas">
                    <h4 class="mb-4 center-text" id="nombre-seleccionado">Nombre del Evento<i  onclick="enableEditMode3('nombre-seleccionado')"></i></h4>
                    <p><strong>Fecha:</strong> <span id="fecha-seleccionada">16 de Abril de 2024</span> <i  onclick="enableEditMode3('fecha-seleccionada')"></i></p>
                    <p><strong>Hora:</strong> <span id="hora-seleccionada" onclick="enableEditMode3('hora-seleccionada')">08:00 AM a 10:00 AM</span> <i  onclick="enableEditMode3('hora-seleccionada')"></i></p>
                    <p><strong>Lugar:</strong> <span id="lugar-seleccionado" onclick="enableEditMode3('lugar-seleccionado')">Nombre del Lugar</span> <i  onclick="enableEditMode3('lugar-seleccionado')"></i></p>
                    <p><strong>Recurrencia:</strong> <span id="recurrencia-seleccionada" onclick="enableEditMode3('recurrencia-seleccionada')">Evento único</span> <i  onclick="enableEditMode3('recurrencia-seleccionada')"></i></p>
                    
                  </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="descripcion">
                    <h4 class="mb-4">Descripción del Evento <i  onclick="enableEditMode('descripcion')"></i></h4>
                    <p contenteditable="false">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida eros sit amet erat fringilla, sed fermentum nisi tristique.</p>
                    <h4 class="mb-4">Materiales <i onclick="enableEditMode('materiales')"></i></h4>
                    <p contenteditable="false">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida eros sit amet erat fringilla, sed fermentum nisi tristique.</p>
                    <h4 class="mb-4" id="profesores-link">
                      <a href="#">Profesores </a>
                   </h4>
                    <p>Manuel Yarleque</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="fixed-buttons">
              <button class="btn btn-custom-danger" id="danger" onclick="window.location.href='eventospasados.jsp'" style ="background-color: #000f22;">Volver a eventos pasados</button>
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
    <script src="${pageContext.request.contextPath}/assets/js/paginas_princpales.js"></script>
    <!-- Bootstrap JS y jQuery (opcional, solo si necesitas funcionalidades de Bootstrap como el menú hamburguesa en móviles) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
                window.location.href = "../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR//js/Eventos/script_detallespasados.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>