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

        String sql = " select * from Profesor";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Profesor profesor = new Profesor();

                profesor.setApellido(rs.getString(2));
                profesor.setNombre(rs.getString(3));
                profesor.setCurso(rs.getString(4));

                listaProfesores.add(profesor);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaProfesores;






    }
}