const menuToggle = document.getElementById('menuToggle');
const container = document.querySelector('.container');

menuToggle.addEventListener('click', function() {
    container.classList.toggle('menu-open');
});

function mostrarAlerta() {
    var confirmacion = window.confirm("¿Estás seguro de que quieres enviar la solicitud?");
    if (confirmacion) {
      // Aquí iría el código para enviar la solicitud
      alert("¡Solicitud enviada correctamente!");
    } else {
      // El usuario ha cancelado la acción
      alert("Solicitud cancelada.");
    }
  }

  function showImage(opcion) {
    var imagenContainer = document.getElementById("imagen-container");
    if (opcion === "deportes") {
      imagenContainer.innerHTML = '<img src="imagen_deportes.jpg" alt="Deportes">';
    } else if (opcion === "cultura") {
      imagenContainer.innerHTML = '<img src="imagen_cultura.jpg" alt="Cultura">';
    }
  }


