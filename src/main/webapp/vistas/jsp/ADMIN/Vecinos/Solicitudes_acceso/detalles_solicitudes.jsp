
<%@ page import="org.example.webappsm.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Usuario usuario=(Usuario) request.getAttribute("usuarioVer");%>
<% String contra = (String) request.getAttribute("contra");%>
<% int idUser =(int) request.getAttribute("id");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud de acceso</title>
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

    <%
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null) {
            userRole = "Admin"; // Por defecto, si no hay rol en la sesión
        }
        String menuadmin = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>


    <jsp:include page="<%= menuadmin %>">
        <jsp:param name="activePage" value="tablaAcceso"/>
    </jsp:include>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style ="background-color: #FFEBEE;margin-top: -30px"> <!--Cambiar al color mas claro-->
                <!--CONTENIDO-->

                <div class="card1">
                    <div class = "wrapper"id="formContent">
                        <!-- Tabs Titles -->
                        <div class="header-container">
                            <h2 style="margin-top: 0; margin-bottom: 20px; text-align: left;font-size: 25px;">Solicitud de Acceso a Plataforma</h2>
                            <a href="tabla_solicitudes.jsp" class="button" onclick="return Cancelar();">Regresar </a>
                        </div>
                        <hr style="border: none; border-top: 2px solid black;">
                        <!-- Icon -->

                        <!-- Login Form -->
                        <form id="miFormulario" action="${pageContext.request.contextPath}/Admin?action=opcionAcceso" method="post">
                            <input type="hidden" name="action" value="opcionAcceso">
                            <input type="hidden" id="idUser" name="idUser" value="<%=idUser%>">
                            <input type="hidden" id="opcionSeleccionada" name="opcionSeleccionada" value="">
                            <div class="inputs">
                                <label for="nombre" style="font-size: 12px; color: gray;">Nombres:</label>
                                <input type="text" id="nombre" value="<%=usuario.getNombre()%>" disabled style="margin-bottom: 5px; background-color: rgb(241, 241, 241);">

                                <label for="apellido" style="font-size: 12px; color: gray;">Apellidos:</label>
                                <input type="text" id="apellido" value="<%=usuario.getApellido()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="correo" style="font-size: 12px; color: gray;">Correo</label>
                                <input type="text" id="correo" value="<%=usuario.getCorreoE()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="dni" style="font-size: 12px; color: gray;">Dirección:</label>
                                <input type="text" id="dni" value="<%=usuario.getDocumento()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="direccion" style="font-size: 12px; color: gray;">Distrito:</label>
                                <input type="text" id="direccion" value="<%=usuario.getDistrito()%>" disabled style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">

                                <label for="telefono" style="font-size: 12px; color: gray;">Número de Teléfono</label>
                                <input type="text" id="telefono" value="<%=usuario.getNumContacto()%>" style="margin-bottom: 5px;background-color: rgb(241, 241, 241);">
                            </div>

                            <label for="solicitud" style="font-size: 16px; color: rgb(5, 0, 0); padding: 5px; float:left; font-weight: bold;">Solicitud de acceso:</label>
                            <hr style="margin-top: 60px;margin-bottom: 0px; ">

                            <label style="color: black; float:left; cursor: pointer;">
                                <input type="radio" name="opcion" value="aprobar" style="margin-top: 15px;cursor: pointer;" onclick="showApproveContent('<%=usuario.getNombre()%>','<%=contra%>')"> Aprobar
                            </label>

                            <label style="color: black; float:left; margin-left: 20px; cursor: pointer;">
                                <input type="radio" name="opcion" value="denegar" style="margin-left: 5px;margin-top: 15px;cursor: pointer;" onclick="showDenyContent('<%=usuario.getNombre()%>')"> Denegar
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
        <script src="<%=request.getContextPath()%>/assets/js/misc.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/settings.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script>

        /* Funciones para que el texto cambie de acuerdo a lo indicado*/

        function showApproveContent(nombreUsuario, contra) {

            document.getElementById("opcionSeleccionada").value = "aprobar";

            var tituloTexto  = "SOLICITUD ACEPTADA- Registro exitoso (Eventos- San Miguel)";
            var cuerpoTexto= "Estimado " + nombreUsuario + ",\n\nNos complace informarte que tu solicitud de registro ha sido aceptada para los Eventos San Miguel. Agradecemos sinceramente tu interés en participar y unirte a nuestros emocionantes eventos.\nPara comenzar, aquí está tu contraseña temporal para acceder a la página: Contraseña temporal: " + contra + ". Recuerda que es importante mantener esta contraseña segura y cambiarla después de iniciar sesión por primera vez.\nSi tienes alguna pregunta o necesitas asistencia en cualquier momento, no dudes en contactarnos. Estamos aquí para ayudarte.\n\n¡Bienvenido a la comunidad de Eventos San Miguel!\n\nAtentamente,\nLa Administración";



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

        function showDenyContent(nombreUsuario) {

            document.getElementById("opcionSeleccionada").value = "denegar";

            var tituloTexto = "SOLICITUD DENEGADA- Registro fallido (Eventos- San Miguel)";
            var cuerpoTexto = "Estimado " + nombreUsuario + ",\n\nLamentamos informarte que tu solicitud de registro para los Eventos San Miguel ha sido rechazada en esta ocasión debido a [motivo].\nA pesar de esta decisión, queremos expresar nuestro agradecimiento por tu interés en participar en nuestros eventos. Valoramos tu dedicación y esperamos que puedas encontrar otras oportunidades para participar en el futuro.\nSi tienes alguna pregunta sobre el motivo de este rechazo o necesitas más información, no dudes en ponerte en contacto con nosotros. Estamos aquí para ayudarte en lo que necesites.\nApreciamos tu comprensión y esperamos poder contar contigo en futuras ocasiones.\n\nAtentamente,\nLa Administración";

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
                    window.location.href = "../../../LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                }
            });
        }

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
                        window.location.href = "${pageContext.request.contextPath}/Admin?action=tablaAcceso";
                    });
                }
            });

            // Evitar que el formulario se envíe automáticamente
            return false;
        }

        function Guardar() {
            // Obtener el valor de la opción seleccionada del campo oculto
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
                title: "¿Estás seguro?",
                text: "El proceso no podrá ser reversible",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#00913f",
                cancelButtonColor: "#d33",
                confirmButtonText: "Sí, guardar y enviar",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {
                    // Enviar el formulario
                    var idInput = document.createElement("input");
                    idInput.type = "hidden";
                    idInput.name = "id";
                    idInput.value = id;
                    document.getElementById("miFormulario").appendChild(idInput);
                    console.log("Enviando formulario...");
                    document.getElementById("miFormulario").submit();
                } else {
                    console.log("Operación cancelada.");
                }
            });

            // Prevenir el envío automático del formulario
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
