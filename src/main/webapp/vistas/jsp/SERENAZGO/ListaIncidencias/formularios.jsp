<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%@ page import="org.example.webappsm.model.beans.TipoSerenazgo" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%ArrayList<TipoSerenazgo> listaTipos = (ArrayList<TipoSerenazgo>) request.getAttribute("listaTipos");%>
<% int idIncidencia = (int) request.getAttribute("idIncidencia");%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sección Proceder</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_tabla.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_proceder.css">
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
          <form id="tipo_form" action="<%=request.getContextPath()%>/Serenazgo?action=procederIncidencia" method="post">

            <input type="hidden" name="id"  value="<%= idIncidencia %>">

          <div class="content-wrapper" style="background-color: #fffff6; margin-top: -30px">
            <div class="opciones-container">

              <!-- TITULO -->
              <div class="autoridad">
                <h1 style="text-align: left;">Proceder con la incidencia</h1>
                <hr style="border: none; border-top: 3px solid #000; margin: 10px 0;">
              </div>

              <div >
                <hr style="border: none; border-top: 1px solid #000;">
              </div>


              <!-- Checkboxes de categorías -->
              <div class ="autoridad" >
                <h1 style="text-align: left;" >Seleccione el tipo de serenazgo asignado</h1>
              </div>




                <div class ="opcion">
                  <!-- Formulario de serenazgo -->
                      <div class ="serenazgoSelector">

                        <select id="tipoS" name="tipoS" class="form-combo" required>
                          <option value="null">--Escoja el tipo de serenazgo--</option>
                          <%
                            for (TipoSerenazgo tipoSerenazgo : listaTipos) {
                          %>
                          <option value="<%= tipoSerenazgo.getIdTipoSerenazgo() %>"><%= tipoSerenazgo.getNombreTipo() %></option>
                          <%
                            }
                          %>
                        </select>

                      </div>



                </div>

                <div class ="autoridad">
                  <h1 style="text-align: left;">Seleccione la autoridad requerida</h1>
                </div>

                <div class ="opcion">
                  <label>
                    <input type="checkbox" name="opcion" value="ambulancia" onchange="mostrarFormulario()"> Ambulancia
                  </label>
                  <!-- Formulario de ambulancia -->
                  <div class="form-ambulancia" style="display: none;">
                    <div class ="inWrapper">
                      <div class="form-section">
                        <input type="text" id="nombre" name ="nombre" placeholder="Nombre del personal de turno">
                      </div>
                      <div class="form-section">
                        <input type="text" id="motivoSol" name ="motivoSol" placeholder="Motivo de la solicitud">
                      </div>
                    </div>
                  </div>
                </div>
                <div class ="opcion">
                  <label>
                    <input type="checkbox" name="opcion" value="policia" onchange="mostrarFormulario()"> Policia
                  </label>
                  <!-- Formulario de policía -->
                  <div class="form-policia" style="display: none;">
                    <div class ="inputs">
                      <select id="comisaría">
                        <option value="default">Escoja una comisaría</option>
                        <option name="nombreComisaria" value="Maranga">Maranga</option>
                        <option name="nombreComisaria" value="San Miguel">San Miguel</option>
                      </select>
                    </div>
                    <div class="inWrapper">
                      <div class ="inputs">
                        <input type="text" id="motivo" name="motivo" placeholder="Motivo de la solicitud">
                      </div>
                    </div>
                  </div>
                </div>
                <div class ="opcion">
                  <div>
                    <label>
                      <input type="checkbox" name="bomberos" value="bomberos"> Bomberos
                    </label>


                  </div>
                </div>



                <!-- Agrega más opciones si es necesario -->
              </div>
            </div>

            <div class="botones-container">

              <button onclick="return aceptar();" class="boton-confirmar">Confirmar</button>
              <button onclick="return cancelar();" class="boton-cancelar">Cancelar</button>

            </div>
          </form>
        </div>
      </div>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/script_tabla.js"></script>
    <script src="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/script_proceder.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>


<script>
  function cancelar() {
    Swal.fire({
      title: "¿Estás seguro de que deseas cancelar?",
      text: "Una vez cancelado, no se guardarán los cambios en el sistema",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#00913f",
      cancelButtonColor: "#d33",
      cancelButtonText: "Cancelar",
      confirmButtonText: "Sí"
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Se canceló el proceso con éxito",
          icon: "success"
        }).then(() => {
          window.location.href = "tabla_incidencias.html";
        });
      }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
  }

  function aceptar() {
    Swal.fire({
      title: "¿Estás seguro de que deseas confirmar?",
      text: "Una vez inicie el procedimiento, el estado de la incidencia cambiará y se solicitarán las autoridades seleccionadas",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#00913f",
      cancelButtonColor: "#d33",
      cancelButtonText: "Cancelar",
      confirmButtonText: "Sí, confirmar"
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Se inició el proceso de esta incidencia",
          icon: "success"
        }).then(() => {
          document.querySelector("#tipo_form").submit();
        });
      }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
  }
</script>