package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Usuario;
import java.sql.*;

import java.util.ArrayList;

public class UserDao extends BaseDao{

    public Usuario mostrarUsuarioID (int userid){
        Usuario usuario = new Usuario();
        String sql = "SELECT nombres AS Nombre, apellidos AS Apellido, correo AS Correo, nroDocumento AS Documento, numeroContacto AS NumeroTelefonico FROM Usuario WHERE idUsuario = ?";
        try(Connection conn = this.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ){
            stmt.setInt(1, userid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setNombre(rs.getString("Nombre"));
                usuario.setApellido(rs.getString("Apellido"));
                usuario.setCorreoE(rs.getString("Correo"));
                usuario.setDocumento(rs.getString("Documento"));
                usuario.setNumContacto(rs.getString("NumeroTelefonico"));
            }

        } catch (SQLException e) {
        throw new RuntimeException(e);
        }

        return usuario;
    }


    public void enviarSolicitud(int idUsuario, int idArea){
        String sql = "INSERT INTO SolicitudCoordinador (idUsuario, idArea, estado) VALUES (?, ?, 0)";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            stmt.setInt(2, idArea);

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Incidencia> listarIncidencias(){
        ArrayList<Incidencia> listaIncidencias = new ArrayList<>();
        String sql = "SELECT " +
                "i.idIncidencia, " +
                "i.nombre, " +
                "DATE(i.fecha) AS fecha, " +
                "e.nombreEstado AS estado " +
                "FROM " +
                "incidencia i " +
                "JOIN " +
                "estado e ON i.idEstado = e.idEstado; ";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
        ){


            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencia(rs.getInt("idIncidencia"));
                incidencia.setNombre(rs.getString("nombre"));
                incidencia.setFechaIncidencia(rs.getTimestamp("fecha"));
                incidencia.setEstado(rs.getString("estado"));
                listaIncidencias.add(incidencia);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return  listaIncidencias;
    }
}
