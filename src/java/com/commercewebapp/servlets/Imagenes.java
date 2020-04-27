/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.servlets;

import com.commercewebapp.objects.Categoria;
import com.commercewebapp.objects.DefaulImage;
import com.commercewebapp.objects.Producto;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 78GDO
 */
@WebServlet(name = "Imagenes", urlPatterns = {"/Imagenes"})
public class Imagenes extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String formid = request.getParameter("formid");
       
        
        switch (formid){
            case "1":{
                // <editor-fold defaultstate="collapsed" desc="Para imágenes en Productos.">
                //Cuando viene de loggeo usuario
                String k = request.getParameter("idImgen");
                String att = request.getParameter("att");
                int i = Integer.parseInt(k);
                List<Producto> lista = (List<Producto>) request.getSession().getAttribute(att);
                
                byte[] img = null;
                OutputStream out = null;
                

                img =  lista.get(i).getImagen();
                if (img == null){
                    DefaulImage defImage = (DefaulImage) request.getSession().getAttribute("imgD");
                    img = defImage.getImg();
                }
                response.setContentType("image/gif");
                    out = response.getOutputStream();
                    out.write(img);
                    out.flush();
                    out.close();
                
                // </editor-fold>
                break;
            }
            case "2":{
                // <editor-fold defaultstate="collapsed" desc="Para desplegar imagenes de categorias">
                String k = request.getParameter("idImgen");
                String att = request.getParameter("att");
                int i = Integer.parseInt(k);
                List<Categoria> lista = (List<Categoria>) request.getSession().getAttribute(att);
                
                byte[] img = null;
                OutputStream out = null;
                

                img =  lista.get(i).getImg();
                
                if (img == null){
                    DefaulImage defImage = (DefaulImage) request.getSession().getAttribute("imgD");
                    img = defImage.getImg();
                }
                response.setContentType("image/gif");
                    out = response.getOutputStream();
                    out.write(img);
                    out.flush();
                    out.close();
                
                // </editor-fold>
                break;
            }
            case "3":{
                // <editor-fold defaultstate="collapsed" desc="Para desplegar imagenes de producto en MuroProducto o Pago producto">
                String att = request.getParameter("att");
//                Producto producto = (Producto) request.getSession().getAttribute(att);
                Producto producto = (Producto) request.getSession().getAttribute("producto");
                request.getSession().setAttribute(att, producto);
                byte[] img = null;
                OutputStream out = null;
                

                img =  producto.getImagen();
                if (img == null){
                    DefaulImage defImage = (DefaulImage) request.getSession().getAttribute("imgD");
                    img = defImage.getImg();
                }
                response.setContentType("image/gif");
                    out = response.getOutputStream();
                    out.write(img);
                    out.flush();
                    out.close();
                // </editor-fold>
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
