package org.example.webappsm.model.beans;
import lombok.Data;

import java.sql.Time;
import java.util.Date;

@Data
public class Evento {
    private int idEvento;
    private String titulo;
    private String descripcion;
    private Date fecha;
    private Time hora;
    private String ubicacion;
    private int recurrencia;
    private byte[] imagenes;
    private int vacantes;
    private Date ingreso;
    private Date salida;
    private int idProfesor;
    private int idCoordinador;
    private int idEstadoEvento;
    private int idArea;
    private String materiales;
    private String resumen;

}
