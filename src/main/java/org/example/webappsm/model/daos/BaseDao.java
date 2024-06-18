package org.example.webappsm.model.daos;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDao {
    public Connection getConnection() throws SQLException{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex){
            ex.printStackTrace();
        }
        String user = "root";
        String pass = "PoCoYo137F";
        String url = "jdbc:mysql://localhost:3306/sanmiguel";

        return DriverManager.getConnection(url, user, pass);
    }

}