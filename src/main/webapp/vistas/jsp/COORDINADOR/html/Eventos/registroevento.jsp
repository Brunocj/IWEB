<%@ page import="org.example.webappsm.model.daos.CoordinadorDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% int idCoordinador = 3; %>
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

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_registro.css">
    <style>
      .input-group {
        display: flex;
        align-items: center;
      }
      .input-group input {
        flex: 1;
        margin-right: 10px;
      }
      .btn-success {
        background-color: #28a745;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      .btn-success:hover {
        background-color: #218838;
      }
      .profesor-info p {
        font-size: 1.2em;
        color: #343a40;
        margin-top: 10px;
      }
      .event-image-container img {
        width: 100%;
        height: 300px;
        object-fit: cover;
      }
      .custom-container {
        padding: 20px;
        background-color: #e0f7fa;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        color: black;
      }
      .custom-container p, .custom-container h4 {
        margin-bottom: 10px;
      }
      .edit-icon {
        cursor: pointer;
        margin-left: 5px;
      }
      #fechas {
        background-color: #e0f7fa;
        border-radius: 10px;
      }
      #fechas.custom-container{
        margin-top: 20px;
        color: #000;
      }
      .form-group {
        margin-bottom: 1rem;
      }
      .form-group label {
        font-weight: bold;
        margin-bottom: 5px;
        display: block;
      }
      .form-group input, .form-group select, .form-group textarea {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
        border-radius: 5px;
        border: 1px solid #ccc;
      }
      .fixed-buttons {
        position: fixed;
        bottom: 20px;
        right: 20px;
        display: flex;
        gap: 10px;
      }
      .btn-custom-success {
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      .btn-custom-danger {
        background-color: #dc3545;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      .vacantes-card {
        background-color: #f8f9fa;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
      }
      .vacantes-card h5 {
        margin-bottom: 15px;
        color: #343a40;
      }
      .vacantes-card p {
        font-size: 1.2em;
        color: #28a745;
        font-weight: bold;
      }
      .btn-ampliar-vacantes {
        margin-top: 15px;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="container-scroller">
      <%
        CoordinadorDao coordinadorDao = new CoordinadorDao();
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
          <div class="content-wrapper" style="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
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
                  <div class="custom-container rounded-3" id="descripcion">
                    <h4 class="mb-4 center-text">Descripción y Adicionales </h4>
                    <div class="form-group">
                      <label for="descripcion2">Descripción:</label>
                      <textarea id="descripcion2" name="descripcion" placeholder="[Ingrese la descripción aquí]"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Materiales:</label>
                      <select id="necesita-material" name="necesita-material" onchange="mostrarOpcionMaterial()">
                        <option value="" selected>-- Seleccione una opción --</option>
                        <option value="si">Sí</option>
                        <option value="no">No</option>
                      </select>
                      <br>
                      <div id="opcion-material" class="hidden">
                        <div class="input-group">
                          <input type="text" id="nuevo-material" placeholder="Agregar material">
                          <button type="button" class="btn btn-success" onclick="agregarMaterial()">Agregar</button>
                        </div>
                        <br>
                        <h5 class="mb-4">Lista de Materiales</h5>
                        <ul id="lista-materiales"></ul>
                      </div>
                      <p id="mensaje-no-material" class="hidden">No se requiere material.</p>
                      <input type="hidden" id="materiales" name="materiales">
                    </div>
                    <div class="form-group">
                      <label>Profesor</label>
                      <div class="profesor-info">
                        <input type="hidden" id="idCoordinador" name="idCoordinador" value="<%= idCoordinador %>">

                        <%
                          Integer idProfesor = (Integer) request.getAttribute("idProfesor");
                          if (idProfesor == null) {
                            idProfesor = 0; // Valor predeterminado
                          }
                          String nombreProfesor = coordinadorDao.obtenerNombreCompletoPorId(idProfesor);
                        %>
                        <input type="hidden" id="idProfesor" name="idProfesor" value="<%= idProfesor %>">
                        <p><%= nombreProfesor %></p>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="custom-container rounded-3" id="fechas">
                    <h4 class="mb-4 center-text">Detalles del Evento</h4>
                    <div class="form-group">
                      <label for="nombre">Nombre del Evento:</label>
                      <input type="text" id="nombre" name="nombre_evento" placeholder="[Nombre del evento]">
                    </div>
                    <div class="form-group">
                      <label for="fecha">Fecha:</label>
                      <input type="date" id="fecha" name="fecha" value="AAAA-MM-DD">
                    </div>
                    <div class="form-group">
                      <label for="hora">Hora de Inicio:</label>
                      <input type="time" id="hora" name="hora" value="HH:mm">
                    </div>
                    <div class="form-group">
                      <label for="horaFin">Hora de Finalización:</label>
                      <input type="time" id="horaFin" name="horaFin" value="HH:mm">
                    </div>
                    <div class="form-group">
                      <label for="lugar">Lugar:</label>
                      <input type="text" id="lugar" name="lugar" placeholder="[Establecer lugar]">
                    </div>
                    <div class="form-group">
                      <label for="recurrencia">Recurrencia:</label>
                      <select id="recurrencia" name="recurrencia">
                        <option value="" disabled selected>--Selecionar opción--</option>
                        <option name="recurrencia" value="1">Sí</option>
                        <option name="recurrencia" value="0">No</option>
                      </select>
                    </div>
                    <div class="vacantes-card">
                      <h5>Vacantes</h5>
                      <p id="vacantesAsignadas">Vacantes por asignar</p>
                      <button type="button" class="btn-ampliar-vacantes" onclick="VacantesPopUp()">Asignar Vacantes</button>
                    </div>
                    <input type="hidden" id="vacantes" name="vacantes">
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="fixed-buttons">
            <button class="btn btn-custom-success" id="success" type="button" onclick="confirmarRegistro('<%= request.getContextPath() %>')">Registrar</button>
            <button class="btn btn-custom-danger" id="danger" type="button" onclick="anularRegistro('<%= request.getContextPath() %>')">Anular Registro</button>
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
    <script src="${pageContext.request.contextPath}/vistas/jsp/PRINCIPAL/paginas_principales.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_registro.js"></script>
    <script>
      function anularRegistro(contextPath) {
        Swal.fire({
          title: "¿Estás seguro de que deseas anular el registro del evento?",
          icon: "question",
          showCancelButton: true,
          confirmButtonColor: "#00913f",
          cancelButtonColor: "#d33",
          confirmButtonText: "Confirmar",
          cancelButtonText: "Cancelar",
        }).then((result) => {
          if (result.isConfirmed) {
            window.location.href = contextPath + "/Coordinador?action=eventos";
          }
        });
      }

      function confirmarRegistro(contextPath) {
        Swal.fire({
          title: "¿Estás seguro de que deseas registrar el evento?",
          icon: "question",
          showCancelButton: true,
          confirmButtonColor: "#00913f",
          cancelButtonColor: "#d33",
          confirmButtonText: "Confirmar",
          cancelButtonText: "Cancelar",
        }).then((result) => {
          if (result.isConfirmed) {
            // Crear un objeto FormData
            var formData = new FormData(document.getElementById("eventForm"));

            // Validar campos
            var missingFields = [];

            if (!formData.get("nombre_evento")) missingFields.push("Nombre del evento");
            if (!formData.get("fecha")) missingFields.push("Fecha");
            if (!formData.get("hora")) missingFields.push("Hora de Inicio");
            if (!formData.get("horaFin")) missingFields.push("Hora de Finalización");
            if (!formData.get("lugar")) missingFields.push("Lugar");
            if (!formData.get("recurrencia")) missingFields.push("Recurrencia");
            if (!formData.get("vacantes")) missingFields.push("Vacantes");
            if (!formData.get("descripcion")) missingFields.push("Descripción");
            if (!formData.get("imagenEvento")) missingFields.push("Imagen del evento");
            if (!formData.get("idProfesor")) missingFields.push("Profesor");

            if (missingFields.length > 0) {
              var message = "Los siguientes campos son obligatorios: " + missingFields.join(", ");
              if (missingFields.length === 10) {
                message = "Rellenar todos los parámetros necesarios";
              }
              Swal.fire("Error", message, "error");
            } else {
              // Enviar el formulario usando Fetch API
              fetch(document.getElementById("eventForm").action, {
                method: 'POST',
                body: formData,
              }).then(response => response.text())
                      .then(data => {
                        console.log(data); // Puedes usar esto para depurar la respuesta del servidor
                        Swal.fire("Éxito", "El evento ha sido registrado correctamente", "success")
                                .then(() => {
                                  window.location.href = contextPath + "/Coordinador?action=eventos";
                                });
                      })
                      .catch(error => {
                        console.error("Error:", error);
                        Swal.fire("Error", "Hubo un problema al registrar el evento", "error");
                      });
            }
          }
        });
      }

      function VacantesPopUp() {
        Swal.fire({
          title: 'Asignar Vacantes',
          input: 'number',
          inputAttributes: {
            min: 1,
            step: 1
          },
          showCancelButton: true,
          confirmButtonColor: "#00913f",
          cancelButtonColor: "#d33",
          confirmButtonText: 'Asignar',
          cancelButtonText: 'Cancelar',
        }).then((result) => {
          if (result.isConfirmed) {
            const vacantes = result.value;
            document.getElementById('vacantes').value = vacantes;
            document.getElementById('vacantesAsignadas').innerText = vacantes + ' vacantes asignadas';
          }
        });
      }
    </script>
    <!-- End custom js for this page -->
  </body>
</html>
