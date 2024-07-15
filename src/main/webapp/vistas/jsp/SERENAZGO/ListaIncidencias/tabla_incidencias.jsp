<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%
  ArrayList<Incidencia> incidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>

<!DOCTYPE html>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lista de incidencias</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vistas/jsp/SERENAZGO/ListaIncidencias/styles_tabla.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/css/vendor.bundle.base.css">

    <!-- Incluir Popper.js desde CDN -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <!-- Incluir Bootstrap JS desde CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/vistas/jsp/LogoSM.png" />
    <!--JS para los popups-->



    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.html -->
        <%
    String userRole = (String) session.getAttribute("userRole");
    if (userRole == null) {
      userRole = "Serenazgo"; // Por defecto, si no hay rol en la sesión
    }
    String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
  %>


      <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="listaIncidencias"/>
      </jsp:include>


      <!-- partial -->
      <div class="main-panel">
        <div >
          <div class="content-wrapper" style ="background-color: #fffff6; margin-top:auto;"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->

            <div style="display: flex; justify-content: space-between;">
              <div style="display: flex; justify-content: space-between;">
                <div style="display: flex; flex-direction: column">

                  <h2 class="tabla-title" style ="color:#000f22;">Lista de incidencias</h2>  <!--Cambiar el titulo de la tabla-->

                  <div style="display: flex; gap:30px;margin-top: 10px;">

                     <div style="display: flex; gap:10px;">

                      <p style ="color:black; align-self: center; margin-bottom: 0px;font-size: 20px">Filtrar por incidencias :</p>
                      <select id="filtroEstado" style="border-color: #DFDFDF; border-radius: 6px; padding:5px; outline: none; height: 40px; margin-top: 10px;">

                        <option value="">Mostrar Todos</option>
                        <option value="Pendiente">Pendiente</option>
                        <option value="En Proceso">En Proceso</option>

                      </select>
                    </div>
                    <div style="display: flex; align-items: center; justify-content: center;">
                      <button id="limpiarFiltros" class="btnTable" style="display: flex; align-items: center;">
                        Limpiar Filtros
                        <a class="mdi mdi-filter-remove" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                      </button>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <hr style="border: none; border-top: 3px solid black; margin-top: -55px; border-radius: 10px;">




            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Estado</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Clasificación</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Nombre Completo</th>
                  <th style="color: white; font-size: 17px;">Acciones</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Falsa alarma</th>


                </tr>
              </thead>

              <tbody style="text-align: center;color: black;">
                <% if (incidencias != null) {
                  for(Incidencia incidencia : incidencias){
                %>
                <tr style="text-align: center;">

                  <td>
                    <% if (incidencia.getEstado().equals("Pendiente")) { %>
                    <span class="badge bg-primary "><%= incidencia.getEstado() %></span>
                    <% } else if (incidencia.getEstado().equals("En proceso")) { %>
                    <span class="badge bg-info "><%= incidencia.getEstado() %></span>
                    <% } else { %>
                    <span class="badge bg-warning text-dark"><%= incidencia.getEstado() %></span>
                    <% } %>
                  </td>


                  <td>
                    <% if (incidencia.getClasificacion() == null || incidencia.getClasificacion().equals("No especificado")) { %>
                    <span class="badge bg-secondary">No especificado</span>
                    <% } else if (incidencia.getClasificacion().equals("Leve")) { %>
                    <span class="badge bg-success fs-5">Leve</span>
                    <% } else if (incidencia.getClasificacion().equals("Moderada")) { %>
                    <span class="badge bg-warning text-dark">Moderada</span>
                    <% } else if (incidencia.getClasificacion().equals("Grave")) { %>
                    <span class="badge bg-danger fs-5">Grave</span>
                    <% } else { %>
                    <span class="badge bg-secondary"><%= incidencia.getClasificacion() %></span>
                    <% } %>
                  </td>



                  <td>
                    <a style="font-size: 1.3em;"><%= incidencia.getNombreUsuarioIncidencia() %></a>
                  </td>
                  <td>
                    <form id="form_<%= incidencia.getIdIncidencia() %>" method="get" action="<%= request.getContextPath() %>/Serenazgo">
                      <select name="accion" id="acciones_<%= incidencia.getIdIncidencia() %>" class="btn btn-secondary dropdown-toggle" onchange="redirectAction('<%= incidencia.getIdIncidencia() %>')">
                        <option value="">--Seleccionar acción--</option>
                        <option value="info">Ver Incidencia</option>
                        <% if (incidencia.getEstado().equals("En proceso")) { %>
                        <option value="gestionar">Gestionar incidencia</option>
                          <option value="finalizar">Finalizar</option>
                        <% }else{ %>
                          <option value="clasificarProceder">Clasificar y Proceder</option>
                        <% } %>
                      </select>
                      <input type="hidden" name="idIncidencia" value="<%= incidencia.getIdIncidencia() %>">
                    </form>
                  </td>
                  <td>
                    <a href="#" onclick="confirmarYEnviar('falsaAlarmaForm-<%= incidencia.getIdIncidencia() %>');" class="mdi mdi-alert" style="color: #6c7293; font-size: 20px;"></a>
                    <form id="falsaAlarmaForm-<%= incidencia.getIdIncidencia() %>" method="post" action="<%= request.getContextPath() %>/Serenazgo?action=falsaAlarma" style="display: none;">
                      <input type="hidden" name="idIncidencia" value="<%= incidencia.getIdIncidencia() %>">
                      <input type="hidden" name="idUsuario" value="<%= incidencia.getIdUsuario() %>">
                    </form>
                  </td>

                </tr>

                <%
                  }
                } else {
                %>
                <tr>
                  <td colspan="5">No hay incidencias registradas owo.</td>
                </tr>
                <%
                  }
                %>
              </tbody>
            </table>

            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <!-- partial -->
          </div>

          <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
      </div>
    </div>

      <!-- container-scroller -->
      <!-- plugins:js -->
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




        function redirectAction(idIncidencia) {
          var selectId = 'acciones_' + idIncidencia;

          var selectElement = document.getElementById(selectId);

          var selectedOption = selectElement.value;

          switch(selectedOption) {
            case 'info':
              window.location.href = '<%= request.getContextPath() %>/Serenazgo?action=leerDescripcion&idIncidencia=' + idIncidencia;
              break;
            case 'clasificarProceder':
              window.location.href = '<%= request.getContextPath() %>/Serenazgo?action=proceder&idProceder=' + idIncidencia;
              break;
            case 'gestionar':
              window.location.href = '<%= request.getContextPath() %>/Serenazgo?action=gestionarIncidencia&idGestionar=' + idIncidencia;
              break;
            case 'finalizar':
              Swal.fire({
                title: 'Finalizar incidencia',
                text: '¿Estás seguro de que deseas finalizar la incidencia?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#00913f',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, finalizar',
                cancelButtonText: 'Cancelar'
              }).then((result) => {
                if (result.isConfirmed) {
                  var form = document.createElement('form');
                  form.method = 'post';
                  form.action = '<%= request.getContextPath() %>/Serenazgo?action=finalizar&idFinalizar=' + idIncidencia;

                  var hiddenField = document.createElement('input');
                  hiddenField.type = 'hidden';
                  hiddenField.name = 'idIncidencia';
                  hiddenField.value = idIncidencia;
                  form.appendChild(hiddenField);

                  document.body.appendChild(form);
                  form.submit();
                } else {
                  // Reset the select element to the default option if the action is canceled
                  selectElement.value = "";
                }
              });
              break;
            default:
              // Opción por defecto si no se selecciona ninguna acción válida
              break;
          }
        }

        function confirmarYEnviar(formId) {
          let confirmMessage = "";

          if (formId.startsWith("falsaAlarmaForm")) {
            confirmMessage = "¿Estás seguro de declarar la incidencia como falsa alarma?";
          }

          // Mostrar el pop-up con un campo de texto para el motivo
          Swal.fire({
            title: confirmMessage,
            icon: 'warning',
            input: 'textarea',  // Campo de texto para el motivo
            inputPlaceholder: 'Ingrese el motivo aquí...',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí',
            cancelButtonText: 'Cancelar',
            preConfirm: (motivo) => {
              if (!motivo) {
                Swal.showValidationMessage('Debe ingresar un motivo');
              }
              return motivo;
            }
          }).then((result) => {
            if (result.isConfirmed) {
              // Crear un input oculto en el formulario con el motivo
              let form = document.getElementById(formId);
              let input = document.createElement('input');
              input.type = 'hidden';
              input.name = 'motivo';
              input.value = result.value;  // El valor del campo de texto
              form.appendChild(input);

              // Enviar el formulario
              form.submit();
            }
          });

          return false;
        }

      </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
      <script src="<%=request.getContextPath()%>/vistas/jsp/SERENAZGO/ListaIncidencias/script_tabla.js"></script>


    <!-- End custom js for this page -->
  </body>
</html>
