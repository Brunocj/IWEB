package org.example.webappsm.Servlet.vecino;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet(name ="VecinoServlet" , value = "/Vecino")
public class VecinoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd ;
        switch (action){
            case "pagPrincipal":
                vista = "vistas/jsp/VECINO/pagina_principal_vecino.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "miPerfil":

                break;
            case "solCoordinador":

                break;
            case "Eventos":

                break;
            case "incidencias":

                break;

        }
//xd
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
