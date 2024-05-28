



$(document).ready(function() {
      var table = $('#miTabla').DataTable({
  "pageLength": 5,
  "lengthChange": false,
  "language": {
      "emptyTable": "No hay registros disponibles",
      "zeroRecords": "No se encontraron registros coincidentes",
      "infoEmpty": "Aún no se ingresan entradas a las tabla",
      "paginate": {
          "first": "Primero",
          "last": "Último",
          "next": "Siguiente",
          "previous": "Anterior"
      },
      "info": "Mostrando de _START_ a _END_ de _TOTAL_ entradas",
      "search": "Buscar:" // Cambia "Search" por "Buscar"
  }
});
  $('#filtroEstado').on('change', function() {
      var estado = $(this).val();
      table.column(2).search(estado).draw();
  });
  $('#limpiarFiltros').on('click', function() {
      $('#filtroEstado').val('');
      table.search('').columns().search('').draw();
  });
  
  
  // Evento de cambio de filtro de turno
  $('#filtroEstado').on('change', function() {
      var estado = $(this).val();
      table.column(2).search(estado).draw();
      
      // Actualizar el contador después de filtrar
      actualizarContador();
  });
  
  // Evento de limpiar filtros
  $('#limpiarFiltros').on('click', function() {
      $('#filtroEstado').val('');
      table.search('').columns().search('').draw();
      
      // Actualizar el contador después de limpiar los filtros
      actualizarContador();
  });
  





});

$(window).on('load', function() {
    function actualizarContador() {
        var contadorMañana = 0;
        var contadorTarde = 0;
        var contadorNoche = 0;

        // Contar personas por turno
        $('#miTabla tbody tr').each(function() {
            var turno = $(this).find('td:eq(2)').text().trim();
            if (turno === 'Mañana') {
                contadorMañana++;
            } else if (turno === 'Tarde') {
                contadorTarde++;
            } else if (turno === 'Noche') {
                contadorNoche++;
            }
        });

        // Actualizar el contenido del contador
        $('#contadorTurnos').text("Personal por turno: Mañana " + contadorMañana + ", Tarde " + contadorTarde + ", Noche " + contadorNoche);
    }

    // Llamar a la función para actualizar el contador después de que la página se haya cargado completamente
    actualizarContador();
});
