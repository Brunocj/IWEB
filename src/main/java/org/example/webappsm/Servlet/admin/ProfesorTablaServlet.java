package org.example.webappsm.Servlet.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.webappsm.model.beans.Profesor;
import org.example.webappsm.model.daos.ProfesorDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProfesorTablaServlet", value = "/ProfesorTablaServlet")
public class ProfesorTablaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        ProfesorDao profesorDao = new ProfesorDao();
        ArrayList<Profesor> list = profesorDao.listarProfesoresTabla();


        request.setAttribute("listaprofesor",list);

        String vista = "vistas/jsp/ADMIN/Profesores/tabla_profesor.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
