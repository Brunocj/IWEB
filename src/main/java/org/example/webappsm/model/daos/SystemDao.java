package org.example.webappsm.model.daos;

import jakarta.mail.*;
import org.example.webappsm.model.beans.Usuario;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import jakarta.mail.internet.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class SystemDao extends BaseDao{

    public void registrarUsuario(String nombre, String apellido, int idDocumento, String nroDocumento, String direccion, String distrito, String urbanizacion, String correo, int idRol, boolean baneado, int idEstado, int falsasAlarmas, String contacto, String contra){
        String sql = "INSERT INTO usuario (nombres, apellidos, nroDocumento, idRol, idDocumento, distrito, urbanización, falsasAlarmas, correo, contrasena, direccion, numeroContacto, baneado, Estado_idEstado) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";


        try(Connection connection = this.getConnection();
        PreparedStatement pstmt = connection.prepareStatement(sql)){
        pstmt.setString(1, nombre);
        pstmt.setString(2, apellido);
        pstmt.setString(3, nroDocumento);
        pstmt.setInt(4, idRol);
        pstmt.setInt(5, idDocumento);
        pstmt.setString(6, distrito);
        pstmt.setString(7, urbanizacion);
        pstmt.setInt(8, falsasAlarmas);
        pstmt.setString(9, correo);
        pstmt.setString(10, contra);
        pstmt.setString(11, direccion);
        pstmt.setString(12, contacto);
        pstmt.setBoolean(13, baneado);
        pstmt.setInt(14, idEstado);
        pstmt.executeUpdate();

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public boolean validarUsuarioPassword(String username, String password){

        String sql = "SELECT * FROM usuario where correo = ? and contrasena = ?";

        boolean exito = false;

        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,username);
            pstmt.setString(2,password);

            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    exito = true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return exito;
    }

    public Usuario getUsuarioCorreo(String correo){
        Usuario usuario = new Usuario();
        String sql = "SELECT * FROM usuario WHERE correo = ?;";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,correo);


            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    usuario.setId(rs.getInt(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCorreoE(correo);
                    usuario.setDocumento(rs.getString(4));
                    usuario.setNumContacto(rs.getString(13));
                    usuario.setIdRol(rs.getInt(5));
                    usuario.setIdEstado(rs.getInt(16));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return usuario;
    }

    public String generarContra(){
        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?";
        SecureRandom random = new SecureRandom();
        int longitud = 8;
        StringBuilder contrasena = new StringBuilder(longitud);

        for (int i = 0; i < longitud; i++) {
            int index = random.nextInt(CHARACTERS.length());
            contrasena.append(CHARACTERS.charAt(index));
        }

        return contrasena.toString();

    }

    public void actualizarContra(int idUsuario, String contrasena){
        String sql = "UPDATE usuario SET contrasena = ? WHERE idUsuario = ?;";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, contrasena);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public void actualizarTelefono(int idUsuario, String telIngresado){
        String sql ="UPDATE usuario SET numeroContacto = ? WHERE idUsuario = ?;";
        try(Connection connection = this.getConnection();
        PreparedStatement pstmt =connection.prepareStatement(sql)){
            pstmt.setString(1, telIngresado);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }
    public void actualizarEstado(int idEstado, int idUsuario){
        String sql ="UPDATE usuario SET Estado_idEstado = ? WHERE idUsuario = ?;";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt =connection.prepareStatement(sql)){
            pstmt.setInt(1, idEstado);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void enviarCorreo(String destino, String asunto, String cuerpo){
        String from = "sm.4dmin@gmail.com";
        String pass = "jrnj deve irvb munz";
        String host = "smtp.gmail.com";
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass); // Cambia "tu_contraseña" por tu contraseña de correo
            }
        });
        try {
            // Crear un objeto MimeMessage
            MimeMessage message = new MimeMessage(session);

            // Configurar los parámetros del mensaje
            message.setFrom(new InternetAddress(from)); // Configuración de la dirección del remitente
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destino)); // Configuración de la dirección del destinatario
            message.setSubject(asunto); // Configuración del asunto
            message.setText(cuerpo); // Configuración del cuerpo del correo

            // Enviar el mensaje
            Transport.send(message);
            System.out.println("Correo enviado exitosamente...");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

    public boolean validarCambioContra(String correo, String documento) throws SQLException {
        String sql ="SELECT * FROM usuario where correo = ? and nroDocumento = ?";
        boolean exito = false;
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt =connection.prepareStatement(sql)){
            pstmt.setString(1,correo);
            pstmt.setString(2,documento);

            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    exito = true;
                }
            }

        }
        return exito;
    }

    public void cambiarContra(String contra, String documento) {
        String sql = "UPDATE usuario SET contrasena = ? WHERE nroDocumento = ?;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, contra);
            pstmt.setString(2, documento);
            int filasActualizadas = pstmt.executeUpdate();

            if (filasActualizadas > 0) {
                System.out.printf("Se cambió exitosamente la contraseña para el documento %s%n", documento);
            } else {
                System.out.printf("No se encontró el usuario con el documento %s%n", documento);
            }

        } catch (SQLException e) {
            System.err.printf("Error al cambiar la contraseña para el documento %s: %s%n", documento, e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public boolean verificarDni(String documento) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE nroDocumento = ?";
        boolean existe = false;

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, documento);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    existe = true; // Si existe algún registro con ese número de documento
                }
            }
        }

        return existe;
    }

    public boolean verificarCorreoExistente(String correo) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE correo = ?";
        boolean existe = false;

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, correo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    existe = true; // Si existe algún registro con ese correo electrónico
                }
            }
        }

        return existe;
    }


    //hasheo de contraseña

    public String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }



    public boolean validarUsuarioPasswordHashed(String username, String password){

        String sql = "SELECT * FROM usuario where correo = ? and contrasena = sha2(?,256)";

        boolean exito = false;

        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,username);
            pstmt.setString(2,password);

            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    exito = true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return exito;
    }


}
