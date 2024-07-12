<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import ="org.example.webappsm.model.beans.Usuario" %>
<%Usuario usuariologueado = (Usuario) session.getAttribute("usuarioLogueado");%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina en blanco</title>
    <!-- plugins:css -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaIncidencias/styles_tabla.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/Perfil/styles_Perfil.css">
    
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
    String menuserenazgo = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
  %>


    <jsp:include page="<%= menuserenazgo %>">
        <jsp:param name="activePage" value="perfil"/>
    </jsp:include>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #fffff6;margin-top: -30px"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->  
        </div>
        
        

        <div class="container">
            <div class="card">
              <div class="main-table">
                <h2>Datos personales:</h2>
                <div class="card-table">
                    <div class="card-body">
                        <table>
                            <tbody>
                                <tr>
                                    <td>Nombre(s)</td>
                                    <td>:</td>
                                    <td><%= usuariologueado.getNombre() %> </td>
                                </tr>
                                <tr>
                                    <td>Apellidos</td>
                                    <td>:</td>
                                    <td><%= usuariologueado.getApellido() %> </td>
                                </tr>
                                <tr>
                                    <td>Correo</td>
                                    <td>:</td>
                                    <td><%= usuariologueado.getCorreoE() %> </td>
                                </tr>
                                <tr>
                                    <td>DNI</td>
                                    <td>:</td>
                                    <td><%= usuariologueado.getDocumento() %> </td>
                                </tr>
                                <tr>
                                    <td>Número telefónico</td>
                                    <td>:</td>
                                    <td><%= usuariologueado.getNumContacto() %> </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
        
                <h2>Actualizar datos:</h2>
                <div class="card-table">
                    <div class="card-body">
                        <table>
                            <tbody>
                                <tr>
                                    <td><i class="mdi mdi-lock" style="font-size:25px"></i></td>
                                    <td><a href="#" onclick="return contra();">Cambiar contraseña</a></td>
                                </tr>
                                <tr>
                                    <td><i class="mdi mdi-phone" style="font-size:25px"></i></td>
                                    <td><a href="#" onclick="return telefono();">Cambiar número telefónico</a></td>
                                    
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
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
            confirmButtonText: 'Sí, cerrar sesión',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    function telefono() {
        Swal.fire({
            title: 'Cambiar número de teléfono',
            text: '¿Estás seguro de que deseas cambiar el número de teléfono?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, cambiar número',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "../../LOGIN/chPhone_serenazgo.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    function contra() {
        Swal.fire({
            title: 'Cambiar contraseña',
            text: '¿Estás seguro de que deseas cambiar la contraseña?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, cambiar contraseña',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "../../LOGIN/chPass_serenazgo.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }

    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "script_tabla.js"></script>
    <script src="cancelaciones.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>
