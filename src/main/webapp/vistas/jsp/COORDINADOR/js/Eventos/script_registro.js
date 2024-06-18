function registrar() {
  Swal.fire({
    title: "¿Estás seguro de que deseas registrar el evento?",
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

function anularRegistro() {
  Swal.fire({
    title: "¿Estás seguro de que deseas anular el registro del evento?",
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

function VacantesPopUp() {
  Swal.fire({
    title: "Asignar Vacantes",
    html: '<input id="swal-input1" class="swal2-input" placeholder="Ingrese el N° de vacantes" type="number" min="1">',
    showCancelButton: true,
    confirmButtonText: "Añadir vacantes",
    cancelButtonText: "Cancelar",
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    focusConfirm: false,
    preConfirm: () => {
      const vacantes = document.getElementById("swal-input1").value;
      if (!vacantes) {
        Swal.showValidationMessage("Por favor, ingrese el número de vacantes");
        return false;
      }
      if (isNaN(vacantes)) {
        Swal.showValidationMessage("Por favor, ingrese un número válido");
        return false;
      }
      if (Number(vacantes) <= 0) {
        Swal.showValidationMessage("El número de vacantes debe ser mayor a 0");
        return false;
      }
      return vacantes;
    },
  }).then((result) => {
    if (result.isConfirmed) {
      const vacantes = result.value;
      Swal.fire("Vacantes asignadas:", `${vacantes}`, "success");
      document.getElementById("vacantesAsignadasContainer").innerText = `Vacantes asignadas: ${vacantes}`;
    }
  });
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

// Script para editar el texto al hacer clic en el icono de edición
// Script para habilitar la edición de los elementos
function enableEditMode(sectionId) {
  const section = document.getElementById(sectionId);
  const paragraphs = section.querySelectorAll('p[contenteditable="false"]');
  paragraphs.forEach((paragraph) => {
    paragraph.contentEditable = "true";
    paragraph.focus();
  });
  document.addEventListener("click", function disableEditMode(event) {
    if (!section.contains(event.target)) {
      paragraphs.forEach((paragraph) => {
        paragraph.contentEditable = "false";
      });
      document.removeEventListener("click", disableEditMode);
    }
  });
}

function enableEditMode2(elementId) {
  var element = document.getElementById(elementId);
  element.contentEditable = true;
  element.focus();
}

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

function enableEditMode3(elementId) {
  const element = document.getElementById(elementId);
  element.contentEditable = true;
  element.focus();
}

document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("profesores-link")
    .addEventListener("click", function (event) {
      event.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
      window.location.href = "../../html/Eventos/tabla_docentes.jsp"; // Cambiar la ubicación de la ventana al enlace deseado
    });
});
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