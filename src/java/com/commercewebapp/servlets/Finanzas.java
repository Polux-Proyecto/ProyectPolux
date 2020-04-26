/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.servlets;

import com.commercewebapp.logics.AdminFinanzas;
import com.commercewebapp.logics.AdminPedidos;
import com.commercewebapp.objects.Tarjetas;
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
            case "2":{
                // <editor-fold defaultstate="collapsed" desc="Ir a Pago producto">
                AdminFinanzas adminFinanzas = new AdminFinanzas();
                String idClient = request.getParameter("idCliente");
                int idCliente = Integer.parseInt(idClient);
                List<Tarjetas> tarjetas = adminFinanzas.getTarjetasByIdCliente(idCliente);
                
                request.getSession().setAttribute("tarjetas", tarjetas);
                response.sendRedirect("PagoProducto.jsp");
                //</editor-fold>
                break;
            }
            case "3":{
                // <editor-fold defaultstate="collapsed" desc="Agregar una targeta">
                AdminFinanzas admin = new AdminFinanzas();
                String propietario  = request.getParameter("Dueno");
                String codigo  = request.getParameter("codigo");
                String numero  = request.getParameter("numero");
                String mes  = request.getParameter("mes");
                String anno  = request.getParameter("anno");
                String idClient  = request.getParameter("idCliente");
                int idCliente = Integer.parseInt(idClient);
                String tipo  = request.getParameter("Tipo");
                anno = anno.substring(2, 4);
                
                Tarjetas tarjeta = new Tarjetas(propietario, tipo, numero, codigo, mes, anno, 0, idCliente);
                
                boolean hasFailed = admin.setNuevaTarjeta(tarjeta);
                
                response.sendRedirect("Finanzas?formid=2&idCliente="+idCliente);
                
                //</editor-fold>
                break;
            }
            case "4":{
                // <editor-fold defaultstate="collapsed" desc="Pagar un producto">
                
                
                
                //</editor-fold>
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
