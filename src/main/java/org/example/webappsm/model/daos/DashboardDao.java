package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class DashboardDao {
    public ArrayList<Incidencia> listarIncidencias(){
        ArrayList<Incidencia> listaIncidencias = new ArrayList<>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "";


        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Incidencia incidencia = new Incidencia();


                listaIncidencias.add(incidencia);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencias;
    }

    public ArrayList<Usuario> listarBaneados(){
        ArrayList<Usuario> listaBaneados = new ArrayList<>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "";


        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                /*Usuario usuario = new Usuario();
                usuario.setApellido();
                usuario.setNombre();
                usuario.setDocumento();
                usuario.setTipoDocumento();
                listaBaneados.add(usuario);*/

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaBaneados;
    }

    public String totalBaneados(){
        String totalBaneados = "";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT COUNT(*) AS total_vecinos_baneados " +
                "FROM Usuario " +
                "WHERE idRol = 3 AND baneado = 1;";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                totalBaneados = Integer.toString(rs.getInt("total_vecinos_baneados"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return totalBaneados;
    }

    public String avgIncidencias(){
        String avgIncidencias ="";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT AVG(incidencias_por_dia) AS promedio_incidencias_por_dia " +
                "FROM (SELECT DATE(fecha) AS fecha_dia, COUNT(*) AS incidencias_por_dia " +
                "FROM Incidencia " +
                "GROUP BY fecha_dia) AS incidencias_diarias;";


        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                avgIncidencias = Double.toString(rs.getDouble("promedio_incidencias_por_dia"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return avgIncidencias;
    }

    public String totalIncidencias(){
        String totalIncidencias ="";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT COUNT(*) AS cantidad_total_incidencias " +
                "FROM Incidencia;";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                totalIncidencias = Integer.toString(rs.getInt("cantidad_total_incidencias"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return totalIncidencias;
    }

    public String incidenciaComunMax(){
        String maxComun = "";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT nombreTipo, COUNT(*) AS cantidad_incidencias " +
                "FROM Incidencia " +
                "JOIN TipoIncidencia ON Incidencia.idTipoIncidencia = TipoIncidencia.idTipoIncidencia " +
                "GROUP BY nombreTipo " +
                "ORDER BY cantidad_incidencias DESC " +
                "LIMIT 1;";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                maxComun = (rs.getString("nombreTipo"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return maxComun;
    }

    public String incidenciaComunMin(){
        String minComun = "";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT nombreTipo, COUNT(*) AS cantidad_incidencias " +
                "FROM Incidencia " +
                "JOIN TipoIncidencia ON Incidencia.idTipoIncidencia = TipoIncidencia.idTipoIncidencia " +
                "GROUP BY nombreTipo " +
                "ORDER BY cantidad_incidencias ASC " +
                "LIMIT 1;";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                minComun = (rs.getString("nombreTipo"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return minComun;
    }
    public String incidenciasPorAtender(){
        String  incidenciasPorAtender ="";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT COUNT(*) AS cantidad_incidencias_pendientes " +
                "FROM Incidencia " +
                "WHERE idEstado = 1;";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                incidenciasPorAtender = Integer.toString(rs.getInt("cantidad_incidencias_pendientes"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidenciasPorAtender;
    }

    public String incidenciasUrbMax(){
        String maxUrb ="";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT nombreUrbanizacion, COUNT(*) AS cantidad_incidencias " +
                "FROM Incidencia " +
                "JOIN Urbanizacion ON Incidencia.idUrbanizacion = Urbanizacion.idUrbanizacion " +
                "GROUP BY nombreUrbanizacion " +
                "ORDER BY cantidad_incidencias DESC " +
                "LIMIT 1;";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                maxUrb = (rs.getString("nombreUrbanizacion"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return maxUrb;
    }

    public String incidenciasUrbMin(){
        String minUrb ="";

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT nombreUrbanizacion, COUNT(*) AS cantidad_incidencias " +
                "FROM Incidencia " +
                "JOIN Urbanizacion ON Incidencia.idUrbanizacion = Urbanizacion.idUrbanizacion " +
                "GROUP BY nombreUrbanizacion " +
                "ORDER BY cantidad_incidencias ASC " +
                "LIMIT 1;";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                minUrb = (rs.getString("nombreUrbanizacion"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return minUrb;
    }

}
//ValoresDashboard
