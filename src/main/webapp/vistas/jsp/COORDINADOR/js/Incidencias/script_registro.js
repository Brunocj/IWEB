function Cancelar() {
  window.location.href = "../Incidencias/incidencia_coordinador.jsp";
  return false;
}

function Confirmacion() {
  Swal.fire({
    title: "Estás seguro?",
    text: "El proceso no podrá ser reversible",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, registrar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire({
        title: "Registrado!",
        text: "La incidencia ha sido registrado con éxito",
        icon: "success",
      }).then(() => {
        window.location.href = "../Incidencias/incidencia_coordinador.jsp";
      });
    }
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}
