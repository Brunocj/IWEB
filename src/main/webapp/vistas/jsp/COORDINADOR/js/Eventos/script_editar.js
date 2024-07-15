$(document).ready(function () {
  // Inicializar el datepicker al hacer clic en el botón de selección de fecha
  $("#fecha-seleccionada").click(function () {
    $("#fecha-seleccionada")
        .datepicker({
          dateFormat: "dd MM yy", // Formato de fecha deseado
          onSelect: function (dateText, inst) {
            // Actualizar el texto de la fecha seleccionada en el elemento span
            $("#fecha-seleccionada").text(dateText);
            console.log("Fecha seleccionada:", dateText); // Log para verificar la fecha seleccionada
          },
        })
        .datepicker("show"); // Mostrar el datepicker
  });
});




function mostrarOpcionMaterial() {
  var opcionMaterial = document.getElementById('opcion-material');
  var mensajeNoMaterial = document.getElementById('mensaje-no-material');
  var select = document.getElementById('necesita-material');

  if (select.value === 'si') {
    opcionMaterial.classList.remove('hidden');
    mensajeNoMaterial.classList.add('hidden');
    console.log("Opción de material mostrada"); // Log para verificar la opción de material
  } else if (select.value === 'no') {
    opcionMaterial.classList.add('hidden');
    mensajeNoMaterial.classList.remove('hidden');
    console.log("Opción de material ocultada"); // Log para verificar la opción de material
  } else {
    opcionMaterial.classList.add('hidden');
    mensajeNoMaterial.classList.add('hidden');
    console.log("Selección de material no definida"); // Log para verificar la opción de material
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

    actualizarCampoMateriales();
    document.getElementById('nuevo-material').value = ""; // Limpiar campo de entrada
    console.log("Material agregado:", nuevoMaterial); // Log para verificar el material agregado
  }
}

function eliminarMaterial(elemento) {
  var li = elemento.parentElement;
  li.remove();
  actualizarCampoMateriales();
  console.log("Material eliminado"); // Log para verificar la eliminación del material
}

function actualizarCampoMateriales() {
  var lista = document.getElementById('lista-materiales');
  var materiales = [];
  lista.querySelectorAll('li').forEach(function (li) {
    materiales.push(li.querySelector('span').textContent);
  });
  document.getElementById('materiales').value = materiales.join(',');
  console.log("Campo de materiales actualizado:", document.getElementById('materiales').value); // Log para verificar el campo de materiales actualizado
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
      console.log("Evento eliminado"); // Log para verificar la eliminación del evento
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
      console.log("Cambios guardados"); // Log para verificar que los cambios se guardaron
    }
  });
}

function CancelarPopUp(contextPath) {
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
      window.location.href = contextPath+"/Coordinador?action=eventos";
      console.log("Cambios cancelados"); // Log para verificar que los cambios se cancelaron
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
      console.log("Imagen cargada:", e.target.result); // Log para verificar la imagen cargada
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
      console.log("Registro de asistencia:", tipo); // Log para verificar el registro de asistencia
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
    console.log("Registro de asistencia confirmado"); // Log para verificar el registro de asistencia
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
      console.log("Foto seleccionada:", foto); // Log para verificar la foto seleccionada
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
        console.log("Registro de entrada exitoso"); // Log para verificar el registro de entrada exitoso
      }, 1000); // Simulación de carga de 1 segundo
    }
  });
}


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
      const vacantesDisponibles = parseInt(document.getElementById("vacantes").value); // Obtener el número actual de vacantes

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

      // Actualizar el número de vacantes en el input oculto
      document.getElementById("vacantes").value = vacantes;
      document.getElementById("btn-vacantes").innerText = `8/${vacantes}`; // Actualizar el texto de vacantes

      // Retornar true para cerrar el modal de SweetAlert2
      return true;
    },
  }).then((result) => {
    if (result.isConfirmed) {
      console.log("Vacantes ampliadas:", document.getElementById("vacantes").value); // Log para verificar la ampliación de vacantes
    }
  });
}


function verInscritos() {
  // Redirigir al usuario a index.html
  window.location.href = "../../html/Eventos/tabla_inscritos.jsp";
  console.log("Ver inscritos clicado"); // Log para verificar el click en ver inscritos
}

document.getElementById("eventForm").addEventListener("submit", function (event) {
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

function confirmarEdicion() {
  Swal.fire({
    title: "¿Estás seguro de que deseas guardar los cambios en el evento?",
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

