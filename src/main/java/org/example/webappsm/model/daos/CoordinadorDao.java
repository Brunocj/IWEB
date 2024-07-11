package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Evento;
import org.example.webappsm.model.beans.Material;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class CoordinadorDao extends BaseDao {
    public ArrayList<Evento> listarEventosCreados(int idCoordinador) {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = " SELECT *" +
                " FROM evento" +
                " WHERE idCoordinador = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Configurar el parámetro para el PreparedStatement
            stmt.setInt(1, idCoordinador);

            // Ejecutar la consulta
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Evento evento = new Evento();
                    evento.setIdEvento(rs.getInt("idEvento"));
                    evento.setTitulo(rs.getString("titulo"));
                    evento.setDescripcion(rs.getString("descripcion"));
                    evento.setFecha(rs.getDate("fecha"));
                    evento.setHora(rs.getTime("hora"));
                    evento.setHoraFin(rs.getTime("horaFin"));
                    evento.setUbicacion(rs.getString("ubicacion"));
                    evento.setRecurrencia(rs.getInt("recurrencia"));
                    evento.setImagenes(this.readImagenes(rs.getBinaryStream("imagenes")));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(this.readImagenes(rs.getBinaryStream("ingreso")));
                    evento.setSalida(this.readImagenes(rs.getBinaryStream("salida")));
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

    public int registrarEvento(Evento evento) {
        String sql = "INSERT INTO evento " +
                "(titulo, descripcion, fecha,hora, ubicacion, recurrencia, imagenes, vacantes, ingreso, salida, idProfesor, idCoordinador, idEstadoEvento, idArea, resumen,horaFin) " +
                "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)) {

            // Establecer los parámetros del PreparedStatement
            stmt.setString(1, evento.getTitulo());
            stmt.setString(2, evento.getDescripcion());
            stmt.setDate(3, new java.sql.Date(evento.getFecha().getTime()));
            stmt.setTime(4,  evento.getHora() );
            stmt.setString(5, evento.getUbicacion());
            stmt.setInt(6, evento.getRecurrencia());
            stmt.setBytes(7, evento.getImagenes());
            stmt.setInt(8, evento.getVacantes());
            stmt.setBytes(9, evento.getIngreso());
            stmt.setBytes(10, evento.getSalida());
            stmt.setInt(11, evento.getIdProfesor());
            stmt.setInt(12, evento.getIdCoordinador());
            stmt.setInt(13, evento.getIdEstadoEvento());
            stmt.setInt(14, evento.getIdArea());
            stmt.setString(15, evento.getResumen());
            stmt.setTime(16,  evento.getHoraFin() );
                // Ejecutar la consulta
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Retorna el idEvento generado
            } else {
                throw new SQLException("No se pudo obtener el id del evento insertado.");
            }
            }    catch (SQLException e) {
            throw new RuntimeException(e);
            }

    }

        public void registrarMaterial(int idEvento, String material) {
            String sql = "INSERT INTO materiales " +
                    "(idEvento, material) " +
                    "VALUES (?,?)";

            try (Connection conn = this.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                // Establecer los parámetros del PreparedStatement
                stmt.setInt(1, idEvento);
                stmt.setString(2,material);
                // Ejecutar la consulta
                stmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException("Error al insertar el evento en la base de datos", e);

            }

        }
    public void actualizarEvento(Evento evento) {
        String sql = "UPDATE evento SET " +
                "titulo = ?, descripcion = ?, fecha = ?, hora = ?, ubicacion = ?, recurrencia = ?, " +
                "imagenes = ?, vacantes = ?, ingreso = ?, salida = ?, idProfesor = ?, " +
                "idCoordinador = ?, idEstadoEvento = ?, idArea = ?, resumen = ?, horaFin = ? " +
                "WHERE idEvento = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Establecer los parámetros del PreparedStatement
            stmt.setString(1, evento.getTitulo());
            stmt.setString(2, evento.getDescripcion());
            stmt.setDate(3, new java.sql.Date(evento.getFecha().getTime()));
            stmt.setTime(4, evento.getHora());
            stmt.setString(5, evento.getUbicacion());
            stmt.setInt(6, evento.getRecurrencia());
            stmt.setBytes(7, evento.getImagenes());
            stmt.setInt(8, evento.getVacantes());
            stmt.setBytes(9, evento.getIngreso());
            stmt.setBytes(10, evento.getSalida());
            stmt.setInt(11, evento.getIdProfesor());
            stmt.setInt(12, evento.getIdCoordinador());
            stmt.setInt(13, evento.getIdEstadoEvento());
            stmt.setInt(14, evento.getIdArea());
            stmt.setString(15, evento.getResumen());
            stmt.setTime(16, evento.getHoraFin());
            stmt.setInt(17, evento.getIdEvento()); // Asegúrate de tener el id del evento para actualizar

            // Ejecutar la consulta
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el evento en la base de datos", e);
        }
    }

    public void eliminarMaterial(int idEvento, String material) {
        String sql = "DELETE FROM materiales WHERE idEvento = ? AND material = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEvento);
            stmt.setString(2, material);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Evento obtenerEventoPorId(int id) {
        Evento evento = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT idEvento,titulo,descripcion,fecha,hora,ubicacion,recurrencia,imagenes,vacantes,ingreso,salida,idProfesor,idCoordinador,idEstadoEvento,idArea,resumen,horaFin FROM evento WHERE idEvento = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

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
                    evento.setImagenes(rs.getBytes("imagenes"));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(rs.getBytes("ingreso"));
                    evento.setIngreso(rs.getBytes("salida"));
                    evento.setIdProfesor(rs.getInt("idProfesor"));
                    evento.setIdCoordinador(rs.getInt("idCoordinador"));
                    evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                    evento.setIdArea(rs.getInt("idArea"));
                    evento.setResumen(rs.getString("resumen"));
                    evento.setHoraFin(rs.getTime("horaFin"));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return evento;
    }
    public ArrayList<String> obtenerNombresMaterialesPorIdEvento(int idEvento) {
        ArrayList<String> listaMateriales = new ArrayList<>();
        String sql = "SELECT material FROM materiales WHERE idEvento = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEvento);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    listaMateriales.add(rs.getString("material"));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Lista de materiales: " + listaMateriales);
        return listaMateriales;
    }




}
