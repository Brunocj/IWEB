<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/LOGIN/styles.css">
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active">Iniciar sesión</h2>

                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="${pageContext.request.contextPath}/vistas/jsp/logoSMletra.png" id="icon" alt="User Icon" />
                </div>
                <% if (request.getAttribute("err") != null) {%>
                <div class="alert alert-danger" role="alert" style="background-color: #ffc0cb; border: 1px solid red; text-align: center; padding: 7px; margin: 0 auto 10px; max-width: 380px;">
                    <%= request.getAttribute("err") %>
                    <br>
                    <% if (request.getAttribute("err2") != null) {%>
                    <%= request.getAttribute("err2") %>
                    <% } %>
                </div>
                <% } %>
                <!-- Login Form -->
                <form method="POST" action="${pageContext.request.contextPath}/sys?action=loginPOST">
                    <input type="text" id="login" class="fadeIn second" name="user" placeholder="Correo electrónico" value="<%= request.getAttribute("user") != null ? request.getAttribute("user") : "" %>">
                    <input type="password" id="password" class="fadeIn third" name="passwd" placeholder="Contraseña">
                    <input type="submit" class="fadeIn eight" value="Iniciar sesión">
                </form>

                <!-- Remind Password -->
                <div id="formFooter">
                    <p style="color: black">No tienes una cuenta? <a class="underlineHover" href="${pageContext.request.contextPath}/sys?action=register"><span>Regístrate aquí</span></a></p>
                    <p><a class="underlineHover" href="${pageContext.request.contextPath}/sys?action=recvPass">Olvidaste tu contraseña?</a></p>
                </div>
            </div>
        </div>
        <div class="circle"></div>
        <div class="background"></div>
    </body>
</html>
