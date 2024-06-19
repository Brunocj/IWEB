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
          <h2 class="active"> Iniciar sesión </h2>
            <% if (request.getAttribute("err") != null) {%>
            <div class="alert alert-danger" role="alert" style="color: red"><%=request.getAttribute("err")%>
            </div>
            <% } %>
          <!-- Icon -->
          <div class="fadeIn first">
            <img src="${pageContext.request.contextPath}/vistas/jsp/logoSMletra.png" id="icon" alt="User Icon" />
          </div>
      
          <!-- Login Form -->
          <form method="POST" action="${pageContext.request.contextPath}/sys">
            <input type="text" id="login" class="fadeIn second" name="user" placeholder="Usuario">
            <input type="text" id="password" class="fadeIn third" name="passwd" placeholder="Contraseña">
              <button type="submit" class="fadeIn fourth" >Iniciar sesión</button>
            
          </form>
      
          <!-- Remind Passowrd -->
          <div id="formFooter">
              <a style="color: black">No tienes una cuenta?<a class="underlineHover" href="register.jsp"><span>Regístrate aquí</span></a></a>
            <h1></h1>
            <a class="underlineHover" href="recvPass.jsp">Olvidaste tu contraseña?</a>
          </div>
      
        </div>
      </div>
    <div class="circle"></div>
    <div class="background"></div>
     <!-- Nuevo elemento para el círculo -->
</body>
</html>
