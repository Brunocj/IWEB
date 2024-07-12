<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contra</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/LOGIN/styles.css">
</head>
<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->
          <h2 class="active"> Recuperar contraseña </h2>
      
          <!-- Icon -->
          <div class="fadeIn first">
            <img src="${pageContext.request.contextPath}/vistas/jsp/logoSMletra.png" id="icon" alt="User Icon" />
          </div>
      
          <!-- Login Form -->
          <form method="POST" action="${pageContext.request.contextPath}/sys?action=recvPassPOST">
              <input type="text" id="dni" class="fadeIn second" name="dni" placeholder="Ingrese su DNI">
              <input type="email" id="correo" class="fadeIn second" name="correo" placeholder="Ingrese el correo de su cuenta">
            <input type="submit" class="fadeIn fourth" value="Solicitar cambio de contraseña">
            
          </form>
      

          
      
        </div>
      </div>
    <div class="circle"></div>
    <div class="background"></div>
     <!-- Nuevo elemento para el círculo -->
     <div class="bottom-left-button">
      <a href="${pageContext.request.contextPath}/sys?action=login" class="btn">Volver</a>
    </div>
</body>
</html>
