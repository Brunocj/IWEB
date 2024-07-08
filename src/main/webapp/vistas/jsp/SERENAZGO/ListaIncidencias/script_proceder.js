function mostrarFormulario() {
    // Obtener todos los checkboxes de opciones
    var checkboxes = document.querySelectorAll('input[name="opcion"]');
    
    // Array para almacenar las opciones seleccionadas
    var opcionesSeleccionadas = [];
    
    // Recorrer todos los checkboxes y almacenar las opciones seleccionadas
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            opcionesSeleccionadas.push(checkbox.value);
        }
    });
    
    // Mostrar los formularios correspondientes a las opciones seleccionadas
    opcionesSeleccionadas.forEach(function(opcionSeleccionada) {
        var formularioMostrar = document.querySelector('.form-' + opcionSeleccionada);
        if (formularioMostrar) {
            formularioMostrar.style.display = 'block';
        }
    });
    
    // Ocultar los formularios no seleccionados
    var formularios = document.querySelectorAll('.form-ambulancia, .form-policia');
    formularios.forEach(function(formulario) {
        if (!opcionesSeleccionadas.includes(formulario.classList[0].replace('form-', ''))) {
            formulario.style.display = 'none';
        }
    });
}