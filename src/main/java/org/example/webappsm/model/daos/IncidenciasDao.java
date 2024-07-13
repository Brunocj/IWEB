package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.TipoSerenazgo;
import org.example.webappsm.model.beans.Usuario;
import org.example.webappsm.model.daos.UserDao;

import java.sql.*;
import java.util.ArrayList;

public class IncidenciasDao extends BaseDao{

    public ArrayList<Incidencia> listarIncidenciasPasadas(){

        ArrayList<Incidencia> listaIncidenciasPasadas = new ArrayList<>();


        String sql = "SELECT \n" +
                "    i.idIncidencia, \n" +
                "    i.nombre, \n" +
                "    i.idTipoSerenazgo,\n" +
                "    c.nombreClasificacion\n" +
                "FROM \n" +
                "    incidencia i\n" +
                "JOIN \n" +
                "    estadoincidencia e ON i.idEstado = e.idEstado\n" +
                "JOIN \n" +
                "   clasificacin c ON i.idClasificacin = c.idClasificacin\n" +
                "WHERE \n" +
                "i.idEstado=3;";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Incidencia incidencia = new Incidencia();

                incidencia.setIdIncidencia(rs.getInt("idIncidencia"));
                incidencia.setNombre(rs.getString("nombre"));
                incidencia.setClasificacion(rs.getString("nombreClasificacion"));
                incidencia.setIdTipoSerenazgo(rs.getInt("idTipoSerenazgo"));

                listaIncidenciasPasadas.add(incidencia);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidenciasPasadas;
    }

    public ArrayList<Incidencia> listarIncidencias(){

        ArrayList<Incidencia> listaIncidencias = new ArrayList<>();

        String sql = "SELECT \n" +
                "    i.idIncidencia,\n" +
                "    e.nombreEstado,\n" +
                "    c.nombreClasificacion,\n" +
                "    CONCAT(u.apellidos, ', ', u.nombres) AS nombreCompleto,\n" +
                "    i.idUsuario\n," +
                "    i.fecha,\n" +
                "    i.idTipoSerenazgo,\n" +
                "    i.personalAmbulancia,\n" +
                "    i.motivoAmbulancia,\n" +
                "    i.motivoPolicia,\n" +
                "    i.idComisaria\n" +
                "FROM \n" +
                "    incidencia i\n" +
                "JOIN \n" +
                "    estadoincidencia e ON i.idEstado = e.idEstado\n" +
                "LEFT JOIN \n" +
                "    clasificacin c ON i.idClasificacin = c.idClasificacin\n" +
                "JOIN \n" +
                "    usuario u ON i.idUsuario = u.idUsuario\n" +
                "WHERE \n" +
                "    i.idEstado IN (1, 2);";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Incidencia incidencia = new Incidencia();


                incidencia.setIdIncidencia(rs.getInt("idIncidencia"));
                incidencia.setEstado(rs.getString("nombreEstado"));
                incidencia.setClasificacion(rs.getString("nombreClasificacion"));
                incidencia.setNombreUsuarioIncidencia(rs.getString("nombreCompleto"));
                incidencia.setIdUsuario(rs.getInt("idUsuario"));
                incidencia.setFechaIncidencia(rs.getTimestamp("fecha"));
                incidencia.setIdTipoSerenazgo(rs.getInt("idTipoSerenazgo"));
                incidencia.setPersonalAmbulancia(rs.getString("personalAmbulancia"));
                incidencia.setMotivoAmbulancia(rs.getString("motivoAmbulancia"));
                incidencia.setMotivoPolicia(rs.getString("motivoPolicia"));
                incidencia.setIdComisaria(rs.getInt("idComisaria"));
                incidencia.setClasificacion(rs.getString("nombreClasificacion"));
                listaIncidencias.add(incidencia);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencias;
    }




    public Incidencia descripcion(int idIncidencia) {

        Incidencia incidencia = new Incidencia();

        String sql = "SELECT idIncidencia,nombre,lugar,descripcion,idTipoSerenazgo,contacto,evidencia,fecha FROM sanmiguel.incidencia WHERE idIncidencia=?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    incidencia.setIdIncidencia(idIncidencia);

                    incidencia.setNombre(rs.getString(2));
                    incidencia.setLugar(rs.getString(3));
                    incidencia.setDescripcion(rs.getString(4));
                    incidencia.setIdTipoSerenazgo(rs.getInt(5));
                    incidencia.setContactoO(rs.getString(6));
                    incidencia.setImgEvidencia(rs.getBytes(7));
                    incidencia.setFechaIncidencia(rs.getTimestamp(8));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidencia;
    }





    public void eliminarIncidenciaPasada(int idIncidenciaPas){

        String query = "DELETE FROM incidencia WHERE idEstado = 3 AND idIncidencia = ?;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){

            pstmt.setInt(1, idIncidenciaPas);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public Incidencia obtenerIncidenciaPorId(int idIncidencia){
        Incidencia incidencia = new Incidencia();

        String query = "SELECT * FROM incidencia WHERE idIncidencia = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idIncidencia);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                incidencia.setIdIncidencia(idIncidencia);
                incidencia.setNombre(rs.getString("nombre"));
                incidencia.setIdTipo(rs.getInt("idTipoIncidencia"));
                incidencia.setLugar(rs.getString("lugar"));
                incidencia.setIdTipoSerenazgo(rs.getInt("idTipoSerenazgo"));
                incidencia.setPersonalAmbulancia(rs.getString("personalAmbulancia"));
                incidencia.setMotivoAmbulancia(rs.getString("motivoAmbulancia"));
                incidencia.setMotivoPolicia(rs.getString("motivoPolicia"));
                incidencia.setIdComisaria(rs.getInt("idComisaria"));
                incidencia.setBomberoI(rs.getBoolean("NecesitaBombero"));
                incidencia.setDescripcion(rs.getString("descripcion"));
                String clasif = "";
                if(rs.getInt("idClasificacin") == 1){
                    clasif = "Leve";
                }else if(rs.getInt("idClasificacin") == 2){
                    clasif = "Moderada";
                }else if(rs.getInt("idClasificacin") == 3){
                    clasif = "Grave";
                }
                incidencia.setClasificacion(clasif);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return incidencia;
    }

    public void actualizarClasificacion(int categoriaId,int id){

        String query = "UPDATE Incidencia AS i " +
                "SET idClasificacin = ? " +
                "WHERE i.idIncidencia = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, categoriaId);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void finalizarIncidencia(int id){
        int idFinalizar = 3;
        String query = "UPDATE Incidencia AS i " +
                "SET i.idEstado = ? " +
                "WHERE i.idIncidencia = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idFinalizar);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void incidenciaEnProceso(int id){
        int idEnProceso = 2;
        String query = "UPDATE Incidencia AS i " +
                "SET i.idEstado = ? " +
                "WHERE i.idIncidencia = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idEnProceso);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void declararFalsaAlarma(int id, int idUser){
        int idFalsaAlarma = 4;
        UserDao userDao = new UserDao();
        try (Connection conn = this.getConnection()) {
            String queryUpd = "UPDATE Incidencia AS i " +
                    "SET idEstado = ? " +
                    "WHERE i.idIncidencia = ?";

            try (PreparedStatement pstmt = conn.prepareStatement(queryUpd)){
                    pstmt.setInt(1, idFalsaAlarma);
                    pstmt.setInt(2, id);
                    pstmt.executeUpdate();
                }
            String queryUpdUser = "UPDATE Usuario AS u " +
                "SET falsasAlarmas = ? " +
                "WHERE u.idUsuario = ?";

            try (PreparedStatement pstmt = conn.prepareStatement(queryUpdUser)) {
                Usuario usuario = userDao.mostrarUsuarioID(idUser);
                int falsasAlarmas = usuario.getFalsasAlarmas();
                int newFalsasAlarmas = falsasAlarmas + 1;
                pstmt.setInt(1, newFalsasAlarmas);
                pstmt.setInt(2, idUser);
                pstmt.executeUpdate();
            }
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ArrayList<TipoSerenazgo> listarTipos(){
        ArrayList<TipoSerenazgo> listaTipos = new ArrayList<>();

        String sql = "SELECT * from Tiposerenazgo";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                TipoSerenazgo tipo = new TipoSerenazgo();

                tipo.setIdTipoSerenazgo(rs.getInt("idTipoSerenazgo"));
                tipo.setNombreTipo(rs.getString("nombreTipo"));
                listaTipos.add(tipo);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaTipos;
    }









}
