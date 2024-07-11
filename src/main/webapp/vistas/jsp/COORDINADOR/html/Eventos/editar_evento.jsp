<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles_pag_principales.css">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_editar.css">
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
            <jsp:param name="activePage" value="eventos"/>
        </jsp:include>
        <!-- partial -->
        <div class="main-panel">
            <%
                Evento evento = (Evento) request.getAttribute("evento");
                String base64Image = (String) request.getAttribute("base64Image");
                if (evento == null) {
                    out.print("<p class='alert alert-danger'>Error: No se encontró el evento.</p>");
                } else {
            %>

            <form id="eventForm" action="${pageContext.request.contextPath}/Coordinador?action=actualizarEvento" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="actualizarEvento">
                <input type="hidden" name="idEvento" value="<%= evento.getIdEvento() %>">

          <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
            <div class="container">
                <div class="container-fluid mt-5"> <!-- Cambié container por container-fluid -->
                    <div class="options-bar d-flex justify-content-center align-items-center">
                        <div class="option verde" onclick="verInscritos()">
                            <i class="fas fa-users me-2"></i> Ver Inscritos
                        </div>
                        <div class="option azul" onclick="seleccionarFoto()">
                            <i class="fas fa-address-book me-2"></i> Registrar Entrada
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
                        <img id="preview" src="<%= base64Image != null ? "data:image/jpeg;base64," + base64Image : "https://via.placeholder.com/800x500" %>" alt="Vista previa de la imagen" class="event-image img-fluid mb-4">
                        <input type="file" id="upload" style="display: none;">
                      <button type="button" class="custom-btn" id="botoncarga" onclick="document.getElementById('upload').click();"><i class="fas fa-plus"></i>Cargar</button>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="custom-container rounded-3" style = "padding: 10px;" id="fechas">
                      <h4 class="mb-4 center-text"><span id="nombre-seleccionado"><input type="text" id="nombre" name="nombre_evento" value="<%=evento.getTitulo() %>"></span><i class="fas fa-pencil-alt edit-icon"></i></h4>
                      <p><strong>Fecha:</strong> <span><input type="date" id="fecha" name="fecha" value="<%=evento.getFecha()%>"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                      <p><strong>Hora de Inicio:</strong> <span><input type="time" id="hora" name="hora" value="<%=evento.getHora()%>"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                      <p><strong>Hora de Finalización:</strong> <span><input type="time" id="horaFin" name="horaFin" value="<%=evento.getHoraFin()%>"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                      <p><strong>Lugar:</strong> <span><input type="text" id="lugar" name="lugar" value="<%=evento.getUbicacion()%>"></span> <i class="fas fa-pencil-alt edit-icon"></i></p>
                        <p><strong>Recurrencia:</strong> <span>
                            <select id="recurrencia" name="recurrencia">
                                <option value="1" <%= evento.getRecurrencia() == 1 ? "selected" : "" %>>Sí</option>
                                <option value="0" <%= evento.getRecurrencia() == 0 ? "selected" : "" %>>No</option>

                            </select>
                            </span> 
                            <i class="fas fa-pencil-alt edit-icon"></i>
                        </p>
                    
                        <div class="d-flex justify-content-start vacantes" id="boton">
                            <!-- El nuevo botón -->

                            <p><strong>Vacantes:</strong> <span id="btn-vacantes "  >8/<%=evento.getVacantes()%></span> </p>
                            <!-- Espacio entre botones -->
                            <div style="width: 20px;"></div>
                            
                            <!-- El botón "Inscribirse" -->
                            <button type="button" class="btn btn-primary custom-btn" id="btn-inscribirse" onclick="AmpliarVacantesPopUp()">Ampliar vacantes</button>


                        </div>
                    </div>
                  </div>
                </div>


                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="descripcion">
                    <h4 class="mb-4">Descripción del Evento <i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <textarea id="descripcion2" name="descripcion"><%=evento.getDescripcion()%></textarea>
                    <h4 class="mb-4">Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                    <div>
                      <p>¿Se necesita material?</p>
                      <select id="necesita-material" name="necesita-material" onchange="mostrarOpcionMaterial()">
                          <option value="si" selected>Sí</option>
                          <option value="no">No</option>
                      </select>
                  </div>
                  <br>
                  <div id="opcion-material">
                      <input type="text" id="nuevo-material" placeholder="Agregar material">
                      <button type="button" onclick="agregarMaterial()">Agregar</button>
                      <input type="hidden" id="vacantes" name="vacantes" value="<%= evento.getVacantes() %>">
                      <br>
                      <br>
                      <h4 class="mb-4">Lista de Materiales <i class="fas fa-pencil-alt edit-icon"></i></h4>
                      <ul id="lista-materiales">
                          <%
                              ArrayList<String> nombresMateriales = (ArrayList<String>) request.getAttribute("materiales");
                              if (nombresMateriales != null) {
                                  for (String nombreMaterial : nombresMateriales) {
                          %>
                          <li class="material-item">
                              <span><%= nombreMaterial %></span>
                              <button class="remove-btn" onclick="eliminarMaterial(this)">X</button>
                          </li>
                          <%
                                  }
                              }else {
                                  out.println("No se encontraron materiales para este evento.");
                              }
                          %>
                      </ul>
                  </div>
      
                  <p id="mensaje-no-material" class="hidden">No se requiere material.</p>

                      <input type="hidden" id="materiales" name="materiales" value="<%= nombresMateriales != null ? String.join(",", nombresMateriales) : "" %>">

                    <h4 class="mb-4" id="profesores-link">
                      <a href="tabla_docentes.jsp">Seleccionar nuevo profesor <i class="fas fa-external-link-alt"></i></a>
                   </h4>
                    <p>Manuel Yarleque</p>
                  </div>
                </div>
              </div>
            </div>

            </form>
            <% } %>

            <div class="fixed-buttons">
              <button class="btn btn-custom-success" id="success" onclick="confirmarEdicion()">Guardar cambios</button>
              <button class="btn btn-custom-danger" id="danger" onclick="CancelarPopUp()">Descartar cambios</button>
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
    <script src = "${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_editar.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>