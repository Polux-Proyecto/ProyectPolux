package com.commercewebapp.servlets;

import com.commercewebapp.logics.BuscarUsuario;
import com.commercewebapp.objects.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Este es el servidor 0
 * Este servidor solamente sirve para el loggeo de los usuarios
 * @author Mauricio Aguilar
 */
@WebServlet(name = "LoggeoUsuarios", urlPatterns = {"/LoggeoUsuarios"}) public class LoggeoUsuarios extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        BuscarUsuario   buscador = new BuscarUsuario();
        String  nombre = request.getParameter("nameis");
        String  clave = request.getParameter("passis");
        Usuario usuario = buscador.getAllUsers(nombre);
        
        if (!usuario.isMicroEmpresario()==usuario.isUsuario()){
            String claveIngresada = usuario.getContra();
            if (claveIngresada.equals(clave)){
                System.out.println("Las claves coinciden");
                request.getSession().setAttribute("usuario", usuario);
                if (usuario.isMicroEmpresario()){
                    request.getSession().setAttribute("usuario", usuario);
                    request.getRequestDispatcher("InicioEmpresa.jsp").forward(request, response);
                } else if (usuario.isUsuario()){
                    request.getSession().setAttribute("usuario", usuario);
                    request.getRequestDispatcher("InicioCliente.jsp").forward(request, response);
            }
                
            } else {
                System.out.println("Las contraseñas no coinciden");
                String  error = "1";
                request.getSession().setAttribute("error",error );
                response.sendRedirect("index.jsp"); //1 significa que las contraseñas no coincidieron
            }
        } else {
            String  error = "2";
            System.out.println("El usuario no se encontró"); //2 significa que el usuario no existe
            request.getSession().setAttribute("error",error );
            response.sendRedirect("index.jsp?");
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
