const notificationBadge = document.getElementById('notification-count');
const notificationMessage = document.getElementById('notification-message');

// Mostrar el mensaje al pasar el mouse sobre la notificación
notificationBadge.addEventListener('mouseenter', () => {
  notificationMessage.style.display = 'block';
});

// Ocultar el mensaje al quitar el mouse de la notificación
notificationBadge.addEventListener('mouseleave', () => {
  notificationMessage.style.display = 'none';
});

function mostrarPopupVecino() {
  Swal.fire({
      title: 'Listas de Vecinos',
      text: '¿A qué lista de solicitudes deseas acceder?',
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#26DADA',
      cancelButtonColor: '#26DADA',
      confirmButtonText: 'Solicitudes de acceso',
      cancelButtonText: 'Solicitudes a coordinador',
      customClass: {
        confirmButton: 'boton-sin-borde' // Agregar una clase personalizada al botón de confirmación
    }
  }).then((result) => {
      if (result.isConfirmed) {
          window.location.href = "../ADMIN/Vecinos/Solicitudes a acceso/tabla_solicitudes.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
      }else if (result.dismiss === Swal.DismissReason.cancel) {
        // Acción a realizar si se cancela el cierre de sesión
        window.location.href = "../ADMIN/Vecinos/Postulaciones a coordinacion/tabla_postulaciones.html";
    }
  });
}
