<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../css/Incidencias/styles_registro.css">
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
          <div class="container">
            <div class="card">
              <div class = "wrapper"id="formContent">
                <!-- Tabs Titles -->
                <center><h2 class="active" style="color: black;">Registro de incidencia</h2></center>                
                <!-- Icon -->
                <!-- Login Form -->
                <form>
                  <div class="inputs">
                    <input type="text" id="nombre" class="input-field" placeholder="Nombre de la incidencia">
                    <input type="text" id="lugar" class="input-field" placeholder="Lugar exacto">
                    <input type="text" id="ref" class="input-field" placeholder="Referencia">
                    <select id="tipo" class="input-field">
                      <option value="" disabled selected>Tipo de incidencia</option>
                      <option value="Hurto">Hurto</option>
                      <option value="Discriminación">Discriminación</option>
                      <option value="Vandalismo">Vandalismo</option>
                      <option value="Homicidio">Homicidio</option>
                      <option value="Secuestro">Secuestro</option>
                      <option value="Acoso">Acoso</option>
                    </select>
                    <input type="text" id="contacto" class="input-field" placeholder="Contacto (opcional)">
                    <select id="ambulanciaSN" class="input-field">
                      <option value="" disabled selected>Requiere ambulancia (s/n)?</option>
                      <option value="Sí">Sí</option>
                      <option value="No">No</option>
                    </select>
                    <div class="formImg">
                      <form action="subir_foto.php" method="post" enctype="multipart/form-data">
                        <label for="foto">Selecciona una foto:</label>
                        <div class="foto-flex" >
                          <input type="file" id="foto" name="foto" accept="image/*">
                        </div>
                      </form>
                    </div>
                  </div>
                  <div class="buttons">
                    <input type="submit" class="green" value="Registrar incidencia" onclick="return Confirmacion();">
                    <input type="submit" class="red" value="Cancelar" onclick="return Cancelar();">
                  </div>
                </form> 
                
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
    <script src ="../../js/Incidencias/script_registro.js"></script>
    
  </body>
</html>

