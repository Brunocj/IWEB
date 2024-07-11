<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%int idCoordinador = 3;%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_registro.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        <form id="eventForm" action="${pageContext.request.contextPath}/Coordinador?action=registrarEvento" method="post" enctype="multipart/form-data">

          <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->

            <div class="container">
              <div class="row">
                <div class="col-md-6">
                  <h4 class="center-text-reg mb-4"><i class="fas fa-pen-square mr-2"></i> Registro del Evento</h4>
                  <div class="custom-container rounded-3" id="container-image">
                    <div class="event-image-container">
                      <img id="preview" src="https://via.placeholder.com/800x500" alt="Vista previa de la imagen" class="event-image img-fluid mb-4">
                      <input type="file" id="upload" name="imagenEvento" style="display: none;" accept="image/*">
                      <button type="button" class="custom-btn" id="botoncarga" onclick="document.getElementById('upload').click();"><i class="fas fa-plus"></i>Cargar</button>
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="custom-container rounded-3" style = "padding: 10px" id="fechas">
                    <h4 class="mb-4 center-text"><span id="nombre-seleccionado"><input type="text" id="nombre" name="nombre_evento" placeholder="[Nombre del evento]"></span><i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <p><strong>Fecha:</strong> <span><input type="date" id="fecha" name="fecha" value="AAAA-MM-DD"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                    <p><strong>Hora de Inicio:</strong> <span><input type="time" id="hora" name="hora" value="HH:mm"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                    <p><strong>Hora de Finalización:</strong> <span><input type="time" id="horaFin" name="horaFin" value="HH:mm"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                    <p><strong>Lugar:</strong> <span><input type="text" id="lugar" name="lugar" placeholder="[Establecer lugar]"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                    <p><strong>Recurrencia:</strong> <span>
                            <select id="recurrencia" name="recurrencia">
                                <option value="" disabled selected>--Selecionar opción--</option>
                                <option name="recurrencia" value="1">Sí</option>
                                <option name="recurrencia" value="0">No</option>
                            </select>
                            </span>
                      <i class="fas fa-pencil-alt edit-icon"></i>
                    </p>
                    <button type="button" class="btn btn-primary custom-btn" id="btn-vacantes" onclick="VacantesPopUp()">Asignar Vacantes</button>
                    <input type="hidden" id="vacantes" name="vacantes">

                    <div id="vacantesAsignadasContainer" style="display: inline-block; margin-left: 10px;"></div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="custom-container rounded-3" id="descripcion">
                  <h4 class="mb-4">Descripción del Evento <i class="fas fa-pencil-alt edit-icon"></i></h4>
                  <textarea id="descripcion2" name="descripcion" placeholder="[Ingrese la descripción aquí]" style="margin-bottom: 20px;"></textarea>
                  <h4 class="mb-4">Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                  <div>
                    <p>¿Se necesita material?</p>
                    <select id="necesita-material" name="necesita-material" onchange="mostrarOpcionMaterial()">
                      <option value="" selected>-- Seleccione una opción --</option>
                      <option value="si">Sí</option>
                      <option value="no">No</option>
                    </select>
                  </div>
                  <br>
                  <div id="opcion-material" class="hidden">
                    <input type="text" id="nuevo-material" placeholder="Agregar material">
                    <button type="button" onclick="agregarMaterial()">Agregar</button>
                    <br>
                    <br>
                    <h4 class="mb-4">Lista de Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <ul id="lista-materiales"></ul>
                  </div>

                  <p id="mensaje-no-material" class="hidden">No se requiere material.</p>
                  <input type="hidden" id="materiales" name="materiales">

                  <h4 class="mb-4" id="profesores-link">
                    <input type="hidden" id="idProfesor" name="idProfesor" value="4">
                    <input type="hidden" id="idCoordinador" name="idCoordinador" value="<%=idCoordinador%>">
                    <a href="${pageContext.request.contextPath}/Coordinador?action=">Seleccionar profesor <i class="fas fa-external-link-alt"></i></a>
                  </h4>
                  <p>Elige el profesor para el evento...</p>

                </div>
              </div>
            </div>


          </div>

          <div class="fixed-buttons">
            <button class="btn btn-custom-success" id="success" type="button" onclick="confirmarRegistro()">Registrar</button>
            <button class="btn btn-custom-danger" id="danger" type="button" onclick="anularRegistro()">Anular Registro</button>
          </div>
        </form>


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
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/paginas_princpales.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_registro.js"></script>


    <!-- End custom js for this page -->
  </body>
</html>
