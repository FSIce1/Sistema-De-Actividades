package controladores;

import algoritmos.Cambio;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "get_Cal_Data", urlPatterns = {"/get_Cal_Data"})
public class getCal_Data_Servlet extends HttpServlet {

    private final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private final String DB_CONNECTION = "jdbc:mysql://localhost:3306/proyectoactividades";
    private final String DB_USER = "root";
    private final String DB_PASSWORD = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        try (PrintWriter out = response.getWriter()) {

            HttpSession ses = request.getSession();
            
            switch (request.getParameter("opcion").charAt(0)) {

                case 'I':
                    

                    System.out.println("x1 en el getCal_Data_Servlet");

                    Connection connection = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    StringBuilder sb = new StringBuilder();
                    boolean enableDatabase = true;

                    try {

                        if(enableDatabase){
                            Class.forName(DB_DRIVER);
                            connection = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);

//                            ps = connection.prepareStatement("select evtID,evtStartDate,evtEndDate,evtDescription,evtBackgroundColor," +
//                                    "evtForegroundColor FROM calevents WHERE id_usuarioFK="+Integer.parseInt(String.valueOf(ses.getAttribute("idCUENTA")))+"");

                            ps = connection.prepareStatement("select id_evento,diaInicio_evento,diaFin_evento,descripcion_evento,colorFondo_evento FROM evento WHERE usuario_eventoFK="+Integer.parseInt(String.valueOf(ses.getAttribute("idCUENTA")))+" AND estado_evento="+0);

                            rs = ps.executeQuery();

                            while(rs.next()) {

                                String evtID = rs.getString("id_evento");
                                String evtCreatorID = " ";
                                String evtStartDate = rs.getString("diaInicio_evento");
                                String evtEndDate = rs.getString("diaFin_evento");
                                String evtDescription = rs.getString("descripcion_evento");
                                String evtBackgroundColor = rs.getString("colorFondo_evento");
                                String evtForegroundColor = "#ffffff";

                                    sb.append("Event ID:").append(evtID).append(";");
                                    sb.append("Created By:").append(evtCreatorID).append(";");
                                    
                                    if(evtStartDate.substring(11, 13).equals("00")){
                                        evtStartDate=Cambio.cambiala(evtStartDate);
                                    }
                                    
                                    if(evtEndDate.substring(11, 13).equals("00")){
                                        evtEndDate=Cambio.cambiala(evtEndDate);
                                    }
                                    
                                    sb.append("Event Start Date:").append(evtStartDate).append(";");
                                    sb.append("Event End Date:").append(evtEndDate).append(";");
                                    sb.append("Event Description:").append(evtDescription).append(";");
                                    sb.append("BackgroundColor:").append(evtBackgroundColor).append(";");
                                    sb.append("ForegroundColor:").append(evtForegroundColor);
                                    sb.append("|");


                                    out.println("Event ID:" + evtID + ";Created By:" + evtCreatorID + ";Event Start Date:" + evtStartDate + ";" +
                                    "Event End Date:" + evtEndDate + ";" + "Event Description:"+ evtDescription + ";" +
                                    "BackgroundColor:" + evtBackgroundColor + ";ForegroundColor:"+ evtForegroundColor + "|");

                            }

                        }
                        
                    } catch (ClassNotFoundException | SQLException ex) {
                        out.println("Error ->" + ex.getMessage());
                    } finally {
                        out.close();

                        if(ps != null)
                            ps.close(); 
                        if(connection != null)
                            connection.close();
                    }


                    break;
                    
                case 'E':
                    
                    
                    break;

                default:
                    out.print("Opción No Disponible");
                    break;

            }

        }
        

    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(getCal_Data_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(getCal_Data_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}