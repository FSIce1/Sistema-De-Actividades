
package controladores;

import beans.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.Modelo_Usuario;

@WebServlet(name = "Controlador_Logueo", urlPatterns = {"/Controlador_Logueo"})
public class Controlador_Logueo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Modelo_Usuario mod;
            
            switch(request.getParameter("opcion").charAt(0)){
            
            // MANDAR AL ERROR    
                
            case 'L': 
                request.getRequestDispatcher("404.html").forward(request, response);
            break;    
                
            case 'S': 
                response.sendRedirect("Login.jsp");
            break;    
                
            case 'Y': 
                request.getRequestDispatcher("SesionExpirada.html").forward(request, response);

            break;    
                  
            case 'E': 
            request.getRequestDispatcher("Inicio.jsp").forward(request, response);
            break;
            
            //LOGUEARSE   
            case 'I': 
                
                
                try {
                    
                    mod= new Modelo_Usuario();

                    String usu = request.getParameter("dni123");
                    String contraseña = request.getParameter("contra123");

                    if(mod.existeUser(usu, "")==1){

                        if(mod.existeUser(usu, contraseña)==1){

                            HttpSession ses = request.getSession(true);

                            //ses.setMaxInactiveInterval(720);

                            Usuario usuario= Modelo_Usuario.buscaUsuario(Integer.parseInt(usu), contraseña);
                            
                            ses.setAttribute("idCUENTA", String.valueOf(usuario.getId_usuario()));
                            ses.setAttribute("dniCUENTA", String.valueOf(usuario.getDni_usuario()));
                            //ses.setAttribute("contraCUENTA", usuario.getContra_usuario());
                            ses.setAttribute("nombresCUENTA", usuario.getNombres_usuario());
                            ses.setAttribute("apellidosCUENTA", usuario.getApellidos_usuario());
                            ses.setAttribute("cargoCUENTA", String.valueOf(usuario.getCargo_usuario().getId_cargo()));
                            ses.setAttribute("nombrecargoCUENTA", usuario.getCargo_usuario().getNombre_cargo());
                            ses.setAttribute("emailCUENTA", usuario.getEmail_usuario());
                            ses.setAttribute("descCUENTA", usuario.getDesc_usuario());
                            ses.setAttribute("tipoCUENTA", String.valueOf(usuario.getTipo_usuario().getId_tipo())); 

                            response.sendRedirect("Inicio.jsp");

                        } else {

                            request.setAttribute("ALERTA2", "CONTRAINCORRECTA");
    //
    //                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
    //                        dispatcher.forward(request, response);

                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                        }
                        
                    } else {
                        
                        request.setAttribute("ALERTA2", "USUARIOINCORRECTO");

                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                        
                    }
                    
    
                } catch (IOException | NumberFormatException | SQLException | ServletException e) {
                }
                
                                
            break;
            
            case 'C': // CERRAR SESIÓN
                    
                HttpSession s=request.getSession();
                s.invalidate();
                
                response.sendRedirect("Login.jsp");
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
