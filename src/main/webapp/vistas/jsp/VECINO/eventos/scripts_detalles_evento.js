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
                         // Mapear eventId a la URL de la imagen correspondiente
                         switch (eventId) {
                             case '1':
                                 return '../../fotos/foto1.png';
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
                             default:
                                 return 'https://via.placeholder.com/400x300'; // URL de imagen de marcador de posición si el ID del evento no coincide
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
                                 window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
                             }
                         });
                     }

                                          
                         // Funciones para mostrar un mensaje de confirmación al hacer clic en el botón "Inscribirse"
function InscribirPopUp() {
    Swal.fire({
        title: '¿Estás seguro de que deseas inscribirte a este evento?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#00913f',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Confirmar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "¡Inscrito!",
                text: "Usted se ha registrado con éxito",
                icon: "success",
            }).then(() => {
                document.querySelector("form").submit();
            });
        }
    });
}
                                          
                                              // Función para mostrar el cuadro de diálogo de confirmación al hacer clic en el botón "Inscribirse"
                         document.getElementById("btn-inscribirse").addEventListener("click", function() {
                         document.getElementById("confirmation-dialog").style.display = "block";
                         });
                                          
                         // Función para ocultar el cuadro de diálogo de confirmación al hacer clic en el botón "Cancelar"
                         document.getElementById("btn-cancelar").addEventListener("click", function() {
                         document.getElementById("confirmation-dialog").style.display = "none";
                         });
                                          
                         // Función para mostrar un mensaje de confirmación al hacer clic en el botón "Sí"
                         document.getElementById("btn-confirmar").addEventListener("click", function() {
                         alert("Te has inscrito en el evento.");
                         document.getElementById("confirmation-dialog").style.display = "none";
                         });
                                          
