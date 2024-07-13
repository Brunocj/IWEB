package org.example.webappsm.model.beans;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;
@Data
public class Incidencia {
    private int idIncidencia;
    private String nombre;
    private String tipo;
    private String lugar;
    private String referencia;
    private int idUrbanizacion;
    private String urbanizacion;
    private String contactoO;
    private int idTipoSerenazgo;
    private String personalAmbulancia;
    private String motivoAmbulancia;
    private String motivoPolicia;
    private int idComisaria;
    private boolean bomberoI;
    public String descripcion;
    private byte[] imgEvidencia; //Almacenar la imagen
    private boolean ambulanciaI; //si al registrar la incidencia requeria ambulancia
    private Timestamp fechaIncidencia;
    private String estado;
    private String clasificacion;
    private int idUsuario;
    private int idTipo;
    private String nombreUsuarioIncidencia;
}
