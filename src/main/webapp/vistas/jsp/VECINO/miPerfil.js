function openChangePasswordPopup(userId) {
    Swal.fire({
        title: "Cambiar Contraseña",
        html: `
            <input id="old-password" type="password" class="swal2-input" placeholder="Contraseña Antigua">
            <input id="new-password" type="password" class="swal2-input" placeholder="Nueva Contraseña">
            <input id="confirm-password" type="password" class="swal2-input" placeholder="Confirmar Nueva Contraseña">
        `,
        focusConfirm: false,
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Cambiar',
        confirmButtonColor: '#12bd52', // Green color for Confirm button
        cancelButtonColor: '#f60606', // Red color for Cancel button
        preConfirm: () => {
            const oldPassword = document.getElementById("old-password").value;
            const newPassword = document.getElementById("new-password").value;
            const confirmPassword = document.getElementById("confirm-password").value;

            if (!oldPassword || !newPassword || !confirmPassword) {
                Swal.showValidationMessage("Por favor ingrese todos los datos");
                return false;
            }

            if (newPassword !== confirmPassword) {
                Swal.showValidationMessage("Las contraseñas no coinciden");
                return false;
            }

            return { oldPassword, newPassword };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            validateOldPassword(userId, result.value.oldPassword, result.value.newPassword);
        }
    });
}

function validateOldPassword(userId, oldPassword, newPassword) {
    const params = new URLSearchParams();
    params.append('userId', userId);
    params.append('oldPassword', oldPassword);

    const contextPath = window.location.pathname.split('/')[1]; // Obtener el contexto

    fetch(`/${contextPath}/sys?action=validatePassword`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params.toString()
    })
        .then(response => response.text())
        .then(data => {
            if (data === "valid") {
                updatePassword(userId, newPassword);
            } else {
                Swal.fire('Error', 'La contraseña antigua es incorrecta', 'error');
            }
        })
        .catch(error => {
            Swal.fire('Error', 'Hubo un problema al validar la contraseña antigua', 'error');
        });
}








function updatePassword(userId, newPassword) {
    const params = new URLSearchParams();
    params.append('userId', userId);
    params.append('newPassword', newPassword);

    const contextPath = window.location.pathname.split('/')[1]; // Obtener el contexto

    fetch(`/${contextPath}/sys?action=updatePassword`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params.toString()
    })
        .then(response => response.text())
        .then(data => {
            if (data === "success") {
                Swal.fire('Éxito', 'La contraseña ha sido cambiada', 'success');
            } else {
                Swal.fire('Error', 'No se pudo cambiar la contraseña', 'error');
            }
        })
        .catch(error => {
            Swal.fire('Error', 'Hubo un problema al cambiar la contraseña', 'error');
        });
}
