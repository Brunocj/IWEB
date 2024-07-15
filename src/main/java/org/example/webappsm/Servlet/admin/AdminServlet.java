package org.example.webappsm.Servlet.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.webappsm.model.beans.*;
import org.example.webappsm.model.daos.*;

import javax.lang.model.type.ArrayType;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
@WebServlet(name = "AdminServlet", value = "/Admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "pagPrincipal" : request.getParameter("action");

        String vista;
        RequestDispatcher rd;
        switch(action){
            case "pagPrincipal":
                vista = "vistas/jsp/ADMIN/pagina_principal_admin.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "dashboard":
                DashboardDao dashboardDao = new DashboardDao();
                String totalBaneados = dashboardDao.totalBaneados();
                String avgIncidencias = dashboardDao.avgIncidencias();
                String incidenciasMes = dashboardDao.incidenciasMes();
                String incidenciasSemana = dashboardDao.incidenciasSemana();
                String incidenciasHoy = dashboardDao.incidenciasHoy();
                String incidenciasPorAtender = dashboardDao.incidenciasPorAtender();
                String incidenciasUrbMax = dashboardDao.incidenciasUrbMax();
                String incidenciasUrbMin = dashboardDao.incidenciasUrbMin();
                ArrayList<Usuario> listaBaneados = dashboardDao.listarBaneados();
                ArrayList<String> tipoIncidencias = new ArrayList<>();
                ArrayList<Integer> cantidadTipo = new ArrayList<>();
                dashboardDao.incidenciasPorTipo(tipoIncidencias, cantidadTipo);
                ArrayList<String> urbanizaciones = new ArrayList<>();
                ArrayList<Integer> cantidadUrbanizacion = new ArrayList<>();
                dashboardDao.incidenciasPorUrbanizacion(urbanizaciones, cantidadUrbanizacion);
                ArrayList<String> estados = new ArrayList<>();
                ArrayList<Double> porcentajes = new ArrayList<>();
                dashboardDao.incidenciasPorEstado(estados, porcentajes);
                ArrayList<String> labelsChart2 = new ArrayList<>();
                ArrayList<Integer> incidenciasReportadas = new ArrayList<>();
                ArrayList<Integer> incidenciasResueltas = new ArrayList<>();
                dashboardDao.incidenciasRegistradas(labelsChart2, incidenciasReportadas, incidenciasResueltas);

                request.setAttribute("totalbaneados", totalBaneados);
                request.setAttribute("avgincidencias", avgIncidencias);
                request.setAttribute("incidenciasmes", incidenciasMes);
                request.setAttribute("incidenciassemana", incidenciasSemana);
                request.setAttribute("incidenciashoy",incidenciasHoy);
                request.setAttribute("incidenciasatender", incidenciasPorAtender);
                request.setAttribute("incidenciasurbmax",incidenciasUrbMax);
                request.setAttribute("incidenciasurbmin", incidenciasUrbMin);
                request.setAttribute("listabaneados", listaBaneados);
                request.setAttribute("tipoincidencias", tipoIncidencias);
                request.setAttribute("cantidadtipo", cantidadTipo);
                request.setAttribute("urbanizaciones", urbanizaciones);
                request.setAttribute("cantidadurbanizacion", cantidadUrbanizacion);
                request.setAttribute("estados", estados);
                request.setAttribute("porcentajes", porcentajes);
                request.setAttribute("labels", labelsChart2);
                request.setAttribute("incidenciasReportadas", incidenciasReportadas);
                request.setAttribute("incidenciasResueltas", incidenciasResueltas);
                vista = "vistas/jsp/ADMIN/Dashboard/dashboard.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "tablaSerenazgo":
                SerenazgoDao serenazgoDaoTabla = new SerenazgoDao();
                ArrayList<Serenazgo> listaserenazgo = serenazgoDaoTabla.listarSerenazgoTabla();

                request.setAttribute("listaserenazgo",listaserenazgo);
                vista = "vistas/jsp/ADMIN/Serenazgo/tabla_serenazgo.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "verSerenazgo":
                int idSerenazgo = Integer.parseInt(request.getParameter("idVer"));

                SerenazgoDao serenazgoDaoVista = new SerenazgoDao();

                Serenazgo serenazgoVer = serenazgoDaoVista.obtenerSerenazgoPorId(idSerenazgo);
                request.setAttribute("serenazgoVer", serenazgoVer);

                vista = "vistas/jsp/ADMIN/Serenazgo/datosSerenazgo.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "agregarSerenazgo":
                SerenazgoDao serenazgoDao = new SerenazgoDao();
                ArrayList<Turno> listaTurnos = serenazgoDao.listarTurnos();
                ArrayList<TipoSerenazgo> listaTipos = serenazgoDao.listarTipos();
                request.setAttribute("listaTurnos", listaTurnos);
                request.setAttribute("listaTipos", listaTipos);
                vista = "vistas/jsp/ADMIN/Serenazgo/serenazgoRegistro.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "editarSerenazgo":
                int idSerenazgoEditar = Integer.parseInt(request.getParameter("idEditar"));

                SerenazgoDao serenazgoDaoE = new SerenazgoDao();
                Serenazgo serenazgoEdit = serenazgoDaoE.obtenerSerenazgoPorId(idSerenazgoEditar);
                ArrayList<Turno> listaTurnosE = serenazgoDaoE.listarTurnos();
                ArrayList<TipoSerenazgo> listaTiposE = serenazgoDaoE.listarTipos();
                request.setAttribute("listaTurnos", listaTurnosE);
                request.setAttribute("listaTipos", listaTiposE);
                request.setAttribute("serenazgoEdit", serenazgoEdit);
                vista = "vistas/jsp/ADMIN/Serenazgo/editarSerenazgo.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "tablaProfesores":
                ProfesorDao profesorDao = new ProfesorDao();
                ArrayList<Profesor> list = profesorDao.listarProfesoresTabla();

                //OBJETO A ENVIAR
                request.setAttribute("listaprofesor",list);

                vista = "vistas/jsp/ADMIN/Profesores/tabla_profesor.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "editarProfesor":
                try {
                    int idProfesor = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ID del profesor recibido: " + idProfesor);

                    ProfesorDao profesorDaoEdit = new ProfesorDao();
                    Profesor profesor = profesorDaoEdit.obtenerProfesorPorId(idProfesor);

                    if (profesor == null) {
                        System.out.println("Profesor no encontrado en la base de datos");
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontró el profesor");
                        return;
                    }

                    request.setAttribute("profesor", profesor);
                    vista = "vistas/jsp/ADMIN/Profesores/editarProfesor.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    System.out.println("ID del profesor no es un número válido");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del profesor no es válido");
                }
                break;
            case "tablaAcceso":
                VecinosDao vecinosDao = new VecinosDao();
                ArrayList<Usuario> listaAcceso = vecinosDao.listarSoliAcceso();

                request.setAttribute("listaacceso", listaAcceso);
                vista = "vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/tabla_solicitudes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "tablaCoordinador":
                VecinosDao vecinosDao1 = new VecinosDao();
                ArrayList<Usuario> listaCoord = vecinosDao1.listarSoliCord();

                request.setAttribute("listacoord", listaCoord);
                vista = "vistas/jsp/ADMIN/Vecinos/Postulaciones_coordinacion/tabla_postulaciones.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "solicitudAcceso":
                int idUsuario = Integer.parseInt(request.getParameter("id")); // Asegúrate de que el nombre del parámetro sea "id"

                VecinosDao vecinosDao2 = new VecinosDao();

                Usuario usuario = vecinosDao2.obtenerUsuarioPorId(idUsuario);
                SystemDao system1= new SystemDao();
                String nuevaContrasena1 = system1.generarContra();
                request.setAttribute("usuarioVer", usuario);
                request.setAttribute("id",idUsuario);
                request.setAttribute("contra",nuevaContrasena1);

                vista = "vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/detalles_solicitudes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "solicitudCoordi":

                int idUsuarioCoordi = Integer.parseInt(request.getParameter("id")); // Asegúrate de que el nombre del parámetro sea "id"

                VecinosDao vecinosDaoS = new VecinosDao();

                Usuario usuario1 = vecinosDaoS.obtenerSolCoordiPorId(idUsuarioCoordi);
                SystemDao system= new SystemDao();
                // Generar la nueva contraseña (puedes ajustar esto según tus necesidades)
                String nuevaContrasena = system.generarContra();

                request.setAttribute("usuarioVerCoordi", usuario1);
                request.setAttribute("id",idUsuarioCoordi);
                request.setAttribute("contra",nuevaContrasena);

                vista = "vistas/jsp/ADMIN/Vecinos/Postulaciones_coordinacion/detalles_postulaciones.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "deleteVecino":

                VecinosDao vecinosDao3 = new VecinosDao();

                int id_usuario = Integer.parseInt(request.getParameter("id1"));
                int opcion_boton = Integer.parseInt(request.getParameter("id2"));

                vecinosDao3.borrar_vecino(id_usuario,opcion_boton); //revisar esta funcion (recive un parametro que no usa)


                break;
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Verificar si la acción es registrar un nuevo profesor
        if(action.equals("registrarDocente")) {
            String apellido = request.getParameter("apellido");
            String nombre = request.getParameter("nombre");
            String curso = request.getParameter("curso");
            // Obtener el valor del parámetro "area" como un entero
            int idArea = Integer.parseInt(request.getParameter("area"));

            Profesor nuevoProfesor = new Profesor();
            nuevoProfesor.setApellido(apellido);
            nuevoProfesor.setNombre(nombre);
            nuevoProfesor.setCurso(curso);
            nuevoProfesor.setIdArea(idArea);

            ProfesorDao profesorDao = new ProfesorDao();
            profesorDao.agregarProfesor(nuevoProfesor);

            // Redireccionar a la página de tablaProfesores después de completar el registro
            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaProfesores");
        }
        // Verificar si la acción es eliminar un profesor
        else if(action.equals("eliminarProfesor")) {
            // Obtener el ID del profesor a eliminar
            int idProfesor = Integer.parseInt(request.getParameter("id"));

            // Crear una instancia de ProfesorDao
            ProfesorDao profesorDao = new ProfesorDao();

            // Eliminar al profesor con el ID especificado
            profesorDao.eliminarProfesor(idProfesor);

            // Redireccionar a la página de tablaProfesores después de completar la eliminación
            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaProfesores");
        }else if (action.equals("actualizarProfesor")) {
            int idProfesor = Integer.parseInt(request.getParameter("idProfesor"));
            String apellido = request.getParameter("apellido");
            String nombre = request.getParameter("nombre");
            String curso = request.getParameter("curso");
            int idArea = Integer.parseInt(request.getParameter("area"));
            ProfesorDao profesorDao = new ProfesorDao();
            Profesor profesor = new Profesor();
            profesor.setIdProfesor(idProfesor);
            profesor.setApellido(apellido);
            profesor.setNombre(nombre);
            profesor.setCurso(curso);
            profesor.setIdArea(idArea);
            profesorDao.actualizarProfesor(profesor);

            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaProfesores");
            // Verificar otras acciones si es necesario
        }else if (action.equals("registrarSerenazgo")) {

                String nombreS = request.getParameter("nombreS").trim();
                String apellidoS = request.getParameter("apellidoS").trim();
                String dniS = request.getParameter("dniS").trim();
                String direccionS = request.getParameter("direccionS").trim();
                String telefonoS = request.getParameter("telefonoS").trim();


                // Validaciones
                boolean hasError = false;

                if (nombreS == null || nombreS.isEmpty() || nombreS.length() > 45 || !nombreS.matches("[\\p{L}\\s]+")) {
                    request.setAttribute("err1", "Debe ingresar un nombre válido");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE NOMBRE");
                }

                if (apellidoS == null || apellidoS.isEmpty() || apellidoS.length() > 45 || !apellidoS.matches("[\\p{L}\\s]+")) {
                    request.setAttribute("err2", "Debe ingresar un apellido válido");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE APELLIDO");
                }

                if (dniS == null || !dniS.matches("\\d{8}")) {
                    request.setAttribute("err3", "El número de DNI debe tener 8 dígitos.");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE DNI");
                }

                if (direccionS == null || direccionS.isEmpty() || direccionS.length() > 45) {
                    request.setAttribute("err4", "La dirección no debe sobrepasar los 45 caracteres");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE DIRECCION");
                }

                if (telefonoS == null || !telefonoS.matches("\\d{9}")) {
                    request.setAttribute("err5", "Número de teléfono no válido");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE TELEFONO");
                }

                String turnoS = request.getParameter("turnoS").trim();
                String tipoS = request.getParameter("tipoS").trim();
                String fNacimientoS = request.getParameter("fNacimientoS").trim();

                System.out.println("nombre: " +nombreS);
                System.out.println("apellido: " +apellidoS);
                System.out.println("dni: " +dniS);
                System.out.println("direccion: " +direccionS);
                System.out.println("telefono: " +telefonoS);
                System.out.println("turno: " +turnoS);
                System.out.println("tipo: " +tipoS);
                System.out.println("fecha de naciemiento: " +fNacimientoS);

                Date fNacimientoDate = null;
                if (fNacimientoS == null || fNacimientoS.isEmpty()) {
                    request.setAttribute("err6", "Debe ingresar una fecha de nacimiento");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE FNACIMIENTO");
                } else {
                    try {
                        // Crear un objeto SimpleDateFormat con el formato de la fecha
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        // Establecer modo estricto para la validación del formato
                        sdf.setLenient(false);
                        // Parsear la cadena de fecha a un objeto Date
                        fNacimientoDate = sdf.parse(fNacimientoS);
                    } catch (ParseException e) {
                        // Manejar la excepción en caso de que el formato de fecha sea incorrecto
                        request.setAttribute("err6", "Formato de fecha incorrecto. Use yyyy-MM-dd");
                        hasError = true;
                    }
                }

                if (turnoS == null || turnoS.isEmpty()) {
                    request.setAttribute("err7", "Debe seleccionar un turno de serenazgo");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE TURNO");
                }

                if (tipoS == null || tipoS.isEmpty()) {
                    request.setAttribute("err8", "Debe seleccionar un tipo de serenazgo");
                    hasError = true;
                    System.out.println("OCURRIO UN ERROR DE TIPO");
                }





            if (hasError) {
                    request.getRequestDispatcher("vistas/jsp/ADMIN/Serenazgo/serenazgoRegistro.jsp").forward(request, response);
                } else {

                    Serenazgo nuevoSerenazgo = new Serenazgo();
                    nuevoSerenazgo.setNombre(nombreS);
                    nuevoSerenazgo.setApellido(apellidoS);
                    nuevoSerenazgo.setDni(dniS);
                    nuevoSerenazgo.setDireccion(direccionS);
                    nuevoSerenazgo.setTelefono(telefonoS);


                    nuevoSerenazgo.setFNacimiento(fNacimientoDate);

                    int turnoId = Integer.parseInt(turnoS);
                    int tipoId = Integer.parseInt(tipoS);


                    SerenazgoDao serenazgoDao = new SerenazgoDao();
                    serenazgoDao.agregarSerenazgo(nuevoSerenazgo, turnoId, tipoId);

                    response.sendRedirect(request.getContextPath() + "/Admin?action=tablaSerenazgo");
                }

        }else if(action.equals("editarSerenazgo")){
            SerenazgoDao serenazgoDao = new SerenazgoDao();
            String idSerenazgoString = request.getParameter("idSerenazgo");
            int idSerenazgo = Integer.parseInt(idSerenazgoString);
            Serenazgo serenazgo = serenazgoDao.obtenerSerenazgoPorId(idSerenazgo);

            String nombreS = request.getParameter("nombreS");
            String apellidoS = request.getParameter("apellidoS");
            String dniS = request.getParameter("dniS");
            String direccionS = request.getParameter("direccionS");
            String telefonoS = request.getParameter("telefonoS");
            String turnoS = request.getParameter("turnoS");
            String tipoS = request.getParameter("tipoS");
            String fNacimientoS = request.getParameter("fNacimientoS");

            if (nombreS != null && !nombreS.isEmpty()) {
                serenazgo.setNombre(nombreS);
            }
            if (apellidoS != null && !apellidoS.isEmpty()) {
                serenazgo.setApellido(apellidoS);
            }
            if (dniS != null && !dniS.isEmpty()) {
                serenazgo.setDni(dniS);
            }
            if (direccionS != null && !direccionS.isEmpty()) {
                serenazgo.setDireccion(direccionS);
            }
            if (telefonoS != null && !telefonoS.isEmpty()) {
                serenazgo.setTelefono(telefonoS);
            }
            Integer turnoId = null;
            if (turnoS != null && !turnoS.isEmpty()) {
                try {
                    turnoId = Integer.parseInt(turnoS);
                } catch (NumberFormatException e) {
                    // Manejar el caso en que turnoS no sea un valor numérico válido
                    e.printStackTrace(); // o puedes imprimir un mensaje de error
                }
            }
            Integer tipoId = null;
            if (tipoS != null && !tipoS.isEmpty()) {
                try {
                    tipoId = Integer.parseInt(tipoS);
                } catch (NumberFormatException e) {
                    // Manejar el caso en que turnoS no sea un valor numérico válido
                    e.printStackTrace(); // o puedes imprimir un mensaje de error
                }
            }

            if (fNacimientoS != null && !fNacimientoS.isEmpty()) {
                try {
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    Date fechaNacimiento = formatter.parse(fNacimientoS);
                    serenazgo.setFNacimiento(fechaNacimiento);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }

            serenazgoDao.editarSerenazgo(serenazgo, turnoId, tipoId);
            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaSerenazgo");

        }else if(action.equals("eliminarSerenazgo")){

            String idParam = request.getParameter("id");
            if (idParam != null) {
                int idSerenazgo = Integer.parseInt(idParam);

                SerenazgoDao serenazgoDao = new SerenazgoDao();
                serenazgoDao.eliminarSerenazgo(idSerenazgo);

                response.sendRedirect(request.getContextPath() + "/Admin?action=tablaSerenazgo");
            }
        }else if(action.equals("opcionAcceso")){
            String opcionSeleccionada = request.getParameter("opcionSeleccionada");
            int id = Integer.parseInt(request.getParameter("idUser"));

            SystemDao daosys = new SystemDao();
            VecinosDao vecinosDao = new VecinosDao();
            Usuario usuario = vecinosDao.obtenerUsuarioPorId(id);
            String tituloCorreo = request.getParameter("tituloCorreo");
            String cuerpoCorreo = request.getParameter("cuerpoCorreo");
            String nuevaContrasena = request.getParameter("contra");
            String nuevaContraHash = daosys.hashPassword(nuevaContrasena);

            System.out.println(nuevaContrasena);


            if (opcionSeleccionada.equals("aprobar")) {
                vecinosDao.editarEstadoAprobado(id, nuevaContraHash);
                daosys.enviarCorreo(usuario.getCorreoE(), tituloCorreo, cuerpoCorreo);
            } else if (opcionSeleccionada.equals("denegar")) {
                vecinosDao.eliminarUsuarioPorId(id);
                daosys.enviarCorreo(usuario.getCorreoE(), tituloCorreo, cuerpoCorreo);
            }

            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaAcceso");
        }else if(action.equals("opcionSoli")){
            String opcionSeleccionada = request.getParameter("opcionSeleccionada");
            int id = Integer.parseInt(request.getParameter("idUser"));
            int idArea = Integer.parseInt(request.getParameter("idArea"));
            VecinosDao vecinosDao = new VecinosDao();
            Usuario usuario = vecinosDao.obtenerUsuarioPorId(id);
            String tituloCorreo = request.getParameter("tituloCorreo");
            String cuerpoCorreo = request.getParameter("cuerpoCorreo");
            SystemDao daosys = new SystemDao();
            String nuevaContrasena = request.getParameter("contra");

            if (opcionSeleccionada.equals("aprobar")) {
                vecinosDao.editarRol(id, idArea, nuevaContrasena);
                daosys.enviarCorreo(usuario.getCorreoE(), tituloCorreo, cuerpoCorreo);

                String contraHasheada = daosys.hashPassword(nuevaContrasena);
                daosys.actualizarContra(id,contraHasheada);

            } else if (opcionSeleccionada.equals("denegar")) {
                vecinosDao.eliminarSolicitud(id);
                daosys.enviarCorreo(usuario.getCorreoE(), tituloCorreo, cuerpoCorreo);
            }

            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaCoordinador");
        }else{
            response.sendRedirect(request.getContextPath() + "/Admin");
        }
    }

}

