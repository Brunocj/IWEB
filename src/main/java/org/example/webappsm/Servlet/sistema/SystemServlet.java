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
import java.sql.SQLException;
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
            case "register":
                vista = "vistas/jsp/LOGIN/register.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "chPass":
                vista = "vistas/jsp/LOGIN/chPass.jsp";
                int idUsuario = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("idUsuario", idUsuario);
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "chPhone":
                int idUsuarioPh = Integer.parseInt(request.getParameter("id"));
                //Usuario usuario = userDao.mostrarUsuarioID(idUsuarioPh);
                request.setAttribute("idUsuario", idUsuarioPh);
                vista = "vistas/jsp/LOGIN/chPhone.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "recvPass":
                vista = "vistas/jsp/LOGIN/recvPass.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("vistas/jsp/LOGIN/login.jsp");

                break;

        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        SystemDao systemDao = new SystemDao();
        UserDao userDao = new UserDao();
        switch (action){
            case "loginPOST":
                String correo = request.getParameter("user");
                String password = request.getParameter("passwd");
                System.out.println("username: " + correo + " | password: " + password);

                if(systemDao.validarUsuarioPassword(correo, password)){
                    System.out.println("usuario y password válidos");
                    Usuario usuario = systemDao.getUsuarioCorreo(correo);
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("usuarioLogueado",usuario);
                    httpSession.setMaxInactiveInterval(15*60);
                    if(usuario.getIdEstado() == 1){
                        request.setAttribute("err","Sus datos aún no han sido validados");
                        request.getRequestDispatcher("vistas/jsp/LOGIN/login.jsp").forward(request,response); //redireect

                    }else if(usuario.getIdEstado() == 2){
                        request.setAttribute("idUsuario", usuario.getId());
                        request.getRequestDispatcher("vistas/jsp/LOGIN/chPass.jsp").forward(request,response);
                    }else{
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
                    }




                }else{
                    System.out.println("usuario o password incorrectos");
                    request.setAttribute("err","Credenciales incorrectos");
                    request.getRequestDispatcher("vistas/jsp/LOGIN/login.jsp").forward(request,response); //redireect
                }
                break;
            case "registerPOST":
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                int idDocumento = Integer.parseInt( request.getParameter("idDoc"));
                String nroDocumento = request.getParameter("documento");
                String direccion =  request.getParameter("direccion");
                String distrito =  request.getParameter("distrito");
                String urbanizacion = request.getParameter("urbanizacion");
                String correo1 =  request.getParameter("correo");
                int idRol = Integer.parseInt( request.getParameter("idrol"));
                boolean baneado = Boolean.parseBoolean( request.getParameter("baneado"));
                int idEstado = Integer.parseInt( request.getParameter("idestado"));
                int falsasAlarmas = Integer.parseInt( request.getParameter("falsasAlarmas"));
                String contacto = request.getParameter("contacto");
                String contra = systemDao.generarContra();

                systemDao.registrarUsuario(nombre, apellido, idDocumento, nroDocumento, direccion, distrito, urbanizacion, correo1, idRol, baneado, idEstado, falsasAlarmas, contacto, contra);

                String msg = "Se le notificará cuando su solicitud sea procesada";
                request.setAttribute("msg",msg);
                request.getRequestDispatcher("vistas/jsp/LOGIN/login.jsp").forward(request,response);

                break;
            case "chPassPOST":
                int idUsuario = Integer.parseInt(request.getParameter("id"));
                Usuario usuario = userDao.mostrarUsuarioID(idUsuario);
                String contraIngresada = request.getParameter("currentPass");
                if(contraIngresada.equals(usuario.getContrasena())){ //falta adaptar para cuando la contraseña este hasheada
                    String nuevaContra = request.getParameter("newPassword");
                    systemDao.actualizarContra(idUsuario, nuevaContra);
                    String passSuccess = "Se actualizo correctamente su contraseña";
                    Usuario usuariohttp = systemDao.getUsuarioCorreo(usuario.getCorreoE());
                    if(usuariohttp.getIdEstado()==2){
                        systemDao.actualizarEstado(3, usuariohttp.getId());
                    }
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("usuarioLogueado",usuariohttp);
                    request.setAttribute("passSuccess",passSuccess);
                    request.getRequestDispatcher("vistas/jsp/LOGIN/PassSuccess.jsp").forward(request,response);
                } else{
                  String passErr = "Ingrese correctamente su contraseña actual";
                    request.setAttribute("idUsuario", idUsuario);
                  request.setAttribute("passErr", passErr);
                  request.getRequestDispatcher("vistas/jsp/LOGIN/chPass.jsp").forward(request,response);
                }

                break;
            case "recvPassPOST":
                String dni = request.getParameter("dni");
                String correo2 = request.getParameter("correo");
                String asunto = "Solicitud de cambio de contraseña aceptada";
                String nuevaContra = systemDao.generarContra();
                String cuerpo = "Estimado usuario, su nueva contraseña es: " + nuevaContra + ". Si desea, puede cambiarla desde la página 'Mi Perfil'";
                System.out.printf("Ingresado: " + dni + " y " + correo2);
                try {
                    if (systemDao.validarCambioContra(correo2, dni)) {
                        systemDao.cambiarContra(nuevaContra, dni); // Cambia aquí el segundo parámetro a dni
                        systemDao.enviarCorreo(correo2, asunto, cuerpo);
                        msg = "Sus datos fueron actualizados correctamente, revise su correo";
                        request.setAttribute("msg", msg);
                        request.getRequestDispatcher("vistas/jsp/LOGIN/login.jsp").forward(request, response);
                        System.out.println("se ha enviado el correo");

                    } else {
                        msg = "Ingrese correctamente sus datos";
                        request.setAttribute("msg", msg);
                        request.getRequestDispatcher("vistas/jsp/LOGIN/recvPass.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "chPhonePOST":
                int idUsuarioPh = Integer.parseInt(request.getParameter("id"));
                Usuario usuarioPh = systemDao.getUsuarioCorreo(userDao.mostrarUsuarioID(idUsuarioPh).getCorreoE());
                String telefonoIngresado = request.getParameter("newPhone");
                systemDao.actualizarTelefono(idUsuarioPh, telefonoIngresado);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("usuarioLogueado",usuarioPh);
                request.setAttribute("idUsuario", idUsuarioPh);
                request.getRequestDispatcher("vistas/jsp/LOGIN/PhoneSuccess.jsp").forward(request,response);

                break;

                //CASE PARA EL CAMBIO DE CONTRASEÑA CON POPUP

            case "validatePassword":
                int userId = Integer.parseInt(request.getParameter("userId"));
                String oldPassword = request.getParameter("oldPassword");
                Usuario usuario1 = userDao.mostrarUsuarioID(userId);

                System.out.println("Contraseña recibida: " + oldPassword);
                System.out.println("Contraseña almacenada: " + usuario1.getContrasena());

                if (usuario1.getContrasena().equals(oldPassword)) {
                    response.getWriter().write("valid");
                } else {
                    response.getWriter().write("invalid");
                }
                break;


            case "updatePassword":
                int userId1 = Integer.parseInt(request.getParameter("userId"));
                String newPassword = request.getParameter("newPassword");
                systemDao.actualizarContra(userId1, newPassword);
                response.getWriter().write("success");
                break;

            case "updateNumber":
                int userId2 = Integer.parseInt(request.getParameter("userId"));
                String newPhNumber = request.getParameter("newPhNumber");
                systemDao.actualizarTelefono(userId2, newPhNumber);
                response.getWriter().write("success");
                break;

        }






    }

}
