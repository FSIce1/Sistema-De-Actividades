
package modelos;

import beans.Cargo;
import datos.cadito;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Modelo_Cargo {
    
    
    // INSERTAR CARGO
    
    public int InsertarCargo(String cargo) {
        
        String sql;
        
        cadito cado = new cadito(); 
        
        sql = "INSERT INTO cargo (nombre_cargo) VALUES (?)";
        
            try {
            
            Object[] parametros = new Object[1];

            parametros[0]=cargo;
        
            return cado.ejecutar1(sql,parametros);
            
        } catch (SQLException ex) {
            return 0;
        }
    }
    
    public int ModificarCargo(Cargo cargo) {
        
        String sql;
        
        cadito cado = new cadito(); 
        
        sql = "UPDATE cargo set nombre_cargo=? WHERE id_cargo=?";
        
            try {
            
            Object[] parametros = new Object[2];
            
            parametros[0]=cargo.getNombre_cargo();
            parametros[1]=cargo.getId_cargo();
            
            return cado.ejecutar1(sql,parametros);
            
        } catch (SQLException ex) {
            return 0;
        }
    }
   
    public int eliminarCargo(int codigo){
        
        String sql="delete from cargo where id_cargo="+codigo+"";
        
        cadito cado= new cadito();
        
        try {
            return cado.ejecutarEliminar(sql);
        } catch (SQLException e) {
            return 0;
        }
    }

        // LISTA DE CARGOS
    public static List<Cargo> listaCargos() throws SQLException{
        
        String sql="select * from cargo";
        
        
        cadito cado= new cadito();
        
        Statement st = null;
        ResultSet re = null;
        
        List<Cargo> cargos = new ArrayList<>();
        
        Connection c = cado.conexion();

        try {
            
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);
            
            while (re.next()) {                
                Cargo cargo = new Cargo();
                
                    cargo.setId_cargo(re.getInt("id_cargo"));
                    cargo.setNombre_cargo(re.getString("nombre_cargo"));

                cargos.add(cargo);
            }
              
            return cargos;
            
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
    
        // BUSCAR CARGO
    public static Cargo buscaCargo(int codigo) throws SQLException{
        
        String sql="select * from cargo WHERE id_cargo="+codigo;
        
        
        cadito cado= new cadito();
        
        Statement st = null;
        ResultSet re = null;
        
        Connection c = cado.conexion();

        try {

                
            Cargo cargo = new Cargo();
            
            st = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            re = st.executeQuery(sql);
            
            while (re.next()) {
                
                    cargo.setId_cargo(re.getInt("id_cargo"));
                    cargo.setNombre_cargo(re.getString("nombre_cargo"));

            }
              
            return cargo;
            
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

