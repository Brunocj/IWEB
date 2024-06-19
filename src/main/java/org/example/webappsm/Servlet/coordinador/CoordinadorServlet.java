package org.example.webappsm.Servlet.coordinador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.webappsm.model.beans.Evento;
import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Profesor;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.CoordinadorDao;
import org.example.webappsm.model.daos.ProfesorDao;
import org.example.webappsm.model.daos.UserDao;
import org.example.webappsm.model.daos.VecinosDao;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;



import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.EventListener;

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
