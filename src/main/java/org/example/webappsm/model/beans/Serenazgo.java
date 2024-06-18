package org.example.webappsm.model.beans;

import lombok.Data;

import java.util.Date;
@Data
public class Serenazgo {
    private int idSerenazgo;
    private String nombre;
    private String apellido;
    private String dni;
    private String direccion;
    private String telefono;
    private String turno;
    private String tipo;
    private Date fNacimiento;
}
