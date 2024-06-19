

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


function eliminarpas(id,contextPath) {
  Swal.fire({
    title: "Estás seguro?",
    text: "Una vez eliminado, la información asociada a la incidencia será permanentemente eliminada del sistema",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#00913f",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, eliminar",
    cancelButtonText: "Cancelar",

  }).then((result) => {
    if (result.isConfirmed) {
      // Crear un formulario para enviar la solicitud POST
      const form = document.createElement('form');
      form.method = 'post';
      form.action = contextPath+'/Serenazgo?action=eliminarIncidenciaPas';

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
  var table = $("#miTabla").DataTable({
    pageLength: 5,
    lengthChange: false,
    language: {
      emptyTable: "No hay registros disponibles",
      zeroRecords: "No se encontraron registros coincidentes",
      infoEmpty: "Aún no se ingresan entradas a la tabla",
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
    table.column(1).search(estado).draw();  // Filtra la columna 2 (índice 1) por clasificación
  });

  $("#limpiarFiltros").on("click", function () {
    $("#filtroEstado").val("");
    table.search("").columns().search("").draw();
  });
});
