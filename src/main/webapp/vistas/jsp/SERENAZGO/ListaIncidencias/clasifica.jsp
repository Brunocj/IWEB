<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.webappsm.model.beans.Incidencia" %>
<%
  Incidencia incidencia = (Incidencia) request.getAttribute("incidencia");
%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Clasificación</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_tabla.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_clasifica.css">
    
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

        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #fffff6;margin-top: -30px"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->  
        </div>
        
        

        <div class="container">
          <div class="card">
            <h1 style="text-align: center;">Clasificación de incidencias</h1>
            <h3>Bienvenido, en este apartado podrá clasificar la incidencia seleccionada en una de las siguientes categorías:</h3>
            
            <!-- Radios de categorías -->
              <form id="clasificarForm" action="<%= request.getContextPath() %>/Serenazgo?action=clasificarIncidencia" method="post">
                  <input type="hidden" name="id"  value="<%= incidencia.getIdIncidencia() %>">
                  <div class="opciones">
                  <div class="opcion">
                      <input type="radio" id="categoriaLeve" name="categoria" value="1">
                      <label for="categoriaLeve">Leve</label>
                  </div>
                  <div class="opcion">
                      <input type="radio" id="categoriaModerada" name="categoria" value="2">
                      <label for="categoriaModerada">Moderada</label>
                  </div>
                  <div class="opcion">
                      <input type="radio" id="categoriaGrave" name="categoria" value="3">
                      <label for="categoriaGrave">Grave</label>
                  </div>
                </div>
           
                <div>
                    <label for="nombre">Ingrese una descripción del porqué seleccionó esta opción:</label>
                    <br>
                    <textarea id="nombre" name="nombre" placeholder="Opcional" required></textarea>
                </div>
        
                <div class="botones-container">
                    <button href="#" onclick="return aceptar();" class="boton-confirmar">Confirmar</button>
                    <button href="#" onclick="return cancelar();" class="boton-cancelar">Cancelar</button>

                </div>
              </form>
        </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../../../assets/js/off-canvas.js"></script>
    <script src="../../../../assets/js/hoverable-collapse.js"></script>
    <script src="../../../../assets/js/misc.js"></script>
    <script src="../../../../assets/js/settings.js"></script>
    <script src="../../../../assets/js/todolist.js"></script>
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
                  // Aquí puedes poner el código para cerrar sesión
                  // Por ejemplo, redirigir a la página de inicio de sesión
                  window.location.href = "../LOGIN/login.html"; 
              }
          });
      }
      function cancelar() {
            Swal.fire({
                title: "¿Estás seguro de que deseas cancelar la clasificación?",
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
                        title: "Se canceló la clasificación",
                        icon: "success"
                    }).then(() => {
                        window.location.href ='<%=request.getContextPath()%>/Serenazgo?action=listaIncidencias';
                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }

        function aceptar() {
            Swal.fire({
                title: "¿Estás seguro de que deseas confirmar la clasificación?",
                text: "Una vez clasificado, los datos del sistema serán actualizados",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                cancelButtonText: "Cancelar",
                confirmButtonText: "Sí, clasificar"
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "La incidencia fue clasificada exitosamente",
                        icon: "success"
                    }).then(() => {
                        document.getElementById("clasificarForm").submit();
                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }


  </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "script_tabla.js"></script>
    <script src="cancelaciones.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>