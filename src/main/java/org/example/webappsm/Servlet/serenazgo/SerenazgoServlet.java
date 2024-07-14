package org.example.webappsm.Servlet.serenazgo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.TipoSerenazgo;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.*;

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
        UserDao userDao  = new UserDao();

        switch (action){

            case "pagPrincipal":
                vista = "vistas/jsp/SERENAZGO/pagina_principal_serenazgo.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "perfil":
                int idusuario = Integer.parseInt(request.getParameter("id"));
                Usuario u = userDao.mostrarUsuarioID(idusuario);

                request.setAttribute("usuario", u);
                vista = "vistas/jsp/SERENAZGO/Perfil/Perfil.jsp";
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
                int idTipoSerenazgo = incidencia.getIdTipoSerenazgo();
                String nombreSerenazgo = ":o";
                if(idTipoSerenazgo== 1){
                    nombreSerenazgo = "Bicicleta";
                }else if(idTipoSerenazgo== 2){
                    nombreSerenazgo = "A pie";
                }else if(idTipoSerenazgo== 3){
                    nombreSerenazgo = "Canino";
                }else if(idTipoSerenazgo== 4){
                    nombreSerenazgo = "Vehículo";
                }

                request.setAttribute("incidencia",incidencia);
                request.setAttribute("serenazgo",nombreSerenazgo);

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
            case "gestionarIncidencia":

                IncidenciasDao incidenciasGestionar = new IncidenciasDao();

                int idIncidenciaGestionar = Integer.parseInt(request.getParameter("idGestionar"));
                Incidencia incidenciaGestionar = incidenciasGestionar.obtenerIncidenciaPorId(idIncidenciaGestionar);

                int indicadorPolicia = 1;
                if (incidenciaGestionar.getMotivoPolicia() == null) {
                    indicadorPolicia = 0;
                }

                int indicadorAmbulancia = 1;
                if (incidenciaGestionar.getMotivoAmbulancia() == null) {
                    indicadorAmbulancia = 0;
                }

                ArrayList<TipoSerenazgo> listaTiposGestionar = incidenciasGestionar.listarTipos();

                // Depuración
                System.out.println("idIncidenciaGestionar: " + idIncidenciaGestionar);
                System.out.println("incidenciaGestionar: " + incidenciaGestionar);
                System.out.println("indicadorPolicia: " + indicadorPolicia);
                System.out.println("indicadorAmbulancia: " + indicadorAmbulancia);
                System.out.println("listaTiposGestionar size: " + listaTiposGestionar.size());

                request.setAttribute("idIncidencia", idIncidenciaGestionar);
                request.setAttribute("incidencia", incidenciaGestionar);
                request.setAttribute("listaTipos", listaTiposGestionar);
                request.setAttribute("policia", indicadorPolicia);
                request.setAttribute("ambulancia", indicadorAmbulancia);

                vista = "vistas/jsp/SERENAZGO/ListaIncidencias/gestionarInc.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
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
            SystemDao daosys = new SystemDao();

            String idParamString = request.getParameter("id");

            int idVecino = Integer.parseInt(idParamString);

            System.out.println("idUsuario: " + idVecino);
            Usuario usuarioBaneado = vecinosDao.obtenerUsuarioPorId(idVecino);


            System.out.println("correo a enviar: " + usuarioBaneado.getCorreoE());

            String tituloCorreo = "USTED HA SIDO BANEADO - Uso incorrecto de la función Registrar Incidencia ";
            String cuerpoCorreo = "Estimado " + usuarioBaneado.getNombre() + ",\n Lamentamos informarte que has sido baneado del botón de incidencias debido a que has registrado más de 5 falsas alarmas en la plataforma.\n Esperamos que esto no vuelva a suceder, ya que esto afecta negativamente a nuestro trabajo por brindar una buena atención a los vecinos del distrito de San Miguel.\n Si tienes alguna pregunta sobre el motivo de tu baneo o necesitas más información, no dudes en ponerte en contacto con nosotros. Estamos aquí para ayudarte en lo que necesites.\nApreciamos tu comprensión y esperamos un cambio en tus acciones a realizar en futuras ocasiones.\n\nAtentamente,\nLa Administración";

            System.out.println("titulo de correo: " + tituloCorreo);
            System.out.println("cuerpo de correo: " + cuerpoCorreo);

            daosys.enviarCorreo(usuarioBaneado.getCorreoE(), tituloCorreo, cuerpoCorreo);


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
        }else if(action.equals("finalizar")){
            String idFinalizar = request.getParameter("idFinalizar");

            int idIncidenciaFinalizar = Integer.parseInt(idFinalizar);
            IncidenciasDao incidenciasDaoFinalizar = new IncidenciasDao();
            incidenciasDaoFinalizar.finalizarIncidencia(idIncidenciaFinalizar);

            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
        }else if(action.equals("falsaAlarma")){
            String idFA = request.getParameter("idIncidencia");
            String idUser = request.getParameter("idUsuario");
            String motivo = request.getParameter(("motivo"));
            if (idFA != null && idUser != null) {
                try {
                    int idIncidenciaFA = Integer.parseInt(idFA);
                    int idUserFA = Integer.parseInt(idUser);
                    IncidenciasDao incidenciasDaoFA = new IncidenciasDao();
                    incidenciasDaoFA.declararFalsaAlarma(idIncidenciaFA, idUserFA);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
        }else if(action.equals("procederIncidencia")){
            SerenazgoDao serenazgoDao = new SerenazgoDao();
            IncidenciasDao incidenciasDao = new IncidenciasDao();

            // Validar que los parámetros no sean null antes de convertirlos
            String idIncidenciaParam = request.getParameter("id");
            String idTipoSerenazgoParam = request.getParameter("tipoS");
            String clasificacion = request.getParameter("clasificacion");

            if (idIncidenciaParam == null || idTipoSerenazgoParam == null) {
                // Manejar el caso donde los parámetros son null
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros inválidos: id o tipoS son null.");
                return;
            }

            int idIncidencia = Integer.parseInt(idIncidenciaParam);
            int idTipoSerenazgo = Integer.parseInt(idTipoSerenazgoParam);
            serenazgoDao.setTipoSerenazgo(idTipoSerenazgo, idIncidencia);

            if (clasificacion != null){
                int clasificacionId = Integer.parseInt(clasificacion);

                incidenciasDao.actualizarClasificacion(clasificacionId, idIncidencia);
            }


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
            String descripcion = request.getParameter("descripcion");

            serenazgoDao.setDescripcion(idIncidencia, descripcion);



            incidenciasDao.incidenciaEnProceso(idIncidencia);
            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
        }else if(action.equals("gestionarIncidencia")){
            SerenazgoDao serenazgoDao = new SerenazgoDao();
            IncidenciasDao incidenciasDao = new IncidenciasDao();

            String idIncidenciaGest = request.getParameter("id");
            String clasificacionUpd = request.getParameter("clasificacion");
            String descripcionGest = request.getParameter("descripcion");

            int idIncidencia = Integer.parseInt(idIncidenciaGest);

            if (clasificacionUpd != null){
                int clasificacionId = Integer.parseInt(clasificacionUpd);

                incidenciasDao.actualizarClasificacion(clasificacionId, idIncidencia);
            }

            serenazgoDao.setDescripcion(idIncidencia, descripcionGest);
            response.sendRedirect(request.getContextPath() + "/Serenazgo?action=listaIncidencias");
        }else{
            response.sendRedirect(request.getContextPath() + "/Serenazgo");
        }

    }


}
