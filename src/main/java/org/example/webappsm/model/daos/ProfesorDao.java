package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Profesor;

import java.sql.*;
import java.util.ArrayList;

public class ProfesorDao extends BaseDao{

    public ArrayList<Profesor> listarProfesoresTabla(){

        ArrayList<Profesor> listaProfesores = new ArrayList<Profesor>();

        String sql = " select * from Profesor" ;

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Profesor profesor = new Profesor();
                profesor.setIdProfesor(rs.getInt(1));
                profesor.setApellido(rs.getString(2));
                profesor.setNombre(rs.getString(3));
                profesor.setCurso(rs.getString(4));
                ///////////////////////////////////////////////////

                String nombreArea = obtenerNombreAreaPorId(rs.getInt(5));
                profesor.setNombreArea(nombreArea);

                listaProfesores.add(profesor);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaProfesores;

    }
    public void eliminarProfesor(int idProfesor) {

        String sql = "DELETE FROM Profesor WHERE idProfesor = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idProfesor);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void agregarProfesor(Profesor profesor) {

        String sql = "INSERT INTO Profesor (apellidos, nombres, curso, idArea) VALUES (?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            if (profesor.getApellido() == null) {
                throw new IllegalArgumentException("El apellido del profesor no puede ser nulo");
            }

            pstmt.setString(1, profesor.getApellido());
            pstmt.setString(2, profesor.getNombre());
            pstmt.setString(3, profesor.getCurso());
            pstmt.setInt(4, profesor.getIdArea());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Profesor obtenerProfesorPorId(int id) {
        Profesor profesor = null;

        String sql = "SELECT * FROM Profesor WHERE idProfesor = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    profesor = new Profesor();
                    profesor.setIdProfesor(rs.getInt("idProfesor"));
                    profesor.setApellido(rs.getString("apellidos"));
                    profesor.setNombre(rs.getString("nombres"));
                    profesor.setCurso(rs.getString("curso"));
                    profesor.setIdArea(rs.getInt("idArea"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return profesor;
    }
    public void actualizarProfesor(Profesor profesor) {

        String sql = "UPDATE Profesor SET apellidos = ?, nombres = ?, curso = ? ,idArea = ? WHERE idProfesor = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, profesor.getApellido());
            pstmt.setString(2, profesor.getNombre());
            pstmt.setString(3, profesor.getCurso());
            pstmt.setInt(4, profesor.getIdArea());
            pstmt.setInt(5, profesor.getIdProfesor());

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Profesor actualizado con éxito!");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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



}
