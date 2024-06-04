package org.example.webappsm.Servlet.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.webappsm.model.beans.Profesor;
import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.ProfesorDao;
import org.example.webappsm.model.daos.SerenazgoDao;
import org.example.webappsm.model.daos.VecinosDao;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
@WebServlet(name = "AdminServlet", value = "/Admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "pagPrincipal" : request.getParameter("action");

        String vista;
        RequestDispatcher rd;
        switch(action){
            case "pagPrincipal":
                vista = "vistas/jsp/ADMIN/pagina_principal_admin.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "dashboard":
                vista = "vistas/jsp/ADMIN/Dashboard/dashboard.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "tablaSerenazgo":
                SerenazgoDao serenazgoDao = new SerenazgoDao();
                ArrayList<Serenazgo> listaserenazgo = serenazgoDao.listarSerenazgoTabla();

                request.setAttribute("listaserenazgo",listaserenazgo);
                vista = "vistas/jsp/ADMIN/Serenazgo/tabla_serenazgo.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "tablaProfesores":
                ProfesorDao profesorDao = new ProfesorDao();
                ArrayList<Profesor> list = profesorDao.listarProfesoresTabla();

                //OBJETO A ENVIAR
                request.setAttribute("listaprofesor",list);

                vista = "vistas/jsp/ADMIN/Profesores/tabla_profesor.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;

             case "tablaAcceso":
                VecinosDao vecinosDao = new VecinosDao();
                ArrayList<Usuario> listaAcceso = vecinosDao.listarSoliAcceso();

                request.setAttribute("listaacceso", listaAcceso);
                vista = "vistas/jsp/ADMIN/Vecinos/Solicitudes_acceso/tabla_solicitudes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "tablaCoordinador":
                VecinosDao vecinosDao1 = new VecinosDao();
                ArrayList<Usuario> listaCoord = vecinosDao1.listarSoliCord();

                request.setAttribute("listacoord", listaCoord);
                vista = "vistas/jsp/ADMIN/Vecinos/Postulaciones_coordinacion/tabla_postulaciones.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Verificar si la acción es registrar un nuevo profesor
        if(action.equals("registrarDocente")) {
            String apellido = request.getParameter("apellido");
            String nombre = request.getParameter("nombre");
            String curso = request.getParameter("curso");

            // Establecer idArea como 1 por defecto
            int idArea = 1;

            Profesor nuevoProfesor = new Profesor();
            nuevoProfesor.setApellido(apellido);
            nuevoProfesor.setNombre(nombre);
            nuevoProfesor.setCurso(curso);
            nuevoProfesor.setIdArea(idArea);

            ProfesorDao profesorDao = new ProfesorDao();
            profesorDao.agregarProfesor(nuevoProfesor);

            // Redireccionar a la página de tablaProfesores después de completar el registro
            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaProfesores");
        }
        // Verificar si la acción es eliminar un profesor
        else if(action.equals("eliminarProfesor")) {
            // Obtener el ID del profesor a eliminar
            int idProfesor = Integer.parseInt(request.getParameter("id"));

            // Crear una instancia de ProfesorDao
            ProfesorDao profesorDao = new ProfesorDao();

            // Eliminar al profesor con el ID especificado
            profesorDao.eliminarProfesor(idProfesor);

            // Redireccionar a la página de tablaProfesores después de completar la eliminación
            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaProfesores");
        }else if(action.equals("registrarSerenazgo")) {
            String nombreS = request.getParameter("apellidoS");
            String apellidoS = request.getParameter("nombreS");
            String dniS = request.getParameter("dniS");
            String direccionS = request.getParameter("direccionS");
            String telefonoS = request.getParameter("telefonoS");
            String turnoS = request.getParameter("turnoS");
            String tipoS = request.getParameter("tipoS");
            String fNacimientoS = request.getParameter("fNacimientoS");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // Define el formato de la fecha
            Date fechaNacimiento = null;

            try {
                fechaNacimiento = formatter.parse(fNacimientoS);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Serenazgo nuevoSerenazgo = new Serenazgo();
            nuevoSerenazgo.setNombre(nombreS);
            nuevoSerenazgo.setApellido(apellidoS);
            nuevoSerenazgo.setDni(dniS);
            nuevoSerenazgo.setDireccion(direccionS);
            nuevoSerenazgo.setTelefono(telefonoS);
            nuevoSerenazgo.setTurno(turnoS);
            nuevoSerenazgo.setTipo(tipoS);
            nuevoSerenazgo.setFNacimiento(fechaNacimiento);

            SerenazgoDao serenazgoDao = new SerenazgoDao();
            serenazgoDao.agregarSerenazgo(nuevoSerenazgo);

            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaSerenazgo");

        }else if(action.equals("editarSerenazgo")){
            SerenazgoDao serenazgoDao = new SerenazgoDao();
            String idSerenazgoString = request.getParameter("idSerenazgo");
            int idSerenazgo = Integer.parseInt(idSerenazgoString);
            Serenazgo serenazgo = serenazgoDao.obtenerSerenazgoPorId(idSerenazgo);

            String nombreS = request.getParameter("nombreS");
            if (nombreS != null && !nombreS.isEmpty()) {
                serenazgo.setNombre(nombreS);
            }
            String apellidoS = request.getParameter("apellidoS");
            if (apellidoS != null && !apellidoS.isEmpty()) {
                serenazgo.setNombre(apellidoS);
            }
            String dniS = request.getParameter("dniS");
            if (dniS != null && !dniS.isEmpty()) {
                serenazgo.setNombre(dniS);
            }
            String direccionS = request.getParameter("direccionS");
            if (direccionS != null && !direccionS.isEmpty()) {
                serenazgo.setNombre(direccionS);
            }
            String telefonoS = request.getParameter("telefonoS");
            if (telefonoS != null && !telefonoS.isEmpty()) {
                serenazgo.setNombre(telefonoS);
            }
            String turnoS = request.getParameter("turnoS");
            if (turnoS != null && !turnoS.isEmpty()) {
                serenazgo.setNombre(turnoS);
            }
            String tipoS = request.getParameter("tipoS");
            if (tipoS != null && !tipoS.isEmpty()) {
                serenazgo.setNombre(tipoS);
            }
            String fNacimientoS = request.getParameter("fNacimientoS");
            if (fNacimientoS != null && !fNacimientoS.isEmpty()) {
                serenazgo.setNombre(fNacimientoS);
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = null;

            try {
                fechaNacimiento = formatter.parse(fNacimientoS);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            serenazgoDao.editarSerenazgo(serenazgo);
            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaSerenazgo");

        }else if(action.equals("eliminarSerenazgo")){

            int idSerenazgo = Integer.parseInt(request.getParameter("idS"));

            SerenazgoDao serenazgoDao = new SerenazgoDao();
            serenazgoDao.eliminarSerenazgo(idSerenazgo);

            response.sendRedirect(request.getContextPath() + "/Admin?action=tablaSerenazgo");
        }else{
            response.sendRedirect(request.getContextPath() + "/Admin");
        }
    }

}
