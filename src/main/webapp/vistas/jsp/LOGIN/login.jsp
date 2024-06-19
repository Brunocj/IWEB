<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->
          <h2 class="active"> Iniciar sesión </h2>
      
          <!-- Icon -->
          <div class="fadeIn first">
            <img src="logoSM.png" id="icon" alt="User Icon" />
          </div>
      
          <!-- Login Form -->
          <form>
            <input type="text" id="login" class="fadeIn second" name="login" placeholder="Usuario">
            <input type="text" id="password" class="fadeIn third" name="login" placeholder="Contraseña">
            <input type="submit" class="fadeIn fourth" value="Iniciar sesión" formaction="../VECINO/pagina_principal_vecino.html">
            
          </form>
      
          <!-- Remind Passowrd -->
          <div id="formFooter">
            <a style="color: black">No tienes una cuenta?<a class="underlineHover" href="register.jsp">Regístrate aquí</a></a>
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
