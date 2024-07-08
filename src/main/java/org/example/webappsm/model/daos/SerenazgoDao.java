package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Serenazgo;
import org.example.webappsm.model.beans.TipoSerenazgo;
import org.example.webappsm.model.beans.Turno;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
public class SerenazgoDao extends BaseDao {
    public ArrayList<Serenazgo> listarSerenazgoTabla(){

        ArrayList<Serenazgo> listaSerenazgo = new ArrayList<>();

        String sql = "SELECT  s.idSerenazgo, s.nombre, s.apellido, ts.nombreTipo AS tipo, t.nombreTurno AS turno " +
                "FROM Serenazgo s " +
                "JOIN TipoSerenazgo ts ON s.idTipoSerenazgo = ts.idTipoSerenazgo " +
                "JOIN Turno t ON s.idTurno = t.idTurno";

        try (Connection conn= this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Serenazgo serenazgo = new Serenazgo();

                serenazgo.setIdSerenazgo(rs.getInt("idSerenazgo"));
                serenazgo.setNombre(rs.getString("nombre"));
                serenazgo.setApellido(rs.getString("apellido"));
                serenazgo.setTipo(rs.getString("tipo"));
                serenazgo.setTurno(rs.getString("Turno"));

                listaSerenazgo.add(serenazgo);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaSerenazgo;
    }
    public void agregarSerenazgo(Serenazgo serenazgo, Integer turnoId, Integer tipoId){

        String query = "INSERT INTO Serenazgo (nombre, apellido, dni, direccion, telefono, idTurno, idTipoSerenazgo, fNacimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){

            if (serenazgo.getDni() == null) {
                throw new IllegalArgumentException("El DNI/Carnet de extranjería del serenazgo no puede ser nulo!!!");
            }

            pstmt.setString(1,serenazgo.getNombre());
            pstmt.setString(2,serenazgo.getApellido());
            pstmt.setString(3,serenazgo.getDni());
            pstmt.setString(4,serenazgo.getDireccion());
            pstmt.setString(5,serenazgo.getTelefono());
            if (turnoId != null) {
                pstmt.setInt(6, turnoId);
            } else {
                pstmt.setNull(6, Types.INTEGER);
            }
            if (tipoId != null) {
                pstmt.setInt(7, tipoId);
            } else {
                pstmt.setNull(7, Types.INTEGER);
            }
            pstmt.setDate(8,new java.sql.Date(serenazgo.getFNacimiento().getTime()));
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void eliminarSerenazgo(int idSerenazgo){

        String query = "DELETE FROM Serenazgo WHERE idSerenazgo = ?";

        try (Connection conn= this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idSerenazgo);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public Serenazgo obtenerSerenazgoPorId(int idSerenazgo){

        Serenazgo serenazgo = new Serenazgo();

        String query = "SELECT s.idSerenazgo, s.nombre, s.apellido, s.dni, s.direccion, s.telefono, s.fNacimiento, " +
                "(SELECT ts.nombreTipo FROM Tiposerenazgo ts WHERE ts.idTipoSerenazgo = s.idTipoSerenazgo) AS tipo, " +
                "(SELECT t.nombreTurno FROM Turno t WHERE t.idTurno = s.idTurno) AS turno " +
                "FROM Serenazgo s " +
                "WHERE s.idSerenazgo = ?";

        try (Connection conn= this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idSerenazgo);
            ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    serenazgo.setIdSerenazgo(rs.getInt("idSerenazgo"));
                    serenazgo.setNombre(rs.getString("nombre"));
                    serenazgo.setApellido(rs.getString("apellido"));
                    serenazgo.setDni(rs.getString("dni"));
                    serenazgo.setDireccion(rs.getString("direccion"));
                    serenazgo.setTelefono(rs.getString("telefono"));
                    serenazgo.setTurno(rs.getString("Turno"));
                    serenazgo.setTipo(rs.getString("tipo"));
                    serenazgo.setFNacimiento(rs.getDate("fNacimiento"));
                }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return serenazgo;
    }
    public void editarSerenazgo(Serenazgo serenazgo, Integer turnoId, Integer tipoId){

        String query = "UPDATE Serenazgo AS S " +
                "SET S.nombre = ?, " +
                "    S.apellido = ?, " +
                "    S.dni = ?, " +
                "    S.direccion = ?, " +
                "    S.telefono = ?, " +
                "    S.idTurno = ?, " +
                "    S.idTipoSerenazgo = ?, " +
                "    S.fNacimiento = ? " +
                "WHERE S.idSerenazgo = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setString(1, serenazgo.getNombre());
            pstmt.setString(2, serenazgo.getApellido());
            pstmt.setString(3, serenazgo.getDni());
            pstmt.setString(4, serenazgo.getDireccion());
            pstmt.setString(5, serenazgo.getTelefono());

            if (turnoId != null) {
                pstmt.setInt(6, turnoId.intValue());
            } else {
                pstmt.setNull(6, Types.INTEGER);
            }
            if (tipoId != null) {
                pstmt.setInt(7, tipoId.intValue());
            } else {
                pstmt.setNull(7, Types.INTEGER);
            }

            pstmt.setDate(8, new java.sql.Date(serenazgo.getFNacimiento().getTime()));
            pstmt.setInt(9, serenazgo.getIdSerenazgo());
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }



    public void setNecesitaAmbulancia(int idIncidencia, String motivo,String personalTurno ){
        String sql = "UPDATE incidencia SET motivoAmbulancia = ?, personalAmbulancia = ? WHERE idIncidencia = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, motivo);
            pstmt.setString(2, personalTurno);
            pstmt.setInt(3, idIncidencia);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }

    public void setNecesitaPolicia(int idIncidencia,int idComisaria, String motivo){
        String sql = "UPDATE incidencia SET motivoPolicia = ?, idComisaria = ? WHERE idIncidencia = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, motivo);
            pstmt.setInt(2, idComisaria);
            pstmt.setInt(3, idIncidencia);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void setNecesitaBombero(int idIncidencia, Boolean necesitaBombero){
        String sql = "UPDATE incidencia SET NecesitaBombero = ? WHERE idIncidencia = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setBoolean(1, necesitaBombero);
            pstmt.setInt(2, idIncidencia);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void setTipoSerenazgo(int idTipo, int idIncidencia){
        String sql = "UPDATE incidencia SET idTipoSerenazgo = ? WHERE idIncidencia = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, idTipo);
            pstmt.setInt(2, idIncidencia);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Turno> listarTurnos(){
        ArrayList<Turno> listaTurnos = new ArrayList<>();

        String sql = "SELECT * from Turno";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Turno turno = new Turno();

                turno.setIdTurno(rs.getInt("idTurno"));
                turno.setNombreTurno(rs.getString("nombreTurno"));
                listaTurnos.add(turno);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaTurnos;
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
