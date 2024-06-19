<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_tabla_docentes.css">
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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" /> <!--Cambiar la ubicacion del logo de la pagina aca tmb-->
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
            <!--CONTENIDO-->
            <div style="display: flex; justify-content: space-between;">
              <div style="display: flex; justify-content: space-between;">
                <div style="display: flex; flex-direction: column; margin-bottom: 20px">
                  <h2 class="tabla-title" style ="color:#000f22;">Lista de docentes</h2>  <!--Cambiar el titulo de la tabla-->
                  <div style="display: flex; gap:30px;">
                    <div style="display: flex; align-items: center; justify-content: center;">
                      <button onclick="return agregar();" id="filtro_button" class="btnTable" style="display: flex; align-items: center;">
                        Agregar Docente
                        <a class="mdi mdi-account-plus" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                      </button>
                    </div> 
                    
                  </div>    
                </div>
              </div>
            </div>
            <table id="miTabla" class="table" style="margin-bottom:15px;">
              
              <thead style="background-color: #e0e9ff;"> <!--Cambiar al color de fondo (claro) de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th></th>
                  <th >Area</th>
                  <th>Profesor</th>                   
                  <th>Estado</th>
                </tr>
              </thead>
              <tbody style="text-align: center;">
                <tr data-disponibilidad="No disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox1" name="opcion" value="opcion1"></td>
                  <td><a>Propa</a></td>
                  <td><a>Elver Augusto</a></td>
                  <td>No disponible</td>
                </tr>
                <tr data-disponibilidad="No disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox2" name="opcion" value="opcion2"></td>
                            <td><a>Iweb</a></td>
                            <td><a>Calderón Rodríguez</a></td>
                            <td><a>No disponible</a></td>
                </tr>
                <tr data-disponibilidad="Disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox3" name="opcion" value="opcion3"></td>
                  <td><a>Tecom</a></td>
                  <td><a>Eduardo Daniel</a></td>                   
                  <td><a>Disponible</a></td>
                </tr>
                <tr data-disponibilidad="Disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox4" name="opcion" value="opcion4"></td>
                  <td><a>Gimnasida Artistica</a></td>
                  <td><a>Jorge</a></td>                   
                  <td><a>Disponible</a></td>
                </tr>
                <tr data-disponibilidad="No disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox5" name="opcion" value="opcion5"></td>
                            <td><a>Circuitos</a></td>
                            <td><a>Manuel Augusto</a></td>                   
                            <td><a>No disponible</a></td>
                </tr>
                <tr data-disponibilidad="Disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox6" name="opcion" value="opcion6"></td>
                  <td><a>Radiacion</a></td>
                  <td><a>Manuel Augusto</a></td>                    
                  <td><a>Disponible</a></td>
                </tr>
                <tr data-disponibilidad="Disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox7" name="opcion" value="opcion7"></td>
                            <td><a>Futchibol</a></td>
                            <td><a>Manuel Augusto</a></td>                   
                            <td><a>Disponible</a></td>
                </tr>
                <tr data-disponibilidad="Disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox8" name="opcion" value="opcion8"></td>
                            <td><a>Voli</a></td>
                            <td><a>Manuel Augusto</a></td>                   
                            <td><a>Disponible</a></td>
                </tr>
                <tr data-disponibilidad="No disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox9" name="opcion" value="opcion9"></td>
                            <td><a>inalambricas</a></td>
                            <td><a>Manuel Augusto</a></td>
                            <td><a>No disponible</a></td>
                </tr>
                <tr data-disponibilidad="Disponible" style="text-align: center;">
                  <td><input type="checkbox" id="checkbox10" name="opcion" value="opcion10"></td>
                            <td><a>ya nos e que poner</a></td>
                            <td><a>Manuel Augusto</a></td>
                            <td><a>Disponible</a></td>
                </tr>
              </tbody>
            </table>
            <br>
            <br>
            <br>
            <div class="button-container">
              <!-- Botón con enlace "#" -->
              <button class="button" onclick="goBack()">Regresar</button>
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
                window.location.href = "LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_tabla_docentes.js"></script>
    
    <!-- End custom js for this page -->
  </body>
</html>