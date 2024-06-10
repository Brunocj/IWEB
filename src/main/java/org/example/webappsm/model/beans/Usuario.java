package org.example.webappsm.model.beans;

import lombok.Data;

@Data
public class Usuario {
    private int id;
    private String nombre;
    private String apellido;
    private String rol;
    private String documento;
    private String tipoDocumento;
    private String distrito;
    private String urbanizacion;
    private int falsasAlarmas;
    private String correoE;
    private String contrasena;
    private String direccion;
    private String numContacto;
    private String area;
}
