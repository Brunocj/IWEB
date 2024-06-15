package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class DashboardDao {


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

        String sql = "SELECT * FROM Usuario WHERE baneado = 1";


        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setApellido(rs.getString("apellidos"));
                usuario.setNombre(rs.getString("nombres"));
                usuario.setDocumento(rs.getString("nroDocumento"));
                //usuario.setTipoDocumento();
                listaBaneados.add(usuario);

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

    public String incidenciasMes(){
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

        String sql = "SELECT COUNT(*) AS total_incidencias_ultimo_mes " +
                "FROM incidencia " +
                "WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                totalIncidencias = Integer.toString(rs.getInt(1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return totalIncidencias;
    }

    public String incidenciasSemana(){
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

        String sql = "SELECT COUNT(*) AS total_incidencias_esta_semana " +
                "FROM incidencia " +
                "WHERE YEARWEEK(fecha, 1) = YEARWEEK(CURDATE(), 1);";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                maxComun = (rs.getString(1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return maxComun;
    }

    public String incidenciasHoy(){
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

        String sql = "SELECT COUNT(*) AS total_incidencias_hoy " +
                "FROM incidencia " +
                "WHERE DATE(fecha) = CURDATE();";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                minComun = (rs.getString(1));

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
    //Funciones para los graficos:
    public ArrayList<String> obtenerIncidenciasPorTipo() {
        ArrayList<String> incidenciasPorTipo = new ArrayList<>();

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
                "ORDER BY cantidad_incidencias DESC";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                incidenciasPorTipo.add(rs.getString("nombreTipo") + ": " + rs.getInt("cantidad_incidencias"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidenciasPorTipo;
    }

    //FALTA MODIFICAR PARA QUE ME DE TODOS LOS TIPOS DE INCIDENCIA POR ESTADO (aunq diria que esta bien)
    public ArrayList<Incidencia> listarIncidenciasPorEstado(int idEstado) {
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

        String sql = "SELECT * FROM Incidencia WHERE idEstado = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEstado);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Incidencia incidencia = new Incidencia();
                    // Setea los atributos de incidencia aquí
                    listaIncidencias.add(incidencia);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencias;
    }

    public ArrayList<String> obtenerIncidenciasPorUrbanizacion() {
        ArrayList<String> incidenciasPorUrbanizacion = new ArrayList<>();

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
                "ORDER BY cantidad_incidencias DESC";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                incidenciasPorUrbanizacion.add(rs.getString("nombreUrbanizacion") + ": " + rs.getInt("cantidad_incidencias"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidenciasPorUrbanizacion;
    }





    public void incidenciasPorTipo(ArrayList<String> Tipos, ArrayList<Integer> Cantidades){
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
                "ti.nombreTipo AS tipo_incidencia, " +
                "COUNT(i.idIncidencia) AS cantidad_incidencias " +
                "FROM " +
                "SanMiguel.TipoIncidencia ti " +
                "LEFT JOIN " +
                "SanMiguel.Incidencia i ON ti.idTipoIncidencia = i.idTipoIncidencia " +
                "GROUP BY " +
                "ti.nombreTipo;";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Tipos.add(rs.getString(1));
                Cantidades.add(rs.getInt(2));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void incidenciasPorUrbanizacion(ArrayList<String> Urbanizaciones, ArrayList<Integer> Cantidades){
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
                "u.nombreUrbanizacion AS nombreUrb, " +
                "COUNT(i.idIncidencia) AS cantidad_incidencias " +
                "FROM " +
                "Urbanizacion u " +
                "LEFT JOIN " +
                "SanMiguel.Incidencia i ON u.idUrbanizacion = i.idTipoIncidencia " +
                "GROUP BY " +
                "u.nombreUrbanizacion;";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Urbanizaciones.add(rs.getString(1));
                Cantidades.add(rs.getInt(2));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void incidenciasPorEstado(ArrayList<String> Estados, ArrayList<Double> Porcentajes){
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
                "e.nombreEstado, " +
                "(COUNT(i.idIncidencia) * 100.0 / (SELECT COUNT(*) FROM Incidencia)) AS porcentaje " +
                "FROM " +
                "EstadoIncidencia e " +
                "LEFT JOIN " +
                "Incidencia i ON e.idEstado = i.idEstado " +
                "GROUP BY " +
                "e.nombreEstado;";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Estados.add(rs.getString(1));
                Porcentajes.add(rs.getDouble(2));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void incidenciasRegistradas (ArrayList<String> Labels, ArrayList<Integer>IncidenciasRegistradas, ArrayList<Integer>IncidenciasResueltas){
        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";
        String sql = "WITH Days AS (" +
                "SELECT 1 AS DayNumber, 'Lunes' AS DayName " +
                "UNION ALL SELECT 2, 'Martes' " +
                "UNION ALL SELECT 3, 'Miercoles' " +
                "UNION ALL SELECT 4, 'Jueves' " +
                "UNION ALL SELECT 5, 'Viernes' " +
                "UNION ALL SELECT 6, 'Sábado' " +
                "UNION ALL SELECT 7, 'Domingo' " +
                ") " +
                "SELECT " +
                "d.DayName AS Dia, " +
                "COALESCE(SUM(CASE WHEN DAYOFWEEK(i.fecha) = d.DayNumber THEN 1 ELSE 0 END), 0) AS IncidenciasReportadas, " +
                "COALESCE(SUM(CASE WHEN i.idEstado IN (3, 4) AND DAYOFWEEK(i.fecha) = d.DayNumber THEN 1 ELSE 0 END), 0) AS IncidenciasResueltas " +
                "FROM " +
                "Days d " +
                "LEFT JOIN " +
                "Incidencia i ON YEARWEEK(i.fecha, 1) = YEARWEEK(CURDATE(), 1) AND DAYOFWEEK(i.fecha) = d.DayNumber " +
                "GROUP BY " +
                "d.DayNumber, d.DayName " +
                "ORDER BY " +
                "d.DayNumber;";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Labels.add(rs.getString(1));
                IncidenciasRegistradas.add(rs.getInt(2));
                IncidenciasResueltas.add(rs.getInt(3));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }




}
