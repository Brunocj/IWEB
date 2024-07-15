package org.example.webappsm.Filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.webappsm.model.beans.Usuario;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter(servletNames = {"AdminServlet", "CoordinadorServlet", "SerenazgoServlet", "VecinoServlet"})
public class RoleFilter implements Filter {

    private static final List<String> VALID_ACTIONS = Arrays.asList(
            // AdminServlet actions
            "pagPrincipal", "dashboard", "tablaSerenazgo", "verSerenazgo",
            "agregarSerenazgo", "editarSerenazgo", "tablaProfesores",
            "editarProfesor", "tablaAcceso", "tablaCoordinador",
            "solicitudAcceso", "solicitudCoordi", "deleteVecino",

            // CoordinadorServlet actions
            "pagPrincipal", "miPerfil", "incidencias", "registroIncidencia",
            "infoIncidencia", "tablaInscritos", "tablaProfesores",
            "eventos", "agregarNota", "EventosNota", "editarEvento",
            "profesorEscogido", "verEventoNota",

            // SerenazgoServlet actions
            "pagPrincipal", "perfil", "dashboard", "listaVecinos",
            "listaIncidenciasPasadas", "mostrarDescripcion", "listaIncidencias",
            "leerDescripcion", "clasificar", "proceder", "gestionarIncidencia",
            "descripcionFinal",

            // VecinoServlet actions
            "pagPrincipal", "miPerfil", "solCoordinador", "incidencias",
            "registroIncidencia", "infoIncidencia", "EventosPasados",
            "verEventoPasado", "eventos", "misEventos", "verEvento",
            "verMiEvento"
    );

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        System.out.println("RoleFilter");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);

        // Control de caché
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        try {
            // Obtener usuario mediante sesión
            Usuario usuario = (Usuario) (session != null ? session.getAttribute("usuarioLogueado") : null);
            Integer role = (usuario != null ? usuario.getIdRol() : null);

            String requestURI = request.getRequestURI();
            String action = request.getParameter("action");

            boolean accessAllowed = false;
            if (role != null) {
                switch (role) {
                    case 1: // Admin
                        if (requestURI.contains("/Admin") || requestURI.contains("/common")) {
                            accessAllowed = true;
                        }
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
                        break;
                }
            }

            if (action != null && !VALID_ACTIONS.contains(action)) {
                response.sendRedirect(request.getContextPath() + "/vistas/jsp/ERROR/error2.jsp");
            }

            if (session == null || role == null || !accessAllowed) {
                // Redirigir al login si no tiene acceso
                response.sendRedirect(request.getContextPath() + "/vistas/jsp/LOGIN/login.jsp");
                if (session != null) {
                    session.invalidate();
                }
            } else {
                // Continuar con el filtro
                filterChain.doFilter(servletRequest, servletResponse);
            }
        } catch (Exception e) {
            // Redirigir a la página de error si ocurre una excepción
            response.sendRedirect(request.getContextPath() + "/vistas/jsp/ERROR/error2.jsp");
        }
    }
}
