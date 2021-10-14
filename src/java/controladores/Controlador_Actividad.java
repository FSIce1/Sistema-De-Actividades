
package controladores;

import beans.Actividad;
import beans.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.Modelo_Actividad;

@WebServlet(name = "Controlador_Actividad", urlPatterns = {"/Controlador_Actividad"})
public class Controlador_Actividad extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            Modelo_Actividad mod;
            HttpSession session = request.getSession();
            
            switch(request.getParameter("opcion").charAt(0)){
                
            // MANDAR A MI LISTA DE ACTIVIDADES
            case 'A':
            
                response.sendRedirect("Lista_MisActividades.jsp");
                
                break;
                
            // MANDAR A LA LISTA DE ACTIVIDADES    
            case 'L': 
                
                request.setAttribute("ID", request.getParameter("txtId"));
                
                request.getRequestDispatcher("Lista_Actividades.jsp").forward(request, response);

                break;
                
            // INSERTAR
            case 'I': 
                
                mod= new Modelo_Actividad();

                Actividad actividad;
                
                try {
                
                    actividad= new Actividad();

                    actividad.setDescripcion_actividad(request.getParameter("txtDescripcionActividad"));
                    
                    actividad.setEstado_actividad(0);

                    //actividad.setPorcentaje_actividad(Integer.parseInt(request.getParameter("txtPorcentaje")));

                    actividad.setPorcentaje_actividad(0);  
                    
                    actividad.setConfirmar_actividad(0); // POR DEFECTO
                    
                    
                    if(mod.InsertarActividad(actividad,Integer.parseInt(request.getParameter("txtIdEvento")),Integer.parseInt(request.getParameter("txtPersonaActividad")))==1)
                        request.setAttribute("ALERTA", "CORRECTO");
                    else 
                        request.setAttribute("ALERTA", "INCORRECTO");
                    
                    request.setAttribute("ID", request.getParameter("txtIdEvento"));

                    request.getRequestDispatcher("Lista_Actividades.jsp").forward(request, response);

                } catch (IOException | NumberFormatException e) {
                }
                
                break;
            
            //MODIFICAR     
            case 'D':
  
                mod= new Modelo_Actividad();

                try {
                
                    actividad= new Actividad();

                    actividad.setId_actividad(Integer.parseInt(request.getParameter("txtIdActividad")));
                    //System.out.println(""+request.getParameter("txtIdActividad"));
                    
                    actividad.setDescripcion_actividad(request.getParameter("txtDescripcionActividad"));
                    //System.out.println(""+request.getParameter("txtDescripcionActividad"));
                    
                    System.out.println(""+request.getParameter("txtPersonaActividad"));
                    
//                    
//                    if(mod.ModificarActividad(actividad, Integer.parseInt(request.getParameter("txtPersonaActividad")))==1){
//                        request.setAttribute("ALERTA", "CORRECTO");
//                    } else {
//                        request.setAttribute("ALERTA", "INCORRECTO");
//                    }


                    System.out.println("¿Actividad Terminada?"+request.getParameter("cbxRealizado"));

                    actividad.setPorcentaje_actividad(Integer.parseInt(request.getParameter("txtPorcentaje")));
                    
                    
                    if(request.getParameter("cbxRealizado")!=null)
                        actividad.setConfirmar_actividad(1);
                    else
                        actividad.setConfirmar_actividad(0);

                    
                    
                    mod.ModificarActividad(actividad, Integer.parseInt(request.getParameter("txtPersonaActividad")));
                    
                    request.setAttribute("ID", request.getParameter("txtIdEvento"));

                    request.getRequestDispatcher("Lista_Actividades.jsp").forward(request, response);

                } catch (IOException | NumberFormatException e) {
                }
                
                break;    

            // INHABILITAR
            case 'E':
            
                try {
                
                    mod= new Modelo_Actividad();

                    mod.cambiarEstado(1,Integer.parseInt(request.getParameter("txtId")));
                    
                    request.setAttribute("ID", request.getParameter("txtIdEvento"));

                    request.getRequestDispatcher("Lista_Actividades.jsp").forward(request, response);

                } catch (IOException | NumberFormatException e) {
                }
                
                break;

            case 'X':

                mod= new Modelo_Actividad();

                try {
                    
                    System.out.println("Id actividad: "+request.getParameter("txtIdActividad"));
                    System.out.println("Porcentaje: "+request.getParameter("txtPorcentaje"));

                    mod.ModificarActividadTipoUsu(Integer.parseInt(request.getParameter("txtIdActividad")), Integer.parseInt(request.getParameter("txtPorcentaje")));
                    
                    
                    
                    response.sendRedirect("Lista_MisActividades.jsp");
                    
                } catch (NumberFormatException e) {
                }
                
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
        processRequest(request, response);
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
        processRequest(request, response);
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
