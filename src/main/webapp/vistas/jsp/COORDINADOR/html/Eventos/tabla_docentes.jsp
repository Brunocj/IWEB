<%@ page import="org.example.webappsm.model.beans.Profesor" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.webappsm.model.daos.ProfesorDao" %>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Usuario usuariologueado= (Usuario) session.getAttribute("usuarioLogueado");%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Profesores disponibles para el registro</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/css/Eventos/styles_tabla_docentes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
      .filter-row {
        display: flex;
        align-items: center;
        gap: 10px;
      }
      .filter-row label {
        margin-bottom: 0;
        font-weight: bold;
        color: #000;
      }
      .filter-row input {
        background-color: #000;
        color: #fff;
        border: none;
        padding: 5px;
        border-radius: 5px;
      }
      .filter-row button {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 5px 10px;
        background-color: #000;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
    </style>
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

      <jsp:include page="<%= menuvecino %>">
        <jsp:param name="activePage" value="eventos"/>
      </jsp:include>
      <div class="main-panel">
        <div class="content-wrapper" style="background-color: #bdf1f5;">
          <div style="display: flex; justify-content: space-between;">
            <div style="display: flex; justify-content: space-between;">
              <div style="display: flex; flex-direction: column; margin-bottom: 20px">
                <h2 class="tabla-title" style="color:#000f22;">Lista de docentes</h2>
                <%
                  List<Profesor> listaprofesor = (List<Profesor>) request.getAttribute("listaprofesor");
                %>
                <div style="display: flex; gap:30px;">
                  <div style="display: flex; align-items: center; justify-content: center;">
                    <button id="agregarDocenteButton" class="btnTable" style="display: flex; align-items: center;">
                      Agregar Docente
                      <a class="mdi mdi-account-plus" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div style="margin-bottom: 20px;">
            <form id="filterForm" method="GET" action="${pageContext.request.contextPath}/Coordinador" class="filter-row">
              <input type="hidden" name="action" value="tablaProfesores">
              <input type="hidden" name="id" value="<%= usuariologueado.getIdArea()%>">
              <label for="fechadispo">Fecha:</label>
              <input type="date" id="fechadispo" name="fechadispo">
              <label for="horaIniciodispo">Hora de Inicio:</label>
              <input type="time" id="horaIniciodispo" name="horaIniciodispo">
              <label for="horaFindispo">Hora de Finalización:</label>
              <input type="time" id="horaFindispo" name="horaFindispo">
              <button type="submit" id="filtro_button2" class="btnTable">
                Filtrar Disponibilidad
                <a class="mdi mdi-account-plus" style="color: #ffffff; font-size: 20px; margin-left: 5px;"></a>
              </button>
            </form>
          </div>

          <table id="miTabla" class="table" style="margin-bottom:15px;">
            <thead style="background-color: #e0e9ff;">
              <tr style="text-align: center; font-weight:800;">
                <th></th>
                <th>Curso</th>
                <th>Area</th>
                <th>Profesor</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody style="text-align: center;">
              <% for (Profesor profesor1 : listaprofesor) { %>
              <%
                int disponibilidad = profesor1.getDisponibilidad();
                String disponibilidadTexto = "";
                if (disponibilidad == 3) {
                  disponibilidadTexto = "Falta filtrar";
                } else if (disponibilidad == 0) {
                  disponibilidadTexto = "No Disponible";
                } else if (disponibilidad == 1) {
                  disponibilidadTexto = "Disponible";
                }
              %>
              <tr data-disponibilidad="<%= disponibilidadTexto %>" style="text-align: center;">
                <td><input type="checkbox" name="opcion" value="<%= profesor1.getIdProfesor() %>"></td>
                <td><a><%= profesor1.getCurso() %></a></td>
                <td><a><%= profesor1.getNombreArea() %></a></td>
                <td><a><%= profesor1.getNombre() %></a></td>
                <td><a><%= disponibilidadTexto %></a></td>
              </tr>
              <% } %>
            </tbody>
          </table>

          <br>
          <br>
          <br>
          <div class="button-container">
            <button class="button" onclick="goBack('<%= request.getContextPath() %>',<%=usuariologueado.getId() %>)">Regresar</button>
          </div>

        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
    <script src="../assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/vistas/jsp/COORDINADOR/js/Eventos/script_tabla_docentes.js"></script>
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
            window.location.href = "${pageContext.request.contextPath}/sys?action=logout";
          }
        });
      }

      function goBack(contextPath,id) {
        window.location.href = contextPath+"/Coordinador?action=eventos&id="+id;
      }

      document.addEventListener('DOMContentLoaded', function() {
        const checkboxes = document.querySelectorAll('input[name="opcion"]');
        const botonAgregar = document.getElementById('agregarDocenteButton');

        checkboxes.forEach(function(checkbox) {
          checkbox.addEventListener('change', function() {
            checkboxes.forEach(function(cb) {
              cb.checked = (cb === checkbox && cb.checked);
            });
          });
        });

        botonAgregar.addEventListener('click', function() {
          const checkboxSeleccionado = document.querySelector('input[name="opcion"]:checked');

          if (!checkboxSeleccionado) {
            seleccionar();
            return;
          }

          const fila = checkboxSeleccionado.closest('tr');
          const disponibilidad = fila.getAttribute('data-disponibilidad');

          if (disponibilidad === 'Disponible') {
            Swal.fire({
              title: "Estás seguro?",
              text: "Una vez agregue a un docente, se actualizará el registro del profesor",
              icon: "warning",
              showCancelButton: true,
              confirmButtonColor: "#00913f",
              cancelButtonColor: "#d33",
              confirmButtonText: "Sí, agregar",
              cancelButtonText: "Cancelar"
            }).then((result) => {
              if (result.isConfirmed) {
                const idProfesor = checkboxSeleccionado.value;
                console.log("ID Profesor seleccionado: " + idProfesor);  // Añadir esta línea para depuración
                if (idProfesor) {
                  const url = '${pageContext.request.contextPath}/Coordinador?action=profesorEscogido&idProfesor='+idProfesor;
                  console.log("Generated URL: " + url);  // Debug URL
                  window.location.href = url;
                } else {
                  seleccionar();
                }
              }
            });
          } else if (disponibilidad === 'No Disponible') {
            no_disponible();
          } else if (disponibilidad === 'Falta filtrar') {
            falta_filtrar();
          }
        });
      });

      function falta_filtrar() {
        Swal.fire({
          title: "Alerta",
          text: "Tienes que utilizar los parámetros de fecha y hora para poder elegir al profesor",
          icon: "warning",

          confirmButtonColor: "#00913f",
          confirmButtonText: "ok",

        });
        return false;
      }

      function no_disponible() {
        Swal.fire({
          title: "Alerta",
          text: "El docente que ha seleccionado no se encuentra disponible",
          icon: "warning",
          confirmButtonColor: "#00913f",
          confirmButtonText: "ok"
        });
        return false;
      }

      function seleccionar() {
        Swal.fire({
          text: "Ningún docente está seleccionado, por favor seleccionar uno",
          icon: "warning",
          confirmButtonColor: "#00913f",
          confirmButtonText: "ok"
        });
        return false;
      }
    </script>
  </body>
</html>
