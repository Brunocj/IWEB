<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="org.example.webappsm.model.beans.Usuario"/>


<%
    int idUsuario = (int) request.getAttribute("idUsuario");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Celular</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/LOGIN/styles.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->
          <h2 class="active"> Cambio de número telefónico </h2>
      
          <!-- Icon -->
          <div class="fadeIn first">
            <img src="${pageContext.request.contextPath}/vistas/jsp/logoSMletra.png"  id="icon" alt="User Icon" />
          </div>
      
          <!-- Login Form -->
          <form onsubmit="return validateForm()" method="POST" action="${pageContext.request.contextPath}/sys?action=chPhonePOST&id=<%=idUsuario%>">
              <input type="text" id="newPhone" class="fadeIn second" name="newPhone" placeholder="Ingrese su nuevo número" required>
              <input type="text" id="newPhoneConfirm" class="fadeIn third" name="newPhoneConfirm" placeholder="Confirme su número" required>
            <input type="submit" class="fadeIn fourth" value="Cambiar número telefónico">
            
          </form>
      
          <!-- Remind Passowrd -->
          
      
        </div>
      </div>
    <div class="circle"></div>
    <div class="background"></div>
     <!-- Nuevo elemento para el círculo -->
     <div class="bottom-left-button">
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
         <a href="<%=vista%>" class="btn">Volver</a>
    </div>

    <script>
        function validateForm() {
            const newPhone = document.getElementById('newPhone').value;
            const newPhoneConfirm = document.getElementById('newPhoneConfirm').value;

            if (newPhone !== newPhoneConfirm) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Los datos ingresados no coinciden, inténtelo de nuevo.',
                    confirmButtonColor: '#56baed'
                });
                return false;
            }

            return true;
        }

    </script>
</body>
</html>