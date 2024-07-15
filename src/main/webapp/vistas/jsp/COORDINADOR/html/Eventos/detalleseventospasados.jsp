<%@ page import="org.example.webappsm.model.beans.Evento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.webappsm.model.daos.CoordinadorDao" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Usuario usuariologueado= (Usuario) session.getAttribute("usuarioLogueado");
%>
<%  int idUsuario = usuariologueado.getId(); %>
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
        <style>
            .event-image-container img {
                width: 800px;
                height: 300px;
                object-fit: cover;
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
                <jsp:param name="activePage" value="EventosNota"/>
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

                <div class="content-wrapper" style ="background-color: #bdf1f5;"> <!--Cambiar al color mas claro-->
                    <div class="container">

                        <div class="container-fluid mt-5"> <!-- Cambié container por container-fluid -->
                            <div class="options-bar d-flex justify-content-center align-items-center">
                                <div class="option verde" onclick="redirectToURL('${pageContext.request.contextPath}/Coordinador?action=agregarNota&id=<%= evento.getIdEvento() %>')">
                                    <i class="fas fa-sticky-note me-2"></i> Agregar Nota
                                </div>


                                <div class="option azul" onclick="seleccionarFoto(<%=evento.getIdEvento()%>,'${pageContext.request.contextPath}')">
                                    <i class="fas fa-address-book me-2"></i> Registrar Salida
                                </div>

                                <div class="option rojo" onclick="return borrarEvento(<%= evento.getIdEvento() %>, '<%= request.getContextPath() %>',<%=idUsuario%>);">
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

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="custom-container rounded-3" id="fechas">
                                    <h4 class="mb-4 center-text" id="nombre-seleccionado">Nombre del Evento</h4>
                                    <p><strong>Fecha:</strong><%=evento.getFecha()%> </p>
                                    <%
                                        // Convertir el formato de la hora de HH:mm:ss a HH:mm
                                        String horaEvento = evento.getHora() != null ? evento.getHora().toString().substring(0, 5) : "";
                                        String horaFinEvento = evento.getHoraFin() != null ? evento.getHoraFin().toString().substring(0, 5) : "";
                                    %>
                                    <p><strong>Hora de Inicio:</strong> <span id="hora-seleccionada"><%=horaEvento%>  </span> </p>
                                    <p><strong>Hora de Finalización:</strong> <span id="horaFin"> <%=horaFinEvento%></span> </p>
                                    <p><strong>Lugar:</strong> <span id="lugar-seleccionado" ><%=evento.getUbicacion()%> </span> </p>
                                    <p><strong>Recurrencia:</strong> <span id="recurrencia-seleccionada">
  <%
      Integer recurrencia = evento.getRecurrencia();
      if (recurrencia != null) {
          if (recurrencia == 0) {
  %>
        Evento único
  <%
  } else if (recurrencia == 1) {
  %>
        Evento repetitivo
  <%
  } else {
  %>
        Valor desconocido
  <%
      }
  } else {
  %>
      Valor no disponible
  <%
      }
  %>
</span></p>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="custom-container rounded-3" id="descripcion">
                                <h4 class="mb-4">Descripción del Evento </h4>
                                <p contenteditable="false"><%=evento.getDescripcion()%></p>
                                <h4 class="mb-4">Materiales Usados </h4>
                                <div id="opcion-material">
                                    <ul id="lista-materiales">
                                        <%
                                            ArrayList<String> nombresMateriales = (ArrayList<String>) request.getAttribute("materiales");
                                            if (nombresMateriales != null && !nombresMateriales.isEmpty()) {
                                                for (String nombreMaterial : nombresMateriales) {
                                        %>
                                        <li class="material-item">
                                            <span><%= nombreMaterial %></span>
                                        </li>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <li>No se uso materiales</li>
                                        <%
                                            }
                                        %>
                                    </ul>

                                    <%
                                        if (nombresMateriales == null) {
                                    %>
                                    <p>No hay materiales disponibles.</p>
                                    <%
                                        }
                                    %>
                                </div>
                                <h4 class="mb-4" id="profesores-link">
                                    <a href="#">Profesores </a>
                                </h4>
                                <%
                                    CoordinadorDao coordinadorDao = new CoordinadorDao();
                                    Integer idProfesor = evento.getIdProfesor();

                                    String nombreProfesor = coordinadorDao.obtenerNombreCompletoPorId(idProfesor);
                                %>
                                <p><%=nombreProfesor%></p>
                            </div>
                        </div>
                    </div>
                </div>

                <% } %>
                <div class="fixed-buttons">
                    <button class="btn btn-custom-success" id="danger" onclick="volverpasado('<%= request.getContextPath() %>',<%=idUsuario%>)" style="background-color: #00913f;">Volver a eventos pasados</button>
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
        <script src="../assets/js/misc.js"></script>
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
                        window.location.href = "${pageContext.request.contextPath}/sys?action=logout"; //Cambiar la ubicacion del login de acuerdo a lo necesario
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
        <script src = "${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_detallespasados.js"></script>
        <script>
            function volverpasado(contextPath,id) {
                window.location.href = contextPath+ '/Coordinador?action=EventosNota&id='+id;
            }
            function borrarEvento(id, contextPath,idusuario) {
                Swal.fire({
                    title: "¿Estás seguro?",
                    text: "Una vez eliminado, la información asociada al evento será eliminada del sistema",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Sí, eliminar",
                    cancelButtonText: "Cancelar",
                    confirmButtonColor: "#00913f",
                    cancelButtonColor: "#d33",

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

                        const input2 = document.createElement('input');
                        input2.type = 'hidden';
                        input2.name = 'idcoordi';
                        input2.value = idusuario; // Cambia esto por el valor que desees enviar
                        form.appendChild(input2);

                        document.body.appendChild(form);
                        form.submit();
                    }
                });

                return false;
            }
            function seleccionarFoto(idEvento, contextPath) {
                Swal.fire({
                    title: 'Seleccionar foto para el registro de salida',
                    html: `<input type="file" id="inputFoto" accept="image/*">`,
                    showCancelButton: true,
                    confirmButtonText: "Confirmar",
                    cancelButtonText: "Cancelar",
                    confirmButtonColor: "#00913f", // Color verde
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

                        // Crear un formulario y enviarlo por POST
                        const form = document.createElement('form');
                        form.method = 'post';
                        form.action = contextPath + '/Coordinador?action=registrarSalida';
                        form.enctype = 'multipart/form-data';

                        const inputFoto = document.createElement('input');
                        inputFoto.type = 'hidden';
                        inputFoto.name = 'foto';
                        inputFoto.value = foto;

                        const inputIdEvento = document.createElement('input');
                        inputIdEvento.type = 'hidden';
                        inputIdEvento.name = 'idEvento';
                        inputIdEvento.value = idEvento;

                        form.appendChild(inputFoto);
                        form.appendChild(inputIdEvento);

                        document.body.appendChild(form);
                        form.submit();

                        // Mostrar un mensaje de éxito
                        Swal.fire({
                            title: "Registro Exitoso",
                            text: `¡Tu registro de salida ha sido procesado correctamente!`,
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
