package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Evento;

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
                    evento.setFechaYHora(rs.getTimestamp("fechaYHora"));
                    evento.setUbicacion(rs.getString("ubicacion"));
                    evento.setRecurrencia(rs.getInt("recurrencia"));
                    evento.setImagenes(readImagenes(rs.getBinaryStream("imagenes")));
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

    public boolean registrarEvento(Evento evento) {
        String sql = "INSERT INTO evento " +
                "(titulo, descripcion, fechaYHora, ubicacion, recurrencia, imagenes, vacantes, ingreso, salida, idProfesor, idCoordinador, idEstadoEvento, idArea, resumen) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Establecer los parámetros del PreparedStatement
            stmt.setString(1, evento.getTitulo());
            stmt.setString(2, evento.getDescripcion());
            stmt.setTimestamp(3, new Timestamp(evento.getFechaYHora().getTime()));
            stmt.setString(4, evento.getUbicacion());
            stmt.setInt(5, evento.getRecurrencia());
            stmt.setBytes(6, evento.getImagenes());
            stmt.setInt(7, evento.getVacantes());
            stmt.setTimestamp(8, new Timestamp(evento.getIngreso().getTime()));
            if (evento.getSalida() != null) {
                stmt.setTimestamp(9, new Timestamp(evento.getSalida().getTime()));
            } else {
                stmt.setNull(9, java.sql.Types.TIMESTAMP);
            }
            stmt.setInt(10, evento.getIdProfesor());
            stmt.setInt(11, evento.getIdCoordinador());
            stmt.setInt(12, evento.getIdEstadoEvento());
            stmt.setInt(13, evento.getIdArea());
            stmt.setString(14, evento.getResumen());

            // Ejecutar la consulta
            stmt.executeUpdate();
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Retorna true si se afectaron filas, lo que indica éxito

        } catch (SQLException e) {
            throw new RuntimeException("Error al insertar el evento en la base de datos", e);

        }

    }
    private byte[] readImagenes(InputStream is) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = is.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }

}
