
package beans;

public class Actividad {
    
    private int id_actividad;
    private String descripcion_actividad;
    private int estado_actividad;
    private int porcentaje_actividad;
    private int confirmar_actividad;
    private Evento id_evento;
    private Usuario id_usuario;

    public Actividad() {
    }

    public Actividad(int id_actividad, String descripcion_actividad, int estado_actividad, int porcentaje_actividad, int confirmar_actividad, Evento id_evento, Usuario id_usuario) {
        this.id_actividad = id_actividad;
        this.descripcion_actividad = descripcion_actividad;
        this.estado_actividad = estado_actividad;
        this.porcentaje_actividad = porcentaje_actividad;
        this.confirmar_actividad = confirmar_actividad;
        this.id_evento = id_evento;
        this.id_usuario = id_usuario;
    }

    public int getId_actividad() {
        return id_actividad;
    }

    public void setId_actividad(int id_actividad) {
        this.id_actividad = id_actividad;
    }

    public String getDescripcion_actividad() {
        return descripcion_actividad;
    }

    public void setDescripcion_actividad(String descripcion_actividad) {
        this.descripcion_actividad = descripcion_actividad;
    }

    public int getEstado_actividad() {
        return estado_actividad;
    }

    public void setEstado_actividad(int estado_actividad) {
        this.estado_actividad = estado_actividad;
    }

    public int getPorcentaje_actividad() {
        return porcentaje_actividad;
    }

    public void setPorcentaje_actividad(int porcentaje_actividad) {
        this.porcentaje_actividad = porcentaje_actividad;
    }

    public int getConfirmar_actividad() {
        return confirmar_actividad;
    }

    public void setConfirmar_actividad(int confirmar_actividad) {
        this.confirmar_actividad = confirmar_actividad;
    }

    public Evento getId_evento() {
        return id_evento;
    }

    public void setId_evento(Evento id_evento) {
        this.id_evento = id_evento;
    }

    public Usuario getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Usuario id_usuario) {
        this.id_usuario = id_usuario;
    }

}
