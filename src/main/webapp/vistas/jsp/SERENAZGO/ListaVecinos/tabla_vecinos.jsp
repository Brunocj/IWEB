<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("listaVecinos");
%>



<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lista de profesores</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaVecinos/styles_tabla.css">
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
        <jsp:param name="activePage" value="listaVecinos"/>
      </jsp:include>

        <!-- partial -->
        <div class="main-panel">
          <div >
            <div class="content-wrapper" style ="background-color: #fffff6; margin-top:auto;"> <!--Cambiar al color mas claro-->
            <!--CONTENIDO-->
            <div style="display: flex; justify-content: space-between;">
              <div style="display: flex; justify-content: space-between;">
                <div style="display: flex; flex-direction: column">
                  <h2 class="tabla-title" style ="color:#000f22;">Lista de vecinos</h2>  <!--Cambiar el titulo de la tabla-->
                    
                  <div style="display: flex; gap:30px;margin-top: 10px;">
 
                    <div style="display: flex; gap:10px;">

                      <p style ="color:black; align-self: center; margin-bottom: 0px;font-size: 15px">Filtrar por falsas alarmas :</p>
                      <select id="filtroEstado" style="border-color: #DFDFDF; border-radius: 6px; padding:5px; outline: none; height: 40px; margin-top: 10px;" >
                        <option value="">Mostrar Todos</option> <!--Cambiar el filtro de acuerdo a lo necesario-->
                        <option value="aptosBaneo">Aptos para baneo </option>
                        <option value="noAptosBaneo">No aptos</option>
                    
                      </select>
                    </div>
                    <div style="display: flex; align-items: center; justify-content: center;">
                      <button id="limpiarFiltros" class="btnTable" style="display: flex; align-items: center;">
                        Limpiar Filtros
                        <a class="mdi mdi-filter-remove" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                      </button> 
                    </div>
                    <div style="display: flex; align-items: center; justify-content: center;">
                    
                    </div>
                  </div>    
                </div>
              </div>
            </div>
            <table id="miTabla" class="table" style="margin-bottom:15px;">
              <thead style="background-color: #000f22;"> <!--Cambiar al color de fondo de la pagina, pero un poco mas oscuro-->
                <tr style="text-align: center; font-weight:800;">
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Nombres</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Apellidos</th>
                  <th style ="color: white;font-size: 17px;cursor: pointer;">Correo</th>
                  <th style="width: 20px;color: white">Falsas alarmas</th>
                  <th style="width: 20px;color: white">Banear</th>
                </tr>
              </thead>
              <hr style="border: none; border-top: 3px solid black; margin-top: -55px; border-radius: 10px;">

              <tbody style="text-align: center; color: black;">
                <% if (lista != null && !lista.isEmpty()) {
                  for (Usuario usuario : lista) { %>

                <tr style="text-align: center;">
                  <td><%= usuario.getNombre() %></td>
                  <td><%= usuario.getApellido() %></td>
                  <td><%= usuario.getCorreoE() %></td>
                  <td><%= usuario.getFalsasAlarmas() %></td>
                  <%
                    if (usuario.isBaneado()) { %>
                  <td style="color: red; font-weight: bold;">Usuario baneado</td>
                  <%
                  } else if (usuario.getFalsasAlarmas() > 5) { %>
                  <td><a href="#" onclick="return banear(<%= usuario.getId() %>,'<%= request.getContextPath() %>');" class="mdi mdi-trash-can-outline" style="color: #0D1832; font-size: 20px;"></a></td>
                  <%
                  } else { %>
                  <td></td>
                  <%
                    }
                  %>
                </tr>
                <% }
                } else { %>
                <tr>
                  <td colspan="5">No hay vecinos registrados.</td>
                </tr>
                <% } %>
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
                window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
            }
        });
    }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src = "${pageContext.request.contextPath}/vistas/jsp/SERENAZGO/ListaVecinos/script_tabla.js"></script>
    
    <!-- End custom js for this page -->
  </body>
</html>