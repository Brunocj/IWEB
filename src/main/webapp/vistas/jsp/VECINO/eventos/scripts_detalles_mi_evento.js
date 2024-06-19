function AnularPopUp() {
    Swal.fire({
    title: '¿Estás seguro de que deseas anular tu inscripción?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#00913f',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Confirmar',
    cancelButtonText: 'Cancelar'

}).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "¡Inscripción Anulada!",
                text: "Se ha anulado su inscripción con éxito",
                icon: "success",
            }).then(() => {
                document.querySelector("form").submit();
            });
        }
});
}

document.addEventListener("DOMContentLoaded", function() {
   // Manejar clics en tarjetas de evento
      document.addEventListener("click", function(event) {
      const clickedCard = event.target.closest(".cardEvent");
      if (clickedCard) {
        const eventId = clickedCard.dataset.eventId;
        mostrarDetallesEvento(eventId);
      }
   });
});

// Funciones para obtener la URL de la imagen del evento
function obtenerURLImagen(eventId) {
                         // Aquí puedes definir la lógica para obtener la URL de la imagen del evento
                         // Por ejemplo, puedes tener un objeto o una base de datos que mapee eventId a la URL de la imagen
                         // Devuelve la URL de la imagen correspondiente al eventId
                         // Este es solo un ejemplo de cómo podrías hacerlo, deberías adaptarlo a tu propia lógica de datos
                         switch(eventId) {
                           case '1':
                             return 'foto1.png';
                           case '2':
                             return 'foto1.png';
                           case '3':
                             return 'foto1.png';
                           case '4':
                             return 'foto1.png';
                           case '5':
                             return 'foto2.jpg';
                           case '6':
                             return 'foto2.jpg';
                           case '7':
                             return 'foto2.jpg';
                           case '8':
                             return 'foto2.jpg';
                           case '9':
                             return 'foto3.jpg';
                           case '10':
                             return 'foto3.jpg';
                           case '11':
                             return 'foto3.jpg';
                           case '12':
                             return 'foto4.jpg';
                           case '13':
                             return 'foto4.jpg';
                           case '14':
                             return 'foto4.jpg';
                           case '15':
                             return 'foto4.jpg';
                           case '16':
                             return 'foto5.jpg';
                           case '17':
                             return 'foto5.jpg';
                           case '18':
                             return 'foto5.jpg';
                           case '19':
                             return 'foto5.jpg';
                           case '20':
                             return 'foto6.png';
                           case '21':
                             return 'foto6.png';
                           case '22':
                             return 'foto6.png';
                           case '23':
                           return 'foto6.png';
                           case '24':
                           return 'foto9.jpg';
                           case '25':
                           return 'foto9.jpg';
                           case '26':
                           return 'foto9.jpg';
                           case '27':
                           return 'foto9.jpg';
                           case '28':
                                                  return 'foto10.jpg';
                                                  case '29':
                                                  return 'foto10.jpg';
                                                  case '30':
                                                  return 'foto10.jpg';
                                                  case '31':
                                                  return 'foto10.jpg';
                         }
                       }
                         // Función para mostrar un mensaje de confirmación al hacer clic en el botón "Cerrar sesión"
                         
                         
                         
                                                  
                                                                         
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
                                                          window.location.href = "../../LOGIN/login.jsp"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                                                      }
                                                  });
                                              }
                         