package com.commercewebapp.servlets;

import com.commercewebapp.logics.BuscarUsuario;
import com.commercewebapp.objects.NuevoMicroEmpresario;
import com.commercewebapp.objects.NuevoUsuarioParticular;
import com.commercewebapp.objects.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Este es el servidor -1
 * @author Rodrigo Salazar
 */

@WebServlet(name = "LogicRegistroNuevoUsuarioServlet", urlPatterns = {"/LogicRegistroNuevoUsuarioServlet"})
public class LogicRegistroNuevoUsuarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String strForm = request.getParameter("formid");
            BuscarUsuario buscador = new BuscarUsuario();
            int itype =0;
            boolean hasfailed;
            
            if(strForm.equals("1")){
                String strname = request.getParameter("strnewNombreUsuario");
                String struser = request.getParameter("strNewUsername");
                String stremail = request.getParameter("strNewEmail");
                String strpassword = request.getParameter("newpassword");
                String strpais = request.getParameter("strPais");
                String strciudad = request.getParameter("strciudad");
                String strdireccion = request.getParameter("strdireccion");
                
                Usuario usuario = buscador.getAllUsers(struser);
                itype=1;
                
                if (usuario.isMicroEmpresario()==usuario.isUsuario())
                {
                    //el usuario no existe
                    NuevoUsuarioParticular nuevouser = new NuevoUsuarioParticular(strname, struser, stremail, strpassword, strpais, strciudad, strdireccion);
                    hasfailed = buscador.createnewuser(nuevouser,null);
                }
                else
                {
                    //usuario ya existente
                    response.sendRedirect("CuentaUsuario.jsp?error=1");
                }
                        
            }
            
            if(strForm.equals("2")){
                String strname= request.getParameter("nombreEmp");
                String struser= request.getParameter("userEmp");
                String strnit= request.getParameter("nit");
                String strpassword = request.getParameter("passEmp");
                String strdescripcion = request.getParameter("descEmp");
                
                Usuario usuario = buscador.getAllUsers(struser);
                itype=2;
                
                if (usuario.isMicroEmpresario()==usuario.isUsuario())
                {
                    //usuario no existe
                    NuevoMicroEmpresario nuevoempresario = new NuevoMicroEmpresario(strname,struser,strnit,strpassword,strdescripcion);
                    hasfailed = buscador.createnewuser(null, nuevoempresario);
                }
                else
                {
                    //usuario existe
                    response.sendRedirect("CuentaEmpresa.jsp?error=1");
                }
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
