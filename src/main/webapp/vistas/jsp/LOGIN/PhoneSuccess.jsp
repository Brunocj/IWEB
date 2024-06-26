<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="org.example.webappsm.model.beans.Usuario"/>

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
          <h1 class="active">¡Su número telefónico ha sido cambiado con éxito!</h1>
      
          <!-- Icon -->
          <div class="fadeIn first">
            <img src="${pageContext.request.contextPath}/vistas/jsp/logoSMletra.png" id="icon" alt="User Icon" />
          </div>
      
          <!-- Login Form -->
          <form>
              <%
                  String vista = "";
                  switch (usuarioLogueado.getIdRol()){
                      case 1:
                          vista = request.getContextPath() + "/Admin?action=pagPrincipal";
                          break;
                      case 2:
                          vista = request.getContextPath() + "/Serenazgo?action=pagPrincipal";
                          break;
                      case 3:
                          vista = request.getContextPath() + "/Vecino?action=pagPrincipal";
                          break;
                      case 4:
                          vista = request.getContextPath() + "/Coordinador?action=pagPrincipal";
                          break;
                  }

              %>

            <input type="submit" class="fadeIn fourth" value="Regresar a la página principal" formaction="<%=vista%>">
            
          </form>
      
          <!-- Remind Passowrd -->
          
      
        </div>
      </div>
    <div class="circle"></div>
    <div class="background"></div>
     <!-- Nuevo elemento para el círculo -->
</body>
</html>
