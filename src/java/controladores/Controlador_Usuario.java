
package controladores;

import beans.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.Modelo_Usuario;

@WebServlet(name = "Controlador_Usuario", urlPatterns = {"/Controlador_Usuario"})
public class Controlador_Usuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            Modelo_Usuario mod;
            HttpSession session = request.getSession();
            
            switch(request.getParameter("opcion").charAt(0)){
                
                
            case 'U':
                
                request.setAttribute("cargo", session.getAttribute("cargoCUENTA")); 
                
                request.getRequestDispatcher("Inicio.jsp").forward(request, response);
                
                break;
            
            // MANDAR A LA LISTA DE USUARIOS    
            case 'L': 
                
                request.getRequestDispatcher("Lista_Usuarios.jsp").forward(request, response);

                break;
                
            // MANDAR PARA INSERTAR USUARIO
            case 'N': 
                request.setAttribute("INSERTARUSUARIO", "INSERTARUSUARIO");
                request.setAttribute("ALERTA", "");
                
                request.getRequestDispatcher("Nuevo_Usuario.jsp").forward(request, response);
                break;    
                
            // ENVIA LOS DATOS DE USUARIO
            case 'M':
                
                request.setAttribute("id", request.getParameter("txtId"));
                request.setAttribute("dni", request.getParameter("txtDni"));
                request.setAttribute("nombres", request.getParameter("txtNombres"));
                request.setAttribute("apellidos", request.getParameter("txtApellidos"));
                request.setAttribute("cargo", request.getParameter("txtCargo"));
                request.setAttribute("email", request.getParameter("txtEmail"));
                request.setAttribute("txtDescripcion", request.getParameter("txtDescripcion"));
                
                
                request.setAttribute("INSERTARUSUARIO", "MODIFICARUSUARIO");
                
                request.getRequestDispatcher("Nuevo_Usuario.jsp").forward(request, response);
                
                break;    
                
                
            // INSERTAR USUARIO
            case 'I': 
                
                mod= new Modelo_Usuario();

                Usuario usuario;
                
                try {
                
                // LLENO CON LOS DATOS ENVIADOS POR EL FORMULARIO
                usuario= new Usuario();

                usuario.setDni_usuario(Integer.parseInt(request.getParameter("txtDni")));
                usuario.setContra_usuario(request.getParameter("txtContra"));
                usuario.setNombres_usuario(request.getParameter("txtNombres"));
                usuario.setApellidos_usuario(request.getParameter("txtApellidos"));
                usuario.setEmail_usuario(request.getParameter("txtEmail"));
                usuario.setDesc_usuario(request.getParameter("txtDescripcion"));
                
                
                
                int existe=mod.existeUser(request.getParameter("txtDni"),"");

                if(existe==1){ // EXISTE EL USUARIO
                    request.setAttribute("ALERTA", "");
                } else {
                    
                    if(mod.insertarUsuario(usuario,Integer.parseInt(request.getParameter("txtCargo")))==1){
                        request.setAttribute("ALERTA", "CORRECTO");
                    } else {
                        request.setAttribute("ALERTA", "INCORRECTO");
                    }

                }

                request.setAttribute("INSERTARUSUARIO", "INSERTARUSUARIO");

                
                request.getRequestDispatcher("Nuevo_Usuario.jsp").forward(request, response);

                
                } catch (IOException | NumberFormatException e) {
                }
                
                break;
            
            //MODIFICAR     
            case 'D':
  
                try {
                    
                    mod= new Modelo_Usuario();

                    // LLENO CON LOS DATOS ENVIADOS POR EL FORMULARIO
                    usuario= new Usuario();

                    usuario.setId_usuario(Integer.parseInt(request.getParameter("txtId")));
                    
                    usuario.setDni_usuario(Integer.parseInt(request.getParameter("txtDni")));
                    usuario.setNombres_usuario(request.getParameter("txtNombres"));
                    usuario.setApellidos_usuario(request.getParameter("txtApellidos"));
                    usuario.setEmail_usuario(request.getParameter("txtEmail"));
                    usuario.setDesc_usuario(request.getParameter("txtDescripcion"));
                    
                    if(request.getParameter("actualiza")!=null){
                        if(request.getParameter("actualiza").equals("actualiza")){

                            session.setAttribute("idCUENTA", String.valueOf(usuario.getId_usuario()));
                            session.setAttribute("dniCUENTA", String.valueOf(usuario.getDni_usuario()));
                            session.setAttribute("nombresCUENTA", usuario.getNombres_usuario());
                            session.setAttribute("apellidosCUENTA", usuario.getApellidos_usuario());
                            session.setAttribute("cargoCUENTA", Integer.parseInt(request.getParameter("txtCargo")));
                            session.setAttribute("emailCUENTA", usuario.getEmail_usuario());
                            session.setAttribute("descCUENTA", usuario.getDesc_usuario());

                        }    
                    }
                    
                    mod.modificarUsuario(usuario,Integer.parseInt(request.getParameter("txtCargo")));
                    
                    if(request.getParameter("actualiza")!=null){
                        if(request.getParameter("actualiza").equals("actualiza")){
                            response.sendRedirect("Inicio.jsp");
                        } 
                    } else {
                            response.sendRedirect("Lista_Usuarios.jsp");
                    }
                
                } catch (IOException | NumberFormatException e) {
                }
                
                break;    

            // INHABILITAR
            case 'E':
            
                try {
                
                    mod= new Modelo_Usuario();

                    int c=0;
                    
                    if(request.getParameter("estado").equals("Activo"))
                        c=1;
                    else if(request.getParameter("estado").equals("Inactivo"))
                        c=0;
                    
                    mod.cambiarEstado(c,Integer.parseInt(request.getParameter("txtId")));
                    
                    response.sendRedirect("Lista_Usuarios.jsp");
                
                } catch (IOException | NumberFormatException e) {
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
