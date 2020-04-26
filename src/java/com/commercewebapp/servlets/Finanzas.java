/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.servlets;

import com.commercewebapp.logics.AdminPedidos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 78GDO
 */
@WebServlet(name = "Finanzas", urlPatterns = {"/Finanzas"})
public class Finanzas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String formid = request.getParameter("formid");
        
        switch (formid){
            case "1":{
                // <editor-fold defaultstate="collapsed" desc="Añadir a lista de deseos">
                AdminPedidos adminProd = new AdminPedidos();
                String idClient = request.getParameter("idCliente");
                String idProd = request.getParameter("idProd"), h = "";
                int idCliente = Integer.parseInt(idClient);
                int idProducto = Integer.parseInt(idProd);
                
                boolean hasFailed = adminProd.setListaDeseos(idCliente, idProducto);
                
                
                if (!hasFailed){
                    h = "0";
                    request.getSession().setAttribute("h", h);
                    response.sendRedirect("MuroProducto.jsp");
                } else {
                    h = "1";
                    request.setAttribute("h", h);
                    request.getRequestDispatcher("MuroProducto.jsp").forward(request, response);
                }
                //</editor-fold>
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
