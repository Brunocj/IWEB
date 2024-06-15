function Eliminacion() {
  Swal.fire({
    title: "Estás seguro?",
    text: "Una vez eliminado, la información asociada al personal será permanentemente eliminada del sistema",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, eliminar",
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire({
        title: "Eliminado!",
        text: "El personal ha sido eliminado con éxito",
        icon: "success",
      }).then(() => {
        window.location.href = "tabla.html"; //Cambiar href de acuerdo a lo necesrio
      });
    }
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}

$(document).ready(function () {
  var table = $("#miTabla").DataTable({
    pageLength: 5,
    lengthChange: false,
    language: {
      emptyTable: "No hay registros disponibles",
      zeroRecords: "No se encontraron registros coincidentes",
      infoEmpty: "Aún no se ingresan entradas a las tabla",
      paginate: {
        first: "Primero",
        last: "Último",
        next: "Siguiente",
        previous: "Anterior",
      },
      info: "Mostrando de _START_ a _END_ de _TOTAL_ entradas",
      search: "Buscar:", // Cambia "Search" por "Buscar"
    },
  });
  $("#filtroEstado").on("change", function () {
    var estado = $(this).val();
    table.column(2).search(estado).draw();
  });
  $("#limpiarFiltros").on("click", function () {
    $("#filtroEstado").val("");
    table.search("").columns().search("").draw();
  });

  function actualizarContador() {
    var contadorMañana = 0;
    var contadorTarde = 0;
    var contadorNoche = 0;

    // Contar personas por turno
    table.rows().every(function () {
      var turno = this.data()[2];
      if (turno === "Mañana") {
        contadorMañana++;
      } else if (turno === "Tarde") {
        contadorTarde++;
      } else if (turno === "Noche") {
        contadorNoche++;
      }
    });

    // Actualizar el contenido del contador
    var contadorHTML = "Personal por turno: ";
    contadorHTML += "Mañana: " + contadorMañana + " | ";
    contadorHTML += "Tarde: " + contadorTarde + " | ";
    contadorHTML += "Noche: " + contadorNoche;
    $("#contadorTurnos").html(contadorHTML);
  }

  // Llamar a la función para actualizar el contador al cargar la página
  actualizarContador();

  // Evento de cambio de filtro de turno
  $("#filtroEstado").on("change", function () {
    var estado = $(this).val();
    table.column(2).search(estado).draw();

    // Actualizar el contador después de filtrar
    actualizarContador();
  });

  // Evento de limpiar filtros
  $("#limpiarFiltros").on("click", function () {
    $("#filtroEstado").val("");
    table.search("").columns().search("").draw();

    // Actualizar el contador después de limpiar los filtros
    actualizarContador();
  });
});

document.addEventListener('DOMContentLoaded', function() {
  var checkboxes = document.querySelectorAll('input[name="opcion"]');
  checkboxes.forEach(function(checkbox) {
      checkbox.addEventListener('click', function() {
          checkboxes.forEach(function(cb) {
              if (cb !== checkbox) {
                  cb.checked = false;
              }
          });
      });
  });
});


document.addEventListener('DOMContentLoaded', function() {
  const checkboxes = document.querySelectorAll('input[name="opcion"]');
  const botonAgregar = document.getElementById('filtro_button');

  checkboxes.forEach(function(checkbox) {
      checkbox.addEventListener('change', function() {
          checkboxes.forEach(function(cb) {
              cb.checked = (cb === checkbox && cb.checked);
          });
      });
  });

  botonAgregar.addEventListener('click', function() {
      const checkboxSeleccionado = document.querySelector('input[name="opcion"]:checked');

      if (!checkboxSeleccionado) {
          seleccionar();
          return;
      }

      const fila = checkboxSeleccionado.closest('tr');
      const disponibilidad = fila.getAttribute('data-disponibilidad');

      if (disponibilidad === 'Disponible') {
          disponible();
      } else {
          no_disponible();
      }
  });
});

function disponible() {
  Swal.fire({
      title: "Estás seguro?",
      text: "Una vez agregue a un docente, se actualizará la información en la base de datos",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#00913f",
      cancelButtonColor: "#d33",
      confirmButtonText: "Sí, agregar"
  }).then((result) => {
      if (result.isConfirmed) {
        window.history.back();;      
      }
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}

function no_disponible() {
  Swal.fire({
      title: "Alerta",
      text: "El docente que ha seleccionado no se encuentra disponible",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#00913f",
      cancelButtonColor: "#d33",
      confirmButtonText: "ok"
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}

function seleccionar() {
  Swal.fire({
      text: "Ningún docente está seleccionado, por favor seleccionar uno",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#00913f",
      cancelButtonColor: "#d33",
      confirmButtonText: "ok"
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}

function goBack() {
  window.history.back();
}