package org.example.webappsm.Servlet.vecino;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.webappsm.model.beans.*;
import org.example.webappsm.model.daos.ProfesorDao;
import org.example.webappsm.model.daos.UserDao;
import org.example.webappsm.model.daos.VecinosDao;


import java.io.IOException;
import java.util.ArrayList;
import java.util.EventListener;

@WebServlet(name ="VecinoServlet" , value = "/Vecino")
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
