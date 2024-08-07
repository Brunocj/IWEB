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
    window.location.href = '../../html/Eventos/editar_evento.jsp';
  }
  
  // Función para mostrar el cuadro de diálogo de confirmación al hacer clic en el botón "Cerrar sesión"

  
 
  document.addEventListener("DOMContentLoaded", function() {
    const pageButtons = document.querySelectorAll('.page-button');
    const contents = document.querySelectorAll('.page-content');
    let currentPage = 1;
    const totalPages = contents.length;

    function updatePage() {
        // Mostrar/ocultar contenido
        contents.forEach(content => content.classList.remove('active'));
        document.getElementById(`page${currentPage}`).classList.add('active');

        // Actualizar botones de paginación
        pageButtons.forEach(button => button.parentElement.classList.remove('active'));
        document.querySelector(`.page-button[data-page="${currentPage}"]`).parentElement.classList.add('active');

        // Habilitar/deshabilitar botones de Anterior y Siguiente
        document.getElementById('previousPage').classList.toggle('disabled', currentPage === 1);
        document.getElementById('nextPage').classList.toggle('disabled', currentPage === totalPages);
    }

    pageButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            currentPage = parseInt(this.getAttribute('data-page'));
            updatePage();
        });
    });

    document.getElementById('previousPage').addEventListener('click', function(event) {
        event.preventDefault();
        if (currentPage > 1) {
            currentPage--;
            updatePage();
        }
    });

    document.getElementById('nextPage').addEventListener('click', function(event) {
        event.preventDefault();
        if (currentPage < totalPages) {
            currentPage++;
            updatePage();
        }
    });

    updatePage();
});