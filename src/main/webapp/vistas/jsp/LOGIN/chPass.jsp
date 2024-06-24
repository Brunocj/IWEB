
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int idUsuario = (int) request.getAttribute("idUsuario");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contra</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/LOGIN/styles.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->
        <h2 class="active"> Cambiar contraseña </h2>

        <!-- Icon -->
        <div class="fadeIn first">
            <img src="${pageContext.request.contextPath}/vistas/jsp/logoSMletra.png" />
        </div>

        <!-- Login Form -->
        <form id="changePasswordForm" onsubmit="return validateForm()" method="POST" action="${pageContext.request.contextPath}/sys?action=chPassPOST&id=<%=idUsuario%>">
            <input type="password" id="currentPass" class="fadeIn second" name="currentPass" placeholder="Ingrese contraseña actual" required>
            <input type="password" id="newPassword" class="fadeIn second" name="newPassword" placeholder="Ingrese su nueva contraseña" required>
            <input type="password" id="confirmPassword" class="fadeIn third" placeholder="Confirme su contraseña" required>
            <input type="submit" class="fadeIn fourth" value="Cambiar Contraseña">
        </form>

        <!-- Remind Password -->


    </div>
</div>
<div class="circle"></div>
<div class="background"></div>
<!-- Nuevo elemento para el círculo -->
<div class="bottom-left-button">
    <a href="../VECINO/MiPerfil.html" class="btn">Volver</a>
</div>

<script>
    function validateForm() {
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Las contraseñas no coinciden. Inténtalo de nuevo.',
                confirmButtonColor: '#56baed'
            });
            return false;
        }

        return true;
    }
</script>
</body>
</html>
