

// Función para cargar la imagen al seleccionar un archivo
document.getElementById("upload").addEventListener("change", function (event) {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById("preview").src = e.target.result;
    };
    reader.readAsDataURL(file);
  }
});


$(document).ready(function () {
  // Inicializar el datepicker al hacer clic en el botón de selección de fecha
  $("#fecha-seleccionada").click(function () {
    $("#fecha-seleccionada")
      .datepicker({
        dateFormat: "dd MM yy", // Formato de fecha deseado
        onSelect: function (dateText, inst) {
          // Actualizar el texto de la fecha seleccionada en el elemento span
          $("#fecha-seleccionada").text(dateText);
        },
      })
      .datepicker("show"); // Mostrar el datepicker
  });
});



document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("profesores-link")
    .addEventListener("click", function (event) {
      event.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
      window.location.href = "../tablaDocentes2/tabla.html"; // Cambiar la ubicación de la ventana al enlace deseado
    });
});

function mostrarPopupCerrarSesion() {
  Swal.fire({
    title: "Cerrar sesión",
    text: "¿Estás seguro de que deseas cerrar sesión?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Sí, cerrar sesión",
  }).then((result) => {
    if (result.isConfirmed) {
      window.location.href = "../../../LOGIN/login.html"; //Cambiar la ubicacion del login de acuerdo a lo necesario
    }
  });
}

function mostrarOpcionMaterial() {
  var opcionMaterial = document.getElementById('opcion-material');
  var mensajeNoMaterial = document.getElementById('mensaje-no-material');
  var select = document.getElementById('necesita-material');

  if (select.value === 'si') {
      opcionMaterial.classList.remove('hidden');
      mensajeNoMaterial.classList.add('hidden');
  } else if (select.value === 'no') {
      opcionMaterial.classList.add('hidden');
      mensajeNoMaterial.classList.remove('hidden');
  } else {
      opcionMaterial.classList.add('hidden');
      mensajeNoMaterial.classList.add('hidden');
  }
}

function agregarMaterial() {
  var lista = document.getElementById('lista-materiales');
  var nuevoMaterial = document.getElementById('nuevo-material').value;
  if (nuevoMaterial.trim() !== "") {
      var li = document.createElement('li');
      li.className = 'material-item';
      li.innerHTML = `
          <span>${nuevoMaterial}</span>
          <button class="remove-btn" onclick="eliminarMaterial(this)">X</button>
      `;
      lista.appendChild(li);
      document.getElementById('nuevo-material').value = ""; // Clear input field
  }
}

function eliminarMaterial(elemento) {
  var li = elemento.parentElement;
  li.remove();
}


function borrarEvento() {
  Swal.fire({
    title: "¿Estás seguro de que deseas eliminar el evento?",
    icon: "question",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Confirmar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      // Almacenar un indicador en el localStorage
      localStorage.setItem("eventoEliminado", "true");
      // Redireccionar a evento.html
      window.location.href = "../../html/Eventos/eventos.jsp";
    }
  });
}

function GuardarPopUp() {
  Swal.fire({
    title: "¿Estás seguro de que deseas guardar los cambios?",
    icon: "question",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Confirmar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      // Redireccionar a evento.html
      window.location.href = "eventos.jsp";
    }
  });
}

function CancelarPopUp() {
  Swal.fire({
    title: "¿Estás seguro de que deseas cancelar los cambios?",
    icon: "question",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Confirmar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      // Redireccionar a evento.html
      window.location.href = "eventos.jsp";
    }
  });
}

window.addEventListener("DOMContentLoaded", () => {
  const urlParams = new URLSearchParams(window.location.search);
  const eventId = urlParams.get("eventId");
  const eventImage = document.getElementById("preview");
  // Obtener la URL de la imagen correspondiente al evento
  const eventImageURL = obtenerURLImagen(eventId);
  // Establecer la fuente de la imagen
  eventImage.src = eventImageURL;
});

// Función para obtener la URL de la imagen del evento
function obtenerURLImagen(eventId) {
  // Aquí puedes definir la lógica para obtener la URL de la imagen del evento
  // Por ejemplo, puedes tener un objeto o una base de datos que mapee eventId a la URL de la imagen
  // Devuelve la URL de la imagen correspondiente al eventId
  // Este es solo un ejemplo de cómo podrías hacerlo, deberías adaptarlo a tu propia lógica de datos
  switch (eventId) {
    case "1":
      return "../../img/Eventos/foto1.png";
    case "2":
      return "../../img/Eventos/foto1.png";
    case "3":
      return "../../img/Eventos/foto1.png";
    case "4":
      return "../../img/Eventos/foto1.png";
    case "5":
      return "../../img/Eventos/foto2.jpg";
    case "6":
      return "../../img/Eventos/foto2.jpg";
    case "7":
      return "../../img/Eventos/foto2.jpg";
    case "8":
      return "../../img/Eventos/foto2.jpg";
    case "9":
      return "../../img/Eventos/foto3.jpg";
    case "10":
      return "../../img/Eventos/foto3.jpg";
    case "11":
      return "../../img/Eventos/foto3.jpg";
    case "12":
      return "../../img/Eventos/foto4.jpg";
    case "13":
      return "../../img/Eventos/foto4.jpg";
    case "14":
      return "../../img/Eventos/foto4.jpg";
    case "15":
      return "../../img/Eventos/foto4.jpg";
    case "16":
      return "../../img/Eventos/foto5.jpg";
    case "17":
      return "../../img/Eventos/foto5.jpg";
    case "18":
      return "../../img/Eventos/foto5.jpg";
    case "19":
      return "../../img/Eventos/foto5.jpg";
    case "20":
      return "../../img/Eventos/foto6.png";
    case "21":
      return "../../img/Eventos/foto6.png";
    case "22":
      return "../../img/Eventos/foto6.png";
    case "23":
      return "../../img/Eventos/foto6.png";
  }
}



// Función para cargar la imagen al seleccionar un archivo
document.getElementById("upload").addEventListener("change", function (event) {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById("preview").src = e.target.result;
    };
    reader.readAsDataURL(file);
  }
});








function mostrarPopup(tipo) {
  // Lógica para mostrar el popup de confirmación
  Swal.fire({
    title: "Registro de Asistencia",
    html: `¿Estás seguro de que deseas registrar la ${tipo}?`,
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Confirmar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      // Lógica para procesar el registro
      Swal.fire({
        title: "Registro Exitoso",
        text: "¡Tu registro ha sido procesado correctamente!",
        icon: "success",
      });
    }
  });
}

function registrarAsistencia() {
  // Mostrar una ventana emergente para seleccionar la foto
  Swal.fire({
    title: "Registrar Asistencia",
    icon: "info",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Registrar Entrada",
    cancelButtonText: "Registrar Salida",
    reverseButtons: true, // Cambia el orden de los botones (Registrar Entrada - Registrar Salida)
  }).then((result) => {
    if (result.isConfirmed) {
      // Lógica para registrar entrada
      seleccionarFoto("entrada");
    } else {
      // Lógica para registrar salida
      seleccionarFoto("salida");
    }
  });
}

function seleccionarFoto() {
  // Mostrar una ventana emergente para seleccionar la foto
  Swal.fire({
    title: `Seleccionar foto para el registro de entrada`,
    html: `<input type="file" id="inputFoto" accept="image/*">`,
    showCancelButton: true,
    confirmButtonText: "Confirmar",
    cancelButtonText: "Cancelar",
    confirmButtonColor: "#00913f", // Color verde
    cancelButtonColor: "#d33",
    preConfirm: () => {
      const foto = document.getElementById("inputFoto").files[0];
      // Aquí puedes procesar la foto, por ejemplo, enviándola al servidor
      return foto;
    },
  }).then((result) => {
    if (result.isConfirmed) {
      const foto = result.value;
      // Simular el proceso de envío de la foto al servidor (puedes reemplazar esto con tu lógica real)
      setTimeout(() => {
        Swal.fire({
          title: "Registro Exitoso",
          text: `¡Tu registro de entrada ha sido procesado correctamente!`,
          icon: "success",
        });
      }, 1000); // Simulación de carga de 1 segundo
    }
  });
}

document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("profesores-link")
    .addEventListener("click", function (event) {
      event.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
      window.location.href = "../../html/Eventos/tabla_docentes.jsp"; // Cambiar la ubicación de la ventana al enlace deseado
    });
});

function AmpliarVacantesPopUp() {
  Swal.fire({
    title: "Ampliar Vacantes",
    html: '<input id="swal-input1" class="swal2-input" placeholder="Ingrese aquí el número">',
    showCancelButton: true,
    confirmButtonText: "Efectuar Ampliación",
    cancelButtonText: "Cancelar",
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    focusConfirm: false,
    preConfirm: () => {
      const vacantes = parseInt(document.getElementById("swal-input1").value); // Convertir a número entero
      const vacantesDisponibles = 10; // Número de vacantes inicial (puedes obtenerlo dinámicamente si lo deseas)

      if (!vacantes) {
        Swal.showValidationMessage("Por favor, ingrese el número de vacantes");
        return;
      }

      if (vacantes <= vacantesDisponibles) {
        Swal.showValidationMessage(
          "La ampliación solo funciona con un número superior a las asignadas"
        );
        return;
      }

      // Actualizar el número de vacantes
      document.getElementById("btn-vacantes").innerText = `8/${vacantes}`;

      return vacantes;
    },
  });
}

function verInscritos() {
  // Redirigir al usuario a index.html
  window.location.href = "../../html/Eventos/tabla_inscritos.jsp";
}
