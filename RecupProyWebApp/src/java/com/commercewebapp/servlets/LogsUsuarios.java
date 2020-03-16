/*
    Este servlet envía los datos de registro de los usuarios al objeto BuscarUsuario. 
    Es necesario que estes los jar de Sql y BalCorpFWJavaLibrary y StudentJars
 */
package com.commercewebapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.commercewebapp.logics.BuscarUsuario;
import com.commercewebapp.objects.Usuario;

/*
 * @author Mauricio Aguilar
 */
@WebServlet(name = "LogsUsuarios", urlPatterns = {"/LogsUsuarios"})
public class LogsUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String strNombre = request.getParameter("nombreis");
        String strClave = request.getParameter("passis");
        
        BuscarUsuario buscar = new BuscarUsuario(strNombre, strClave);
        Usuario usuario;
        
        usuario = buscar.buscar(); //Este método busca si el usuario existe o no
        
        if(buscar.isAutorizado()){
            
        } else {
            response.sendRedirect("index.html"); //En el caso que no se haya encontrado
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
