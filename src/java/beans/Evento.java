
package beans;

import java.util.Date;

public class Evento {

    private int idEvento;
    
    private Date diaInicio;
    private String diaInicio1;
    
    private Date diaFinal;
    private String diaFinal1;
    
    private String descripcion;
    private String colorFondo;
    private Date diaTerminado;
    
    private int estado;
    private Usuario idUsuario;

    public Evento() {
    }

    public Evento(int idEvento, Date diaInicio, String diaInicio1, Date diaFinal, String diaFinal1, String descripcion, String colorFondo, Date diaTerminado, int estado, Usuario idUsuario) {
        this.idEvento = idEvento;
        this.diaInicio = diaInicio;
        this.diaInicio1 = diaInicio1;
        this.diaFinal = diaFinal;
        this.diaFinal1 = diaFinal1;
        this.descripcion = descripcion;
        this.colorFondo = colorFondo;
        this.diaTerminado = diaTerminado;
        this.estado = estado;
        this.idUsuario = idUsuario;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public Date getDiaInicio() {
        return diaInicio;
    }

    public void setDiaInicio(Date diaInicio) {
        this.diaInicio = diaInicio;
    }

    public String getDiaInicio1() {
        return diaInicio1;
    }

    public void setDiaInicio1(String diaInicio1) {
        this.diaInicio1 = diaInicio1;
    }

    public Date getDiaFinal() {
        return diaFinal;
    }

    public void setDiaFinal(Date diaFinal) {
        this.diaFinal = diaFinal;
    }

    public String getDiaFinal1() {
        return diaFinal1;
    }

    public void setDiaFinal1(String diaFinal1) {
        this.diaFinal1 = diaFinal1;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getColorFondo() {
        return colorFondo;
    }

    public void setColorFondo(String colorFondo) {
        this.colorFondo = colorFondo;
    }

    public Date getDiaTerminado() {
        return diaTerminado;
    }

    public void setDiaTerminado(Date diaTerminado) {
        this.diaTerminado = diaTerminado;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

}

