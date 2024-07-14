package org.example.webappsm.Servlet.vecino;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.webappsm.model.beans.*;
import org.example.webappsm.model.daos.CoordinadorDao;
import org.example.webappsm.model.daos.ProfesorDao;
import org.example.webappsm.model.daos.UserDao;
import org.example.webappsm.model.daos.VecinosDao;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.EventListener;

import static org.example.webappsm.Servlet.coordinador.CoordinadorServlet.obtenerImagenComoByteArray;

@WebServlet(name ="VecinoServlet" , value = "/Vecino")
@MultipartConfig
public class VecinoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd ;
        UserDao userDao  = new UserDao();

        switch (action){
            case "pagPrincipal":
                vista = "vistas/jsp/VECINO/pagina_principal_vecino.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "miPerfil":
                int idusuario = Integer.parseInt(request.getParameter("id"));
                Usuario u = userDao.mostrarUsuarioID(idusuario);

                request.setAttribute("usuario", u);
                vista = "vistas/jsp/VECINO/Miperfil.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "solCoordinador":
                vista = "vistas/jsp/VECINO/solicitud/solicitarCoordinador.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

            case "incidencias":
                ArrayList<Incidencia> listaIncidencias = userDao.listarIncidencias();
                request.setAttribute("listaincidencias", listaIncidencias);

                vista = "vistas/jsp/VECINO/incidencias/incidencia_vecino.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "registroIncidencia":
                ArrayList<Urbanizacion> listaUrbanizaciones = userDao.listarUrbanizaciones();
                ArrayList<Tipos> tiposIncidencias = userDao.listarTiposIncidencias();
                request.setAttribute("listaUrbanizaciones", listaUrbanizaciones);
                request.setAttribute("tiposIncidencias", tiposIncidencias);
                vista = "vistas/jsp/VECINO/incidencias/registrar_incidencia.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "infoIncidencia":
                int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
                Incidencia incidencia = userDao.getIncidenciaId(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                vista = "vistas/jsp/VECINO/incidencias/incidencia_info.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "EventosPasados":
                VecinosDao vecinosDaolistaPasados = new VecinosDao();
                int idusuario2 = 10; // posteriormente obtener mediante un request.getParameter
                ArrayList<Evento> listaEventosPasados = vecinosDaolistaPasados.listarEventosPasados(idusuario2);
                request.setAttribute("listaEventosPasados", listaEventosPasados);

                vista = "vistas/jsp/VECINO/eventos/eventos_pasados.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "verEventoPasado":
                try {
                    int idEvento = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ID del evento recibido: " + idEvento);

                    CoordinadorDao eventoDAOedit = new CoordinadorDao();
                    VecinosDao eventoDaoImag = new VecinosDao();
                    Evento evento = eventoDAOedit.obtenerEventoPorId(idEvento);

                    ArrayList<String> materiales = eventoDAOedit.obtenerNombresMaterialesPorIdEvento(idEvento);
                    System.out.println("Materiales obtenidos: " + materiales);

                    ArrayList<String> imagenesEvento = eventoDaoImag.obtenerImagenesPorIdEvento(idEvento);
                    System.out.println("Número de imágenes obtenidas: " + imagenesEvento.size());
                    for (String imagen : imagenesEvento) {
                        System.out.println("Imagen base64: " + imagen.substring(0, 50) + "...");
                    }

                    if (evento.getImagenes() != null) {
                        String base64Image = Base64.getEncoder().encodeToString(evento.getImagenes());
                        request.setAttribute("base64Image", base64Image);
                    }

                    request.setAttribute("evento", evento);
                    request.setAttribute("materiales", materiales);
                    request.setAttribute("imagenesEvento", imagenesEvento);
                    vista = "/vistas/jsp/VECINO/eventos/detalles_eventos_pasados.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    System.out.println("ID del empleado no es un número válido");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del empleado no es válido");
                }
                break;
            case "eventos":
                VecinosDao vecinosDao = new VecinosDao();
                idusuario = 10;
                ArrayList<Evento> listarEventos = vecinosDao.listarEventos(idusuario);
                request.setAttribute("listaEventos", listarEventos);

                vista = "vistas/jsp/VECINO/eventos/eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "misEventos":
                VecinosDao vecinosDao2 = new VecinosDao();
                idusuario = 10;
                ArrayList<Evento> listarEventos2 = vecinosDao2.listarMisEventos(idusuario);
                request.setAttribute("listaMisEventos", listarEventos2);

                vista = "vistas/jsp/VECINO/eventos/mis_eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "verEvento":
                try {
                    int idEvento = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ID del profesor recibido: " + idEvento);

                    VecinosDao vecinosDaovista = new VecinosDao();
                    Evento evento = vecinosDaovista.obtenerEventoporId(idEvento);

                    if (evento == null) {
                        System.out.println("Profesor no encontrado en la base de datos");
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontró el profesor");
                        return;
                    }

                    request.setAttribute("evento", evento);
                    vista = "vistas/jsp/VECINO/eventos/detalles_evento.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    System.out.println("ID del profesor no es un número válido");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del profesor no es válido");
                }
                break;
            case "verMiEvento":
                try {
                    int idEvento2 = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ID del profesor recibido: " + idEvento2);

                    VecinosDao vecinosDaovista3 = new VecinosDao();
                    Evento evento2 = vecinosDaovista3.obtenerEventoporId(idEvento2);

                    if (evento2 == null) {
                        System.out.println("Profesor no encontrado en la base de datos");
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontró el profesor");
                        return;
                    }

                    request.setAttribute("evento", evento2);
                    vista = "vistas/jsp/VECINO/eventos/detalles_mis_eventos.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    System.out.println("ID del profesor no es un número válido");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del profesor no es válido");
                }
                break;

        }
//xd
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        UserDao userDao = new UserDao();

        switch (action) {
            case "enviarSolicitud":
                int idArea = Integer.parseInt(request.getParameter("idArea"));
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                userDao.enviarSolicitud(idUsuario, idArea);
                response.sendRedirect(request.getContextPath() + "/Vecino?action=solCoordinador");
                break;
            case "registrarIncidenciaPOST":
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String lugar = request.getParameter("lugar");
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
                System.out.println("Lugar: " + lugar);
                System.out.println("Referencia: " + referencia);
                System.out.println("Contacto: " + contacto);
                System.out.println("Fecha: " + fechaStr);
                System.out.println("Necesita ambulancia: " + necesitaAmbulanciaStr);
                System.out.println("ID de urbanización: " + idUrbanizacionStr);
                System.out.println("ID de tipo de incidencia: " + idTipoStr);
                System.out.println("ID de usuario: " + idUsuarioIncidenciaStr);

                if (idUrbanizacionStr != null && !idUrbanizacionStr.isEmpty() && validacionContacto &&
                        idTipoStr != null && !idTipoStr.isEmpty() && nombreIncidencia.length()<=100 && lugar.length()<=100 && referencia.length() <=70 &&
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
                    incidencia.setLugar(lugar);
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
            case "inscribir":
                VecinosDao vecinosDao = new VecinosDao();
                int eventoId = Integer.parseInt(request.getParameter("idEvento"));
                int usuarioId = Integer.parseInt(request.getParameter("idUsuario"));

                boolean exito = vecinosDao.inscribirUsuarioEnEvento(usuarioId, eventoId);

                if (exito) {
                    response.getWriter().write("{ \"success\": true }");
                } else {
                    response.getWriter().write("{ \"success\": false, \"message\": \"Error al inscribirse en el evento.\" }");
                }

                // Redireccionar a la página de eventos después de procesar la inscripción
                response.sendRedirect(request.getContextPath() + "/Vecino?action=eventos");
                break;
            case "desinscribir":
                VecinosDao vecinosDao2 = new VecinosDao();
                int eventoId1 = Integer.parseInt(request.getParameter("idEvento"));
                int usuarioId1 = Integer.parseInt(request.getParameter("idUsuario"));

                boolean exito1 = vecinosDao2.desinscribirUsuarioDeEvento(usuarioId1, eventoId1);

                if (exito1) {
                    response.getWriter().write("{ \"success\": true }");
                } else {
                    response.getWriter().write("{ \"success\": false, \"message\": \"Error al inscribirse en el evento.\" }");
                }

                // Redireccionar a la página de eventos después de procesar la inscripción
                response.sendRedirect(request.getContextPath() + "/Vecino?action=misEventos");
                break;

        }
    }

}
