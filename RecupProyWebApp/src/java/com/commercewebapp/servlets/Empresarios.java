package com.commercewebapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
        response.setContentType("text/html;charset=UTF-8");
        String  formid = request.getParameter("formid");
        
        if (formid.equals("11")){
        //Acá está el código si el empresario quiere insertar un nuevo producto
        //Obtenet parámetros
            String  nombre = request.getParameter("nameProd"), 
                    cantidadS = request.getParameter("cantProd"), 
                    costoS = request.getParameter("costoProd"), 
                    descripciónS  = request.getParameter("descProd");
        //Convertir
            int     cantidad = Integer.parseInt(cantidadS);
            double  costo = Double.parseDouble(costoS);
            
        //Ejecutar
            
            
            
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
