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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;

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
            case "tablaInscritos":
                try {
                    int idEvento = Integer.parseInt(request.getParameter("id"));

                    CoordinadorDao coordinadorDaolista = new CoordinadorDao();
                    ArrayList<Usuario> listaincritos = coordinadorDaolista.listarInscritos(idEvento);

                    request.setAttribute("listaInscritos", listaincritos);
                    request.setAttribute("idEvento", idEvento); // Añadir el idEvento como atributo
                    vista = "vistas/jsp/COORDINADOR/html/Eventos/tabla_inscritos.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del profesor no es válido");
                }
                break;
            case "tablaProfesores":
                CoordinadorDao coordinadorDao = new CoordinadorDao();
                int idArea = Integer.parseInt(request.getParameter("id"));
                String fechaString = request.getParameter("fechadispo");
                java.sql.Date fechaEvento = null;

                if (fechaString != null && !fechaString.isEmpty()) {
                    try {
                        java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString);
                        fechaEvento = new java.sql.Date(utilDate.getTime());  // Convertir java.util.Date a java.sql.Date
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                }

                String horaString = request.getParameter("horaIniciodispo");
                java.sql.Time horaEvento = null;

                if (horaString != null && !horaString.isEmpty()) {
                    try {
                        if (!horaString.matches("^\\d{2}:\\d{2}$")) {
                            throw new IllegalArgumentException("Formato de hora inválido, debería ser HH:mm");
                        }
                        horaString += ":00";
                        horaEvento = java.sql.Time.valueOf(horaString);
                    } catch (IllegalArgumentException e) {
                        throw new RuntimeException("Formato de hora inválido, debería ser HH:mm", e);
                    }
                }

                String horaString2 = request.getParameter("horaFindispo");
                java.sql.Time horaEvento2 = null;

                if (horaString2 != null && !horaString2.isEmpty()) {
                    try {
                        if (!horaString2.matches("^\\d{2}:\\d{2}$")) {
                            throw new IllegalArgumentException("Formato de hora inválido, debería ser HH:mm");
                        }
                        horaString2 += ":00";
                        horaEvento2 = java.sql.Time.valueOf(horaString2);
                    } catch (IllegalArgumentException e) {
                        throw new RuntimeException("Formato de hora inválido, debería ser HH:mm", e);
                    }
                }

                ArrayList<Profesor> list = coordinadorDao.listarProfesoresTablaDisponibilidad(fechaEvento, horaEvento, horaEvento2,idArea);

                request.setAttribute("listaprofesor", list);

                vista = "vistas/jsp/COORDINADOR/html/Eventos/tabla_docentes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;


            case "eventos":
                CoordinadorDao coordinadorDao2 = new CoordinadorDao();
                int idusuarioeventos = Integer.parseInt(request.getParameter("id"));
                Usuario usuarioevento = userDao.mostrarUsuarioID(idusuarioeventos);
                int idCoordinador = usuarioevento.getId();
                ArrayList<Evento> listarEventoscreadoss = coordinadorDao2.listarEventosCreados(idCoordinador);
                request.setAttribute("listaEventos", listarEventoscreadoss);
                vista = "vistas/jsp/COORDINADOR/html/Eventos/eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "agregarNota":
                int idEventoNota = Integer.parseInt(request.getParameter("id"));
                System.out.println("ID del evento recibido: " + idEventoNota);

                CoordinadorDao eventoDAONota2 = new CoordinadorDao();
                Evento evento2 = eventoDAONota2.obtenerEventoPorId(idEventoNota);

                if (evento2.getImagenes() != null) {
                    String base64Image = Base64.getEncoder().encodeToString(evento2.getImagenes());
                    request.setAttribute("base64Image", base64Image);
                }

                request.setAttribute("eventoNota", evento2);

                vista = "vistas/jsp/COORDINADOR/html/Eventos/agregarnota.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "EventosNota":
                CoordinadorDao coordinadorDaonota = new CoordinadorDao();
                int idusuarionota = Integer.parseInt(request.getParameter("id"));
                Usuario usuarionota = userDao.mostrarUsuarioID(idusuarionota);
                int idCoordinador2 = usuarionota.getId(); // posteriormente obtener mediante un request.getParameter
                ArrayList<Evento> listarEventosNotas = coordinadorDaonota.listarEventosNota(idCoordinador2);
                request.setAttribute("listaEventosNota", listarEventosNotas);

                vista = "vistas/jsp/COORDINADOR/html/Eventos/eventospasados.jsp";
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
            case "profesorEscogido":
                String idProfesorStr = request.getParameter("idProfesor");
                if (idProfesorStr == null || idProfesorStr.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El ID del profesor no puede ser nulo o vacío.");
                    return;
                }

                try {
                    int idProfesor = Integer.parseInt(idProfesorStr);
                    request.setAttribute("idProfesor", idProfesor);
                    vista = "vistas/jsp/COORDINADOR/html/Eventos/registroevento.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El ID del profesor no es válido.");
                }
                break;
            case  "verEventoNota":
                int idEvento = Integer.parseInt(request.getParameter("id"));
                System.out.println("ID del evento recibido: " + idEvento);

                CoordinadorDao eventoDAONota = new CoordinadorDao();
                Evento evento = eventoDAONota.obtenerEventoPorId(idEvento);

                ArrayList<String> materiales = eventoDAONota.obtenerNombresMaterialesPorIdEvento(idEvento);
                System.out.println("Materiales obtenidos: " + materiales);
                if (evento.getImagenes() != null) {
                    String base64Image = Base64.getEncoder().encodeToString(evento.getImagenes());
                    request.setAttribute("base64Image", base64Image);
                }

                request.setAttribute("evento", evento);
                request.setAttribute("materiales", materiales);

                vista = "vistas/jsp/COORDINADOR/html/Eventos/detalleseventospasados.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);

                break;
            default:
                vista = "vistas/jsp/ERROR/error3.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        UserDao userDao = new UserDao();
        switch (action) {
            case "pasoEventoPasado":
                Part fotoPartimg1 = request.getPart("img1");
                Part fotoPartimg2 = request.getPart("img2");
                String nota = request.getParameter("texto");
                int idEventoPasado = Integer.parseInt(request.getParameter("idEvento"));
                byte[] img1 = obtenerImagenComoByteArray(fotoPartimg1.getInputStream());
                byte[] img2 = obtenerImagenComoByteArray(fotoPartimg2.getInputStream());


                CoordinadorDao coordinadorDaoregisPasado = new CoordinadorDao();
                coordinadorDaoregisPasado.registroNotas(img1, img2, idEventoPasado,nota);

                response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos");
                break;
            case "registrarSalida":
                Part fotoPart = request.getPart("foto");
                byte[] imagensalida = obtenerImagenComoByteArray(fotoPart.getInputStream());
                int idEvento5 = Integer.parseInt(request.getParameter("idEvento"));

                CoordinadorDao coordinadorDaoregis = new CoordinadorDao();
                coordinadorDaoregis.registrarSalida(idEvento5, imagensalida);

                response.sendRedirect(request.getContextPath() + "/Coordinador?action=verEventoNota&id=" + idEvento5);
                break;

            case "registrarEvento":
                CoordinadorDao coordinadorDao = new CoordinadorDao();
                int idusuarioregistro = Integer.parseInt(request.getParameter("idCoordi"));
                Usuario usuarioregistro = userDao.mostrarUsuarioID(idusuarioregistro);
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
                int idArea = usuarioregistro.getIdArea();
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

                byte[] entrada = null;
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

                response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos&id="+idusuarioregistro);
                break;
            case "borrarEvento":
                int idEvento = Integer.parseInt(request.getParameter("id"));
                int idcoordi = Integer.parseInt(request.getParameter("idcoordi"));
                CoordinadorDao coordinadorDao1 = new CoordinadorDao();

                coordinadorDao1.eliminarEvento(idEvento);

                response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos&id="+idcoordi);
                ;
                break;
            case "eliminarInscrito":
                int idUsuario_elim = Integer.parseInt(request.getParameter("idUsuario"));
                int idEvento_elim = Integer.parseInt(request.getParameter("idEvento"));
                CoordinadorDao coordinadorDaoelim = new CoordinadorDao();
                coordinadorDaoelim.eliminarInscrito(idUsuario_elim, idEvento_elim);
                response.sendRedirect(request.getContextPath() + "/Coordinador?action=tablaInscritos&id=" + idEvento_elim);
                break;
            case "actualizarEvento":
                actualizarEvento(request, response);
                break;
            case "registrarIncidencia":
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String lugar1 = request.getParameter("lugar");
                String referencia = request.getParameter("ref");
                String contacto = request.getParameter("contacto");
                String fechaStr = request.getParameter("fecha");
                String necesitaAmbulanciaStr = request.getParameter("ambulanciaSN");
                String idUrbanizacionStr = request.getParameter("urbanizacionId");
                String idTipoStr = request.getParameter("idTipoIncidencia");
                String idUsuarioIncidenciaStr = request.getParameter("idUsuario");

                boolean validacionContacto = true;
                if (contacto != null && !contacto.trim().isEmpty()) {
                    if (contacto.length() != 9) {
                        validacionContacto = false;
                    } else {
                        try {
                            int contactoInt = Integer.parseInt(contacto);
                        } catch (NumberFormatException e) {
                            validacionContacto = false;
                        }
                    }
                } else {
                    validacionContacto = false;
                }


                // Imprimir todos los parámetros recibidos
                System.out.println("Parámetros recibidos:");
                System.out.println("Nombre de la incidencia: " + nombreIncidencia);
                System.out.println("Lugar: " + lugar1);
                System.out.println("Referencia: " + referencia);
                System.out.println("Contacto: " + contacto);
                System.out.println("Fecha: " + fechaStr);
                System.out.println("Necesita ambulancia: " + necesitaAmbulanciaStr);
                System.out.println("ID de urbanización: " + idUrbanizacionStr);
                System.out.println("ID de tipo de incidencia: " + idTipoStr);
                System.out.println("ID de usuario: " + idUsuarioIncidenciaStr);

                if (idUrbanizacionStr != null && !idUrbanizacionStr.isEmpty() && validacionContacto &&
                        idTipoStr != null && !idTipoStr.isEmpty() && nombreIncidencia.length()<=100 && lugar1.length()<=100 && referencia.length() <=70 &&
                        idUsuarioIncidenciaStr != null && !idUsuarioIncidenciaStr.isEmpty()) {
                    int idUrbanizacion = Integer.parseInt(idUrbanizacionStr);
                    int idTipo = Integer.parseInt(idTipoStr);
                    int idUsuarioIncidencia = Integer.parseInt(idUsuarioIncidenciaStr);
                    Boolean necesitaAmbulancia = Boolean.parseBoolean(necesitaAmbulanciaStr);
                    byte[] evidencia = obtenerImagenComoByteArray(request.getPart("foto").getInputStream());

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
                    if(contacto.trim().isEmpty()){
                        contacto = null;
                    }


                    incidencia.setNombre(nombreIncidencia);
                    incidencia.setLugar(lugar1);
                    incidencia.setReferencia(referencia);
                    incidencia.setIdUrbanizacion(idUrbanizacion);
                    incidencia.setContactoO(contacto);
                    incidencia.setAmbulanciaI(necesitaAmbulancia);
                    incidencia.setImgEvidencia(evidencia);
                    incidencia.setIdTipo(idTipo);
                    incidencia.setIdUsuario(idUsuarioIncidencia);
                    userDao.agregarIncidencia(incidencia);
                    response.sendRedirect(request.getContextPath() + "/Vecino?action=incidencias");
                } else {
                    System.out.println("Uno o más parámetros requeridos están vacíos o nulos.");
                    //FALTA mandar mensaje de error al usuario si es que alguno de los parametros es nulo
                    String msg = "Ingrese correctamente los datos de la incidencia y llene los campos obligatorios";
                    request.setAttribute("msg", msg);
                    response.sendRedirect(request.getContextPath() + "/Vecino?action=incidencias");
                }
                break;

            default:
                throw new IllegalStateException("Unexpected value: " + action);
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

    private void actualizarEvento(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            UserDao userDao = new UserDao();
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            CoordinadorDao coordinadorDao2 = new CoordinadorDao();
            int idusuarioactu = Integer.parseInt(request.getParameter("idCoordi"));
            Usuario usuarioactu = userDao.mostrarUsuarioID(idusuarioactu);
            String nombre_evento2 = request.getParameter("nombre_evento");

            // Verificar y manejar la imagen
            Part filePart = request.getPart("imagenEvento");
            byte[] imagen2 = null;
            if (filePart != null && filePart.getSize() > 0) {
                imagen2 = obtenerImagenComoByteArray(filePart.getInputStream());
            } else {
                // Si no se proporciona una nueva imagen, usar la imagen existente
                Evento eventoExistente = coordinadorDao2.obtenerEventoPorId(idEvento);
                imagen2 = eventoExistente.getImagenes();
            }
            // Verificar y manejar la imagen
            Part filePart2 = request.getPart("imagenEntrada");
            byte[] entrada2 = null;
            if (filePart2 != null && filePart2.getSize() > 0) {
                entrada2 = obtenerImagenComoByteArray(filePart2.getInputStream());
            } else {
                // Si no se proporciona una nueva imagen, usar la imagen existente
                Evento eventoExistente2 = coordinadorDao2.obtenerEventoPorId(idEvento);
                entrada2 = eventoExistente2.getIngreso();
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
            int idArea2 = usuarioactu.getIdArea();
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

            coordinadorDao2.actualizarEvento(eventoedit);
            actualizarMaterialesEvento(idEvento, materiales2, coordinadorDao2);

            // Redirigir antes de cualquier operación de escritura
            response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos&id="+idusuarioactu);
            return; // Asegúrate de no ejecutar más código después de la redirección
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new ServletException("Formato de número inválido", e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
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

