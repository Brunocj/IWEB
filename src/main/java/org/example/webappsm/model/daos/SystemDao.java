package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SystemDao extends BaseDao{

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


}
