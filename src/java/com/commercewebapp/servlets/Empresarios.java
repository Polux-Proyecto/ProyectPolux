package com.commercewebapp.servlets;

import com.commercewebapp.logics.AdminEmpresas;
import com.commercewebapp.logics.AdminPedidos;
import com.commercewebapp.logics.AdminProductos;
import com.commercewebapp.logics.BuscarUsuario;
import com.commercewebapp.objects.Envio;
import com.commercewebapp.objects.Estadistico;
import com.commercewebapp.objects.InformacionCliente;
import com.commercewebapp.objects.NuevoProducto;
import com.commercewebapp.objects.Stock;
import com.commercewebapp.objects.Usuario;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 * Este es el servidor 1
 * Este servidor administra todo lo qe hagan los empresarios
 * @author Mauricio Aguilar
 */
@MultipartConfig
@WebServlet(name = "Empresarios", urlPatterns = {"/Empresarios"})
public class Empresarios extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    //Pedir el formid y el empresario
        response.setContentType("text/html;charset=UTF-8");
        String  formid = request.getParameter("formid");
        
        switch (formid){
            case "1":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ingresar producto nuevo.">
                
                boolean hasfailed ;
                AdminProductos productos = new AdminProductos();
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                String nombreproducto=request.getParameter("nameProd");
                String strprecioproducto=request.getParameter("precProd");
                int precioproducto= Integer.parseInt(strprecioproducto);
                String descripcionproducto=request.getParameter("descProd");
                int empresaproducto = usuario.getIdUsuario();
                String strcategoriaproducto = request.getParameter("StrCategoria");
                int categoriaproducto = Integer.parseInt(strcategoriaproducto);
                int busquedasproducto = 0;
                String strexistenciasproducto = request.getParameter("cantProd");
                int existenciasproducto= Integer.parseInt(strexistenciasproducto);
                Part fileimagenproducto = request.getPart("resume");
                
                InputStream filecontent = fileimagenproducto.getInputStream();
                byte[] imagenproducto = IOUtils.toByteArray(filecontent);
                System.out.println(Arrays.toString(imagenproducto));
                
                NuevoProducto productoingresado = new NuevoProducto(nombreproducto , precioproducto, descripcionproducto , empresaproducto , categoriaproducto, busquedasproducto, existenciasproducto, imagenproducto);
                hasfailed = productos.crearProducto(productoingresado);
                
                
                if(hasfailed==true)
                {
                    String productoexitoso="25";
                    
                    request.getSession().setAttribute("productoexitoso", productoexitoso);
                    response.sendRedirect("Empresarios?formid=6");
                } 
                else 
                {
                    System.out.println("ha habido un error al ingresar nuevo producto");
                }
                // </editor-fold>
                break;
            }
            case "2":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ir al reporte de ventas.">
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                AdminPedidos buscador = new AdminPedidos();
                List<Estadistico> listaEstadisticos = buscador.getAllEstadisticosPorIdEmpresa(usuario.getIdUsuario());
                List<Estadistico> listaTop5Prod = buscador.getTop5Ventas(usuario.getIdUsuario());
                List<Estadistico> listaTop5Cat = buscador.getTop5Categorias(usuario.getIdUsuario());
                request.getSession().setAttribute("listaEstadisticos", listaEstadisticos);
                request.getSession().setAttribute("listaTop5Prod", listaTop5Prod);
                request.getSession().setAttribute("listaTop5Cat", listaTop5Cat);
                response.sendRedirect("EstadoDeVentas.jsp");
                // </editor-fold>
                break;
            }
            case "3":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ir al reporte de envios pendientes.">
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                AdminEmpresas buscador = new AdminEmpresas();
                List<Envio> lstEnvio = buscador.getEnviosPorId(usuario.getIdUsuario()); 
                request.getSession().setAttribute("lstEnvio", lstEnvio);
                response.sendRedirect("EnviosPend.jsp");
                // </editor-fold>
                break;
            }
            case "4":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ir al reporte de envios pendientes.">
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                AdminEmpresas buscador = new AdminEmpresas();
                List<Envio> lstEnvio = buscador.getEnviosPorId(usuario.getIdUsuario()); 
                request.getSession().setAttribute("lstEnvio", lstEnvio);
                response.sendRedirect("EnviosPend.jsp");
                // </editor-fold>
                break;
            } 
            case "5":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ir al detalle de compra.">
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                String cliente = request.getParameter("idCliente");
                
                
                int idCliente = Integer.parseInt(cliente);
                
                AdminEmpresas buscador = new AdminEmpresas();
                BuscarUsuario buscadorCliente = new BuscarUsuario();
                
                List<Envio> lstEnvio = buscador.getEnviosPorIdEmpYCliente(usuario.getIdUsuario(), idCliente);
                Usuario clienteU = buscadorCliente.getClienteById(idCliente);
                
                request.getSession().setAttribute("lstEnvioPorCliente", lstEnvio);
                request.getSession().setAttribute("clienteU", clienteU);
                request.getRequestDispatcher("DetalleCompra.jsp").forward(request, response); 
                // </editor-fold>
                break;
            }
            case "6":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ir al inventario.">
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                
                AdminEmpresas buscador = new AdminEmpresas();
                
                List<Stock> listaStock = buscador.getInvertarioPorId(usuario.getIdUsuario());
                
                request.getSession().setAttribute("listaStock", listaStock);
                request.getRequestDispatcher("Inventario.jsp").forward(request, response);
                        
                // </editor-fold>
                break;
            }
            case "7":{
                // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Opción para ver los clientes frecuentes.">
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                
                AdminEmpresas buscador = new AdminEmpresas();
                List<Usuario> top10Clientes = buscador.getTop10Clientes(usuario.getIdUsuario());
                List<InformacionCliente> paises = buscador.getTopPaises(usuario.getIdUsuario(), 3);
                List<InformacionCliente> ciudades = buscador.getTopCiudades(usuario.getIdUsuario(), 3);
                InformacionCliente genero = buscador.getTopGenero(usuario.getIdUsuario());
                
                request.getSession().setAttribute("paises", paises);
                request.getSession().setAttribute("ciudades", ciudades);
                request.getSession().setAttribute("genero", genero);
                request.getSession().setAttribute("top10Clientes", top10Clientes);
                
                response.sendRedirect("ClientesFrecuentes.jsp");
                
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
