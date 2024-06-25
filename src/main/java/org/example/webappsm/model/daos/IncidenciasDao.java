package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Incidencia;
import org.example.webappsm.model.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class IncidenciasDao extends BaseDao{

    public ArrayList<Incidencia> listarIncidenciasPasadas(){

        ArrayList<Incidencia> listaIncidenciasPasadas = new ArrayList<>();


        String sql = "SELECT \n" +
                "    i.idIncidencia, \n" +
                "    i.nombre, \n" +
                "    c.nombreClasificacion\n" +
                "FROM \n" +
                "    incidencia i\n" +
                "JOIN \n" +
                "    clasificacin c ON i.idEstado = c.idClasificacin\n" +
                "WHERE \n" +
                "i.idEstado=3;";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Incidencia incidencia = new Incidencia();

                incidencia.setIdIncidencia(rs.getInt("idIncidencia"));
                incidencia.setNombre(rs.getString(2));
                incidencia.setClasificacion(rs.getString(3));

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
                "    u.nombres,\n" +
                "    u.apellidos\n" +
                "FROM \n" +
                "    incidencia i\n" +
                "JOIN \n" +
                "    estadoincidencia e ON i.idEstado = e.idEstado\n" +
                "LEFT JOIN \n" +
                "    clasificacin c ON i.idClasificacin = c.idClasificacin\n" +
                "JOIN \n" +
                "    usuario u ON i.idUsuario = u.idUsuario\n" +
                "WHERE \n" +
                "    i.idEstado IN (1, 2, 4);";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Incidencia incidencia = new Incidencia();


                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setEstado(rs.getString(2));
                incidencia.setClasificacion(rs.getString(3));
                incidencia.setNombreUsuarioIncidencia(rs.getString(4));
                incidencia.setApellidoUsuarioIncidencia(rs.getString(5));

                listaIncidencias.add(incidencia);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencias;
    }




    public Incidencia descripcion(int idIncidencia) {

        Incidencia incidencia = new Incidencia();

        String sql = "SELECT idIncidencia, descripcion from incidencia WHERE idIncidencia=?;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    incidencia.setIdIncidencia(idIncidencia);
                    incidencia.setDescripcion(rs.getString(2));

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidencia;
    }





    public void eliminarIncidenciaPasada(int idIncidenciaPas){

        String query = "DELETE FROM incidencia WHERE idEstado = 3 AND idSerenazgo = ?;";
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
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return incidencia;
    }



}
