<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_tabla_inscritos.css">
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
                  <h2 class="tabla-title" style ="color:#000f22;">Lista de Inscritos</h2>  <!--Cambiar el titulo de la tabla-->
                   
                </div>
              </div>
            </div>
            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo (claro) de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th style="width: 100px; color: white;">Turno</th>
                  <th style="color: white;">Nombre</th>
                  <th style="width: 100px;color: white;">Ajustes</th>
                  
                </tr>
              </thead>
              <tbody style="text-align: center;">
                <tr style="text-align: center;">
                  <td><a>01</a></td>
                  <td><a>Tacuri Flores, Brandon Rafael</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr style="text-align: center;">
                  <td><a>02</a></td>
                  <td><a>Luján Carrión, Jesús Andrés</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr style="text-align: center;">
                  <td><a>03</a></td>
                  <td><a>Vilchez Campos, Carlos Eduardo</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr style="text-align: center;">
                  <td><a>04</a></td>
                  <td><a>Domínguez Alvarado, Christian</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
                </tr>
                <tr>
                  <td><a>05</a></td>
                  <td><a>Camarena Jáuregui, Bruno Imanol</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>06</a></td>
                  <td><a>Garay Cruz, Eduardo Daniel</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>07</a></td>
                  <td><a>Calderón Rodríguez, José Ricardo</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>08</a></td>
                  <td><a>Bustamante Melo, Pedro Miguel</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              <tr>
                  <td><a>09</a></td>
                  <td><a>Lopez Pascual, Álvaro Adrián</a></td>
                  <td><a href ="#" onclick="return Eliminacion();" class ="mdi mdi-delete" style ="color: #6c7293;"></a></td>
              </tr>
              </tbody>
            </table>
            <br>
            <br>
            <br>
            <div class="button-container">
              <!-- Botón con enlace "#" -->
              <button class="button" onclick="goBack()" style ="background-color:#000f22">Regresar</button>
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
                window.location.href = "../../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_tabla_incsritos.js"></script>
    
    <!-- End custom js for this page -->
  </body>
</html>