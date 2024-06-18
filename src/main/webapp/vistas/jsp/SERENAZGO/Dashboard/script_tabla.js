

function Confirmacion() {
    Swal.fire({
        title: "¿Estás seguro?",
        text: "El proceso no podrá ser reversible",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, registrar"
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "¡Registrado!",
                text: "El personal ha sido registrado con éxito",
                icon: "success"
            }).then(() => {
                window.location.href = "tabla_serenazgo.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}

function Eliminacion() {
    Swal.fire({
        title: "Estás seguro?",
        text: "Una vez eliminado, la información asociada al personal será permanentemente eliminada del sistema",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si, eliminar"
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Eliminado!",
                text: "El personal ha sido eliminado con éxito",
                icon: "success"
            }).then(() => {
                window.location.href = "tabla_serenazgo.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}






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
    
    $('#filtroFecha').on('change', function() {
        var fecha = $(this).val();
        var fechaFormateada = formatDate(fecha); // Formatear la fecha
        table.column(3).search(fechaFormateada).draw();
    });
    
    $('#limpiarFiltros').on('click', function() {
        $('#filtroFecha').val(''); // Borra la fecha seleccionada en el calendario
        table.search('').column(3).search('').draw(); // Limpia los filtros de la tabla y la redibuja
    });
});

// Función para formatear la fecha como 'dd/mm/yyyy'
function formatDate(date) {
    var parts = date.split('-');
    return parts[2] + '/' + parts[1] + '/' + parts[0];
}

