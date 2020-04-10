package com.commercewebapp.servlets;

import com.commercewebapp.logics.AdminPedidos;
import com.commercewebapp.logics.AdminProductos;
import com.commercewebapp.objects.Estadistico;
import com.commercewebapp.objects.Producto;
import com.commercewebapp.objects.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Este es el servidor 1
 * Este servidor administra todo lo qe hagan los empresarios
 * @author Mauricio Aguilar
 */

@WebServlet(name = "Empresarios", urlPatterns = {"/Empresarios"})
public class Empresarios extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    //Pedir el formid y el empresario
        response.setContentType("text/html;charset=UTF-8");
        String  formid = request.getParameter("formid");
        
        switch (formid){
            case "1":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ingresar producto nuevo.">
                
                
                // </editor-fold>
                break;
            }
            case "2":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ingresar producto nuevo.">
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                AdminPedidos buscador = new AdminPedidos();
                List<Estadistico> listaEstadisticos = buscador.getAllEstadisticosPorIdEmpresa(usuario.getIdUsuario());
                
                request.getSession().setAttribute("listaEstadisticos", listaEstadisticos);
                response.sendRedirect("EstadoDeVentas.jsp");
                // </editor-fold>
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
