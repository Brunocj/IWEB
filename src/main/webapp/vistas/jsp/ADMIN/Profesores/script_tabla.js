

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
        document.querySelector("form").submit();
      });
    }
  });

  // Evitar que el formulario se envíe automáticamente
  return false;
}

function Eliminacion(id,contextPath) {
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
      // Crear un formulario para enviar la solicitud POST
      const form = document.createElement('form');
      form.method = 'post';
      form.action = contextPath+'/Admin?action=eliminarProfesor';

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

  $("#filtroTipo").on("change", function () {
    var tipo = $(this).val();
    if (tipo === "curso") {
      $("#filtroCursoDiv").css("display", "flex");
      $("#filtroAreaDiv").css("display", "none");
    } else if (tipo === "area") {
      $("#filtroCursoDiv").css("display", "none");
      $("#filtroAreaDiv").css("display", "flex");
    } else {
      $("#filtroCursoDiv").css("display", "none");
      $("#filtroAreaDiv").css("display", "none");
    }
    filtrarTabla();
  });

  $("#filtroCurso").on("change", filtrarTabla);
  $("#filtroArea").on("change", filtrarTabla);

  $("#limpiarFiltros").on("click", function () {
    $("#filtroCurso").val("");
    $("#filtroArea").val("");
    $("#filtroTipo").val("");
    $("#filtroCursoDiv").css("display", "none");
    $("#filtroAreaDiv").css("display", "none");
    filtrarTabla();
    actualizarContador();
  });

  function filtrarTabla() {
    var curso = $("#filtroCurso").val().toLowerCase();
    var area = $("#filtroArea").val().toLowerCase();
    table.columns().search("").draw(); // Limpiar todos los filtros de DataTables
    table.column(2).search(curso).draw(); // Aplicar filtro por curso
    table.column(3).search(area).draw(); // Aplicar filtro por área
  }

  function actualizarContador() {
    // Aquí puedes agregar la lógica para actualizar el contador si es necesario
  }
});
