function mostrarPopupCerrarSesion() {
    Swal.fire({
        title: 'Cerrar sesión',
        text: '¿Estás seguro de que deseas cerrar sesión?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00913f',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, cerrar sesión',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
        }
    });
}
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

function openChangePhonePopup(userId) {
    Swal.fire({
        title: "Cambiar Número de Teléfono",
        html: `
            <input id="new-phoneNumber" type="tel" class="swal2-input" placeholder="Nuevo Número">
            <input id="confirm-phoneNumber" type="tel" class="swal2-input" placeholder="Confirmar Nuevo Número">
        `,
        focusConfirm: false,
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Cambiar',
        confirmButtonColor: '#12bd52', // Green color for Confirm button
        cancelButtonColor: '#f60606', // Red color for Cancel button
        preConfirm: () => {
            const newPhNumber = document.getElementById("new-phoneNumber").value.trim();
            const confirmPhNumber = document.getElementById("confirm-phoneNumber").value.trim();

            if (!newPhNumber || !confirmPhNumber) {
                Swal.showValidationMessage("Por favor ingrese todos los datos");
                return false; // Prevents the pop-up from closing
            } else if (newPhNumber !== confirmPhNumber) {
                Swal.showValidationMessage("Los números no coinciden");
                return false; // Prevents the pop-up from closing
            } else if (isNaN(newPhNumber) || isNaN(confirmPhNumber)) {
                Swal.showValidationMessage("Por favor ingrese solo números");
                return false; // Prevents the pop-up from closing
            } else if (newPhNumber.length !== 9) {
                Swal.showValidationMessage("Por favor ingrese un número de teléfono válido de 9 dígitos");
                return false; // Prevents the pop-up from closing
            }

            return { newPhNumber };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            updatePhNumber(userId, result.value.newPhNumber);
        }
    });
}




function updatePhNumber(userId, newPhNumber) {
    console.log("Updating phone number:", userId, newPhNumber);

    const params = new URLSearchParams();
    params.append('userId', userId);
    params.append('newPhNumber', newPhNumber);

    const contextPath = window.location.pathname.split('/')[1]; // Obtener el contexto
    console.log("Context path:", contextPath);

    fetch(`/${contextPath}/sys?action=updateNumber`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params.toString()
    })
        .then(response => {
            console.log("Response status:", response.status);
            return response.text();
        })
        .then(data => {
            console.log("Response data:", data);
            if (data === "success") {
                Swal.fire('Éxito', 'El número de teléfono ha sido actualizado', 'success');
            } else {
                Swal.fire('Error', 'Hubo un problema al actualizar el número de teléfono', 'error');
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
            Swal.fire('Error', 'Hubo un problema al actualizar el número de teléfono', 'error');
        });
}