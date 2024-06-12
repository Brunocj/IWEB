package org.example.webappsm.Servlet.vecino;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.UserDao;


import java.io.IOException;
import java.util.ArrayList;

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


                vista = "vistas/jsp/VECINO/eventos/eventos.jsp";
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

        }
//xd
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        UserDao userDao = new UserDao();
        switch (action){
            case "enviarSolicitud":
                int idArea = Integer.parseInt(request.getParameter("idArea"));
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                userDao.enviarSolicitud(idUsuario, idArea);
                response.sendRedirect(request.getContextPath() + "/Vecino?action=solCoordinador");
                break;
        }

    }
}
