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
      confirmButtonColor: '#3c72f3',
      cancelButtonColor: '#3c72f3',
      confirmButtonText: 'Solicitudes de acceso',
      cancelButtonText: 'Solicitudes a coordinador',
      customClass: {
        confirmButton: 'boton-sin-borde' // Agregar una clase personalizada al botón de confirmación
    }
  }).then((result) => {
      if (result.isConfirmed) {

          const contextPath = window.location.pathname.split('/')[1]; // Obtener el contexto de la aplicación
          console.log("Context path:", contextPath);
          const url = `/${contextPath}/Admin?action=tablaAcceso`;
          window.location.href = url;


      }else if (result.dismiss === Swal.DismissReason.cancel) {
        // Acción a realizar si se cancela el cierre de sesión

          const contextPath = window.location.pathname.split('/')[1]; // Obtener el contexto de la aplicación
          console.log("Context path:", contextPath);
          const url = `/${contextPath}/Admin?action=tablaCoordinador`;
          window.location.href = url;

    }
  });
}
