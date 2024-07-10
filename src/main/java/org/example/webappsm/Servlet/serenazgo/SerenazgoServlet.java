package org.example.webappsm.Servlet.serenazgo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.TipoSerenazgo;
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
                String incidenciasMes = dashboardDao.incidenciasMes();
                String incidenciasSemana = dashboardDao.incidenciasSemana();
                String incidenciasHoy = dashboardDao.incidenciasHoy();
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
                ArrayList<String> labelsChart2 = new ArrayList<>();
                ArrayList<Integer> incidenciasReportadas = new ArrayList<>();
                ArrayList<Integer> incidenciasResueltas = new ArrayList<>();
                dashboardDao.incidenciasRegistradas(labelsChart2, incidenciasReportadas, incidenciasResueltas);

                request.setAttribute("totalbaneados", totalBaneados);
                request.setAttribute("avgincidencias", avgIncidencias);
                request.setAttribute("incidenciasmes", incidenciasMes);
                request.setAttribute("incidenciassemana", incidenciasSemana);
                request.setAttribute("incidenciashoy",incidenciasHoy);
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
                request.setAttribute("labels", labelsChart2);
                request.setAttribute("incidenciasReportadas", incidenciasReportadas);
                request.setAttribute("incidenciasResueltas", incidenciasResueltas);
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
                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/formularios.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "proceder":

                IncidenciasDao incidenciasProceder = new IncidenciasDao();
                int idIncidenciaProceder = Integer.parseInt(request.getParameter("idProceder"));

                ArrayList<TipoSerenazgo> listaTipos = incidenciasProceder.listarTipos();

                request.setAttribute("idIncidencia",idIncidenciaProceder);
                request.setAttribute("listaTipos",listaTipos);

                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/formularios.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "descripcionFinal":
                IncidenciasDao incidenciasDF = new IncidenciasDao();
                int idIncidenciaDF = Integer.parseInt(request.getParameter("idDescripcionF"));
                Incidencia incidenciaDF = incidenciasDF.descripcion(idIncidenciaDF);

                request.setAttribute("incidencia",incidenciaDF);
                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/info1.jsp";

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
        }else if(action.equals("clasificarIncidencia")){
            String idParam = request.getParameter("id");
            String categoria = request.getParameter("categoria");
            if (idParam != null) {
                int idIncidenciaC = Integer.parseInt(idParam);

                IncidenciasDao incidenciasDao = new IncidenciasDao();
                int categoriaId = Integer.parseInt(categoria);

                incidenciasDao.actualizarClasificacion(categoriaId, idIncidenciaC);
                response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
            }
        }else if(action.equals("finalizar")){
            String idFinalizar = request.getParameter("idIncidencia");

            int idIncidenciaFinalizar = Integer.parseInt(idFinalizar);
            IncidenciasDao incidenciasDaoFinalizar = new IncidenciasDao();
            incidenciasDaoFinalizar.finalizarIncidencia(idIncidenciaFinalizar);

            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
        }else if(action.equals("falsaAlarma")){
            String idFA = request.getParameter("idIncidencia");
            String idUser = request.getParameter("idUsuario");
            if (idFA != null && idUser != null) {
                int idIncidenciaFA = Integer.parseInt(idFA);
                int idUserFA = Integer.parseInt(idUser);
                IncidenciasDao incidenciasDaoFA = new IncidenciasDao();
                incidenciasDaoFA.declararFalsaAlarma(idIncidenciaFA,idUserFA);
            }
            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
        }else if(action.equals("procederIncidencia")){
            SerenazgoDao serenazgoDao = new SerenazgoDao();

            // Validar que los parámetros no sean null antes de convertirlos
            String idIncidenciaParam = request.getParameter("id");
            String idTipoSerenazgoParam = request.getParameter("tipoS");

            if (idIncidenciaParam == null || idTipoSerenazgoParam == null) {
                // Manejar el caso donde los parámetros son null
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros inválidos: id o tipoS son null.");
                return;
            }

            int idIncidencia = Integer.parseInt(idIncidenciaParam);
            int idTipoSerenazgo = Integer.parseInt(idTipoSerenazgoParam);

            serenazgoDao.setTipoSerenazgo(idTipoSerenazgo, idIncidencia);

            // Obtener las opciones seleccionadas
            String[] opcionesSeleccionadas = request.getParameterValues("opcion");
            if (opcionesSeleccionadas != null) {
                for (String opcion : opcionesSeleccionadas) {
                    switch (opcion) {
                        case "ambulancia":
                            String motivoSol = request.getParameter("motivoSol");
                            String nombre = request.getParameter("nombre");
                            if (motivoSol != null && nombre != null) {
                                serenazgoDao.setNecesitaAmbulancia(idIncidencia, motivoSol, nombre);
                                System.out.println("Se ingresó: " + motivoSol);
                            } else {
                                System.out.println("Faltan parámetros para la ambulancia.");
                            }
                            break;
                        case "policia":
                            String nombreComisaria = request.getParameter("nombreComisaria");
                            String motivo = request.getParameter("motivo");
                            if (nombreComisaria != null && !nombreComisaria.equals("default") && motivo != null) {
                                int idComisaria = 0;
                                switch (nombreComisaria) {
                                    case "Maranga":
                                        idComisaria = 1;
                                        break;
                                    case "San Miguel":
                                        idComisaria = 2;
                                        break;
                                    default:
                                        throw new IllegalArgumentException("Comisaría no válida: " + nombreComisaria);
                                }
                                serenazgoDao.setNecesitaPolicia(idIncidencia, idComisaria, motivo);
                                System.out.println("Se ingresó: " + motivo);
                            } else {
                                System.out.println("Faltan parámetros para la policía.");
                            }
                            break;
                    }
                }
            }

            // Manejar checkbox de bomberos
            if (request.getParameter("bomberos") != null) {
                Boolean bomberos = true;
                serenazgoDao.setNecesitaBombero(idIncidencia, bomberos);
                System.out.println("Se solicitó bomberos");
            }

            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
        }else{
            response.sendRedirect(request.getContextPath() + "/Serenazgo");
        }

    }


}
