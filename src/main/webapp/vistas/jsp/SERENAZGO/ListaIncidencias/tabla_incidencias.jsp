<!DOCTYPE html>
<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%
  ArrayList<Incidencia> incidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lista de incidencias</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_tabla.css">
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
    <style>

      .clasificacion-leve {
        background-color: #32CD32; /* Turquesa medio */
        color: white;
        padding: 2px 4px; /* Ajustar padding para hacerlo más delgado */
        border-radius: 5px;
        font-weight: normal; /* Asegurarse de que no sea bold */
        font-size: 12px; /* Ajustar tamaño del texto */
        display: inline-block; /* Hacer que el elemento ocupe solo el ancho del texto */
        margin-top: 13px; /* Eliminar margen */
        width: 100px; /* Ancho fijo */
        height: 40px;
        text-align: center;
        vertical-align: middle;
      }

      .clasificacion-moderada {
        background-color: #FFA500; /* Naranja */
        color: white;
        padding: 2px 4px; /* Ajustar padding para hacerlo más delgado */
        border-radius: 5px;
        font-weight: normal; /* Asegurarse de que no sea bold */
        font-size: 12px; /* Ajustar tamaño del texto */
        display: inline-block; /* Hacer que el elemento ocupe solo el ancho del texto */
        margin-top: 13px; /* Eliminar margen */
        width: 100px; /* Ancho fijo */
        height: 40px;
        text-align: center;
        vertical-align: middle;
      }

      .clasificacion-grave {
        background-color: #FF0000; /* Rojo */
        color: white;
        padding: 2px 4px; /* Ajustar padding para hacerlo más delgado */
        border-radius: 5px;
        font-weight: normal; /* Asegurarse de que no sea bold */
        font-size: 12px; /* Ajustar tamaño del texto */
        display: inline-block; /* Hacer que el elemento ocupe solo el ancho del texto */
        margin-top: 13px; /* Eliminar margen */
        width: 100px; /* Ancho fijo */
        height: 40px;
        text-align: center;
        vertical-align: middle;
      }
    </style>


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

                    <!-- <div style="display: flex; gap:10px;">

                      <p style ="color:black; align-self: center; margin-bottom: 0px;font-size: 15px">Filtrar por incidencias :</p>
                      <select id="filtroEstado" style="border-color: #DFDFDF; border-radius: 6px; padding:5px; outline: none; height: 40px; margin-top: 10px;">
                        <option value="">Mostrar Todos</option>
                        <option value="pendiente">Pendiente</option>
                        <option value="en proceso">En Proceso</option>

                      </select>
                    </div>
                    <div style="display: flex; align-items: center; justify-content: center;">
                      <button id="limpiarFiltros" class="btnTable" style="display: flex; align-items: center;">
                        Limpiar Filtros
                        <a class="mdi mdi-filter-remove" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                      </button>
                    </div>
                    <div style="display: flex; align-items: center; justify-content: center;">

                    </div> -->
                  </div>
                </div>
              </div>
            </div>
            <hr style="border: none; border-top: 3px solid black; margin-top: 0; border-radius: 10px;">
            <%!
              String getClasificacionClase(String clasificacion) {
                switch (clasificacion) {
                  case "Leve":
                    return "clasificacion-leve";
                  case "Moderada":
                    return "clasificacion-moderada";
                  case "Grave":
                    return "clasificacion-grave";
                  default:
                    return "";
                }
              }
            %>

            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Estado</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Clasificación</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Nombre Completo</th>

                  <th style="width: 20px;color: white" colspan="2">Acciones</th>
                  <th style="width: 20px;color: white;cursor: pointer;">Falsa Alarma</th>
                </tr>
              </thead>

              <tbody style="text-align: center;color: black;">
                <% if (incidencias != null) {
                  for(Incidencia incidencia : incidencias){
                %>
                <tr style="text-align: center;">
                  <td><a><%=incidencia.getEstado()%></a></td>
                  <td class="<%= incidencia.getClasificacion() != null ? getClasificacionClase(incidencia.getClasificacion()) : "" %>">
                    <%= incidencia.getClasificacion() != null ? incidencia.getClasificacion() : "no especificado" %>
                  </td>
                  <td><a><%=incidencia.getNombreUsuarioIncidencia()%></a></td>
                  <td colspan="2">
                    <form id="form_<%= incidencia.getIdIncidencia() %>" method="get" action="<%= request.getContextPath() %>/Serenazgo">
                      <select name="accion" id="acciones_<%= incidencia.getIdIncidencia() %>" class="btn btn-secondary dropdown-toggle" onchange="redirectAction('<%= incidencia.getIdIncidencia() %>')">
                        <option value="">--Seleccionar acción--</option>
                        <option value="info">Ver Incidencia</option>
                        <option value="clasificarProceder">Clasificar y Proceder</option>
                        <% if (incidencia.getEstado().equals("En proceso")) { %>
                        <option value="finalizar">Finalizar</option>
                        <% } %>
                      </select>
                      <input type="hidden" name="idIncidencia" value="<%= incidencia.getIdIncidencia() %>">
                    </form>
                  </td>
                  <td>
                    <a href="#" onclick="confirmarYEnviar('falsaAlarmaForm');" class="mdi mdi-alert" style="color: #6c7293; font-size: 20px;"></a>
                    <form id="falsaAlarmaForm" method="post" action="<%= request.getContextPath() %>/Serenazgo?action=falsaAlarma" style="display: none;">
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
              window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
          });
        }


        function redirectAction(idIncidencia) {
          var selectId = 'acciones_' + idIncidencia;

          // Obtener el elemento select por su id
          var selectElement = document.getElementById(selectId);

          // Obtener el valor seleccionado
          var selectedOption = selectElement.value;
          switch(selectedOption) {
            case 'info':
              window.location.href = '<%= request.getContextPath() %>/Serenazgo?action=leerDescripcion&idIncidencia=' + idIncidencia;
              break;
            case 'clasificarProceder':
              window.location.href = '<%= request.getContextPath() %>/Serenazgo?action=clasificar&idClasificar=' + idIncidencia;
              break;
            case 'finalizar':
              window.location.href = '<%= request.getContextPath() %>/Serenazgo?action=finalizar&idFinalizar=' + idIncidencia;
              break;
            default:
              // Opción por defecto si no se selecciona ninguna acción válida
              break;
          }
        }
        function confirmarYEnviar(formId) {
          let confirmMessage = "";
          if (formId.startsWith("finalizarForm")) {
            confirmMessage = "¿Estás seguro de que deseas finalizar la incidencia?";
          } else if (formId.startsWith("falsaAlarmaForm")) {
            confirmMessage = "¿Estás seguro de declarar la incidencia como falsa alarma?";
          }

          Swal.fire({
            title: confirmMessage,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí'
          }).then((result) => {
            if (result.isConfirmed) {
              document.getElementById(formId).submit();
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
