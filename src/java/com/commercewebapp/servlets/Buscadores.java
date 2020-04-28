/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.servlets;

import com.commercewebapp.logics.AdminCategorias;
import com.commercewebapp.logics.AdminEmpresas;
import com.commercewebapp.logics.AdminProductos;
import com.commercewebapp.objects.Categoria;
import com.commercewebapp.objects.Empresa;
import com.commercewebapp.objects.Precios;
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
 *
 * @author Mauricio Aguilar
 */

@WebServlet(name = "Buscadores", urlPatterns = {"/Buscadores"}) public class Buscadores extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String formid = request.getParameter("formid");
        
        
        switch (formid) {
            case "1":{
                // <editor-fold defaultstate="collapsed" desc="Para las barras de búsqueda">
                    //Es buscador de incioCliente
                    Usuario abs = (Usuario) request.getSession().getAttribute("usuario");
                    if(abs==null){
                        request.getRequestDispatcher("ErrorEnInicioSesion.jsp").forward(request, response);
                    }
                    String palabra = request.getParameter("palabra");
                    AdminProductos buscador = new AdminProductos();
                    List<Producto> listaProductos = buscador.getProductoPorPalabra(palabra);
                    request.getSession().setAttribute("palabra", palabra);
                    request.getSession().setAttribute("listaProductos", listaProductos);
                    response.sendRedirect("Busqueda.jsp");
                    
                    // </editor-fold>
                break;
            }
            case "2":{
                // <editor-fold defaultstate="collapsed" desc="Para las barras de opciones de InicioCliente">
                Usuario abs = (Usuario) request.getSession().getAttribute("usuario");
                if(abs==null){
                    request.getRequestDispatcher("ErrorEnInicioSesion.jsp").forward(request, response);
                }
                    String idCat = request.getParameter("idCat");
                    int idCategoria = Integer.parseInt(idCat);
                    AdminProductos buscador = new AdminProductos();
                    String nombreCategoria = buscador.getNombreCategoriaPorId(idCategoria);
                    List<Producto> listaProductos = buscador.getProductoPorCategoria(idCategoria, true);
                    request.getSession().setAttribute("listaProductos", listaProductos);
                    request.getSession().setAttribute("nombreCategoria", nombreCategoria);
                    request.getRequestDispatcher("CategoriaEmpresas.jsp").forward(request, response);
                    // </editor-fold>
                break;
            }
            case "3":{
                // <editor-fold defaultstate="collapsed" desc="Para la opcion de todas las categorias">
                    Usuario abs = (Usuario) request.getSession().getAttribute("usuario");
                    if(abs==null){
                        request.getRequestDispatcher("ErrorEnInicioSesion.jsp").forward(request, response);
                    }
                    AdminCategorias buscador = new AdminCategorias();
                    int mitad = 0;
                    List<Categoria> listaCategoria = buscador.getAllCategorias();
                    if (listaCategoria!=null){
                        mitad = buscador.getMitadCategorias(listaCategoria.size());
                    }       request.getSession().setAttribute("mitad", mitad);
                    request.getSession().setAttribute("listaCategoria", listaCategoria);
                    request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                    // </editor-fold>
                break;
            }
            case "4":{
                // <editor-fold defaultstate="collapsed" desc="Esta es para la selección de un producto">
                Usuario abs = (Usuario) request.getSession().getAttribute("usuario");
                if(abs==null){
                    request.getRequestDispatcher("ErrorEnInicioSesion.jsp").forward(request, response);
                }
                String idProd = request.getParameter("idProd");
                int idProducto = Integer.parseInt(idProd);
                Empresa empresa = null;
                
                AdminProductos buscadorProd = new AdminProductos();
                AdminEmpresas buscadorEmpr = new AdminEmpresas();
                Producto producto = buscadorProd.getProductoPorId(idProducto);
                if (producto!=null){
                    empresa = buscadorEmpr.getEmpresasPorId(producto.getIdEmpresa());
                }
                request.getSession().setAttribute("producto", producto);
                request.getSession().setAttribute("empresa", empresa);
                request.getRequestDispatcher("MuroProducto.jsp").forward(request, response);
                // </editor-fold>
                break;
            } 
            case "5":{
                // <editor-fold defaultstate="collapsed" desc="Para crear una cuenta empresarial">
                    AdminCategorias buscador = new AdminCategorias();
                    int mitad = 0;
                    List<Categoria> listaCategoria = buscador.getAllCategorias();
                    
                    request.getSession().setAttribute("listaCategoria", listaCategoria);
                    
                    request.getRequestDispatcher("CuentaEmpresa.jsp").forward(request, response);
                    // </editor-fold>
                break;
            }
            case "6" :{
                // <editor-fold defaultstate="collapsed" desc="Para cerrar sesión">
                    request.getSession().removeAttribute("usuario");
                    
                    response.setHeader("Cache-Control","no-cache"); 
                    response.setDateHeader("Expires", 0);
                    response.setHeader("Pragma","no-cache"); 
                    response.sendRedirect("index.jsp");
                    // </editor-fold>
                break;
            }
            case "7":{
                // <editor-fold defaultstate="collapsed" desc="Cargar precios de producto">
                    Usuario abs = (Usuario) request.getSession().getAttribute("usuario");
                    if(abs==null){
                        request.getRequestDispatcher("ErrorEnInicioSesion.jsp").forward(request, response);
                    }   
                    String cant = request.getParameter("cantidad");
                    int cantidad =  Integer.parseInt(cant);
                    Producto producto = (Producto) request.getSession().getAttribute("producto");
                    AdminProductos buscadorProd = new AdminProductos();
                    Precios precios = buscadorProd.getPrecios(producto, cantidad);
                    request.getSession().setAttribute("precios", precios);
                    request.getRequestDispatcher("CompraProducto.jsp").forward(request, response);
                // </editor-fold>
                break;
            }
            case "8":{
                // <editor-fold defaultstate="collapsed" desc="Ir al muro de una empresa">
                Usuario abs = (Usuario) request.getSession().getAttribute("usuario");
                if(abs==null){
                    request.getRequestDispatcher("ErrorEnInicioSesion.jsp").forward(request, response);
                }
                String idEmp = request.getParameter("idEmpresa");
                int idEmpresa = Integer.parseInt(idEmp), mitad = 0;
                AdminProductos buscador = new AdminProductos();
                AdminCategorias admin  = new AdminCategorias();
                AdminEmpresas buscadorEmpresa = new AdminEmpresas();
                List<Producto> lista = buscador.getProductosPorEmpresa(idEmpresa, 40);
                if (lista!=null){
                    mitad = admin.getMitadCategorias(idEmpresa);
                }
                Empresa empresa = buscadorEmpresa.getEmpresasPorId(idEmpresa);
                
                request.getSession().setAttribute("empresa", empresa);
                request.getSession().setAttribute("listaProductos", lista);
                request.getSession().setAttribute("mitad", mitad);
                request.getRequestDispatcher("EmpresaMuro.jsp").forward(request, response);
                
                // </editor-fold>
                break;
            }
            case "9":{
                // <editor-fold defaultstate="collapsed" desc="Cargar precios de producto">
                Usuario abs = (Usuario) request.getSession().getAttribute("usuario");
                if(abs==null){
                    request.getRequestDispatcher("ErrorEnInicioSesion.jsp").forward(request, response);
                }
                    String cant = request.getParameter("cantidad");
                    String idP = request.getParameter("idProd");
                    int idProd = Integer.parseInt(idP);
                    int cantidad =  Integer.parseInt(cant);
                    AdminProductos buscadorProd = new AdminProductos();
                    Producto producto = buscadorProd.getProductoPorId(idProd);
                    Precios precios = buscadorProd.getPrecios(producto, cantidad);
                    request.getSession().setAttribute("precios", precios);
                    request.getSession().setAttribute("producto", producto);
                    request.getRequestDispatcher("CompraProducto.jsp").forward(request, response);
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
