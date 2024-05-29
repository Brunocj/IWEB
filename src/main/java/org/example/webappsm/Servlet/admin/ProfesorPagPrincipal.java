package org.example.webappsm.Servlet.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ProfesorPagPrincipal", value = "/ProfesorPagPrincipal")
public class ProfesorPagPrincipal extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String vista = "vistas/jsp/ADMIN/pagina_principal_admin.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
