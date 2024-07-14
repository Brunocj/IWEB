<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page import="java.util.ArrayList" %>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles_pag_principales.css">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <!-- jQuery UI -->
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_editar.css">
        <!--JS para los popups-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                width: 800px;
                height: 300px;
                object-fit: cover;
            }
            .custom-container {
                padding: 20px;
                background-color: #e0f7fa;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
                    CoordinadorDao coordinadorDaoinscritos = new CoordinadorDao();
                    int cantidad_inscritos = coordinadorDaoinscritos.obtenerCantidadInscripciones(evento.getIdEvento());
                    String base64Image = (String) request.getAttribute("base64Image");
                    if (evento == null) {
                        out.print("<p class='alert alert-danger'>Error: No se encontró el evento.</p>");
                    } else {
                %>

                <form id="eventForm" action="${pageContext.request.contextPath}/Coordinador?action=actualizarEvento" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="actualizarEvento">
                    <input type="hidden" name="idEvento" value="<%= evento.getIdEvento() %>">

                    <div class="content-wrapper" style="background-color: #bdf1f5;">
                        <!--Cambiar al color más claro-->
                        <div class="container">
                            <div class="container-fluid mt-5">
                                <!-- Cambié container por container-fluid -->
                                <div class="options-bar d-flex justify-content-center align-items-center">
                                    <div class="option verde" onclick="redirectToURL('${pageContext.request.contextPath}/Coordinador?action=tablaInscritos&id=<%= evento.getIdEvento() %>')">
                                        <i class="fas fa-users me-2"></i> Ver Inscritos
                                    </div>
                                    <div class="option azul" onclick="seleccionarFoto()">
                                        <i class="fas fa-address-book me-2"></i> Registrar Entrada
                                    </div>
                                    <div class="option rojo" onclick="return borrarEvento(<%= evento.getIdEvento() %>, '<%= request.getContextPath() %>');">
                                        <i class="fas fa-trash-alt me-2"></i> Borrar Evento
                                    </div>
                                </div>
                                <!-- Campo de archivo oculto -->
                                <input type="file" id="upload2" name="imagenEntrada" style="display: none;" accept="image/*">
                            </div>
                            <div class="row">
                                <div class="col-md-6" >
                                    <div class="custom-container" id="container-image">
                                        <div class="event-image-container">
                                            <img id="preview" src="<%= base64Image != null ? "data:image/jpeg;base64," + base64Image : "https://via.placeholder.com/800x500" %>" alt="Vista previa de la imagen" class="event-image img-fluid mb-4">
                                            <input type="file" id="upload" name="imagenEvento" style="display: none;" accept="image/*">
                                            <button type="button" class="custom-btn" id="botoncarga" onclick="document.getElementById('upload').click();"><i class="fas fa-plus"></i>Cargar</button>
                                        </div>
                                    </div>
                                    <div class="custom-container" id="descripcion">
                                        <div class="form-group">
                                            <label for="descripcion2">Descripción:</label>
                                            <textarea id="descripcion2" name="descripcion"><%= evento.getDescripcion() %></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Materiales:</label>
                                            <select id="necesita-material" name="necesita-material" onchange="mostrarOpcionMaterial()">
                                                <option value="si" selected>Sí</option>
                                                <option value="no">No</option>
                                            </select>
                                            <br>
                                            <div id="opcion-material">
                                                <div class="input-group">
                                                    <input type="text" id="nuevo-material" placeholder="Agregar material">
                                                    <button type="button" class="btn btn-success" onclick="agregarMaterial()">Agregar</button>
                                                </div>
                                                <br>
                                                <h5 class="mb-4">Lista de Materiales</h5>
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
                                                        } else {
                                                            out.println("No se encontraron materiales para este evento.");
                                                        }
                                                    %>
                                                </ul>
                                            </div>
                                            <p id="mensaje-no-material" class="hidden">No se requiere material.</p>
                                            <input type="hidden" id="materiales" name="materiales" value="<%= nombresMateriales != null ? String.join(",", nombresMateriales) : "" %>">
                                        </div>
                                        <div class="form-group">
                                            <label>Profesor</label>
                                            <div class="profesor-info">
                                                <input type="hidden" id="idCoordinador" name="idCoordinador" value="<%= idCoordinador %>">
                                                <input type="hidden" id="idProfesor" name="idProfesor" value="<%= evento.getIdProfesor() %>">
                                                <%
                                                    CoordinadorDao coordinadorDao = new CoordinadorDao();
                                                    Integer idProfesor = evento.getIdProfesor();
                                                    String nombreProfesor = coordinadorDao.obtenerNombreCompletoPorId(idProfesor);
                                                %>
                                                <p><%= nombreProfesor %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="custom-container" id="fechas">
                                        <div class="form-group">
                                            <label for="nombre">Nombre del Evento:</label>
                                            <input type="text" id="nombre" name="nombre_evento" value="<%= evento.getTitulo() %>">
                                        </div>
                                        <div class="form-group">
                                            <label for="fecha">Fecha:</label>
                                            <input type="date" id="fecha" name="fecha" value="<%= evento.getFecha() %>">
                                        </div>
                                        <div class="form-group">
                                            <label for="hora">Hora de Inicio:</label>
                                            <input type="time" id="hora" name="hora" value="<%= evento.getHora().toString().substring(0, 5) %>">
                                        </div>
                                        <div class="form-group">
                                            <label for="horaFin">Hora de Finalización:</label>
                                            <input type="time" id="horaFin" name="horaFin" value="<%= evento.getHoraFin().toString().substring(0, 5) %>">
                                        </div>
                                        <div class="form-group">
                                            <label for="lugar">Lugar:</label>
                                            <input type="text" id="lugar" name="lugar" value="<%= evento.getUbicacion() %>">
                                        </div>
                                        <div class="form-group">
                                            <label for="recurrencia">Recurrencia:</label>
                                            <select id="recurrencia" name="recurrencia">
                                                <option value="1" <%= evento.getRecurrencia() == 1 ? "selected" : "" %>>Sí</option>
                                                <option value="0" <%= evento.getRecurrencia() == 0 ? "selected" : "" %>>No</option>
                                            </select>
                                        </div>
                                        <div class="vacantes-card">
                                            <h5>Vacantes</h5>
                                            <p id="btn-vacantes"><%= cantidad_inscritos %> / <%= evento.getVacantes() %></p>
                                            <button type="button" style="background-color: #28a745" class="btn-ampliar-vacantes" onclick="AmpliarVacantesPopUp('<%= cantidad_inscritos %>')">Ampliar vacantes</button>
                                            <input type="hidden" id="vacantes" name="vacantes" value="<%= evento.getVacantes() %>">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <% } %>
                <div class="fixed-buttons">
                    <button class="btn btn-custom-success" id="success" onclick="confirmarEdicion()">Guardar cambios</button>
                    <button class="btn btn-custom-danger" id="danger" onclick="CancelarPopUp('<%= request.getContextPath() %>')">Descartar cambios</button>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
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
        <script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_editar.js"></script>
        <!-- End custom js for this page -->
        <script>
            function CancelarPopUp(contextPath) {
                Swal.fire({
                    title: "¿Estás seguro de que deseas cancelar los cambios?",
                    icon: "question",
                    showCancelButton: true,
                    confirmButtonColor: "#00913f",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Confirmar",
                    cancelButtonText: "Cancelar",
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Redireccionar a evento.html
                        window.location.href = contextPath+"/Coordinador?action=eventos";
                        console.log("Cambios cancelados"); // Log para verificar que los cambios se cancelaron
                    }
                });
            }
            function AmpliarVacantesPopUp(cantidadInscritos) {
                const currentVacantes = parseInt(document.getElementById('vacantes').value);

                Swal.fire({
                    title: 'Ampliar Vacantes',
                    input: 'number',
                    inputLabel: 'Nuevo número de vacantes',
                    inputValue: currentVacantes,
                    showCancelButton: true,
                    confirmButtonText: 'Efectuar Ampliación',
                    cancelButtonText: 'Cancelar',
                    confirmButtonColor: "#00913f",
                    cancelButtonColor: "#d33",
                    preConfirm: (vacantes) => {
                        if (isNaN(vacantes) || vacantes <= currentVacantes) {
                            Swal.showValidationMessage('Por favor ingrese un número mayor al actual de vacantes.');
                            return false;
                        }
                        return vacantes;
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        const vacantes = result.value;
                        document.getElementById('vacantes').value = vacantes;
                        document.getElementById('btn-vacantes').innerText = cantidadInscritos+'/' + vacantes;
                        console.log("Vacantes ampliadas:", vacantes);
                    }
                });
            }

            function borrarEvento(id, contextPath) {
                Swal.fire({
                    title: "¿Estás seguro?",
                    text: "Una vez eliminado, la información asociada al evento será eliminada del sistema",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#00913f",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Sí, eliminar",
                    cancelButtonText: "Cancelar",
                }).then((result) => {
                    if (result.isConfirmed) {
                        const form = document.createElement('form');
                        form.method = 'post';
                        form.action = contextPath + '/Coordinador?action=borrarEvento';

                        const input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'id';
                        input.value = id;

                        form.appendChild(input);
                        document.body.appendChild(form);
                        form.submit();
                    }
                });

                return false;
            }

            function seleccionarFoto() {
                Swal.fire({
                    title: 'Seleccionar foto para el registro de entrada',
                    html: `<input type="file" id="inputFoto" accept="image/*">`,
                    showCancelButton: true,
                    confirmButtonText: "Confirmar",
                    cancelButtonText: "Cancelar",
                    confirmButtonColor: "#00913f",
                    cancelButtonColor: "#d33",
                    preConfirm: () => {
                        const foto = document.getElementById("inputFoto").files[0];
                        if (!foto) {
                            Swal.showValidationMessage('Por favor seleccione una foto');
                            return false;
                        }
                        return foto;
                    },
                }).then((result) => {
                    if (result.isConfirmed) {
                        const foto = result.value;
                        const uploadField = document.getElementById('upload');
                        const dataTransfer = new DataTransfer();
                        dataTransfer.items.add(foto);
                        uploadField.files = dataTransfer.files;

                        const preview = document.getElementById('preview');
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            preview.src = e.target.result;
                        }
                        reader.readAsDataURL(foto);

                        Swal.fire({
                            title: "Registro Exitoso",
                            text: `¡Tu registro de entrada ha sido procesado correctamente!`,
                            icon: "success",
                        });
                    }
                });
            }

            function redirectToURL(url) {
                window.location.href = url;
            }
        </script>
    </body>
</html>
