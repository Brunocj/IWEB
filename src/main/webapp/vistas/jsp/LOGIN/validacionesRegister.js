document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector(".flexform");

    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Evitar el envío automático del formulario

        // Limpiar mensajes de error anteriores
        clearErrors();

        // Obtener valores de los campos
        const nombre = document.getElementById("nombre").value.trim();
        const apellido = document.getElementById("apellido").value.trim();
        const idDoc = document.getElementById("docList").value;
        const documento = document.getElementById("documento").value.trim();
        const direccion = document.getElementsByName("direccion")[0].value.trim();
        const distrito = document.getElementById("distrito").value.trim();
        const urbanizacion = document.getElementById("urbanizacion").value.trim();
        const correo = document.getElementsByName("correo")[0].value.trim();
        const contacto = document.getElementsByName("contacto")[0].value.trim();

        // Validar cada campo
        let isValid = true;

        if (!isValidText(nombre)) {
            showError("errNombre", "El nombre solo debe contener letras.");
            isValid = false;
        }

        if (!isValidText(apellido)) {
            showError("errApellido", "El apellido solo debe contener letras.");
            isValid = false;
        }

        if (!isValidDocumento(idDoc, documento)) {
            showError("errDocumento", "Por favor ingrese un documento válido.");
            isValid = false;
        }

        if (!isValidLength(direccion, 70)) {
            showError("errDireccion", "La dirección debe tener máximo 70 caracteres.");
            isValid = false;
        }

        if (!isValidLength(distrito, 45)) {
            showError("errDistrito", "El distrito debe tener máximo 45 caracteres.");
            isValid = false;
        }

        if (!isValidLength(urbanizacion, 45)) {
            showError("errUrbanizacion", "La urbanización debe tener máximo 45 caracteres.");
            isValid = false;
        }

        if (!isValidEmail(correo)) {
            showError("errCorreo", "Ingrese un correo electrónico válido.");
            isValid = false;
        }

        if (!isValidPhoneNumber(contacto)) {
            showError("errContacto", "El número de contacto debe contener solo números y tener máximo 9 dígitos.");
            isValid = false;
        }

        // Si todos los campos son válidos, enviar el formulario
        if (isValid) {
            form.submit();
        }
    });

    // Función para limpiar mensajes de error
    function clearErrors() {
        const errorMessages = document.querySelectorAll(".error-message");
        errorMessages.forEach(function(element) {
            element.textContent = "";
        });
    }

    // Función para mostrar mensaje de error debajo del campo correspondiente
    function showError(idError, message) {
        const errorElement = document.getElementById(idError);
        errorElement.textContent = message;
    }

    // Función para validar texto (solo letras)
    function isValidText(text) {
        return /^[A-Za-zñÑáéíóúÁÉÍÓÚ\s]+$/.test(text);
    }

    // Función para validar longitud máxima de un campo
    function isValidLength(text, maxLength) {
        return text.length <= maxLength;
    }

    // Función para validar tipo de documento y número
    function isValidDocumento(idDoc, documento) {
        if (idDoc === "1") { // DNI
            return /^\d{8}$/.test(documento);
        } else if (idDoc === "3" || idDoc === "2") { // Pasaporte o Carnet de Extranjería (otros tipos, validar según necesidad)
            return true; // Aquí podrías agregar validaciones adicionales si es necesario
        } else {
            return false;
        }
    }

    // Función para validar correo electrónico
    function isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }

    // Función para validar número de teléfono
    function isValidPhoneNumber(phone) {
        return /^\d{1,9}$/.test(phone);
    }
});
