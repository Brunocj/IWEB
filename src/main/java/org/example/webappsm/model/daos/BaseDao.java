package org.example.webappsm.model.daos;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
        String pass = "wmrGt3uVztJgxOMvBxZLVc+bGGxcwsEw6qpTzaPTtxU=";
        String url = "jdbc:mysql://35.231.142.39:3306/sanmiguel";

        return DriverManager.getConnection(url, user, pass);
    }
    public byte[] readImagenes(InputStream is) throws IOException {
        if (is == null) {
            return null;
        }
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = is.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }

}
