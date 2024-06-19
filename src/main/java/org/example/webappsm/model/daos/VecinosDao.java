package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class VecinosDao extends BaseDao{
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
    public ArrayList<Evento> listarEventos(int idUsuario) {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT e.* " +
                "FROM evento e " +
                "LEFT JOIN inscripcion i ON e.idEvento = i.idEvento AND i.idUsuario = ? " +
                "WHERE i.idUsuario IS NULL AND e.idEstadoEvento = 1;";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Configurar el parámetro para el PreparedStatement
            stmt.setInt(1, idUsuario);

            // Ejecutar la consulta
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Evento evento = new Evento();
                    evento.setIdEvento(rs.getInt("idEvento"));
                    evento.setTitulo(rs.getString("titulo"));
                    evento.setDescripcion(rs.getString("descripcion"));
                    evento.setFecha(rs.getDate("fecha"));
                    evento.setHora(rs.getTime("hora"));
                    evento.setUbicacion(rs.getString("ubicacion"));
                    evento.setRecurrencia(rs.getInt("recurrencia"));
                    evento.setImagenes(this.readImagenes(rs.getBinaryStream("imagenes")));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(rs.getTimestamp("ingreso"));
                    evento.setSalida(rs.getTimestamp("salida"));
                    evento.setIdProfesor(rs.getInt("idProfesor"));
                    evento.setIdCoordinador(rs.getInt("idCoordinador"));
                    evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                    evento.setIdArea(rs.getInt("idArea"));
                    evento.setResumen(rs.getString("resumen"));

                    listaEventos.add(evento);
                }
            }

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }

        return listaEventos;
    }

    public ArrayList<Evento> listarMisEventos(int idUsuario) {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT e.* " +
                "FROM evento e " +
                "INNER JOIN inscripcion i ON e.idEvento = i.idEvento\n " +
                "WHERE i.idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Configurar el parámetro para el PreparedStatement
            stmt.setInt(1, idUsuario);

            // Ejecutar la consulta
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Evento evento = new Evento();
                    evento.setIdEvento(rs.getInt("idEvento"));
                    evento.setTitulo(rs.getString("titulo"));
                    evento.setDescripcion(rs.getString("descripcion"));
                    evento.setFecha(rs.getDate("fecha"));
                    evento.setHora(rs.getTime("hora"));
                    evento.setUbicacion(rs.getString("ubicacion"));
                    evento.setRecurrencia(rs.getInt("recurrencia"));
                    evento.setImagenes(this.readImagenes(rs.getBinaryStream("imagenes")));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(rs.getTimestamp("ingreso"));
                    evento.setSalida(rs.getTimestamp("salida"));
                    evento.setIdProfesor(rs.getInt("idProfesor"));
                    evento.setIdCoordinador(rs.getInt("idCoordinador"));
                    evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                    evento.setIdArea(rs.getInt("idArea"));
                    evento.setResumen(rs.getString("resumen"));

                    listaEventos.add(evento);
                }
            }

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }

        return listaEventos;
    }


    public Evento obtenerEventoporId(int id) {
        Evento evento = null;
        String sql = "SELECT * FROM evento WHERE idEvento = ?";

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    evento = new Evento();
                    evento.setIdEvento(rs.getInt("idEvento"));
                    evento.setTitulo(rs.getString("titulo"));
                    evento.setDescripcion(rs.getString("descripcion"));
                    evento.setFecha(rs.getDate("fecha"));
                    evento.setHora(rs.getTime("hora"));
                    evento.setUbicacion(rs.getString("ubicacion"));
                    evento.setRecurrencia(rs.getInt("recurrencia"));
                    evento.setImagenes(this.readImagenes(rs.getBinaryStream("imagenes")));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(rs.getTimestamp("ingreso"));
                    evento.setSalida(rs.getTimestamp("salida"));
                    evento.setIdProfesor(rs.getInt("idProfesor"));
                    evento.setIdCoordinador(rs.getInt("idCoordinador"));
                    evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                    evento.setIdArea(rs.getInt("idArea"));
                    evento.setResumen(rs.getString("resumen"));

                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return evento;
    }
    public boolean inscribirUsuarioEnEvento(int idUsuario, int idEvento) {
        String sqlInscripcion = "INSERT INTO inscripcion (idUsuario, idEvento) VALUES (?, ?)";
        try (Connection con = this.getConnection();
             PreparedStatement ps = con.prepareStatement(sqlInscripcion)) {

            ps.setInt(1, idUsuario);
            ps.setInt(2, idEvento);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Retorna true si se afectaron filas, lo que indica éxito

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Retorna false si hubo un error
        }
    }
    public boolean desinscribirUsuarioDeEvento(int idUsuario, int idEvento) {
        String sql = "DELETE FROM inscripcion WHERE idUsuario = ? AND idEvento = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            stmt.setInt(2, idEvento);

            int filasAfectadas = stmt.executeUpdate();

            return filasAfectadas > 0;  // Devuelve true si se eliminó al menos una fila
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones
        }

        return false;
    }


}
