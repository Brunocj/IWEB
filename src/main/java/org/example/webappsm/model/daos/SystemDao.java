package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Usuario;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.stream.Stream;

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
                    usuario.setIdRol(rs.getInt(5));

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


}
