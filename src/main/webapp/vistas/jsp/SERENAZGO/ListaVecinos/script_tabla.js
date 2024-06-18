

function Confirmacion() {
  Swal.fire({
    title: "¿Estás seguro?",
    text: "El proceso no podrá ser reversible",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Sí, registrar",
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire({
        title: "¡Registrado!",
        text: "El personal ha sido registrado con éxito",
        icon: "success",
      }).then(() => {
        window.location.href = "tabla_profesor.html";
      });
    }
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}

function banear(id,contextPath) {
  Swal.fire({
    title: "Estás seguro?",
    text: "Una vez baneado, el usuario perderá el acceso a la plataforma",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, banear",
    cancelButtonText: "Cancelar",

  }).then((result) => {
    if (result.isConfirmed) {
      // Crear un formulario para enviar la solicitud POST
      const form = document.createElement('form');
      form.method = 'post';
      form.action = contextPath+'/Serenazgo?action=banearVecino';

      // Crear un input oculto para el ID del profesor
      const input = document.createElement('input');
      input.type = 'hidden';
      input.name = 'id';
      input.value = id;

      form.appendChild(input);
      document.body.appendChild(form);
      form.submit();
    }
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}

$(document).ready(function () {
  // Initialize DataTable
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
    var filtro = $(this).val();
    console.log("Filtro seleccionado: ", filtro); // Debugging line

    if (filtro === "aptosBaneo") {
      // Filtrar usuarios con más de 5 falsas alarmas
      table.column(3).search("^([6-9]|[1-9][0-9]+)$", true, false).draw();
    } else if (filtro === "noAptosBaneo") {
      // Filtrar usuarios con 5 o menos falsas alarmas
      table.column(3).search("^(0|[1-5])$", true, false).draw();
    } else {
      // Mostrar todos
      table.column(3).search("").draw();
    }

    console.log("Filtrado aplicado: ", table.column(3).data()); // Debugging line
  });

  $("#limpiarFiltros").on("click", function () {
    $("#filtroEstado").val("");
    table.column(3).search("").draw();
    console.log("Filtros limpiados"); // Debugging line
  });
});








