package org.example.webappsm.Filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.webappsm.model.beans.Usuario;

import java.io.IOException;

@WebFilter(servletNames = {"AdminServlet", "CoordinadorServlet", "SerenazgoServlet", "VecinoServlet"}) // No se selecciona sys porque si se hace eso nunca despliega la aplicacion; los demas servlets si se seleccionan
public class RoleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {

        System.out.println("RoleFilter");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession(false);

        // Obtener usuario mediante sesion
        Usuario usuario = (Usuario) (session != null ? session.getAttribute("usuarioLogueado") : null);
        Integer role = (usuario != null ? usuario.getIdRol() : null);

        String requestURI = request.getRequestURI();


        boolean accessAllowed = false;
        if (role != null) {
            switch (role) {
                case 1: // Admin
                    accessAllowed = true;
                    break;
                case 2: // Serenazgo
                    if (requestURI.contains("/Serenazgo") || requestURI.contains("/common")) {
                        accessAllowed = true;
                    }
                    break;
                case 3: // Vecino
                    if (requestURI.contains("/Vecino") || requestURI.contains("/common")) {
                        accessAllowed = true;
                    }
                    break;
                case 4: // Coordinador
                    if (requestURI.contains("/Coordinador") || requestURI.contains("/common")) {
                        accessAllowed = true;
                    }
                    break;
                default:
                    accessAllowed = false;
                    break;
            }
        }

        if (session == null || role == null || !accessAllowed) {
            //Se redirige al usuario al login (por malcriado)
            response.sendRedirect(request.getContextPath() + "/vistas/jsp/LOGIN/login.jsp");
        } else {
            //Continuar
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
