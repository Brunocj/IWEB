package org.example.webappsm.model.daos;

import org.example.webappsm.model.beans.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class VecinosDao extends BaseDao{
    public ArrayList<Usuario> listarSoliAcceso(){
        ArrayList<Usuario> listaSoli = new ArrayList<>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";
        String sql = "SELECT u.idUsuario, u.nombres, u.apellidos, e.nombreEstado AS estado " +
                "FROM Usuario u " +
                "JOIN Estado e ON u.Estado_idEstado = e.idEstado " +
                "WHERE e.nombreEstado = 'pendiente'";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("idUsuario"));
                usuario.setNombre(rs.getString("nombres"));
                usuario.setApellido(rs.getString("apellidos"));


                listaSoli.add(usuario);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaSoli;
    }

    public ArrayList<Usuario> listarSoliCord(){
        ArrayList<Usuario> listaCoord = new ArrayList<>();

        try {
            Class.forName( "com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //Parametros de conexion a que base de datos me quiero unir//
        String url ="jdbc:mysql://localhost:3306/sanmiguel";
        String username = "root";
        String password = "123456";
        String sql = "SELECT " +
                "u.idUsuario," +
                "u.nombres, " +
                "u.apellidos, " +
                "a.nombreArea AS area " +
                "FROM " +
                "SolicitudCoordinador sc " +
                "JOIN Usuario u ON sc.idUsuario = u.idUsuario " +
                "JOIN Area a ON sc.idArea = a.idArea " +
                "WHERE " +
                "sc.estado = 0";

        try (Connection conn= DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("idUsuario"));
                usuario.setNombre(rs.getString("nombres"));
                usuario.setApellido(rs.getString("apellidos"));
                usuario.setArea(rs.getString("area"));

                listaCoord.add(usuario);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCoord;
    }
    public ArrayList<Evento> listarEventos(){
        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = " SELECT * FROM evento ";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
        ){


            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEvento(rs.getInt("idEvento"));
                evento.setTitulo(rs.getString("titulo"));
                evento.setDescripcion(rs.getString("descripcion"));
                evento.setFechaYHora(rs.getTimestamp("fechaYHora"));
                evento.setUbicacion(rs.getString("ubicacion"));
                evento.setRecurrencia(rs.getInt("recurrencia"));
                evento.setImagenes(readImagenes(rs.getBinaryStream("imagenes")));
                evento.setVacantes(rs.getInt("vacantes"));
                evento.setIngreso(rs.getTimestamp("ingreso"));
                evento.setSalida(rs.getTimestamp("salida"));
                evento.setIdProfesor(rs.getInt("idProfesor"));
                evento.setIdCoordinador(rs.getInt("idCoordinador"));
                evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                evento.setIdArea(rs.getInt("idArea"));
                evento.setResumen(rs.getString("resumen"));

                listaEventos.add(evento);
            }

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }

        return  listaEventos;
    }
    private byte[] readImagenes(InputStream is) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = is.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }
    public Evento obtenerEventoporId(int id) {
        Evento evento = null;
        String sql = "SELECT * FROM evento WHERE idEvento = ?";

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    evento = new Evento();
                    evento.setIdEvento(rs.getInt("idEvento"));
                    evento.setTitulo(rs.getString("titulo"));
                    evento.setDescripcion(rs.getString("descripcion"));
                    evento.setFechaYHora(rs.getTimestamp("fechaYHora"));
                    evento.setUbicacion(rs.getString("ubicacion"));
                    evento.setRecurrencia(rs.getInt("recurrencia"));
                    evento.setImagenes(readImagenes(rs.getBinaryStream("imagenes")));
                    evento.setVacantes(rs.getInt("vacantes"));
                    evento.setIngreso(rs.getTimestamp("ingreso"));
                    evento.setSalida(rs.getTimestamp("salida"));
                    evento.setIdProfesor(rs.getInt("idProfesor"));
                    evento.setIdCoordinador(rs.getInt("idCoordinador"));
                    evento.setIdEstadoEvento(rs.getInt("idEstadoEvento"));
                    evento.setIdArea(rs.getInt("idArea"));
                    evento.setResumen(rs.getString("resumen"));

                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return evento;
    }


}
