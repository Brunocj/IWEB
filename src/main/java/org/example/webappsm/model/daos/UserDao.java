package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Tipos;
import org.example.webappsm.model.beans.Urbanizacion;
import org.example.webappsm.model.beans.Usuario;

import java.io.IOException;
import java.sql.*;

import java.util.ArrayList;

public class UserDao extends BaseDao{

    public Usuario mostrarUsuarioID (int userid){
        Usuario usuario = new Usuario();
        String sql = "SELECT nombres AS Nombre, apellidos AS Apellido, correo AS Correo, nroDocumento AS Documento, contrasena AS contra,numeroContacto AS NumeroTelefonico FROM Usuario WHERE idUsuario = ?";
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
                usuario.setContrasena(rs.getString("contra"));
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



    public Incidencia getIncidenciaId(int idIncidencia){
        Incidencia incidencia = new Incidencia();
        String sql = "SELECT " +
                "smi.*, urb.nombreUrbanizacion AS urbanizacion " +
                "FROM " +
                "sanmiguel.incidencia smi " +
                "JOIN " +
                "sanmiguel.urbanizacion urb ON urb.idUrbanizacion = smi.idUrbanizacion " +
                "WHERE " +
                "smi.idIncidencia = ?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, idIncidencia);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    incidencia.setIdIncidencia(rs.getInt("idIncidencia"));
                    incidencia.setNombre(rs.getString("nombre"));
                    incidencia.setLugar(rs.getString("lugar"));
                    incidencia.setUrbanizacion(rs.getString("urbanizacion"));
                    incidencia.setContactoO(rs.getString("contacto"));
                    incidencia.setReferencia(rs.getString("referencia"));
                    incidencia.setAmbulanciaI(rs.getBoolean("solicitudAmbulanciaReg"));
                    incidencia.setImgEvidencia(this.readImagenes(rs.getBinaryStream("evidencia")));
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        } catch (SQLException e){
            throw new RuntimeException(e);
        }

        return incidencia;
    }

    public void agregarIncidencia (Incidencia incidencia){
        String sql = "INSERT INTO incidencia (" +
                "nombre, lugar, idUrbanizacion, contacto, referencia, solicitudAmbulanciaReg, evidencia, fecha, idUsuario, idEstado, idTipoIncidencia" +
                ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,incidencia.getNombre());
            pstmt.setString(2,incidencia.getLugar());
            pstmt.setInt(3,incidencia.getIdUrbanizacion());
            if(incidencia.getContactoO()  != null && incidencia.getContactoO().trim().isEmpty()){

                pstmt.setString(4, null);
            } else {
                pstmt.setString(4, incidencia.getContactoO());

            }
            pstmt.setString(5, incidencia.getReferencia());
            pstmt.setBoolean(6,incidencia.isAmbulanciaI());
            pstmt.setBytes(7, incidencia.getImgEvidencia());
            pstmt.setTimestamp(8, incidencia.getFechaIncidencia());
            pstmt.setInt(9, incidencia.getIdUsuario());
            pstmt.setInt(10, incidencia.getIdTipo());
            pstmt.executeUpdate();
        } catch (SQLException e){
            throw new RuntimeException(e);
        }


    }
    public ArrayList<Urbanizacion> listarUrbanizaciones(){
        ArrayList<Urbanizacion> listaUrb = new ArrayList<>();
        String sql = "SELECT * FROM urbanizacion;";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()){
                Urbanizacion urb = new Urbanizacion();
                urb.setIdUrbanizacion(rs.getInt(1));
                urb.setNombreUrbanizacion(rs.getString(2));
                listaUrb.add(urb);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaUrb;
    }
    public ArrayList<Tipos> listarTiposIncidencias(){
        ArrayList<Tipos> tiposIncidencias = new ArrayList<>();
        String sql = "SELECT * FROM tipoincidencia;";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()){
                Tipos tipo = new Tipos();
                tipo.setIdTipo(rs.getInt(1));
                tipo.setNombreTipo(rs.getString(2));
                tiposIncidencias.add(tipo);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return tiposIncidencias;
    }

}
