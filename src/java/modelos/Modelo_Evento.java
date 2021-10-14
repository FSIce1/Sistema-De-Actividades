
package modelos;

import beans.Evento;
import datos.cadito;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Modelo_Evento {
    
    
    // INSERTAR EVENTO
    
    public int InsertarEvento(Evento evento,String ini,String fin,int id) {
        
        String sql;
        
        cadito cado = new cadito(); 
        
        sql = "INSERT INTO evento (diaInicio_evento,diaFin_evento,descripcion_evento,colorFondo_evento,estado_evento,usuario_eventoFK) VALUES (?,?,?,?,?,?)";
        
            try {
            
            Object[] parametros = new Object[6];

            parametros[0]=ini;
            parametros[1]=fin;
            parametros[2]=evento.getDescripcion();
            parametros[3]=evento.getColorFondo();
            parametros[4]=0;
            parametros[5]=id;
            
            return cado.ejecutar1(sql,parametros);
            
        } catch (SQLException ex) {
            return 0;
        }
    }
    
    public int ModificarEvento(Evento evento) {
        
        String sql;
        
        cadito cado = new cadito(); 
        
        sql = "UPDATE evento set descripcion_evento=?,diaTerminado_evento=? WHERE id_evento=?";
        
            try {
            
            Object[] parametros = new Object[3];
            
            //parametros[1]=new java.sql.Date(evento.getDiaInicio().getTime());
            //parametros[2]=new java.sql.Date(evento.getDiaFinal().getTime());
            
            //parametros[1]=diaIni;
            //parametros[2]=diaFin;
            parametros[0]=evento.getDescripcion();
            
            if(evento.getDiaTerminado()==null)
                parametros[1]=null;
            else 
                parametros[1]=new java.sql.Date(evento.getDiaTerminado().getTime());
           
            parametros[2]=evento.getIdEvento();
            
            return cado.ejecutar1(sql,parametros);
            
        } catch (SQLException ex) {
            return 0;
        }
    }
    
    
    public int cambiarEstado(int estado,int eve){

        try {
            
            cadito cado = new cadito();
            
            Object[] parametros = new Object[2];
            
            String sql="UPDATE evento set estado_evento=? where id_evento=?";
        
            parametros[0]=estado;
            parametros[1]=eve;
            
            
            return cado.ejecutar1(sql, parametros);
            
        } catch (SQLException e) {
            return 0;
        }
        
    }

    public int eliminarEvento(int codigo){
        
        String sql="delete from evento where id_evento="+codigo+"";
        
        cadito cado= new cadito();
        
        try {
            return cado.ejecutarEliminar(sql);
        } catch (SQLException e) {
            return 0;
        }
    }

        // LISTA DE EVENTOS
    public static List<Evento> listaEventos(String mod1,String mod,int cod) throws SQLException{
        String sql="";
        
        if(mod.equals("1"))
            sql="select * from evento WHERE estado_evento="+0;
        else if(mod.equals("2"))
            sql="select * from evento WHERE usuario_eventoFK="+cod+" AND estado_evento="+1;
        
        
        cadito cado= new cadito();
        
        Statement st = null;
        ResultSet re = null;
        
        List<Evento> eventos = new ArrayList<>();
        
        Connection c = cado.conexion();

        try {
            
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);
            
            while (re.next()) {                
                Evento evento = new Evento();
                
                        evento.setIdEvento(re.getInt("id_evento"));
                        
                        if(mod1.equals("Date")){
                            evento.setDiaInicio(re.getDate("diaInicio_evento"));
                            evento.setDiaFinal(re.getDate("diaFin_evento"));
                        } else {
                            evento.setDiaInicio1(re.getString("diaInicio_evento"));
                            evento.setDiaFinal1(re.getString("diaFin_evento"));
                        
                        }
                        
                        evento.setDescripcion(re.getString("descripcion_evento"));
//                        evento.setEstado(re.getString("estado"));
                        evento.setDiaTerminado(re.getDate("diaTerminado_evento"));
                        
                       // evento.setIdUsuario(Modelo_Usuario.buscaUsuario(re.getInt("usuario_eventoFK"),""));
                        
                eventos.add(evento);
            }
              
            return eventos;
            
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
    
    public static Evento buscaEventos(int cod) throws SQLException{
        
        String sql="select * from evento WHERE id_evento="+cod;
        
        cadito cado= new cadito();
        
        Statement st = null;
        ResultSet re = null;
        
        Connection c = cado.conexion();
    
        try {
    
            Evento evento = new Evento();
        
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);
            
            while (re.next()) {                
            
                        evento.setIdEvento(re.getInt("id_evento"));
                        evento.setDescripcion(re.getString("descripcion_evento"));
                        
            }
              
            return evento;
            
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
