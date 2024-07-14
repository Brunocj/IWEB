package org.example.webappsm.model.daos;

import lombok.Data;
import org.example.webappsm.model.beans.Evento;
import org.example.webappsm.model.beans.Material;
import org.example.webappsm.model.beans.Profesor;
import org.example.webappsm.model.beans.Usuario;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class CoordinadorDao extends BaseDao {

    public ArrayList<Evento> listarEventosCreados(int idCoordinador) {
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT *" +
                " FROM evento" +
                " WHERE idCoordinador = ? AND idEstadoEvento = 1" +
                " ORDER BY fecha ASC, hora ASC;";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idCoordinador);

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
                    evento.setImagenes(rs.getBytes("imagenes"));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(rs.getBytes("ingreso"));
                    evento.setSalida(rs.getBytes("salida"));
                    evento.setIdProfesor(rs.getInt("idProfesor"));
                    evento.setIdCoordinador(rs.getInt("idCoordinador"));
                    evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                    evento.setIdArea(rs.getInt("idArea"));
                    evento.setResumen(rs.getString("resumen"));

                    listaEventos.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventos;
    }

    public int registrarEvento(Evento evento) {
        String sql = "INSERT INTO evento " +
                "(titulo, descripcion, fecha, hora, ubicacion, recurrencia, imagenes, vacantes, ingreso, salida, idProfesor, idCoordinador, idEstadoEvento, idArea, resumen, horaFin) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

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

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                throw new SQLException("No se pudo obtener el id del evento insertado.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void registrarSalida(int idEvento, byte[] salida) {
        String sql = "UPDATE evento SET salida = ? WHERE idEvento = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setBytes(1, salida);
            stmt.setInt(2, idEvento);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void registroNotas(byte[] img1, byte[] img2, int idEvento, String nota) {
        String sqlInsertFotos = "INSERT INTO fotos_eventos (fotoEvento, evento_idEvento) VALUES (?, ?), (?, ?)";
        String sqlUpdateResumen = "UPDATE evento SET resumen = ? WHERE idEvento = ?";
        String sqlUpdateEstado = "UPDATE evento SET idEstadoEvento = 4 WHERE idEvento = ?";

        try (Connection conn = this.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement stmtInsertFotos = conn.prepareStatement(sqlInsertFotos);
                 PreparedStatement stmtUpdateResumen = conn.prepareStatement(sqlUpdateResumen);
                 PreparedStatement stmtUpdateEstado = conn.prepareStatement(sqlUpdateEstado)) {

                stmtInsertFotos.setBytes(1, img1);
                stmtInsertFotos.setInt(2, idEvento);
                stmtInsertFotos.setBytes(3, img2);
                stmtInsertFotos.setInt(4, idEvento);
                stmtInsertFotos.executeUpdate();

                stmtUpdateResumen.setString(1, nota);
                stmtUpdateResumen.setInt(2, idEvento);
                stmtUpdateResumen.executeUpdate();

                stmtUpdateEstado.setInt(1, idEvento);
                stmtUpdateEstado.executeUpdate();

                conn.commit();

            } catch (SQLException e) {
                conn.rollback();
                throw new RuntimeException(e);
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void registrarMaterial(int idEvento, String material) {
        String sql = "INSERT INTO materiales (idEvento, material) VALUES (?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEvento);
            stmt.setString(2, material);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
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
            stmt.setInt(17, evento.getIdEvento());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
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
        String sql = "SELECT * FROM evento WHERE idEvento = ?";

        try (Connection conn = this.getConnection();
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
        return listaMateriales;
    }

    public ArrayList<Profesor> listarProfesoresTablaDisponibilidad(Date fechaEvento, Time horaEvento, Time horaEvento2, int idArea) {
        ArrayList<Profesor> listaProfesores = new ArrayList<>();
        String sql = "SELECT *, ? AS Disponibilidad FROM profesor WHERE idArea = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            if (fechaEvento == null || horaEvento == null || horaEvento2 == null) {
                pstmt.setInt(1, 3);
            } else {
                pstmt.setInt(1, -1);
            }

            pstmt.setInt(2, idArea);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Profesor profesor = new Profesor();
                    profesor.setIdProfesor(rs.getInt("idProfesor"));
                    profesor.setApellido(rs.getString("apellidos"));
                    profesor.setNombre(rs.getString("nombres"));
                    profesor.setCurso(rs.getString("curso"));

                    String nombreArea = obtenerNombreAreaPorId(rs.getInt("idArea"));
                    profesor.setNombreArea(nombreArea);

                    int disponibilidad;
                    if (fechaEvento == null || horaEvento == null || horaEvento2 == null) {
                        disponibilidad = 3;
                    } else {
                        disponibilidad = determinarDisponibilidad(rs.getInt("idProfesor"), fechaEvento, horaEvento, horaEvento2);
                    }
                    profesor.setDisponibilidad(disponibilidad);

                    listaProfesores.add(profesor);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaProfesores;
    }

    public int determinarDisponibilidad(int idProfesor, Date fechaEvento, Time horaEvento, Time horaEvento2) {
        String sql = "SELECT " +
                "CASE " +
                "    WHEN COUNT(CASE WHEN resultado = 0 THEN 1 END) > 0 THEN 0 " +
                "    ELSE 1 " +
                "END AS final_result " +
                "FROM (" +
                "    SELECT " +
                "        COALESCE(dp.idProfesor, ?) AS idProfesor, " +
                "        CASE " +
                "            WHEN dp.idProfesor IS NULL THEN 1 " +
                "            WHEN dp.fecha = ? THEN " +
                "                CASE " +
                "                    WHEN ? BETWEEN dp.horaInicio AND dp.horaFin OR ? BETWEEN dp.horaInicio AND dp.horaFin THEN 0 " +
                "                    ELSE 1 " +
                "                END " +
                "            ELSE 1 " +
                "        END AS resultado " +
                "    FROM " +
                "        (SELECT * FROM disponibilidadprofe WHERE idProfesor = ?) dp " +
                "    RIGHT JOIN " +
                "        (SELECT ? AS idProfesor) temp ON temp.idProfesor = dp.idProfesor " +
                ") subquery;";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfesor);
            stmt.setDate(2, fechaEvento);
            stmt.setTime(3, horaEvento);
            stmt.setTime(4, horaEvento2);
            stmt.setInt(5, idProfesor);
            stmt.setInt(6, idProfesor);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("final_result");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    public String obtenerNombreAreaPorId(int idArea) {
        String nombreArea = null;
        String sql = "SELECT nombreArea FROM area WHERE idArea = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idArea);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nombreArea = rs.getString("nombreArea");
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return nombreArea;
    }

    public String obtenerNombreCompletoPorId(int idProfesor) {
        String nombreCompleto = null;
        String sql = "SELECT nombres, apellidos FROM profesor WHERE idProfesor = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idProfesor);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String nombre = rs.getString("nombres");
                    String apellido = rs.getString("apellidos");
                    nombreCompleto = nombre + " " + apellido;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return nombreCompleto;
    }

    public void eliminarEvento(int idEvento) {
        String deleteQuery1 = "DELETE FROM inscripcion WHERE idEvento = ?";
        String deleteQuery2 = "DELETE FROM evento WHERE idEvento = ?";

        try (Connection conn = this.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement deleteStmt1 = conn.prepareStatement(deleteQuery1);
                 PreparedStatement deleteStmt2 = conn.prepareStatement(deleteQuery2)) {

                deleteStmt1.setInt(1, idEvento);
                deleteStmt1.executeUpdate();

                deleteStmt2.setInt(1, idEvento);
                deleteStmt2.executeUpdate();

                conn.commit();

            } catch (SQLException e) {
                conn.rollback();
                throw new RuntimeException(e);
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void eliminarInscrito(int idUsuario_elim, int idEvento_elim) {
        String deleteQuery = "DELETE FROM inscripcion WHERE idUsuario = ? AND idEvento = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery)) {

            deleteStmt.setInt(1, idUsuario_elim);
            deleteStmt.setInt(2, idEvento_elim);
            deleteStmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Usuario> listarInscritos(int idEvento) {
        ArrayList<Usuario> listarInscrito = new ArrayList<>();
        String sql = "SELECT u.* FROM usuario u JOIN inscripcion i ON u.idUsuario = i.idUsuario WHERE i.idEvento = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEvento);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setNombre(rs.getString("nombres"));
                    usuario.setApellido(rs.getString("apellidos"));
                    usuario.setId(rs.getInt("idUsuario"));
                    listarInscrito.add(usuario);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listarInscrito;
    }

    public int obtenerCantidadInscripciones(int idEvento) {
        int cantidad = 0;
        String sql = "SELECT COUNT(*) AS cantidad FROM inscripcion WHERE idEvento = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idEvento);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cantidad = rs.getInt("cantidad");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cantidad;
    }

    public ArrayList<Evento> listarEventosNota(int idCoordinador) {
        ArrayList<Evento> listaEventosNotas = new ArrayList<>();
        String sql = "SELECT e.* " +
                "FROM evento e " +
                "LEFT JOIN inscripcion i ON e.idEvento = i.idEvento AND i.idUsuario = ? " +
                "WHERE i.idUsuario IS NULL AND e.idEstadoEvento = 3 " +
                "ORDER BY fecha ASC, hora ASC;";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idCoordinador);

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
                    evento.setImagenes(rs.getBytes("imagenes"));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(rs.getBytes("ingreso"));
                    evento.setSalida(rs.getBytes("salida"));
                    evento.setIdProfesor(rs.getInt("idProfesor"));
                    evento.setIdCoordinador(rs.getInt("idCoordinador"));
                    evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                    evento.setIdArea(rs.getInt("idArea"));
                    evento.setResumen(rs.getString("resumen"));

                    listaEventosNotas.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosNotas;
    }
}
