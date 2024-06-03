package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.Profesor;
import org.example.webappsm.model.beans.Serenazgo;

import java.sql.*;
import java.util.ArrayList;

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
        String password = "123456";
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
}
