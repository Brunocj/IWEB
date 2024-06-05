package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Profesor;

import java.sql.*;
import java.util.ArrayList;

public class ProfesorDao {

    public ArrayList<Profesor> listarProfesoresTabla(){

        ArrayList<Profesor> listaProfesores = new ArrayList<Profesor>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = " select * from Profesor" ;

        try (Connection conn= DriverManager.getConnection(url, username, password);
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
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "DELETE FROM Profesor WHERE idProfesor = ?";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idProfesor);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void agregarProfesor(Profesor profesor) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "INSERT INTO Profesor (apellidos, nombres, curso, idArea) VALUES (?, ?, ?, ?)";

        try (Connection conn= DriverManager.getConnection(url, username, password);
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
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT * FROM Profesor WHERE idProfesor = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
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
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "UPDATE Profesor SET apellidos = ?, nombres = ?, curso = ? ,idArea = ? WHERE idProfesor = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";

        String sql = "SELECT nombreArea FROM area WHERE idArea = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
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
