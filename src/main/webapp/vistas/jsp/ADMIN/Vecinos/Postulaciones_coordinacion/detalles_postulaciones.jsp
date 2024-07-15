<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 27/05/2024
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Usuario usuario =(Usuario) request.getAttribute("usuarioVerCoordi");%>
<% String contra = (String) request.getAttribute("contra");%>
<% int idPostulacion =(int) request.getAttribute("id");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Postulación a coordinador: <%=usuario.getNombre()%></title>
    <!-- plugins:css -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/styles_detalles_solicitudes.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/vistas/jsp/LogoSM.png" /> <!--Cambiar la ubicacion del logo de la pagina aca tmb-->
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>


<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->
    <!-- partial:../../partials/_sidebar.html -->
    <!-- partial:../../partials/_sidebar.html -->

    <%
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Admin"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>


    <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="tablaCoordinador"/>
    </jsp:include>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #FFEBEE;margin-top: -30px"> <!--Cambiar al color mas claro-->
                <!--CONTENIDO-->

                <div class="card1">
                    <div class = "wrapper"id="formContent">
                        <!-- Tabs Titles -->
                        <div class="header-container">
                            <h2 style="margin-top: 0; margin-bottom: 20px; text-align: left;font-size: 25px;">Solicitud a coordinación</h2>
                            <a href="tabla_postulaciones.jsp" class="button"onclick="return Cancelar();">Regresar</a>
                        </div>
                        <hr style="border: none; border-top: 2px solid black;">
                        <!-- Icon -->

                        <!-- Login Form -->
                        <form id="miFormularioPostulacion" action="${pageContext.request.contextPath}/Admin?action=opcionSoli" method="post">
                            <input type="hidden" name="action" value="opcionSoli">
                            <input type="hidden" id="idUser" name="idUser" value="<%=idPostulacion%>">
                            <%
                                int idArea;
                                if(usuario.getArea().equals("Cultura")){
                                    idArea = 1;
                                }else{
                                    idArea = 2;
                                }
                            %>
                            <input type="hidden" id="idArea" name="idArea" value="<%=idArea%>">
                            <input type="hidden" id="opcionSeleccionada" name="opcionSeleccionada" value="">
                            <div class="inputs">
                                <label for="nombre" style="font-size: 12px; color: gray;">Nombres:</label>
                                <input type="text" id="nombre" value="<%=usuario.getNombre()%>" disabled style="margin-bottom: 5px; background-color: rgb(241, 241, 241);">

                                <label for="apellido" style="font-size: 12px; color: gray;">Apellidos:</label>
                                <input type="text" id="apellido" value="<%=usuario.getApellido()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);" >

                                <label for="dni" style="font-size: 12px; color: gray;">DNI-peruano:</label>
                                <input type="text" id="dni" value="<%=usuario.getDocumento()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="direccion" style="font-size: 12px; color: gray;">Distrito:</label>
                                <input type="text" id="direccion" value="<%=usuario.getDistrito()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="telefono" style="font-size: 12px; color: gray;">Urbanización:</label>
                                <input type="text" id="telefono" value="<%=usuario.getNumContacto()%>" style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="correo" style="font-size: 12px; color: gray;">Correo(gmail):</label>
                                <input type="text" id="correo" value="<%=usuario.getCorreoE()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">


                                <label for="area" style="font-size: 12px; color: gray;">Coordinación [Deporte/Cultura]</label>
                                <input type="text" id="area" value="<%=usuario.getArea() %>" disabled style="margin-bottom: -15px;background-color: rgb(236, 243, 207);">
                            </div>

                            <label for="solicitud" style="font-size: 16px; color: rgb(5, 0, 0); padding: 5px; float:left; font-weight: bold;">Solicitud a Coordinación:</label>
                            <hr style="margin-top: 60px;margin-bottom: 0px; ">

                            <label style="color: black; float:left; cursor: pointer;">
                                <input type="radio" name="opcion" value="aprobar" style="margin-top: 15px;cursor: pointer;" onclick="showApproveContent('<%=usuario.getNombre()%>', '<%=usuario.getArea()%>', '<%=contra%>')"> Aprobar
                            </label>

                            <label style="color: black; float:left; margin-left: 20px; cursor: pointer;">
                                <input type="radio" name="opcion" value="denegar" style="margin-left: 5px;margin-top: 15px;cursor: pointer;" onclick="showDenyContent('<%=usuario.getNombre()%>', '<%=usuario.getArea()%>')"> Denegar
                            </label>




                            <input type="hidden" id="tituloCorreo" name="tituloCorreo" value="">
                            <input type="hidden" id="cuerpoCorreo" name="cuerpoCorreo" value="">
                            <input type="hidden" id="contra" name="contra" value="<%=contra%>">


                            <br>
                            <br>

                            <a class="mdi mdi-alert-box" style="color: rgb(182, 1, 1); font-size: 20px; vertical-align: middle; float:left;"></a>
                            <label for="solicitud" style="font-size: 14px; color: rgb(182, 1, 1); padding: 5px; float:left;">Deberá rellenar/modificar obligatoriamente los siguientes campos:</label>

                            <div class="inputs">
                                <label for="titulo" style="font-size: 12px; color: gray; margin-top:35px;">Asunto de correo:</label>
                                <input type="text" id="titulo" value="Marca una opción por favor" disabled style="margin-bottom: 2px; font-size: 16px; color: rgb(156, 150, 150); background-color: white;">

                                <label for="cuerpo" style="font-size: 12px; color: gray;">Cuerpo del correo:</label>
                                <textarea id="cuerpo" class="correo-cuerpo" disabled style="color: rgb(156, 150, 150); font-size: 16px; background-color: white;">
    Marca una opción por favor
                        </textarea>
                                </textarea>
                            </div>





                            <div class = "buttons">
                                <input type="submit" class="green" value="Guardar y enviar" onclick="return Guardar();">
                                <input type="submit" class="red" value="Cancelar" onclick="return Cancelar();">
                            </div>

                        </form>

                    </div>


                </div>


            </div>

        </div>
        <!-- page-body-wrapper ends -->
    </div>

    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="<%=request.getContextPath()%>/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<%=request.getContextPath()%>/assets/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/hoverable-collapse.js"></script>
    <script src="../../../../assets/js/misc.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/settings.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/todolist.js"></script>


<script>

        /* Funciones para que el texto cambie de acuerdo a lo indicado*/

        function showApproveContent(nombreUsuario, area,contra) {
            document.getElementById("opcionSeleccionada").value = "aprobar";

            var tituloTexto = "SOLICITUD ACEPTADA- Solicitud para coordinación de " + area + " exitosa (Eventos- San Miguel)";
            var cuerpoTexto = "Estimado/a " + nombreUsuario + ",\n\nNos complace informarte que tu solicitud para el rol de coordinador en " + area + " ha sido aceptada. Esperamos con entusiasmo trabajar contigo para fortalecer nuestra comunidad y llevar a cabo diversos proyectos.\n\nTu nueva contraseña para acceder al sistema es: " + contra + ". Reinicia la página y cambia a una contraseña segura tan pronto como sea posible. Si tienes alguna pregunta o necesitas asistencia, no dudes en contactarnos.\nBienvenido coordinador y gracias por tu compromiso con el distrito de San Miguel.\n\nAtentamente,\nLa administración";

            // Establecer los valores de los campos ocultos
            document.getElementById("tituloCorreo").value = tituloTexto;
            document.getElementById("cuerpoCorreo").value = cuerpoTexto;

            // Mostrar los textos en los campos de título y cuerpo del formulario
            var titulo = document.getElementById("titulo");
            var cuerpo = document.getElementById("cuerpo");
            titulo.style.color = "black";
            titulo.value = tituloTexto;
            cuerpo.style.color = "black";
            cuerpo.style.fontSize = "14px";
            cuerpo.value = cuerpoTexto;

            titulo.removeAttribute("disabled");
            cuerpo.removeAttribute("disabled");
        }

        function showDenyContent(nombreUsuario, area) {
            document.getElementById("opcionSeleccionada").value = "denegar";

            var tituloTexto = "SOLICITUD DENEGADA- Solicitud para coordinación de " + area + " fallida (Eventos- San Miguel)";
            var cuerpoTexto = "Estimado " + nombreUsuario + ",\n\nLamentamos informarte que tu solicitud para el rol de coordinador en el área de " + area + " ha sido rechazada en esta ocasión. Apreciamos tu interés en contribuir al bienestar de nuestra comunidad, y te animamos a explorar otras oportunidades de participación en otra ocasión. Si tienes alguna pregunta o necesitas más información, no dudes en contactar a nosotros.\n\nAtentamente,\nLa administración";

            // Establecer los valores de los campos ocultos
            document.getElementById("tituloCorreo").value = tituloTexto;
            document.getElementById("cuerpoCorreo").value = cuerpoTexto;

            // Mostrar los textos en los campos de título y cuerpo del formulario
            var titulo = document.getElementById("titulo");
            var cuerpo = document.getElementById("cuerpo");
            titulo.style.color = "black";
            titulo.value = tituloTexto;
            cuerpo.style.color = "black";
            cuerpo.style.fontSize = "14px";
            cuerpo.value = cuerpoTexto;

            titulo.removeAttribute("disabled");
            cuerpo.removeAttribute("disabled");
        }


        /* aqui muere*/



        function Cancelar() {
            Swal.fire({
                title: "Estás seguro?",
                text: "Perdera todo su progreso",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Sí, cancelar",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Cancelado!",
                        text: "Se ha cancelado satisfactoriamente",
                        icon: "success"
                    }).then(() => {
                        window.location.href = "${pageContext.request.contextPath}/Admin?action=tablaCoordinador";
                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }

        function Guardar() {
            var opcionSeleccionada = document.getElementById("opcionSeleccionada").value;
            console.log("Opción seleccionada:", opcionSeleccionada);
            var id = document.getElementById("idUser").value;
            // Verificar si se ha seleccionado alguna opción
            if (!opcionSeleccionada) {
                // Mostrar un mensaje de error si no se ha seleccionado ninguna opción
                console.log("Error: No se ha seleccionado ninguna opción.");
                Swal.fire({
                    title: "Error",
                    text: "Por favor, selecciona una opción antes de guardar",
                    icon: "error",
                    confirmButtonColor: "#00913f",
                });
                return false; // Prevenir el envío del formulario
            }

            // Mostrar el popup de confirmación
            console.log("Mostrando pop-up de confirmación...");
            Swal.fire({
                title: "Estás seguro?",
                text: "El proceso no podrá ser reversible",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Si, guardar y enviar"
            }).then((result) => {
                if (result.isConfirmed) {
                    // Enviar el formulario
                    var idInput = document.createElement("input");
                    idInput.type = "hidden";
                    idInput.name = "id";
                    idInput.value = id;
                    document.getElementById("miFormularioPostulacion").appendChild(idInput);
                    console.log("Enviando formulario...");
                    document.getElementById("miFormularioPostulacion").submit();
                } else {
                    console.log("Operación cancelada.");
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
