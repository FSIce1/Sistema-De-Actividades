package modelos;

import beans.Actividad;
import datos.cadito;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Modelo_Actividad {
    
    // INSERTAR ACTIVIDAD
    
    public int InsertarActividad(Actividad actividad,int idEvento,int idUsuario) {
        
        String sql;
        
        cadito cado = new cadito(); 
        
        sql = "INSERT INTO actividad (descripcion_actividad,estado_actividad,porcentaje_actividad,confirmar_actividad,evento_actividadFK,id_usuarioFK) VALUES (?,?,?,?,?,?)";
        
        try {
            
            Object[] parametros = new Object[6];
            
            parametros[0]=actividad.getDescripcion_actividad();
            parametros[1]=actividad.getEstado_actividad();
            parametros[2]=actividad.getPorcentaje_actividad();
            parametros[3]=actividad.getConfirmar_actividad();
            parametros[4]=idEvento;
            parametros[5]=idUsuario;
        
            return cado.ejecutar1(sql,parametros);
            
        } catch (SQLException ex) {
            return 0;
        }
         
    }
    
    public int ModificarActividad(Actividad actividad,int idUsuario) {
        
        String sql;
        
        cadito cado = new cadito(); 
        
        sql = "UPDATE actividad set descripcion_actividad=?,porcentaje_actividad=?,confirmar_actividad=?,id_usuarioFK=? WHERE id_actividad=?";
        
            try {
            
            Object[] parametros = new Object[5];
            
            parametros[0]=actividad.getDescripcion_actividad();
            parametros[1]=actividad.getPorcentaje_actividad();
            parametros[2]=actividad.getConfirmar_actividad();
            parametros[3]=idUsuario;
            parametros[4]=actividad.getId_actividad();
            
            return cado.ejecutar1(sql,parametros);
            
        } catch (SQLException ex) {
            return 0;
        }
    }
   
    public int ModificarActividadTipoUsu(int cod,int por) {
        
        String sql;
        
        cadito cado = new cadito(); 
        
        sql = "UPDATE actividad set porcentaje_actividad=?,confirmar_actividad=? WHERE id_actividad=?";
        
            try {
            
            Object[] parametros = new Object[3];
            
            parametros[0]=por;
            parametros[1]=0;
            parametros[2]=cod;
            
            return cado.ejecutar1(sql,parametros);
            
        } catch (SQLException ex) {
            return 0;
        }
    }
    
    public int eliminarActividad(int codigo){
        
        String sql="delete from actividad where id_actividad="+codigo+"";
        
        cadito cado= new cadito();
        
        try {
            return cado.ejecutarEliminar(sql);
        } catch (SQLException e) {
            return 0;
        }
    }
    
    
    public int cambiarEstado(int estado,int eve){

        try {
            
            cadito cado = new cadito();
            
            Object[] parametros = new Object[2];
            
            String sql="UPDATE actividad set estado_actividad=? where id_actividad=?";
        
            parametros[0]=estado;
            parametros[1]=eve;
            
            
            return cado.ejecutar1(sql, parametros);
            
        } catch (SQLException e) {
            return 0;
        }
        
    }

        // LISTA DE ACTIVIDADES
    public static List<Actividad> listaActividades(int codEvento, int codUsuario) throws SQLException{
        
        String sql="";
        
        if(codEvento==-1)
            sql="select * from actividad WHERE id_usuarioFK="+codUsuario+" AND estado_actividad="+0;
        else if(codUsuario==-1)
            sql="select * from actividad WHERE evento_actividadFK="+codEvento+" AND estado_actividad="+0; // ID DE EVENTO
            
            
        cadito cado= new cadito();
        
        Statement st = null;
        ResultSet re = null;
        
        List<Actividad> actividades = new ArrayList<>();
        
        Connection c = cado.conexion();

        try {
            
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);
            
            while (re.next()) {                
                Actividad actividad = new Actividad();
                
                    actividad.setId_actividad(re.getInt("id_actividad"));
                    actividad.setDescripcion_actividad(re.getString("descripcion_actividad"));
                    actividad.setEstado_actividad(re.getInt("estado_actividad"));
                    actividad.setPorcentaje_actividad(re.getInt("porcentaje_actividad"));
                    actividad.setConfirmar_actividad(re.getInt("confirmar_actividad"));
                    actividad.setId_evento(Modelo_Evento.buscaEventos(re.getInt("evento_actividadFK")));
                    actividad.setId_usuario(Modelo_Usuario.buscaUsu(re.getInt("id_usuarioFK")));
                    // FALTA EL EVENTO <--
                    
                actividades.add(actividad);
            }
              
            return actividades;
            
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
    
}

