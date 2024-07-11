package org.example.webappsm.Servlet.coordinador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.webappsm.model.beans.*;
import org.example.webappsm.model.daos.CoordinadorDao;
import org.example.webappsm.model.daos.UserDao;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;


import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name ="CoordinadorServlet" , value = "/Coordinador")
@MultipartConfig
public class CoordinadorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd ;
        UserDao userDao  = new UserDao();

        switch (action){
            case "pagPrincipal":
                vista = "vistas/jsp/COORDINADOR/html/PaginaPrincipal/pagina_principal_coordinador.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "miPerfil":
                int idusuario = Integer.parseInt(request.getParameter("id"));
                Usuario u = userDao.mostrarUsuarioID(idusuario);

                request.setAttribute("usuario", u);
                vista = "vistas/jsp/COORDINADOR/html/MiPerfil/Miperfil.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "incidencias":
                ArrayList<Incidencia> listaIncidencias = userDao.listarIncidencias();
                request.setAttribute("listaincidencias", listaIncidencias);

                vista = "vistas/jsp/COORDINADOR/html/Incidencias/incidencia_coordinador.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "registroIncidencia":
                ArrayList<Urbanizacion> listaUrbanizaciones = userDao.listarUrbanizaciones();
                ArrayList<Tipos> tiposIncidencias = userDao.listarTiposIncidencias();
                request.setAttribute("listaUrbanizaciones", listaUrbanizaciones);
                request.setAttribute("tiposIncidencias", tiposIncidencias);
                vista = "vistas/jsp/COORDINADOR/html/Incidencias/registrar_incidencia.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "infoIncidencia":
                int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
                Incidencia incidencia = userDao.getIncidenciaId(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                vista = "vistas/jsp/COORDINADOR/html/Incidencias/incidencia_info.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;




            case "eventos":
                CoordinadorDao coordinadorDao2 = new CoordinadorDao();
                int idCoordinador = 3; // posteriormente obtener mediante un request.getParameter
                ArrayList<Evento> listarEventoscreadoss = coordinadorDao2.listarEventosCreados(idCoordinador);
                request.setAttribute("listaEventos", listarEventoscreadoss);
                vista = "vistas/jsp/COORDINADOR/html/Eventos/eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "EventosNota":

                vista = "vistas/jsp/COORDINADOR/html/Eventos/eventospasados.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;


            case  "escogerProfesor":
                vista = "vistas/jsp/COORDINADOR/html/Eventos/tabla_docentes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case  "editarEvento":
                try {
                    int idEvento = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ID del evento recibido: " + idEvento);

                    CoordinadorDao eventoDAOedit = new CoordinadorDao();
                    Evento evento = eventoDAOedit.obtenerEventoPorId(idEvento);

                    ArrayList<String> materiales = eventoDAOedit.obtenerNombresMaterialesPorIdEvento(idEvento);
                    System.out.println("Materiales obtenidos: " + materiales);
                    if (evento.getImagenes() != null) {
                        String base64Image = Base64.getEncoder().encodeToString(evento.getImagenes());
                        request.setAttribute("base64Image", base64Image);
                    }

                    request.setAttribute("evento", evento);
                    request.setAttribute("materiales", materiales);
                    vista = "/vistas/jsp/COORDINADOR/html/Eventos/editar_evento.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    System.out.println("ID del empleado no es un número válido");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del empleado no es válido");
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        UserDao userDao = new UserDao();
        switch (action) {

            case "registrarEvento":
                CoordinadorDao coordinadorDao = new CoordinadorDao();
                String nombre_evento = request.getParameter("nombre_evento");
                byte[] imagen = obtenerImagenComoByteArray((request.getPart("imagenEvento").getInputStream()));
                String descripcion = request.getParameter("descripcion");
                String lugar = request.getParameter("lugar");

                String idCoordinadorStr = request.getParameter("idCoordinador");
                String idProfesorStr = request.getParameter("idProfesor");
                String vacantesStr = request.getParameter("vacantes");
                String recurrenciaStr = request.getParameter("recurrencia");

                if (idCoordinadorStr == null || idCoordinadorStr.isEmpty() ||
                        idProfesorStr == null || idProfesorStr.isEmpty() ||
                        vacantesStr == null || vacantesStr.isEmpty() ||
                        recurrenciaStr == null || recurrenciaStr.isEmpty()) {

                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Todos los campos son obligatorios");
                    return;
                }

                int idCoordinador = Integer.parseInt(idCoordinadorStr);
                int idProfesor = Integer.parseInt(idProfesorStr);
                int vacantes = Integer.parseInt(vacantesStr);
                int recurrencia = Integer.parseInt(recurrenciaStr);

                int idEstadoEvento = 1;
                int idArea = 2;
                String resumen = "Resumen";

                String fechaString = request.getParameter("fecha");
                Date fechaEvento = null;

                if (fechaString != null && !fechaString.isEmpty()) {
                    try {
                        fechaEvento = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString);
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                }

                String horaString = request.getParameter("hora");
                Time horaEvento = null;

                if (horaString != null && !horaString.isEmpty()) {
                    try {
                        if (!horaString.matches("^\\d{2}:\\d{2}$")) {
                            throw new IllegalArgumentException("Formato de hora inválido, debería ser HH:mm");
                        }

                        horaString += ":00";

                        horaEvento = Time.valueOf(horaString);
                    } catch (IllegalArgumentException e) {
                        throw new RuntimeException("Formato de hora inválido 2, debería ser HH:mm", e);
                    }
                } else {
                    throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
                }

                if (horaEvento == null) {
                    throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
                }

                String horaString2 = request.getParameter("horaFin");
                Time horaEvento2 = null;

                if (horaString2 != null && !horaString2.isEmpty()) {
                    try {
                        if (!horaString2.matches("^\\d{2}:\\d{2}$")) {
                            throw new IllegalArgumentException("Formato de hora inválido, debería ser HH:mm");
                        }

                        horaString2 += ":00";

                        horaEvento2 = Time.valueOf(horaString2);
                    } catch (IllegalArgumentException e) {
                        throw new RuntimeException("Formato de hora inválido 2, debería ser HH:mm", e);
                    }
                } else {
                    throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
                }

                if (horaEvento2 == null) {
                    throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
                }

                String fechaString2 = "2000-03-31";
                byte[] entrada = null;

                String fechaString3 = "2000-03-31";
                byte[] salida = null;

                String materiales = request.getParameter("materiales");
                System.out.println("Materiales recibidos: " + materiales); // Log para verificar

                Evento evento = new Evento();
                evento.setTitulo(nombre_evento);
                evento.setDescripcion(descripcion);
                evento.setFecha(fechaEvento);
                evento.setHora(horaEvento);
                evento.setHoraFin(horaEvento2);
                evento.setUbicacion(lugar);
                evento.setRecurrencia(recurrencia);
                evento.setImagenes(imagen);
                evento.setVacantes(vacantes);
                evento.setIngreso(entrada);
                evento.setSalida(salida);
                evento.setIdProfesor(idProfesor);
                evento.setIdCoordinador(idCoordinador);
                evento.setIdEstadoEvento(idEstadoEvento);
                evento.setIdArea(idArea);
                evento.setResumen(resumen);
                boolean exito;
                int idEventoGenerado = coordinadorDao.registrarEvento(evento);

                if (materiales != null && !materiales.trim().isEmpty()) {
                    String[] materialesArray = materiales.split(",");
                    for (String material : materialesArray) {
                        if (!material.trim().isEmpty()) {
                            coordinadorDao.registrarMaterial(idEventoGenerado, material.trim());
                        }
                    }
                }

                response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos");
                break;
            case "actualizarEvento":
                actualizarEvento(request, response);
                response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos");
                break;
            case "registrarIncidencia":
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String lugarIncidencia = request.getParameter("lugar");
                String referencia = request.getParameter("ref");
                int idUrbanizacion = Integer.parseInt(request.getParameter("idUrb"));
                String contacto = request.getParameter("contacto");
                Boolean necesitaAmbulancia = Boolean.parseBoolean(request.getParameter("ambulanciaSN"));
                byte[] evidencia = obtenerImagenComoByteArray((request.getPart("foto").getInputStream()));
                String fechaStr = request.getParameter("fecha");

                try {
                    // Definir el formato de la fecha/hora
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    // Parsear la cadena a un objeto java.util.Date
                    Date fechaUtil = sdf.parse(fechaStr);
                    // Convertir el objeto java.util.Date a java.sql.Timestamp
                    Timestamp fechaSql = new Timestamp(fechaUtil.getTime());
                    incidencia.setFechaIncidencia(fechaSql);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                int idTipo = Integer.parseInt(request.getParameter("idTipoIncidencia"));
                int idUsuarioIncidencia = Integer.parseInt(request.getParameter("idUsuario"));
                incidencia.setNombre(nombreIncidencia);
                incidencia.setLugar(lugarIncidencia);
                incidencia.setReferencia(referencia);
                incidencia.setIdUrbanizacion(idUrbanizacion);
                incidencia.setContactoO(contacto);
                incidencia.setAmbulanciaI(necesitaAmbulancia);
                incidencia.setImgEvidencia(evidencia);
                incidencia.setIdTipo(idTipo);
                incidencia.setIdUsuario(idUsuarioIncidencia);
                userDao.agregarIncidencia(incidencia);
                response.sendRedirect(request.getContextPath() + "/Coordinador?action=incidencias");
                break;


            default:
                throw new IllegalStateException("Unexpected value: " + action);
        }
    }

    private void actualizarEvento(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            CoordinadorDao coordinadorDao2 = new CoordinadorDao();
            String nombre_evento2 = request.getParameter("nombre_evento");
            byte[] imagen2 = null;
            if (request.getPart("imagenEvento") != null) {
                imagen2 = obtenerImagenComoByteArray(request.getPart("imagenEvento").getInputStream());
            }
            String descripcion2 = request.getParameter("descripcion");
            String lugar2 = request.getParameter("lugar");

            String idCoordinadorStr2 = request.getParameter("idCoordinador");
            String idProfesorStr2 = request.getParameter("idProfesor");
            String vacantesStr2 = request.getParameter("vacantes");
            String recurrenciaStr2 = request.getParameter("recurrencia");


            int idCoordinador2 = Integer.parseInt(idCoordinadorStr2);
            int idProfesor2 = Integer.parseInt(idProfesorStr2);
            int vacantes2 = Integer.parseInt(vacantesStr2);
            int recurrencia2 = Integer.parseInt(recurrenciaStr2);

            int idEstadoEvento2 = 1;
            int idArea2 = 2;
            String resumen2 = "Resumen";

            String fechaString5 = request.getParameter("fecha");
            Date fechaEvento2 = null;

            if (fechaString5 != null && !fechaString5.isEmpty()) {
                try {
                    fechaEvento2 = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString5);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }

            String horaString5 = request.getParameter("hora");
            Time horaEvento5 = null;

            if (horaString5 != null && !horaString5.isEmpty()) {
                try {
                    if (!horaString5.matches("^\\d{2}:\\d{2}$")) {
                        throw new IllegalArgumentException("Formato de hora inválido, debería ser HH:mm");
                    }

                    horaString5 += ":00";

                    horaEvento5 = Time.valueOf(horaString5);
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException("Formato de hora inválido 2, debería ser HH:mm", e);
                }
            } else {
                throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
            }

            if (horaEvento5 == null) {
                throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
            }

            String horaString6 = request.getParameter("horaFin");
            Time horaEvento6 = null;

            if (horaString6 != null && !horaString6.isEmpty()) {
                try {
                    if (!horaString6.matches("^\\d{2}:\\d{2}$")) {
                        throw new IllegalArgumentException("Formato de hora inválido, debería ser HH:mm");
                    }

                    horaString6 += ":00";

                    horaEvento6 = Time.valueOf(horaString6);
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException("Formato de hora inválido 2, debería ser HH:mm", e);
                }
            } else {
                throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
            }

            if (horaEvento6 == null) {
                throw new RuntimeException("La hora del evento no fue seleccionada correctamente");
            }

            byte[] entrada2 = null;

            byte[] salida2 = null;

            String materiales2 = request.getParameter("materiales");
            System.out.println("Materiales recibidos: " + materiales2); // Log para verificar

            Evento eventoedit = new Evento();
            eventoedit.setIdEvento(idEvento); // Necesario para la actualización
            eventoedit.setTitulo(nombre_evento2);
            eventoedit.setDescripcion(descripcion2);
            eventoedit.setFecha(fechaEvento2);
            eventoedit.setHora(horaEvento5);
            eventoedit.setHoraFin(horaEvento6);
            eventoedit.setUbicacion(lugar2);
            eventoedit.setRecurrencia(recurrencia2);
            eventoedit.setImagenes(imagen2);
            eventoedit.setVacantes(vacantes2);
            eventoedit.setIngreso(entrada2);
            eventoedit.setSalida(salida2);
            eventoedit.setIdProfesor(idProfesor2);
            eventoedit.setIdCoordinador(idCoordinador2);
            eventoedit.setIdEstadoEvento(idEstadoEvento2);
            eventoedit.setIdArea(idArea2);
            eventoedit.setResumen(resumen2);
            boolean exito2;

            coordinadorDao2.actualizarEvento(eventoedit);
            actualizarMaterialesEvento(idEvento, materiales2, coordinadorDao2);

            response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos");
        } catch (NumberFormatException e) {
            e.printStackTrace();

        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public static byte[] obtenerImagenComoByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }

    private void actualizarMaterialesEvento(int idEvento, String nuevosMateriales, CoordinadorDao coordinadorDao) {
        ArrayList<String> materialesActuales = coordinadorDao.obtenerNombresMaterialesPorIdEvento(idEvento);

        // Convertir los nuevos materiales en una lista
        ArrayList<String> nuevosMaterialesList = new ArrayList<>(Arrays.asList(nuevosMateriales.split(",")));

        // Identificar materiales a eliminar y a añadir
        ArrayList<String> materialesAEliminar = new ArrayList<>(materialesActuales);
        ArrayList<String> materialesAAñadir = nuevosMaterialesList;

        materialesAEliminar.removeAll(nuevosMaterialesList); // Materiales a eliminar
        materialesAAñadir.removeAll(materialesActuales); // Materiales a añadir

        // Eliminar materiales
        for (String material : materialesAEliminar) {
            coordinadorDao.eliminarMaterial(idEvento, material.trim());
        }

        // Añadir nuevos materiales
        for (String material : materialesAAñadir) {
            if (!material.trim().isEmpty()) {
                coordinadorDao.registrarMaterial(idEvento, material.trim());
            }
        }
    }


}

