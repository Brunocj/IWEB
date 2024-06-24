<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/LOGIN/styles.css">
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
              <div class = "flex">
                  <input type="hidden" name="idrol" value="3">
                  <input type="hidden" name="baneado" value="0">
                  <input type="hidden" name="idestado" value="1">
                  <input type="hidden" name="falsasAlarmas" value="0">

                <input type="text" name="nombre" id="nombre"  class="fadeIn second" placeholder="Nombre" required>
                <input type="text" name="apellido" id="apellido" class="fadeIn second" placeholder="Apellido" required>
              </div>
              <div class= "flex" id="documentSection">
                <select id="docList" name="idDoc" class="fadeIn third" style="text-align: center; color: #757575;" required>
                  <option value="" selected disabled style="text-align: left;" >Documento</option>
                  <option value="1" style="text-align: left;">DNI</option>
                  <option value="3" style="text-align: left;">Pasaporte</option>
                  <option value="2" style="text-align: left;">Carnet de extranjería</option>
                </select>
                <input type="text" name="documento" id="documento" class="fadeIn third"  placeholder="Nro. Documento" required>
              </div>
              <input type="text" name="direccion" class="fadeIn fourth"  placeholder="Direccion" required>
              <div class = "flex">  
                <input type="text" name="distrito" id="distrito" class="fadeIn fifth"  placeholder="Distrito" required>
                <input type="text" name="urbanizacion" id="urbanizacion" class="fadeIn fifth" placeholder="Urbanización" required>
              </div>  
              <input type="email" name="correo" class="fadeIn sixth" placeholder="Correo" required>
                <input type="text" name="contacto" class="fadeIn sixth" placeholder="Número de cntacto" required>
              <input type="submit" class="fadeIn sixth" value="Enviar solicitud de registro">
            </form>
            
        </div>
      </div>
      
    
    <div class="circle"></div>
    <div class="background"></div>
    <div class="bottom-left-button">
      <a href="${pageContext.request.contextPath}/sys?action=login" class="btn">Volver</a>
    </div>
    
</body>
</html>
