
package datos;

import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class cadito {
 
    Connection cn;
    
    public Connection conexion(){
    
        
        // DEMO
    try {
        Class.forName("com.mysql.jdbc.Driver");
            this.cn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sistema-actividades", 
                    "root", "");
            return this.cn;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexion: "+e.getMessage());
            return null;
        }
        
    }
    
    public int ejecutar1(String sql, Object[] o) throws SQLException {

        PreparedStatement pst = null;
        Connection c = this.conexion();
        
        try {

            pst = c.prepareStatement(sql);

            for (int i = 0; i < o.length; i++) {
                
                if(o[i]!=null){
                    
                    switch (o[i].getClass().toString()) {
                    case "class java.lang.Integer":
                        pst.setInt(i + 1, Integer.parseInt(o[i].toString()));
                        break;
                    case "class java.lang.String":
                        pst.setString(i + 1, o[i].toString());
                        break;
                    case "class java.sql.Date":
                        pst.setDate(i + 1, (Date) o[i]);
                        break;
                    default:
                        break;
                    }
                    
                } else {
                    pst.setString(i+1, null);
                } 
                
                
            }

            pst.executeUpdate();

            return 1;

        } catch (NumberFormatException | SQLException ex) {
            return 0;
        } finally {

            if (pst != null) {
                pst.close();
            }

            closeCnx(c);
        }

    } 
   
    
    public int ejecutar(String sql, List<Object> o) throws SQLException {

        PreparedStatement pst = null;
        Connection c = this.conexion();
        
        try {

            pst = c.prepareStatement(sql);

            for (int i = 0; i < o.size(); i++) {
                
                if(o.get(i)!=null){
                    
                    switch (o.get(i).getClass().toString()) {
                    case "class java.lang.Integer":
                        pst.setInt(i + 1, Integer.parseInt(o.get(i).toString()));
                        break;
                    case "class java.lang.String":
                        pst.setString(i + 1, o.get(i).toString());
                        break;
                    case "class java.sql.Date":
                        pst.setDate(i + 1, (Date) o.get(i));
                        break;
                    default:
                        break;
                    }
                    
                } else {
                    pst.setString(i+1, null);
                } 
                
                
            }

            pst.executeUpdate();

            return 1;

        } catch (NumberFormatException | SQLException ex) {
            return 0;
        } finally {

            if (pst != null) {
                pst.close();
            }

            closeCnx(c);
        }

    }
    
    
    public ResultSet recuperarPrpStm(String sql, Object o[]) throws SQLException{
        
        try{
            
            PreparedStatement pst;
            
            pst = this.conexion().prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_INSENSITIVE, 
                    ResultSet.CONCUR_READ_ONLY);
            
            
            for(int x=0; x<o.length; x++){ 
                
                if(o[x].getClass().toString().equals("class java.lang.Integer"))
                    pst.setInt((x+1), Integer.parseInt(o[x].toString()));
                else if(o[x].getClass().toString().equals("class java.lang.String"))
                    pst.setString((x+1), o[x].toString());                    
            }
            pst.executeQuery();
            
        return pst.executeQuery();
              
        }catch(NumberFormatException | SQLException ex){ 
            System.out.println("error en la ejecucion "+ ex.getMessage());
            return null;
        }finally{
         conexion().close();
        } 
    }
    
    
    public ResultSet Recuperar(String sql){
        
        try{
          Statement pst;
            pst = this.conexion().createStatement();
            return pst.executeQuery(sql);
          }catch(SQLException ex){
            System.out.println("Error en el statement--> "+ex.getMessage());
            return null;
        } finally {
            try {
                conexion().close();
            } catch (SQLException ex) {
                Logger.getLogger(cadito.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
         
    }
     
    public ResultSet recuperar(String sql) {
        try {
            Statement st = conexion().createStatement(
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            return st.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }
    }
    
    //CIERRA CONEXIÓN
    public void closeCnx(Connection cnx) {

        try {
            if (cnx != null) {
                cnx.close();
            }
        } catch (SQLException e) {
        }
    } 
     
    public int ejecutarEliminar(String sql) throws SQLException {

        Statement st = null;
        Connection c = this.conexion();

        try {
            st = c.createStatement();

            st.executeUpdate(sql);

            return 1;

        } catch (SQLException e) {
            return 0;
        } finally {

            if (st != null) {
                st.close();
            }

            closeCnx(c);
        }

    }

     
}
