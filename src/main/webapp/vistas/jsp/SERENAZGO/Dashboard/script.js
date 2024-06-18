const menuToggle = document.getElementById('menuToggle');
const container = document.querySelector('.container');

menuToggle.addEventListener('click', function() {
    container.classList.toggle('menu-open');
});

    function mostrarPopupCerrarSesion() {
        Swal.fire({
            title: 'Cerrar sesión',
            text: '¿Estás seguro de que deseas cerrar sesión?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, cerrar sesión'
        }).then((result) => {
            if (result.isConfirmed) {
                // Aquí puedes poner el código para cerrar sesión
                // Por ejemplo, redirigir a la página de inicio de sesión
                window.location.href = "../LOGIN/login.html"; 
            }
        });
    }
