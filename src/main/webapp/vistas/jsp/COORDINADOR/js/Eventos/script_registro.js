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

function confirmarRegistro() {
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
      console.log("Formulario antes de enviar:");
      console.log($("#eventForm").serialize()); // Esto mostrará todos los datos del formulario antes de enviarlos
      document.getElementById("eventForm").submit(); // Envía el formulario
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
      goBack();
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
      document.getElementById("vacantes").value = vacantes;
    }
  });
}

// Función para cargar la imagen al seleccionar un archivo
document.getElementById('upload').addEventListener('change', function () {
  var preview = document.getElementById('preview');
  var file = this.files[0];
  var reader = new FileReader();
  reader.onloadend = function () {
    preview.src = reader.result;
  }
  if (file) {
    reader.readAsDataURL(file);
  } else {
    preview.src = "https://via.placeholder.com/800x500";
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
        paragraph.contentEditable = "false"; // Corrección aquí
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
  var nuevoMaterial = document.getElementById('nuevo-material').value;
  if (nuevoMaterial.trim() !== "") {
    var lista = document.getElementById('lista-materiales');
    var li = document.createElement('li');
    li.textContent = nuevoMaterial;
    lista.appendChild(li);

    // Añadir el material al campo oculto
    var materialesField = document.getElementById('materiales');
    if (materialesField.value) {
      materialesField.value += "," + nuevoMaterial;
    } else {
      materialesField.value = nuevoMaterial;
    }

    li.innerHTML = `
          <span>${nuevoMaterial}</span>
          <button class="remove-btn" onclick="eliminarMaterial(this)">X</button>
      `;

    document.getElementById('nuevo-material').value = ""; // Limpiar campo de entrada
    console.log("Material agregado:", materialesField.value); // Añadir log para verificar
  }
}

function eliminarMaterial(elemento) {
  var li = elemento.parentElement;
  var material = li.querySelector('span').textContent;
  var materialesField = document.getElementById('materiales');
  var materialesArray = materialesField.value.split(',');

  // Eliminar el material del array
  var index = materialesArray.indexOf(material);
  if (index > -1) {
    materialesArray.splice(index, 1);
  }

  // Actualizar el campo oculto
  materialesField.value = materialesArray.join(',');

  // Eliminar el elemento de la lista
  li.remove();
  console.log("Material eliminado:", materialesField.value); // Añadir log para verificar
}

document.getElementById("eventForm").addEventListener("submit", function(event) {
  var nombre = document.getElementById("nombre").value;
  var fecha = document.getElementById("fecha").value;
  var hora = document.getElementById("hora").value;
  var lugar = document.getElementById("lugar").value;
  var recurrencia = document.getElementById("recurrencia").value;
  var descripcion = document.getElementById("descripcion2").value; // Asegúrate de que sea "descripcion2"
  var vacantes = document.getElementById("vacantes").value;
  var materiales = document.getElementById("materiales").value; // Asegúrate de que los materiales se envíen

  console.log("Materiales:", materiales);

  var missingFields = [];

  if (!nombre) {
    missingFields.push("Nombre del evento");
  }
  if (!fecha) {
    missingFields.push("Fecha");
  }
  if (!hora) {
    missingFields.push("Hora de Inicio");
  }
  if (!lugar) {
    missingFields.push("Lugar");
  }
  if (!recurrencia) {
    missingFields.push("Recurrencia");
  }
  if (!descripcion) {
    missingFields.push("Descripcion");
  }
  if (!vacantes) {
    missingFields.push("Vacantes");
  }
  if (!materiales) {
    missingFields.push("Materiales");
  }

  if (missingFields.length > 0) {
    event.preventDefault();
    Swal.fire("Error", "Los siguientes campos son obligatorios: " + missingFields.join(", "), "error");
  }
});


function goBack() {
  window.history.back();
}
