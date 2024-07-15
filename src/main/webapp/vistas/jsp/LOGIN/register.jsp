<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/LOGIN/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- Incluye SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <style>
        #formContent {
            max-height: 90vh; /* Ajusta el tamaño según sea necesario */
            overflow-y: auto;
            overflow-x: hidden;
            padding: 20px; /* Opcional: para agregar espacio interno */
            border-radius: 10px;
            position: relative; /* Asegura que el contenido respetará los bordes */
        }

        #formContent::-webkit-scrollbar {
            width: 12px; /* Ancho de la barra de desplazamiento */
        }

        #formContent::-webkit-scrollbar-track {
            border-radius: 10px; /* Borde redondeado de la pista */
        }

        #formContent::-webkit-scrollbar-thumb {
            background-color: #cccccc; /* Color de la barra de desplazamiento */
            border-radius: 10px; /* Borde redondeado de la barra de desplazamiento */
            border: 3px solid #ffffff; /* Espacio interno para que el borde sea visible */
        }

    </style>
</head>
<body>

            <div class="wrapper fadeInDown">
                <div id="formContent">
                  <!-- Tabs Titles -->
                  <h2 class="active">Registro</h2>

                  <!-- Icon -->
                  <div class="fadeIn first">
                    <img src="${pageContext.request.contextPath}/vistas/jsp/logoSMletra.png" id="icon" alt="User Icon" />
                  </div>

                  <!-- Login Form -->
                    <form class="flexform" method="POST" action="${pageContext.request.contextPath}/sys?action=registerPOST">

                        <input type="hidden" name="idrol" value="3">
                        <input type="hidden" name="baneado" value="0">
                        <input type="hidden" name="idestado" value="1">
                        <input type="hidden" name="falsasAlarmas" value="0">

                        <div class="flex">
                            <div style="flex-basis: 50%;">
                                <input type="text" name="nombre" id="nombre" class="fadeIn second" placeholder="Nombre(s)"
                                       value="<%= (request.getParameter("nombre") != null) ? request.getParameter("nombre") : "" %>" required>
                                <% if (request.getAttribute("err1") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.3em;margin-top: -4px;max-width: 240px;margin-left: 33px;font-size: 11px;color: red;margin-right: -1px;">
                                    <%= request.getAttribute("err1") %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.3em; margin-top: -4px; max-width: 190px; margin-left: 35px; font-size: 12px;color: white;">
                                    <!-- Este div blanco mantendrá el espacio y la alineación -->

                                </div>
                                <% } %>
                            </div>

                            <div style="flex-basis: 50%;">
                                <input type="text" name="apellido" id="apellido" class="fadeIn second" placeholder="Apellidos"
                                       value="<%= (request.getParameter("apellido") != null) ? request.getParameter("apellido") : "" %>" required>
                                <% if (request.getAttribute("err2") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.3em;margin-top: -4px;max-width: 190px;margin-left: 6px;margin-right: 26px;font-size: 11px;color: red;">
                                    <%= request.getAttribute("err2") %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.3em; margin-top: -4px; max-width: 190px; margin-left: 6px; margin-right: 30px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->


                                </div>
                                <% } %>
                            </div>
                        </div>

                        <div class="flex" id="documentSection">
                            <div style="flex-basis: 50%;">
                                <select id="docList" name="idDoc" class="fadeIn third" style="text-align: center; color: #757575;" required>
                                    <option value="" selected disabled style="text-align: left;">Documento</option>
                                    <option value="1" style="text-align: left;">DNI</option>
                                    <option value="3" style="text-align: left;">Pasaporte</option>
                                    <option value="2" style="text-align: left;">Carnet de extranjería</option>
                                </select>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.8em; margin-top: -17px; max-width: 190px; margin-left: 6px; margin-right: 30px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->


                                </div>
                            </div>
                            <div style="flex-basis: 50%;">
                                <input type="text" name="documento" id="documento" class="fadeIn third" placeholder="Nro. Documento"
                                    value="<%= (request.getParameter("documento") != null) ? request.getParameter("documento") : "" %>" required>

                                <% if (request.getAttribute("err3") != null || request.getAttribute("err4") != null || request.getAttribute("err5") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.2em;margin-top: -4px;max-width: 190px;margin-left: 6px;margin-right: 26px;font-size: 11px;color: red;">
                                    <% if (request.getAttribute("err3") != null) { %>
                                    <%= request.getAttribute("err3") %><br>
                                    <% } %>
                                    <% if (request.getAttribute("err4") != null) { %>
                                    <%= request.getAttribute("err4") %><br>
                                    <% } %>
                                    <% if (request.getAttribute("err5") != null) { %>
                                    <%= request.getAttribute("err5") %>
                                    <% } %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.8em; margin-top: -10px; max-width: 190px; margin-left: 6px; margin-right: 30px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->


                                </div>
                                <% } %>
                            </div>
                        </div>


                        <div class="flex">

                            <div style="flex-basis: 100%;">
                                <input type="text" name="direccion" class="fadeIn fourth" placeholder="Direccion"
                                       value="<%= (request.getParameter("direccion") != null) ? request.getParameter("direccion") : "" %>" required>

                                <% if (request.getAttribute("err6") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.4em;margin-top: -4px;max-width: 390px;margin-left: 33px;margin-right: 27px;font-size: 11px;color: red;">
                                    <%= request.getAttribute("err6") %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.3em; margin-top: -4px; max-width: 390px; margin-left: 35px; margin-right: 30px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->
                                </div>
                                <% } %>
                            </div>

                        </div>


                        <div class="flex">
                            <div style="flex-basis: 50%;">
                                <input type="text" name="distrito" id="distrito" class="fadeIn fifth" placeholder="Distrito"
                                value="<%= (request.getParameter("distrito") != null) ? request.getParameter("distrito") : "" %>" required>

                                <% if (request.getAttribute("err7") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.2em;margin-top: -4px;max-width: 190px;margin-left: 32px;font-size: 11px;color: red;margin-right: -1px;">

                                    <%= request.getAttribute("err7") %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.3em; margin-top: -4px; max-width: 190px; margin-left: 6px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->
                                </div>
                                <% } %>
                            </div>

                            <div style="flex-basis: 50%;">
                                <input type="text" name="urbanizacion" id="urbanizacion" class="fadeIn fifth" placeholder="Urbanización"
                                value="<%= (request.getParameter("urbanizacion") != null) ? request.getParameter("urbanizacion") : "" %>" required>

                                <% if (request.getAttribute("err8") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.2em;margin-top: -4px;max-width: 190px;margin-left: 6px;margin-right: 26px;font-size: 11px;color: red;">
                                    <%= request.getAttribute("err8") %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.3em; margin-top: -4px; max-width: 190px; margin-left: 6px; margin-right: 30px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->
                                </div>
                                <% } %>
                            </div>
                        </div>









                        <div class="flex">
                            <div style="flex-basis: 100%;">
                                <input type="email" name="correo" class="fadeIn sixth" placeholder="Correo" required
                                       value="<%= (request.getParameter("correo") != null) ? request.getParameter("correo") : "" %>">

                                <% if (request.getAttribute("err9") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.3em;margin-top: -4px;max-width: 390px;margin-left: 32px;margin-right: 26px;font-size: 11px;color: red;">
                                    <%= request.getAttribute("err9") %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.3em; margin-top: -4px; max-width: 390px; margin-left: 35px; margin-right: 30px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->
                                </div>
                                <% } %>
                            </div>
                        </div>


                        <div class="flex">
                            <div style="flex-basis: 100%;">
                                <input type="text" name="contacto" class="fadeIn sixth" placeholder="Número de contacto" required
                                       value="<%= (request.getParameter("contacto") != null) ? request.getParameter("contacto") : "" %>">

                                <% if (request.getAttribute("err10") != null) { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: #ffc0cb;text-align: center;padding: 0.3em;margin-top: -4px;max-width: 390px;margin-left: 32px;margin-right: 26px;font-size: 11px;color: red;">
                                    <%= request.getAttribute("err10") %>
                                </div>
                                <% } else { %>
                                <div class="alert alert-danger" role="alert"
                                     style="background-color: white; text-align: center; padding: 0.3em; margin-top: -4px; max-width: 390px; margin-left: 35px; margin-right: 30px; font-size: 12px;color: white;">
                                    <!-- Cuadro blanco para mantener la alineación -->
                                </div>
                                <% } %>
                            </div>
                        </div>


                        <div class="flex">
                            <div style="flex-basis: 100%;">
                              <input type="submit" class="fadeIn seven" value="Enviar solicitud de registro">
                            </div>
                        </div>
                    </form>

                    <%-- JavaScript para llamar a Swal.fire condicionalmente --%>
                    <%-- JavaScript para llamar a Swal.fire condicionalmente --%>
                    <%-- JavaScript para llamar a Swal.fire condicionalmente --%>
                    <script>
                        <% if (request.getAttribute("msg") != null && "confirmacion".equals(request.getAttribute("msg"))) { %>
                        Swal.fire({
                            title: "Registro exitoso",
                            text: "Se le notificará por correo electrónico el estado de su registro",
                            icon: "success",
                            confirmButtonText: "OK"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "${pageContext.request.contextPath}/vistas/jsp/LOGIN/login.jsp";
                            }
                        });
                        <% } %>
                    </script>


                </div>
              </div>




    <div class="circle"></div>
    <div class="background"></div>
    <div class="bottom-left-button">
      <a href="${pageContext.request.contextPath}/sys?action=login" class="btn">Volver</a>
    </div>

</body>
</html>
