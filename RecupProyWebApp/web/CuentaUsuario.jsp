<%-- 
    Document   : CuentaUsuario
    Created on : 03-05-2020, 10:59:31 AM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.NuevoUsuarioParticular"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    NuevoUsuarioParticular usuarioexistente = (NuevoUsuarioParticular)session.getAttribute("nuevouser");
    String bdnombre="";
    String bdemail="brocolin@brocomail.com";
    String bdpassword="";
    String bdpais ="";
    String bdciudad ="";
    String bddireccion ="";
    String message= "";
         
    
    if (usuarioexistente!=null)
    {
           bdnombre = usuarioexistente.getName();
           bdemail = usuarioexistente.getEmail();
           bdpassword = usuarioexistente.getPassword();
           bdpais = usuarioexistente.getPais();
           bdciudad = usuarioexistente.getCiudad();
           bddireccion = usuarioexistente.getDireccion();
           
            message = "El usuario ya existe, por favor intente con otro";
           
    }
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Crea una cuenta empresarial</title>
    </head>
    <form id="Nuevousuarioform" name="Nuevousuarioform" action="LogicRegistroNuevoUsuarioServlet" method="post">
    <body>
        <section class="section">
            <div class="container">
                <h1 class="title">
                    Crea una cuenta
                </h1>
                <h2 class="title-2">
                    Es fácil y rápido
                </h2>
                
            </div>
        <div class="field">
            <label class="label">Nombre</label>
                <div class="control">
                    <input id="strnewNombreUsuario" name="strnewNombreUsuario" class="input" type="text" placeholder="Text input" value=<%=bdnombre%>>
                </div>
        </div>

        <div class="field">
            <label class="label">Username</label>                
            <div class="subtitle has-text-danger" ><%= message %></div>
                <div class="control has-icons-left has-icons-right">
                    <input id="strNewUsername" name="strNewUsername" class="input is-success" type="text" placeholder="Text input" value="bulma">
                    <span class="icon is-small is-left">
                        <i class="fas fa-user"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i class="fas fa-check"></i>
                    </span>
                </div>
            
        </div>

        <div class="field">
          <label class="label">Email</label>
          <div class="control has-icons-left has-icons-right">
            <input id="strNewEmail" name="strNewEmail" class="input is-danger" type="email" placeholder="Email input" value=<%=bdemail%>>
            <span class="icon is-small is-left">
              <i class="fas fa-envelope"></i>
            </span>
            <span class="icon is-small is-right">
              <i class="fas fa-exclamation-triangle"></i>
            </span>
          </div>
        </div>
        
        <div class="field">
            <label class="label">Contraseña</label>
                <div class="control">
                    <input name="newpassword" id="newpassword" class="input" type="password" placeholder="Text input">
                </div>
        </div>

        <div class="field is-grouped">
          <div class="control">
            <button class="button is-link">Submit</button>
          </div>
          <div class="control">
            <button class="button is-link is-light">Cancel</button>
          </div>
        </div>
    </section>
    <input type="hidden" name="formid" value="1" />
    </form>
    </body>
</html>