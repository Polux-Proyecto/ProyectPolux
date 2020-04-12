package com.commercewebapp.servlets;

import com.commercewebapp.logics.BuscarUsuario;
import com.commercewebapp.objects.NuevoMicroEmpresario;
import com.commercewebapp.objects.NuevoUsuarioParticular;
import com.commercewebapp.objects.Usuario;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;
/**
 * Este es el servidor -1
 * @author Rodrigo Salazar
 */
@MultipartConfig
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
                Part fileimagenperfil = request.getPart("resume");
                String struser = request.getParameter("strNewUsername");
                String stremail = request.getParameter("strNewEmail");
                String strpassword = request.getParameter("newpassword");
                String strsexo = request.getParameter("StringNewSexo");
                String strdia = request.getParameter("StringNewBornDay");
                String strmes = request.getParameter("StringNewBornMonth");
                String stranno = request.getParameter("StringNewUseryear");
                String strFechaNacimiento = strdia + "/" + strmes + "/" + stranno;
                String strpais = request.getParameter("StringNewCountry");
                String strciudad = request.getParameter("strnewCiudadUsuario");
                String strdireccion = request.getParameter("strnewDireccionUsuario");
                
                InputStream filecontent = fileimagenperfil.getInputStream();
                byte[] imagenperfil = IOUtils.toByteArray(filecontent);
                
                Usuario usuario = buscador.getAllUsers(struser);
                itype=1;
                
                if (usuario.isMicroEmpresario()==usuario.isUsuario())
                {
                    //el usuario no existe
                    NuevoUsuarioParticular nuevouser = new NuevoUsuarioParticular(strname, struser, stremail, strpassword, strpais, strciudad, strdireccion,strsexo,strFechaNacimiento,imagenperfil);
                    hasfailed = buscador.createnewuser(nuevouser,null);
                    String codigo = "27";
                    request.getSession().setAttribute("nuevouser", struser);
                    request.getSession().setAttribute("codigo", codigo);
                    response.sendRedirect("index.jsp");
                    
                }
                else
                {
                    //usuario ya existente
                    String error = "1";
                    NuevoUsuarioParticular nuevouser = new NuevoUsuarioParticular(strname, struser, stremail, strpassword, strpais, strciudad, strdireccion,strsexo,strFechaNacimiento,imagenperfil);
                    request.getSession().setAttribute("usuarioexistente", nuevouser);
                    request.getSession().setAttribute("error",error);
                    request.getSession().setAttribute("imagenfile", fileimagenperfil);
                    request.getSession().setAttribute("day", strdia);
                    request.getSession().setAttribute("month", strmes);
                    request.getSession().setAttribute("year", stranno);
                    response.sendRedirect("CuentaUsuario.jsp");
                }
                        
            }
            
            if(strForm.equals("2")){
                String strname= request.getParameter("nombreEmp");
                String struser= request.getParameter("userEmp");
                String stremail = request.getParameter("strNewEmail");
                String strnit= request.getParameter("nit");
                String strpassword = request.getParameter("passEmp");
                String strpais = request.getParameter("StringNewCountryEmp");
                String strciudad = request.getParameter("strnewCiudadEmp");
                String strcategoria = request.getParameter("StrCategoria");
                int intcategoria = Integer.parseInt(strcategoria);
                String strdescripcion = request.getParameter("descEmp");
                Part fileimagenperfil = request.getPart("resume");
                
                InputStream filecontent = fileimagenperfil.getInputStream();
                byte[] imagenlogo = IOUtils.toByteArray(filecontent);
                
                Usuario usuario = buscador.getAllUsers(struser);
                itype=2;
                
                if (usuario.isMicroEmpresario()==usuario.isUsuario())
                {
                    //usuario no existe               
                    NuevoMicroEmpresario nuevoempresario = new NuevoMicroEmpresario(strname,struser,strnit,strpassword,strdescripcion,stremail,strpais,strciudad,intcategoria,imagenlogo);
                    hasfailed = buscador.createnewuser(null, nuevoempresario);
                    String codigo = "27";
                    request.getSession().setAttribute("nuevouser", struser);
                    request.getSession().setAttribute("codigo", codigo);
                    response.sendRedirect("index.jsp");
                }
                else
                {
                    //usuario existe
                    String error = "2";
                    NuevoMicroEmpresario nuevoempresario = new NuevoMicroEmpresario(strname,struser,strnit,strpassword,strdescripcion,stremail,strpais,strciudad,intcategoria,imagenlogo);
                    request.getSession().setAttribute("usuarioexistente", nuevoempresario);
                    request.getSession().setAttribute("error",error);
                    response.sendRedirect("CuentaEmpresa.jsp");
                    
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
