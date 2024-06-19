<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
  
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->
          <h2 class="active">Registro</h2>
      
          <!-- Icon -->
          <div class="fadeIn first">
            <img src="logoSM.png" id="icon" alt="User Icon" />
          </div>
      
          <!-- Login Form -->
            <form class="flexform">
              <div class = "flex">
                <input type="text" id="nombre" class="fadeIn second" name="login" placeholder="Nombre">
                <input type="text" id="apellido" class="fadeIn second" name="login" placeholder="Apellido">
              </div>
              <div class= "flex" id="documentSection">
                <select id="docList" name="document" class="fadeIn third">
                  <option value="">Seleccione su documento</option>
                  <option value="DNI">DNI</option>
                  <option value="Pasaporte">Pasaporte</option>
                  <option value="Pasaporte">Carnet de extranjería</option>
                </select>
                <input type="text" id="documento" class="fadeIn third" name="login" placeholder="Documento">
              </div>
              <input type="text" id="direccion" class="fadeIn fourth" name="login" placeholder="Direccion">
              <div class = "flex">  
                <input type="text" id="distrito" class="fadeIn fifth" name="login" placeholder="Distrito">
                <input type="text" id="urbanizacion" class="fadeIn fifth" name="login" placeholder="Urbanización">
              </div>  
              <input type="text" id="correo" class="fadeIn sixth" name="login" placeholder="Correo">
              <input type="submit" class="fadeIn sixth" value="Enviar solicitud de registro" formaction = "login.html">
            </form>
            
        </div>
      </div>
      
    
    <div class="circle"></div>
    <div class="background"></div>
    <div class="bottom-left-button">
      <a href="login.jsp" class="btn">Volver</a>
    </div>
    
</body>
</html>
