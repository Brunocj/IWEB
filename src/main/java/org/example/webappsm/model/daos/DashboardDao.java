package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class DashboardDao extends BaseDao{


    public ArrayList<Usuario> listarBaneados(){
        ArrayList<Usuario> listaBaneados = new ArrayList<>();



        String sql = "SELECT * FROM usuario WHERE baneado = 1";


        try (Connection conn = this.getConnection();
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



        String sql = "SELECT COUNT(*) AS total_vecinos_baneados " +
                "FROM usuario " +
                "WHERE idRol = 3 AND baneado = 1;";

        try (Connection conn = this.getConnection();
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



        String sql = "SELECT ROUND(AVG(incidencias_por_dia), 2) AS promedio_incidencias_por_dia \n" +
                "FROM (\n" +
                "    SELECT DATE(fecha) AS fecha_dia, COUNT(*) AS incidencias_por_dia \n" +
                "    FROM incidencia \n" +
                "    GROUP BY fecha_dia\n" +
                ") AS incidencias_diarias;";


        try (Connection conn = this.getConnection();
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



        String sql = "SELECT COUNT(*) AS total_incidencias_ultimo_mes " +
                "FROM incidencia " +
                "WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);";

        try (Connection conn = this.getConnection();
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



        String sql = "SELECT COUNT(*) AS total_incidencias_esta_semana " +
                "FROM incidencia " +
                "WHERE YEARWEEK(fecha, 1) = YEARWEEK(CURDATE(), 1);";

        try (Connection conn = this.getConnection();
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



        String sql = "SELECT COUNT(*) AS total_incidencias_hoy " +
                "FROM incidencia " +
                "WHERE DATE(fecha) = CURDATE();";

        try (Connection conn = this.getConnection();
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


        String sql = "SELECT COUNT(*) AS cantidad_incidencias_pendientes " +
                "FROM incidencia " +
                "WHERE idEstado = 1;";

        try (Connection conn = this.getConnection();
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



        String sql = "SELECT nombreUrbanizacion, COUNT(*) AS cantidad_incidencias " +
                "FROM incidencia " +
                "JOIN urbanizacion ON incidencia.idUrbanizacion = urbanizacion.idUrbanizacion " +
                "GROUP BY nombreUrbanizacion " +
                "ORDER BY cantidad_incidencias DESC " +
                "LIMIT 1;";

        try (Connection conn = this.getConnection();
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



        String sql = "SELECT nombreUrbanizacion, COUNT(*) AS cantidad_incidencias " +
                "FROM incidencia " +
                "JOIN urbanizacion ON incidencia.idUrbanizacion = urbanizacion.idUrbanizacion " +
                "GROUP BY nombreUrbanizacion " +
                "ORDER BY cantidad_incidencias ASC " +
                "LIMIT 1;";

        try (Connection conn = this.getConnection();
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


        String sql = "SELECT nombreTipo, COUNT(*) AS cantidad_incidencias " +
                "FROM incidencia " +
                "JOIN tipoIncidencia ON incidencia.idTipoIncidencia = tipoIncidencia.idTipoIncidencia " +
                "GROUP BY nombreTipo " +
                "ORDER BY cantidad_incidencias DESC";

        try (Connection conn = this.getConnection();
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


        String sql = "SELECT * FROM incidencia WHERE idEstado = ?";

        try (Connection conn = this.getConnection();
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


        String sql = "SELECT nombreUrbanizacion, COUNT(*) AS cantidad_incidencias " +
                "FROM incidencia " +
                "JOIN urbanizacion ON incidencia.idUrbanizacion = urbanizacion.idUrbanizacion " +
                "GROUP BY nombreUrbanizacion " +
                "ORDER BY cantidad_incidencias DESC";

        try (Connection conn = this.getConnection();
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

        String sql = "SELECT \n" +
                "    ti.nombreTipo AS tipo_incidencia, \n" +
                "    COUNT(i.idIncidencia) AS cantidad_incidencias \n" +
                "FROM \n" +
                "    sanmiguel.tipoincidencia ti \n" +
                "LEFT JOIN \n" +
                "    sanmiguel.incidencia i ON ti.idTipoIncidencia = i.idTipoIncidencia \n" +
                "GROUP BY \n" +
                "    ti.nombreTipo;";

        try (Connection conn = this.getConnection();
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

        String sql = "SELECT \n" +
                "    u.nombreUrbanizacion AS nombreUrb, \n" +
                "    COUNT(i.idIncidencia) AS cantidad_incidencias \n" +
                "FROM \n" +
                "    urbanizacion u \n" +
                "LEFT JOIN \n" +
                "    sanmiguel.incidencia i ON u.idUrbanizacion = i.idUrbanizacion \n" +
                "GROUP BY \n" +
                "    u.nombreUrbanizacion;";

        try (Connection conn = this.getConnection();
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

        String sql = "SELECT \n" +
                "    e.nombreEstado, \n" +
                "    (COUNT(i.idIncidencia) * 100.0 / (SELECT COUNT(*) FROM incidencia)) AS porcentaje \n" +
                "FROM \n" +
                "    estadoincidencia e \n" +
                "LEFT JOIN \n" +
                "    incidencia i ON e.idEstado = i.idEstado \n" +
                "GROUP BY \n" +
                "    e.nombreEstado;";

        try (Connection conn = this.getConnection();
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

        String sql = "WITH Days AS (\n" +
                "    SELECT 1 AS DayNumber, 'Lunes' AS DayName\n" +
                "    UNION ALL SELECT 2, 'Martes'\n" +
                "    UNION ALL SELECT 3, 'Miércoles'\n" +
                "    UNION ALL SELECT 4, 'Jueves'\n" +
                "    UNION ALL SELECT 5, 'Viernes'\n" +
                "    UNION ALL SELECT 6, 'Sábado'\n" +
                "    UNION ALL SELECT 7, 'Domingo'\n" +
                ")\n" +
                "SELECT \n" +
                "    d.DayName AS Dia,\n" +
                "    COALESCE(SUM(CASE WHEN DAYOFWEEK(i.fecha) = d.DayNumber THEN 1 ELSE 0 END), 0) AS IncidenciasReportadas,\n" +
                "    COALESCE(SUM(CASE WHEN i.idEstado IN (3, 4) AND DAYOFWEEK(i.fecha) = d.DayNumber THEN 1 ELSE 0 END), 0) AS IncidenciasResueltas\n" +
                "FROM \n" +
                "    Days d\n" +
                "LEFT JOIN \n" +
                "    incidencia i ON YEARWEEK(i.fecha, 1) = YEARWEEK(CURDATE(), 1) AND DAYOFWEEK(i.fecha) = d.DayNumber\n" +
                "GROUP BY \n" +
                "    d.DayNumber, d.DayName\n" +
                "ORDER BY \n" +
                "    d.DayNumber;";

        try (Connection conn = this.getConnection();
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
