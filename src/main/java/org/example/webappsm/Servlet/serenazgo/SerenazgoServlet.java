package org.example.webappsm.Servlet.serenazgo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.DashboardDao;
import org.example.webappsm.model.daos.IncidenciasDao;
import org.example.webappsm.model.daos.SerenazgoDao;
import org.example.webappsm.model.daos.VecinosDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SerenazgoServlet", value = "/Serenazgo")
public class SerenazgoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //action por default
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");

        String vista;
        RequestDispatcher rd;

        switch (action){

            case "pagPrincipal":
                vista = "vistas/jsp/SERENAZGO/pagina_principal_serenazgo.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

            case "dashboard":
                DashboardDao dashboardDao = new DashboardDao();

                String totalBaneados = dashboardDao.totalBaneados();
                String avgIncidencias = dashboardDao.avgIncidencias();
                String totalIncidencias = dashboardDao.totalIncidencias();
                String incidenciasComunMax = dashboardDao.incidenciaComunMax();
                String incidenciasComunMin = dashboardDao.incidenciaComunMin();
                String incidenciasPorAtender = dashboardDao.incidenciasPorAtender();
                String incidenciasUrbMax = dashboardDao.incidenciasUrbMax();
                String incidenciasUrbMin = dashboardDao.incidenciasUrbMin();

                ArrayList<String> tipoIncidencias = new ArrayList<>();
                ArrayList<Integer> cantidadTipo = new ArrayList<>();
                dashboardDao.incidenciasPorTipo(tipoIncidencias, cantidadTipo);

                ArrayList<String> urbanizaciones = new ArrayList<>();
                ArrayList<Integer> cantidadUrbanizacion = new ArrayList<>();
                dashboardDao.incidenciasPorUrbanizacion(urbanizaciones, cantidadUrbanizacion);

                ArrayList<String> estados = new ArrayList<>();
                ArrayList<Double> porcentajes = new ArrayList<>();
                dashboardDao.incidenciasPorEstado(estados, porcentajes);

                request.setAttribute("totalbaneados", totalBaneados);
                request.setAttribute("avgincidencias", avgIncidencias);
                request.setAttribute("totalincidencias", totalIncidencias);
                request.setAttribute("incidenciascomunmax", incidenciasComunMax);
                request.setAttribute("incidenciascomunmin",incidenciasComunMin);
                request.setAttribute("incidenciasatender", incidenciasPorAtender);
                request.setAttribute("incidenciasurbmax",incidenciasUrbMax);
                request.setAttribute("incidenciasurbmin", incidenciasUrbMin);

                request.setAttribute("tipoincidencias", tipoIncidencias);
                request.setAttribute("cantidadtipo", cantidadTipo);
                request.setAttribute("urbanizaciones", urbanizaciones);
                request.setAttribute("cantidadurbanizacion", cantidadUrbanizacion);
                request.setAttribute("estados", estados);
                request.setAttribute("porcentajes", porcentajes);

                vista = "vistas/jsp/SERENAZGO/Dashboard/dashboard.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

            case "listaVecinos":

                VecinosDao vecinoDaoLista = new VecinosDao();

                ArrayList<Usuario> listaVecinos = vecinoDaoLista.listarVecinos();

                request.setAttribute("listaVecinos",listaVecinos);

                vista = "vistas/jsp/SERENAZGO/ListaVecinos/tabla_vecinos.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

            case "listaIncidenciasPasadas":

                IncidenciasDao incidenciasDao = new IncidenciasDao();

                ArrayList<Incidencia> listaIncidenciasPasadas = incidenciasDao.listarIncidenciasPasadas();

                request.setAttribute("listaIncidenciasPas",listaIncidenciasPasadas);

                vista = "vistas/jsp/SERENAZGO/ListaPasadas/tabla_pasadas.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

            case "mostrarDescripcion":

                IncidenciasDao daoMostrarDescripcion = new IncidenciasDao();
                String idIncidenciaString = request.getParameter("idIncidencia");
                int idIncidencia = Integer.parseInt(idIncidenciaString);

                Incidencia incidencia = daoMostrarDescripcion.descripcion(idIncidencia);

                request.setAttribute("incidencia",incidencia);

                vista = "vistas/jsp/SERENAZGO/ListaPasadas/infoDescripcionPasada.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

            case "listaIncidencias":

                IncidenciasDao incidenciasDao1 = new IncidenciasDao();

                ArrayList<Incidencia> listaIncidencias = incidenciasDao1.listarIncidencias();

                request.setAttribute("listaIncidencias",listaIncidencias);

                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/tabla_incidencias.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

            case "leerDescripcion":

                IncidenciasDao incidenciasDao2 = new IncidenciasDao();
                String idIncidenciaLeer = request.getParameter("idIncidencia");
                int idIncidenciaLeerInt = Integer.parseInt(idIncidenciaLeer);

                Incidencia incidencia2 = incidenciasDao2.descripcion(idIncidenciaLeerInt);

                request.setAttribute("incidencia",incidencia2);

                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/info1.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "clasificar":
                int idIncidenciaClasificar = 0;
                IncidenciasDao incidenciasClasificar = new IncidenciasDao();
                String idIncidenciaClasificarStr = request.getParameter("idClasificar");
                try {
                    idIncidenciaClasificar = Integer.parseInt(idIncidenciaClasificarStr);
                } catch (NumberFormatException e) {
                    // Manejo de la excepción si el parámetro no es un entero válido
                    e.printStackTrace(); // Opcional: imprimir la traza de la excepción para debug
                    // Puedes establecer un valor por defecto, redirigir a una página de error, etc.
                }
                Incidencia incidenciaClasificar = incidenciasClasificar.obtenerIncidenciaPorId(idIncidenciaClasificar);

                request.setAttribute("incidencia",incidenciaClasificar);
                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/clasifica.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "proceder":
                IncidenciasDao incidenciasProceder = new IncidenciasDao();
                int idIncidenciaProceder = Integer.parseInt(request.getParameter("idProceder"));
                Incidencia incidenciaProceder = incidenciasProceder.obtenerIncidenciaPorId(idIncidenciaProceder);

                request.setAttribute("incidencia",incidenciaProceder);
                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/formularios.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "descripcionFinal":
                IncidenciasDao incidenciasDF = new IncidenciasDao();
                int idIncidenciaDF = Integer.parseInt(request.getParameter("idDescripcionF"));
                Incidencia incidenciaDF = incidenciasDF.obtenerIncidenciaPorId(idIncidenciaDF);

                request.setAttribute("incidencia",incidenciaDF);
                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if(action.equals("banearVecino")){

            VecinosDao vecinosDao = new VecinosDao();
            String idParamString = request.getParameter("id");
            int idVecino = Integer.parseInt(idParamString);

            vecinosDao.banearVecino(idVecino);

            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaVecinos");

        }else if(action.equals("eliminarIncidenciaPas")){

            String idParam = request.getParameter("id");
            if (idParam != null) {
                int idIncidenciaPas = Integer.parseInt(idParam);

                IncidenciasDao incidenciasDao = new IncidenciasDao();
                incidenciasDao.eliminarIncidenciaPasada(idIncidenciaPas);

                response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidenciasPasadas");
            }
        }else if(action.equals("clasificar")){
            Incidencia incidencia = new Incidencia();
            String categoria = null;
            String idParam = request.getParameter("id");
            String categoriaId = request.getParameter("categoria");
            if (idParam != null) {
                int idIncidenciaC = Integer.parseInt(idParam);

                IncidenciasDao incidenciasDao = new IncidenciasDao();
                incidencia = incidenciasDao.obtenerIncidenciaPorId(idIncidenciaC);
                if ("1".equals(categoriaId)) {
                    categoria = "Leve";
                } else if ("2".equals(categoriaId)) {
                    categoria = "Moderada";
                } else if ("3".equals(categoriaId)) {
                    categoria = "Grave";
                }
                incidencia.setClasificacion(categoria);
                response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
            }
        }else{
            response.sendRedirect(request.getContextPath() + "/Serenazgo");
        }

    }


}
