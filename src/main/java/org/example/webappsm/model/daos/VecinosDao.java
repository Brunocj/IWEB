package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class VecinosDao extends BaseDao{
    public ArrayList<Usuario> listarSoliAcceso(){
        ArrayList<Usuario> listaSoli = new ArrayList<>();


        String sql = "SELECT u.idUsuario, u.nombres, u.apellidos, e.nombreEstado AS estado " +
                "FROM Usuario u " +
                "JOIN Estado e ON u.Estado_idEstado = e.idEstado " +
                "WHERE u.Estado_idEstado = 1";

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


    public Usuario obtenerUsuarioPorId(int id) {
        Usuario usuario = null;


        String sql = "SELECT * FROM Usuario WHERE idUsuario = ?";

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

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
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
    public void aprobarSol(int idUsuario){

        String query = "DELETE FROM Usuario WHERE idUsuario = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idUsuario);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
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




}
