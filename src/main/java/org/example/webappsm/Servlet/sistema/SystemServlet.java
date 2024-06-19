package org.example.webappsm.Servlet.sistema;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.webappsm.model.beans.*;
import org.example.webappsm.model.daos.ProfesorDao;
import org.example.webappsm.model.daos.SystemDao;
import org.example.webappsm.model.daos.UserDao;
import org.example.webappsm.model.daos.VecinosDao;


import java.io.IOException;
import java.util.ArrayList;
import java.util.EventListener;

@WebServlet(name ="SystemServlet" , value = "/sys")
public class SystemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null? "login" : request.getParameter("action");
        String vista;
        RequestDispatcher rd ;
        UserDao userDao  = new UserDao();

        switch (action){
            case "login":
                vista = "vistas/jsp/LOGIN/login.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("user");
        String password = request.getParameter("passwd");
        System.out.println("username: " + correo + " | password: " + password);
        SystemDao systemDao = new SystemDao();
        if(systemDao.validarUsuarioPassword(correo, password)){
            System.out.println("usuario y password válidos");
            Usuario usuario = systemDao.getUsuarioCorreo(correo);
            HttpSession httpSession = request.getSession();
            switch (usuario.getIdRol()){
                case 1:
                    response.sendRedirect(request.getContextPath() + "/Admin?action=pagPrincipal");
                    break;
                case 2:
                    response.sendRedirect(request.getContextPath() + "/Serenazgo?action=pagPrincipal");
                    break;
                case 3:
                    response.sendRedirect(request.getContextPath() + "/Vecino?action=pagPrincipal");
                    break;
                case 4:
                    response.sendRedirect(request.getContextPath() + "/Coordinador?action=pagPrincipal");
                    break;
            }



        }else{
            System.out.println("usuario o password incorrectos");
            request.setAttribute("err","Credenciales incorrectos");
            request.getRequestDispatcher("vistas/jsp/LOGIN/login.jsp").forward(request,response);
        }


    }

}
