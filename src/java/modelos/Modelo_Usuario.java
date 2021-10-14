

package modelos;

import beans.TipoUsuario;
import beans.Usuario;
import datos.cadito;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Modelo_Usuario {

    public Modelo_Usuario() {
    
    }

    // INSERTAR INSERTAR USUARIO
    public int insertarUsuario(Usuario usuario,int idCargo){
        
        
        try {
        
            
                cadito cado = new cadito();

                String sql="insert into usuario (dni_usuario,contraseña_usuario,nombres_usuario,apellidos_usuario,email_usuario,descripcion_usuario,estado_usuario,cargo_usuarioFK,tipo_usuarioFK) values(?,?,?,?,?,?,?,?,?)";

                Object[] parametros = new Object[9];

                parametros[0]=usuario.getDni_usuario();
                parametros[1]=usuario.getContra_usuario();
                parametros[2]=usuario.getNombres_usuario();
                parametros[3]=usuario.getApellidos_usuario();
                parametros[4]=usuario.getEmail_usuario();
                parametros[5]=usuario.getDesc_usuario();
                parametros[6]=0; // ACTIVO
                parametros[7]=idCargo;
                parametros[8]=2;
                        
              
            return cado.ejecutar1(sql, parametros);
        } catch (SQLException ex) {
            return 0;
        }
        
    }
    
    // MODIFICAR USUARIO
    public int modificarUsuario(Usuario usuario,int idCargo){

        try {
            
            cadito cado = new cadito();
            
            String sql="update usuario set dni_usuario=?,nombres_usuario=?,apellidos_usuario=?,email_usuario=?,descripcion_usuario=?,cargo_usuarioFK=? where id_usuario=?";
                
            Object[] parametros = new Object[7];

                parametros[0]=usuario.getDni_usuario();
                parametros[1]=usuario.getNombres_usuario();
                parametros[2]=usuario.getApellidos_usuario();
                parametros[3]=usuario.getEmail_usuario();
                parametros[4]=usuario.getDesc_usuario();
                parametros[5]=idCargo;
                parametros[6]=usuario.getId_usuario();               
        
            return cado.ejecutar1(sql, parametros);
            
        } catch (SQLException e) {
            return 0;
        }
        
    }
    
    
    // CAMBIA ESTADO A ----> ACTIVO / INACTIVO
    public int cambiarEstado(int estado,int id){

        String sql="update usuario set estado_usuario=? where id_usuario=?";
        
        cadito cado = new cadito();
        
        try {
            
              Object[] parametros = new Object[2];

            parametros[0]=estado;
            parametros[1]=id;
            
            return cado.ejecutar1(sql, parametros);
        } catch (SQLException e) {
            return 0;
        }
        
    }
        
        //ELIMINAR USUARIOS
    public int eliminarUsuario(int codigo){
        
        String sql="delete from usuario where id_usuario="+codigo+"";
        
        cadito cado = new cadito();
        
        try {
            return cado.ejecutarEliminar(sql);
        } catch (SQLException e) {
            return 0;
        }
    }
    
        //LISTA DE USUARIOS
    public static List<Usuario> listaUsuarios(String modo) throws SQLException{
        
        String sql;
        
        if(modo.equals(""))
            sql="select * from usuario";
        else        
            sql="select * from usuario WHERE tipo_usuarioFK="+2;
        
        cadito cado = new cadito();
        
        Statement st = null;
        ResultSet re = null;
        List<Usuario> usuarios = new ArrayList<>();
        
        Connection c = cado.conexion();
        
        try {
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);

            while (re.next()) {
                
                Usuario usuario = new Usuario();
                
                usuario.setId_usuario(re.getInt("id_usuario"));
                usuario.setDni_usuario(re.getInt("dni_usuario"));
                usuario.setContra_usuario(re.getString("contraseña_usuario"));
                usuario.setNombres_usuario(re.getString("nombres_usuario"));
                usuario.setApellidos_usuario(re.getString("apellidos_usuario"));
                usuario.setEmail_usuario(re.getString("email_usuario"));
                usuario.setDesc_usuario(re.getString("descripcion_usuario"));
                usuario.setEstado_usuario(re.getInt("estado_usuario"));
                usuario.setCargo_usuario(Modelo_Cargo.buscaCargo(re.getInt("cargo_usuarioFK")));

                usuarios.add(usuario);
            }
        
            return usuarios;

        } catch (SQLException e) {
            return null;
        } finally {

            if (re != null) {
                re.close();
            }

            if (st != null) {
                st.close();
            }

            cado.closeCnx(c);
        }
        
    }
    
    public static Usuario buscaUsu(int cod) throws SQLException{
        
        String sql;
        
         sql="select * from usuario where id_usuario="+cod;
        
        cadito cado = new cadito();
        
        Statement st = null;
        ResultSet re = null;
        
        Connection c = cado.conexion();
        
        
                
        
        try {
            
            Usuario usuario = new Usuario();
        
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);

            while (re.next()) {
                
                        usuario.setId_usuario(re.getInt("id_usuario"));
                        usuario.setDni_usuario(re.getInt("dni_usuario"));
                        usuario.setContra_usuario(re.getString("contraseña_usuario"));
                        usuario.setNombres_usuario(re.getString("nombres_usuario"));
                        usuario.setApellidos_usuario(re.getString("apellidos_usuario"));
                        usuario.setEmail_usuario(re.getString("email_usuario"));
                        usuario.setDesc_usuario(re.getString("descripcion_usuario"));
                        usuario.setEstado_usuario(re.getInt("estado_usuario"));
                        usuario.setCargo_usuario(Modelo_Cargo.buscaCargo(re.getInt("cargo_usuarioFK")));
                        
            }
        
            return usuario;

        } catch (SQLException e) {
            return null;
        } finally {

            if (re != null) {
                re.close();
            }

            if (st != null) {
                st.close();
            }

            cado.closeCnx(c);
        }
        
    }
    
    //BUSCA DE USUARIO POR ID
    public static Usuario buscaUsuario(int codigo,String contra) throws SQLException{
        
        cadito cd= new cadito();
        ResultSet re;
        
        String sql;
        Object a[]= new Object[2];
            
        if(contra.equals("")){
            //sql="select * from usuario where dni_usuario="+codigo+"";
            sql="select * from usuario where id_usuario="+codigo;
        }else{
            sql="select * from usuario where dni_usuario=? and contraseña_usuario=?";
            
            a[0]=codigo;
            a[1]=contra;
            
        }
        
        re= cd.recuperarPrpStm(sql,a);
        
        try {
            
            while (re.next()) {                
                Usuario usuario = new Usuario();
                
                        usuario.setId_usuario(re.getInt("id_usuario"));
                        usuario.setDni_usuario(re.getInt("dni_usuario"));
                        usuario.setContra_usuario(re.getString("contraseña_usuario"));
                        usuario.setNombres_usuario(re.getString("nombres_usuario"));
                        usuario.setApellidos_usuario(re.getString("apellidos_usuario"));
                        usuario.setEmail_usuario(re.getString("email_usuario"));
                        usuario.setDesc_usuario(re.getString("descripcion_usuario"));
                        //usuario.setEstado_usuario(re.getBoolean("estado_usuario"));
                        
                        usuario.setCargo_usuario(Modelo_Cargo.buscaCargo(re.getInt("cargo_usuarioFK")));
                        usuario.setTipo_usuario(Modelo_Usuario.buscaTipoUsuario(re.getInt("tipo_usuarioFK")));
                        
                return usuario;
            }
              
            return new Usuario();
            
        } catch (SQLException e) {
            return null;
        }
        
    }
    
    /*
    public static Usuario datosUsuario(String usu, String contra){

            try {

                ResultSet re;
                cadito cd = new cadito();
                
                Usuario b = new Usuario(); 
                Object a[]= new Object[2];
                a[0]=usu;
                a[1]=contra;

                String sql="SELECT * FROM usuario WHERE dni_usuario=? AND contra_usuario=? ";
                re= cd.recuperarPrpStm(sql,a);
               
                while(re.next()){

                    Usuario usuario = new Usuario();
                
                        usuario.setDni_usuario(re.getInt("dni_usuario"));
                        usuario.setContra_usuario(re.getString("contra_usuario"));
                        usuario.setNombres_usuario(re.getString("nombres_usuario"));
                        usuario.setApellidos_usuario(re.getString("apellidos_usuario"));
                        usuario.setCargo_usuario(re.getString("cargo_usuario"));
                        usuario.setEmail_usuario(re.getString("email_usuario"));
                        usuario.setEstado_usuario(re.getString("estado_usuario"));
                         
                    return usuario;
                }

                return b;
            } catch (SQLException e) {
                return null;
            }

    }
    */
    
    public int existeUser(String usu, String contra){

        try {

            ResultSet rs;
            cadito cd = new cadito();
            
            String sql="";
            
            if(contra.equals("")){

                sql="SELECT COUNT(dni_usuario) FROM usuario WHERE dni_usuario='"+usu+"'";

            } else {
            
               sql="SELECT COUNT(dni_usuario) FROM usuario WHERE dni_usuario='"+usu+"' "
                         + "AND contraseña_usuario='"+contra+"' AND estado_usuario="+0;

            }
            
            rs=cd.Recuperar(sql);
            
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return -1;
        }

    }

    //BUSCA DE TIPO DE USUARIO POR ID
    public static TipoUsuario buscaTipoUsuario(int codigo) throws SQLException{
        String sql;
        
        sql="select * from tipousuario where id_tipo="+codigo+"";
        
        cadito cado= new cadito();
        
        Statement st = null;
        ResultSet re = null;
        
        Connection c = cado.conexion();

        try {
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);
            
            while (re.next()) {                
                TipoUsuario tipoUsuario = new TipoUsuario();
                
                        tipoUsuario.setId_tipo(re.getInt("id_tipo"));
                        tipoUsuario.setNombre_tipo(re.getString("nombre_tipo"));
                        
                return tipoUsuario;
            }
              
            return null;
            
        } catch (SQLException e) {
            return null;
        } finally {

            if (re != null) {
                re.close();
            }

            if (st != null) {
                st.close();
            }

            cado.closeCnx(c);
        }
        
    }
    
    public static String getMD5(String contraseña) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] mensaje = md.digest(contraseña.getBytes());
            BigInteger numero = new BigInteger(1, mensaje);
            String siguiente = numero.toString(16);

            while (siguiente.length() < 32) {
                siguiente = "0" + siguiente;
            }
            return siguiente;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }
    
}
