/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.servlets;

import com.commercewebapp.logics.AdminProductos;
import com.commercewebapp.objects.Producto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mauricio Aguilar
 */

@WebServlet(name = "Buscadores", urlPatterns = {"/Buscadores"}) public class Buscadores extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String formid = request.getParameter("formid");
        
        
        if(formid.equals("1")){
            // <editor-fold defaultstate="collapsed" desc="Para las barras de búsqueda">
            //Es buscador de incioCliente
            
            String palabra = request.getParameter("palabra");
            AdminProductos buscador = new AdminProductos();
            
            List<Producto> listaProductos = buscador.getProductoPorPalabra(palabra);
            
            
            response.sendRedirect("CategoriaEmpresas.jsp");
            /* TODO output your page here. You may use following sample code. */
            // </editor-fold>
        } else if (formid.equals("2")){
            // <editor-fold defaultstate="collapsed" desc="Para las barras de opciones de InicioCliente">
            String idCat = request.getParameter("idCat");
            int idCategoria = Integer.parseInt(idCat);
            AdminProductos buscador = new AdminProductos();
            String nombreCategoria = buscador.getNombreCategoriaPorId(idCategoria);
            List<Producto> listaProductos = buscador.getProductoPorCategoria(idCategoria, true);
            
            request.getSession().setAttribute("listaProductos", listaProductos);
            request.getSession().setAttribute("nombreCategoria", nombreCategoria);
            request.getRequestDispatcher("CategoriaEmpresas.jsp").forward(request, response);
            // </editor-fold>
        } else if (formid.equals("3")){
            // <editor-fold defaultstate="collapsed" desc="Para las barras de opciones de InicioCliente">
            
            
            
            // </editor-fold>
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
