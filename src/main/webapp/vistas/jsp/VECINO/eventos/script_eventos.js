document.addEventListener("DOMContentLoaded", function() {
  // Manejar clics en tarjetas de evento
  document.addEventListener("click", function(event) {
    if (event.target.classList.contains("card")) {
      const eventId = event.target.dataset.eventId;
      mostrarDetallesEvento(eventId);
    }
  });

  // Inicializar la paginación
  const eventsPerPage = 8;
  const cards = document.querySelectorAll(".cardEvent");
  const totalPages = Math.ceil(cards.length / eventsPerPage);

  // Función para mostrar los eventos de la página actual
  function mostrarEventosPagina(page) {
    const startIndex = (page - 1) * eventsPerPage;
    const endIndex = Math.min(startIndex + eventsPerPage, cards.length);

    cards.forEach((card, index) => {
      if (index >= startIndex && index < endIndex) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });
  }

  // Función para manejar clics en botones de página
  document.querySelectorAll(".page-button").forEach(button => {
    button.addEventListener("click", function() {
      const page = parseInt(this.dataset.page);
      mostrarEventosPagina(page);
      actualizarBotonesPagina(page);
    });
  });

  // Función para actualizar la apariencia de los botones de página
  function actualizarBotonesPagina(page) {
    document.querySelectorAll(".page-button").forEach(button => {
      button.classList.remove("active");
      if (parseInt(button.dataset.page) === page) {
        button.classList.add("active");
      }
    });
  }

  // Mostrar la primera página de eventos al cargar la página
  mostrarEventosPagina(1);
  actualizarBotonesPagina(1);
});

// Función para mostrar los detalles de un evento
function mostrarDetallesEvento(eventoId) {
  localStorage.setItem('eventoSeleccionado', eventoId);
  window.location.href = 'detalles_evento.html';
}

// Función para mostrar el cuadro de diálogo de confirmación al hacer clic en el botón "Cerrar sesión"
function mostrarPopupCerrarSesion() {
  Swal.fire({
      title: 'Cerrar sesión',
      text: '¿Estás seguro de que deseas cerrar sesión?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#00913f',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí, cerrar sesión',
      cancelButtonText: 'Cancelar',
  }).then((result) => {
      if (result.isConfirmed) {
          window.location.href = "../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
      }
  });
}
