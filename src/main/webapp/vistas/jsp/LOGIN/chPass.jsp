<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contra</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->
          <h2 class="active"> Cambiar contraseña </h2>
      
          <!-- Icon -->
          <div class="fadeIn first">
            <img src="logoSM.png" id="icon" alt="User Icon" />
          </div>
      
          <!-- Login Form -->
          <form>
            <input type="text" id="login" class="fadeIn second" name="login" placeholder="Ingrese su nueva contraseña">
            <input type="text" id="password" class="fadeIn third" name="login" placeholder="Confirme su contraseña">
            <input type="submit" class="fadeIn fourth" value="Cambiar contraseña" formaction = "PassSuccess.html">
            
          </form>
      
          <!-- Remind Passowrd -->
          
      
        </div>
      </div>
    <div class="circle"></div>
    <div class="background"></div>
     <!-- Nuevo elemento para el círculo -->
     <div class="bottom-left-button">
      <a href="../VECINO/MiPerfil.html" class="btn">Volver</a>
    </div>
</body>
</html>
