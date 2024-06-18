package org.example.webappsm.Servlet.vecino;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Tipos;
import org.example.webappsm.model.beans.Urbanizacion;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.UserDao;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name ="VecinoServlet" , value = "/Vecino")
@MultipartConfig
public class VecinoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd ;
        UserDao userDao  = new UserDao();
        switch (action){
            case "pagPrincipal":
                vista = "vistas/jsp/VECINO/pagina_principal_vecino.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "miPerfil":
                int idusuario = Integer.parseInt(request.getParameter("id"));
                Usuario u = userDao.mostrarUsuarioID(idusuario);

                request.setAttribute("usuario", u);
                vista = "vistas/jsp/VECINO/Miperfil.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "solCoordinador":
                vista = "vistas/jsp/VECINO/solicitud/solicitarCoordinador.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "eventos":


                vista = "vistas/jsp/VECINO/eventos/eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "incidencias":
                ArrayList<Incidencia> listaIncidencias = userDao.listarIncidencias();
                request.setAttribute("listaincidencias", listaIncidencias);

                vista = "vistas/jsp/VECINO/incidencias/incidencia_vecino.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "registroIncidencia":
                ArrayList<Urbanizacion> listaUrbanizaciones = userDao.listarUrbanizaciones();
                ArrayList<Tipos> tiposIncidencias = userDao.listarTiposIncidencias();
                request.setAttribute("listaUrbanizaciones", listaUrbanizaciones);
                request.setAttribute("tiposIncidencias", tiposIncidencias);
                vista = "vistas/jsp/VECINO/incidencias/registrar_incidencia.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "infoIncidencia":
                int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
                Incidencia incidencia = userDao.getIncidenciaId(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                vista = "vistas/jsp/VECINO/incidencias/incidencia_info.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;


        }
//xd
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        UserDao userDao = new UserDao();
        switch (action){
            case "enviarSolicitud":
                int idArea = Integer.parseInt(request.getParameter("idArea"));
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                userDao.enviarSolicitud(idUsuario, idArea);
                response.sendRedirect(request.getContextPath() + "/Vecino?action=solCoordinador");
                break;
            case "registrarIncidencia":
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String lugar = request.getParameter("lugar");
                String referencia = request.getParameter("ref");
                int idUrbanizacion = Integer.parseInt(request.getParameter("idUrb"));
                String contacto = request.getParameter("contacto");
                Boolean necesitaAmbulancia = Boolean.parseBoolean(request.getParameter("ambulanciaSN"));
                byte[] evidencia = obtenerImagenComoByteArray((request.getPart("foto").getInputStream()));
                String fechaStr = request.getParameter("fecha");

                try {
                    // Definir el formato de la fecha/hora
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    // Parsear la cadena a un objeto java.util.Date
                    Date fechaUtil = sdf.parse(fechaStr);
                    // Convertir el objeto java.util.Date a java.sql.Timestamp
                    Timestamp fechaSql = new Timestamp(fechaUtil.getTime());
                    incidencia.setFechaIncidencia(fechaSql);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                int idTipo = Integer.parseInt(request.getParameter("idTipoIncidencia"));
                int idUsuarioIncidencia = Integer.parseInt(request.getParameter("idUsuario"));
                incidencia.setNombre(nombreIncidencia);
                incidencia.setLugar(lugar);
                incidencia.setReferencia(referencia);
                incidencia.setIdUrbanizacion(idUrbanizacion);
                incidencia.setContactoO(contacto);
                incidencia.setAmbulanciaI(necesitaAmbulancia);
                incidencia.setImgEvidencia(evidencia);
                incidencia.setIdTipo(idTipo);
                incidencia.setIdUsuario(idUsuarioIncidencia);
                userDao.agregarIncidencia(incidencia);
                response.sendRedirect(request.getContextPath() + "/Vecino?action=incidencias");
                break;
        }

    }
    public static byte[] obtenerImagenComoByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }
}
