
package beans;

public class Usuario {

    private int id_usuario;
    private int dni_usuario;
    private String contra_usuario;
    private String nombres_usuario;
    private String apellidos_usuario;
    private String email_usuario;
    private String desc_usuario;
    private int estado_usuario;
    private Cargo cargo_usuario;
    private TipoUsuario tipo_usuario;

    public Usuario() {
    }

    public Usuario(int id_usuario, int dni_usuario, String contra_usuario, String nombres_usuario, String apellidos_usuario, String email_usuario, String desc_usuario, int estado_usuario, Cargo cargo_usuario, TipoUsuario tipo_usuario) {
        this.id_usuario = id_usuario;
        this.dni_usuario = dni_usuario;
        this.contra_usuario = contra_usuario;
        this.nombres_usuario = nombres_usuario;
        this.apellidos_usuario = apellidos_usuario;
        this.email_usuario = email_usuario;
        this.desc_usuario = desc_usuario;
        this.estado_usuario = estado_usuario;
        this.cargo_usuario = cargo_usuario;
        this.tipo_usuario = tipo_usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getDni_usuario() {
        return dni_usuario;
    }

    public void setDni_usuario(int dni_usuario) {
        this.dni_usuario = dni_usuario;
    }

    public String getContra_usuario() {
        return contra_usuario;
    }

    public void setContra_usuario(String contra_usuario) {
        this.contra_usuario = contra_usuario;
    }

    public String getNombres_usuario() {
        return nombres_usuario;
    }

    public void setNombres_usuario(String nombres_usuario) {
        this.nombres_usuario = nombres_usuario;
    }

    public String getApellidos_usuario() {
        return apellidos_usuario;
    }

    public void setApellidos_usuario(String apellidos_usuario) {
        this.apellidos_usuario = apellidos_usuario;
    }

    public String getEmail_usuario() {
        return email_usuario;
    }

    public int getEstado_usuario() {
        return estado_usuario;
    }

    public void setEstado_usuario(int estado_usuario) {
        this.estado_usuario = estado_usuario;
    }

    public void setEmail_usuario(String email_usuario) {
        this.email_usuario = email_usuario;
    }

    public String getDesc_usuario() {
        return desc_usuario;
    }

    public void setDesc_usuario(String desc_usuario) {
        this.desc_usuario = desc_usuario;
    }

    public Cargo getCargo_usuario() {
        return cargo_usuario;
    }

    public void setCargo_usuario(Cargo cargo_usuario) {
        this.cargo_usuario = cargo_usuario;
    }

    public TipoUsuario getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(TipoUsuario tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }
    
    public String getNombreCompleto(){
        return this.apellidos_usuario + " "+this.nombres_usuario;
    }
    

    
}
