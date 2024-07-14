package org.example.webappsm.model.beans;

import lombok.Data;

@Data
public class Profesor {

    private int idProfesor;
    private String apellido;
    private String nombre;
    private String curso;
    private int idArea;
    private String nombreArea;
    private int disponibilidad;
}