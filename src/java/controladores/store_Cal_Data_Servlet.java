
package controladores;

import beans.Evento;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.Modelo_Evento;

@WebServlet(name = "store_Cal_Data", urlPatterns = {"/store_Cal_Data"})
public class store_Cal_Data_Servlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            Modelo_Evento mod;
            HttpSession ses = request.getSession();

            switch (request.getParameter("opcion").charAt(0)) {
                
                
            // ENVIA LOS DATOS DEL EVENTO
            case 'M':
                
                request.setAttribute("INSERTAREVENTO", "MODIFICAREVENTO");
                
                request.setAttribute("id", request.getParameter("txtId"));
                request.setAttribute("diaInicio", request.getParameter("txtDiaInicio").split(" ")[0]);
                request.setAttribute("diaFinal", request.getParameter("txtDiaFinal").split(" ")[0]);
                request.setAttribute("diaTerminado", request.getParameter("txtDiaTerminado"));
                request.setAttribute("descripcion", request.getParameter("txtDescripcion"));
                
                
                request.getRequestDispatcher("Nuevo_Evento.jsp").forward(request, response);
                
                break;    
                
            case 'I':
            
                try {
                    
                    System.out.println("ENTOOOOOOOOOOOoo");     
                    
                    Evento evento= new Evento();
                    
                    System.out.println("ID "+String.valueOf(ses.getAttribute("idCUENTA")));
                    
                    evento.setDescripcion(request.getParameter("desc"));
                    evento.setColorFondo(request.getParameter("fg_color"));
                    
                    mod = new Modelo_Evento();
                    
                    mod.InsertarEvento(evento,request.getParameter("start_date"),request.getParameter("end_date"),Integer.parseInt(String.valueOf(ses.getAttribute("idCUENTA"))));
                
                } catch (NumberFormatException ex) {
                    out.println("Error ->" + ex.getMessage());
                }
                
            break;

            // MODIFICAR EVENTO
            case 'S':
            
                try {

                    SimpleDateFormat simpleC = new SimpleDateFormat("yyyy-MM-dd");
                
                    Evento evento= new Evento();
                    
                    evento.setIdEvento(Integer.parseInt(request.getParameter("txtId")));
                    System.out.println("\nID: "+request.getParameter("txtId"));
                    
//                    String diaInicio=request.getParameter("txtDiaInicio");
//                    System.out.println("Día Inicio: "+request.getParameter("txtDiaInicio"));
//                    
//                    String diaFinal=request.getParameter("txtDiaFinal");
//                    System.out.println("Día Final: "+request.getParameter("txtDiaFinal"));
//                    
                    
                    System.out.println("Día Terminado: "+request.getParameter("txtDiaTerminado"));
                    
                    if(request.getParameter("txtDiaTerminado").equals("")){
                    
                        

                        
                    } else {
                        if(request.getParameter("txtDiaTerminado")!=null){

                        String fechaT=request.getParameter("txtDiaTerminado");

                        Date dateT = null;

                        dateT = simpleC.parse(fechaT);

                        evento.setDiaTerminado(dateT);

                        System.out.println("x1");
                        
                        }
                    }
                    
                    
                    
                        
                    evento.setDescripcion(request.getParameter("txtDescripcion"));
                    System.out.println("Desc: "+request.getParameter("txtDescripcion"));
                    
                    mod = new Modelo_Evento();
                    
                    //mod.ModificarEvento(evento,diaInicio,diaFinal);
                    mod.ModificarEvento(evento);
                
                    response.sendRedirect("Lista_Eventos.jsp");
                    
                } catch (IOException | NumberFormatException | ParseException ex) {
                    out.println("Error ->" + ex.getMessage());
                }
                
            break;
            
            
            case 'E':
                
                mod = new Modelo_Evento();
                
                mod.cambiarEstado(1, Integer.parseInt(request.getParameter("id")));
                    
            break;
            
            case 'D':
                
                mod = new Modelo_Evento();
                        
                mod.cambiarEstado(1, Integer.parseInt(request.getParameter("txtId")));
                    
                response.sendRedirect("Lista_Eventos.jsp");
            break;
            
            case 'L':
                
                //request.setAttribute("lista", Modelo_Evento.listaEventos());
                
                request.getRequestDispatcher("Lista_Eventos.jsp").forward(request, response);
                
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
     *
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
            Logger.getLogger(store_Cal_Data_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
            Logger.getLogger(store_Cal_Data_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
