package org.example.webappsm.Servlet.serenazgo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.DashboardDao;
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
                ArrayList<Usuario> listaBaneados = dashboardDao.listarBaneados();

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
                request.setAttribute("listabaneados", listaBaneados);
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

        }



    }


}
