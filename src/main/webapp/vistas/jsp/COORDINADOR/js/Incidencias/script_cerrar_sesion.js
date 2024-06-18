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
          window.location.href = "../../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
      }
  });
}