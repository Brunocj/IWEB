const menuToggle = document.getElementById('menuToggle');

    menuToggle.addEventListener('click', function() {
        container.classList.toggle('menu-open');
    });

    // Función para mostrar un popup de confirmación antes de enviar la solicitud
    function mostrarAlerta() {
        Swal.fire({
            title: '¿Estás seguro de que quieres enviar la solicitud?',
            text: 'Este proceso será irreversible',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, enviar solicitud',
            cancelButtonText: 'Cancelar',
            customClass: {
                title: 'swal-custom-title',
                content: 'swal-custom-content'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // Si el usuario confirma, muestra un mensaje de éxito
                Swal.fire({
                    title: '¡Solicitud enviada!',
                    text: 'La solicitud ha sido enviada correctamente.',
                    icon: 'success',
                    customClass: {
                        title: 'swal-custom-title',
                        content: 'swal-custom-content'
                    }
                });
            } else {
                // Si el usuario cancela, muestra un mensaje informativo
                Swal.fire(
                    'Solicitud cancelada',
                    '',
                    'info'
                );
            }
        }).catch((error) => {
            // Si hay algún error, muestra un mensaje de error
            console.error('Error al mostrar el popup:', error);
            Swal.fire(
                'Error',
                'Hubo un problema al mostrar el popup de confirmación.',
                'error'
            );
        });
    }

    // Función para mostrar una imagen según la opción seleccionada
    function showImage(opcion) {
        var imagenContainer = document.getElementById("imagen-container");
        if (opcion === "deportes") {
            imagenContainer.innerHTML = '<img src="imagen_deportes.jpg" alt="Deportes">';
        } else if (opcion === "cultura") {
            imagenContainer.innerHTML = '<img src="imagen_cultura.jpg" alt="Cultura">';
        }
    }

    // Función para mostrar un popup de confirmación antes de cerrar sesión


