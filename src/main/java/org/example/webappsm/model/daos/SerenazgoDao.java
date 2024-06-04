package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Serenazgo;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
public class SerenazgoDao {
    public ArrayList<Serenazgo> listarSerenazgoTabla(){
        ArrayList<Serenazgo> listaSerenazgo = new ArrayList<>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "rootroot";
        String sql = "SELECT s.nombre, s.apellido, ts.nombreTipo AS tipo, t.nombreTurno AS turno " +
                "FROM Serenazgo s " +
                "JOIN TipoSerenazgo ts ON s.idTipoSerenazgo = ts.idTipoSerenazgo " +
                "JOIN Turno t ON s.idTurno = t.idTurno";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Serenazgo serenazgo = new Serenazgo();

                serenazgo.setNombre(rs.getString("nombre"));
                serenazgo.setApellido(rs.getString("apellido"));
                serenazgo.setTipo(rs.getString("tipo"));
                serenazgo.setTurno(rs.getString("turno"));

                listaSerenazgo.add(serenazgo);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaSerenazgo;
    }
    public void agregarSerenazgo(Serenazgo serenazgo){
        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "rootroot";
        String query = "INSERT INTO Serenazgo (nombre, apellido, dni, direccion, telefono, turno, tipo, fNacimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn= DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(query)){

            if (serenazgo.getDni() == null) {
                throw new IllegalArgumentException("El DNI/Carnet de extranjería del serenazgo no puede ser nulo!!!");
            }

            pstmt.setString(1,serenazgo.getNombre());
            pstmt.setString(2,serenazgo.getApellido());
            pstmt.setString(3,serenazgo.getDni());
            pstmt.setString(4,serenazgo.getDireccion());
            pstmt.setString(5,serenazgo.getTelefono());
            pstmt.setString(6,serenazgo.getTurno());
            pstmt.setString(7,serenazgo.getTipo());
            pstmt.setDate(8,new java.sql.Date(serenazgo.getFNacimiento().getTime()));
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public void eliminarSerenazgo(int idSerenazgo){
        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "rootroot";
        String query = "DELETE FROM Serenazgo WHERE idSerenazgo = ?";
        try (Connection conn= DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, idSerenazgo);
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
    public Serenazgo obtenerSerenazgoPorId(int idSerenazgo){
        Serenazgo serenazgo = new Serenazgo();
        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "rootroot";
        String query = "SELECT * FROM Serenazgo WHERE idSerenazgo = ?";
        try (Connection conn= DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery()){
            pstmt.setInt(1, idSerenazgo);
                if (rs.next()) {
                    serenazgo.setIdSerenazgo(rs.getInt("idSerenazgo"));
                    serenazgo.setNombre(rs.getString("nombre"));
                    serenazgo.setApellido(rs.getString("apellido"));
                    serenazgo.setDni(rs.getString("dni"));
                    serenazgo.setDireccion(rs.getString("direccion"));
                    serenazgo.setTelefono(rs.getString("telefono"));
                    serenazgo.setTurno(rs.getString("turno"));
                    serenazgo.setTipo(rs.getString("tipo"));
                    serenazgo.setFNacimiento(rs.getDate("fNacimiento"));
                }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return serenazgo;
    }
    public void editarSerenazgo(Serenazgo serenazgo){
        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "rootroot";
        String query = "UPDATE Serenazgo SET nombre = ?, apellido = ?, dni = ?, direccion = ?, telefono = ?, turno = ?, tipo = ?, fNacimiento = ? WHERE idSerenazgo = ?";
        try (Connection conn= DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setString(1, serenazgo.getNombre());
            pstmt.setString(2, serenazgo.getApellido());
            pstmt.setString(3, serenazgo.getDni());
            pstmt.setString(4, serenazgo.getDireccion());
            pstmt.setString(5, serenazgo.getTelefono());
            pstmt.setString(6, serenazgo.getTurno());
            pstmt.setString(7, serenazgo.getTipo());
            pstmt.setDate(8, new java.sql.Date(serenazgo.getFNacimiento().getTime()));
            pstmt.setInt(9, serenazgo.getIdSerenazgo());
            pstmt.executeUpdate();
        }catch( SQLException e){
            throw new RuntimeException(e);
        }
    }
}
