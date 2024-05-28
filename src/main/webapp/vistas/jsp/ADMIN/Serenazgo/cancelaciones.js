function CancelarPagPrincipal(){
    Swal.fire({
        title: "Estás seguro?",
        text: "Perdera todo su progreso",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, cancelar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Cancelado!",
                text: "Se ha cancelado satisfactoriamente",
                icon: "success"
            }).then(() => {
                window.location.href = "../pag_principal.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}  

function CancelarDashboard() {
    Swal.fire({
        title: "Estás seguro?",
        text: "Perdera todo su progreso",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, cancelar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Cancelado!",
                text: "Se ha cancelado satisfactoriamente",
                icon: "success"
            }).then(() => {
                window.location.href = "../../ADMIN/Dashboard/dashboard.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}  


function CancelarSerenazgo() {
    Swal.fire({
        title: "Estás seguro?",
        text: "Perdera todo su progreso",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, cancelar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Cancelado!",
                text: "Se ha cancelado satisfactoriamente",
                icon: "success"
            }).then(() => {
                window.location.href = "../../ADMIN/Serenazgo/tabla_serenazgo.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}  


function CancelarProfesores() {
    Swal.fire({
        title: "Estás seguro?",
        text: "Perdera todo su progreso",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, cancelar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Cancelado!",
                text: "Se ha cancelado satisfactoriamente",
                icon: "success"
            }).then(() => {
                window.location.href = "../../ADMIN/Profesores/tabla_profesor.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}  


function CancelarSolAcceso() {
    Swal.fire({
        title: "Estás seguro?",
        text: "Perdera todo su progreso",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, cancelar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Cancelado!",
                text: "Se ha cancelado satisfactoriamente",
                icon: "success"
            }).then(() => {
                window.location.href = "../../ADMIN/Vecinos/Solicitudes a acceso/tabla_solicitudes.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}  

function CancelarSolCoordinacion() {
    Swal.fire({
        title: "Estás seguro?",
        text: "Perdera todo su progreso",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00913f",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, cancelar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Cancelado!",
                text: "Se ha cancelado satisfactoriamente",
                icon: "success"
            }).then(() => {
                window.location.href = "../../ADMIN/Vecinos/Postulaciones a coordinacion/tabla_postulaciones.html";
            });
        }
    });

    // Evitar que el formulario se envíe automáticamente
    return false;
}  