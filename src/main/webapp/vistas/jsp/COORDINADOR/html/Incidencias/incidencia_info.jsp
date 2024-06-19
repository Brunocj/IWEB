<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../css/Incidencias/styles_info.css">
    <link rel="stylesheet" href="../../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../../assets/css/style.css">
    
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../../LogoSM.png" />
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
            <div class="card" style="background-color: white; color: black;">
              <h2 style="color: black;">Información de la incidencia:</h2>
              <div class="card-table">
                <div class="card-body">
                  <table>
                    <tbody>
                        <tr>
                          <td>Nombre de la incidencia</td>
                          <td>:</td>
                          <td>Asalto en el condominio Arica a Juan Flores</td>
                        </tr>
                        <tr>
                          <td>Lugar exacto</td>
                          <td>:</td>
                          <td>Jr. Arica, Condominio Arica, Torre 1</td>
                        </tr>
                        <tr>
                          <td>Referencia</td>
                          <td>:</td>
                          <td>Cerca del área de estacionamiento</td>
                        </tr>
                        <tr>
                          <td>Contacto (o)</td>
                          <td>:</td>
                          <td>Jorge Barraza - 924 151 366</td>
                        </tr>
                        <tr>
                          <td>Requiere ambulancia?</td>
                          <td>:</td>
                          <td>No</td>
                        </tr>
                        <tr td colspan="3">
                          <td style="border-bottom: none;">Imagen de referencia:</td>
                          <td style="border-bottom: none;"></td>
                          <td style="border-bottom: none;"></td>
                        </tr>
                        
                        <tr>
                          <td class = "info" colspan="3" style="text-align: center;"> 
                            <img src="../../img/Incidencias/asalto.jpg" alt="Imagen" style="max-width: 750px; height: auto; border-radius: 5px;">  <!--Imagen de referencia de la incidencia -->
                          </td>
                        </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="button-container">
                  <!-- Botón con enlace "#" -->
                  <a href="incidencia_coordinador.jsp" class="button" style =" background-color: #000f22;" >Regresar</a>
              </div>
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
    <script src="../../../../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../../../../assets/js/off-canvas.js"></script>
    <script src="../../../../../assets/js/hoverable-collapse.js"></script>
    <script src="../../../../../assets/js/misc.js"></script>
    <script src="../../../../../assets/js/settings.js"></script>
    <script src="../../../../../assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="../../js/Incidencias/script_cerrar_sesion.js"></script>
    <!-- End custom js for this page -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src ="../../js/Incidencias/script_incidencia.js"></script>
  </body>
</html>