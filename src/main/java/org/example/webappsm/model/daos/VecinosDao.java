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

        String sql = "SELECT u.idUsuario, u.nombres, u.apellidos, e.nombreEstado AS estado " +
                "FROM Usuario u " +
                "JOIN Estado e ON u.Estado_idEstado = e.idEstado " +
                "WHERE e.nombreEstado = 'pendiente'";

        try (Connection conn = this.getConnection();
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

        try (Connection conn = this.getConnection();
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
                    evento.setFechaYHora(rs.getTimestamp("fechaYHora"));
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
                    evento.setFechaYHora(rs.getTimestamp("fechaYHora"));
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
                    evento.setFechaYHora(rs.getTimestamp("fechaYHora"));
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


    public ArrayList<Usuario> listarVecinos(){

        ArrayList<Usuario> listaVecinos = new ArrayList<>();

        String sql = "SELECT u.idUsuario, u.nombres, u.apellidos, u.correo, u.falsasAlarmas, u.baneado, e.nombreEstado AS estado " +
                "FROM Usuario u " +
                "JOIN Estado e ON u.Estado_idEstado = e.idEstado " +
                "WHERE e.nombreEstado = 'aceptado'";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Usuario usuario = new Usuario();

                usuario.setId(rs.getInt("idUsuario"));
                usuario.setNombre(rs.getString("nombres"));
                usuario.setApellido(rs.getString("apellidos"));
                usuario.setCorreoE(rs.getString("correo"));
                usuario.setFalsasAlarmas(rs.getInt("falsasAlarmas"));
                usuario.setBaneado(rs.getBoolean("baneado"));

                listaVecinos.add(usuario);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaVecinos;
    }

    public void banearVecino(int idVecino){

        String query = "UPDATE Usuario\n" +
                "SET baneado = 1\n" +
                "WHERE idUsuario = ?;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){

            pstmt.setInt(1,idVecino);
            pstmt.executeUpdate();

        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public Usuario obtenerUsuarioPorId(int id) {
        Usuario usuario = null;


        String sql = "SELECT * FROM Usuario WHERE idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setId(id);
                    usuario.setNombre(rs.getString("nombres"));
                    usuario.setApellido(rs.getString("apellidos"));
                    usuario.setDocumento(rs.getString("nroDocumento"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setNumContacto(rs.getString("numeroContacto"));
                    usuario.setFalsasAlarmas(rs.getInt("falsasAlarmas"));
                    usuario.setDistrito(rs.getString("distrito"));
                    usuario.setUrbanizacion(rs.getString("urbanización"));
                    usuario.setCorreoE(rs.getString("correo"));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
    public Usuario obtenerSolCoordiPorId(int id) {
        Usuario usuario = null;

        String sql = "SELECT s.idUsuario, s.nombres, s.apellidos, s.nroDocumento, s.direccion, s.numeroContacto, s.falsasAlarmas, " +
                "s.distrito, s.urbanización, s.correo, " +
                "(SELECT a.nombreArea FROM Area a WHERE a.idArea = " +
                "(SELECT sc.idArea " +
                "FROM solicitudCoordinador sc " +
                "WHERE sc.idUsuario = s.idUsuario)) AS area " +
                "FROM Usuario s " +
                "WHERE s.idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setNombre(rs.getString("nombres"));
                    usuario.setApellido(rs.getString("apellidos"));
                    usuario.setDocumento(rs.getString("nroDocumento"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setNumContacto(rs.getString("numeroContacto"));
                    usuario.setFalsasAlarmas(rs.getInt("falsasAlarmas"));
                    usuario.setDistrito(rs.getString("distrito"));
                    usuario.setUrbanizacion(rs.getString("urbanización"));
                    usuario.setCorreoE(rs.getString("correo"));
                    usuario.setArea(rs.getString("area"));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
    public void borrar_vecino(int id_usuario, int opcion_boton){



        if (opcion_boton == 1){
            String query="";
        } else if (opcion_boton == 2){
            String query="";
        }

        String query = "DELETE FROM Usuario";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){


        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void  eliminarUsuarioPorId(int idUsuario) {

        try (Connection conn = this.getConnection()) {
            //Para este caso particular de eliminar empleados, al existir la posibilidad de que algunos empleados
            //sean manager, debemos "quitarlos" de ese cargo antes de eliminarlos de la tabla empleados.
            //Es por eso que primero se actualiza todos los empleados que hayan tenido de manager al empleado que
            //será eliminado, mostrarán el valor de "Sin Jefe".
            String updIncidencias = "DELETE FROM incidencia WHERE idUsuario = ?";
            try (PreparedStatement pstmtUpdEmployees = conn.prepareStatement(updIncidencias);) {
                pstmtUpdEmployees.setInt(1,idUsuario );
                pstmtUpdEmployees.executeUpdate();
            }
            // Ahora, quitamos el valor de manager para el departamento al cual pertenecía
            String updSol = "DELETE FROM solicitudcoordinador WHERE idUsuario = ?";
            try (PreparedStatement pstmtUpdDepartments = conn.prepareStatement(updSol);) {
                pstmtUpdDepartments.setInt(1, idUsuario);
                pstmtUpdDepartments.executeUpdate();
            }

            String sql = "DELETE FROM Usuario WHERE idUsuario = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql);) {

                pstmt.setInt(1, idUsuario);
                pstmt.executeUpdate();
            }
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void editarEstadoAprobado(int idUsuario){
        int idAprobado = 2;
        String query = "UPDATE Usuario AS U " +
                "SET U.Estado_idEstado = ? " +
                "WHERE U.idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idAprobado);
            pstmt.setInt(2, idUsuario);


            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void editarRol(int idUsuario, int idArea){
        int idNuevoRol = 4;
        int idEstado = 1;

        try (Connection conn = this.getConnection()){
            String queryRol = "UPDATE Usuario AS U " +
                    "SET U.idRol = ?, U.idArea = ? " +
                    "WHERE U.idUsuario = ?";
            try (PreparedStatement pstmtRol = conn.prepareStatement(queryRol);) {
                pstmtRol.setInt(1,idNuevoRol);
                pstmtRol.setInt(2,idArea );
                pstmtRol.setInt(3,idUsuario );
                pstmtRol.executeUpdate();
            }
            String queryEstado = "UPDATE solicitudCoordinador SET estado = ? WHERE idUsuario = ?";
            try (PreparedStatement pstmtEstado = conn.prepareStatement(queryEstado);) {
                pstmtEstado.setInt(1,idEstado);
                pstmtEstado.setInt(2,idUsuario );
                pstmtEstado.executeUpdate();
            }
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void  eliminarSolicitud(int idUsuario) {

        String sql = "DELETE FROM solicitudcoordinador WHERE idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, idUsuario);
            pstmt.executeUpdate();


        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }






}
