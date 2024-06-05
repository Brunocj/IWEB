package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class VecinosDao {
    public ArrayList<Usuario> listarSoliAcceso(){
        ArrayList<Usuario> listaSoli = new ArrayList<>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";
        String sql = "SELECT u.idUsuario, u.nombres, u.apellidos, e.nombreEstado AS estado " +
                "FROM Usuario u " +
                "JOIN Estado e ON u.Estado_idEstado = e.idEstado " +
                "WHERE e.nombreEstado = 'pendiente'";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("idUsuario"));
                usuario.setNombre(rs.getString("nombres"));
                usuario.setApellido(rs.getString("apellidos"));


                listaSoli.add(usuario);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaSoli;
    }

    public ArrayList<Usuario> listarSoliCord(){
        ArrayList<Usuario> listaCoord = new ArrayList<>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";
        String sql = "SELECT " +
                "u.idUsuario," +
                "u.nombres, " +
                "u.apellidos, " +
                "a.nombreArea AS area " +
                "FROM " +
                "SolicitudCoordinador sc " +
                "JOIN Usuario u ON sc.idUsuario = u.idUsuario " +
                "JOIN Area a ON sc.idArea = a.idArea " +
                "WHERE " +
                "sc.estado = 0";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("idUsuario"));
                usuario.setNombre(rs.getString("nombres"));
                usuario.setApellido(rs.getString("apellidos"));
                usuario.setArea(rs.getString("area"));

                listaCoord.add(usuario);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCoord;
    }
}
