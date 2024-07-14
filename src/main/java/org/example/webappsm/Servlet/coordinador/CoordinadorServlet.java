package org.example.webappsm.Servlet.coordinador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.webappsm.model.beans.*;
import org.example.webappsm.model.daos.CoordinadorDao;
import org.example.webappsm.model.daos.UserDao;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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




            case "eventos":
                CoordinadorDao coordinadorDao2 = new CoordinadorDao();
                int idCoordinador = 3;
                ArrayList<Evento> listarEventoscreadoss = coordinadorDao2.listarEventosCreados(idCoordinador);
                request.setAttribute("listaEventos", listarEventoscreadoss);
                vista = "vistas/jsp/COORDINADOR/html/Eventos/eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case  "escogerProfesor":
                vista = "vistas/jsp/COORDINADOR/html/Eventos/tabla_docentes.jsp";
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

                // Verificar si los parámetros son nulos o vacíos
                if (idCoordinadorStr == null || idCoordinadorStr.isEmpty() ||
                        idProfesorStr == null || idProfesorStr.isEmpty() ||
                        vacantesStr == null || vacantesStr.isEmpty() ||
                        recurrenciaStr == null || recurrenciaStr.isEmpty()) {

                    // Redirigir a una página de error o enviar un mensaje de error
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

                // Parsear la fecha si se proporcionó
                if (fechaString != null && !fechaString.isEmpty()) {
                    try {
                        fechaEvento = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString);
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                }
                String fechaString2 = "2000-03-31";
                Date entrada = null;
                if (fechaString2 != null && !fechaString2.isEmpty()) {
                    try {
                        entrada = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString2);
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                }
                String fechaString3 = "2000-03-31";
                Date salida = null;
                if (fechaString3 != null && !fechaString3.isEmpty()) {
                    try {
                        salida = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString3);
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                }
                String material = "material prueba";

                Evento evento = new Evento();
                evento.setTitulo(nombre_evento);
                evento.setDescripcion(descripcion);
                evento.setFechaYHora(fechaEvento);
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
                coordinadorDao.registrarEvento(evento);

                // Redireccionar a la página de eventos después de procesar la inscripción
                response.sendRedirect(request.getContextPath() + "/Coordinador?action=eventos");
                break;
            case "registrarIncidencia":
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String lugarIn = request.getParameter("lugar");
                String referencia = request.getParameter("ref");
                String contacto = request.getParameter("contacto");
                String fechaStr = request.getParameter("fecha");
                String necesitaAmbulanciaStr = request.getParameter("ambulanciaSN");
                String idUrbanizacionStr = request.getParameter("urbanizacionId");
                String idTipoStr = request.getParameter("idTipoIncidencia");
                String idUsuarioIncidenciaStr = request.getParameter("idUsuario");

                // Imprimir todos los parámetros recibidos
                System.out.println("Parámetros recibidos:");
                System.out.println("Nombre de la incidencia: " + nombreIncidencia);
                System.out.println("Lugar: " + lugarIn);
                System.out.println("Referencia: " + referencia);
                System.out.println("Contacto: " + contacto);
                System.out.println("Fecha: " + fechaStr);
                System.out.println("Necesita ambulancia: " + necesitaAmbulanciaStr);
                System.out.println("ID de urbanización: " + idUrbanizacionStr);
                System.out.println("ID de tipo de incidencia: " + idTipoStr);
                System.out.println("ID de usuario: " + idUsuarioIncidenciaStr);

                if (idUrbanizacionStr != null && !idUrbanizacionStr.isEmpty() &&
                        idTipoStr != null && !idTipoStr.isEmpty() &&
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

                    incidencia.setNombre(nombreIncidencia);
                    incidencia.setLugar(lugarIn);
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

}

