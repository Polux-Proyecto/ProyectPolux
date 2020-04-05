<%-- 
    Document   : InicioEmpresa
    Created on : 03-05-2020, 11:31:15 AM
    Author     : Joanna Rivas
    Errores    : 
        1 - No se pudo insertar el producto ingresado
    Mensajes   :
        1 - El producto se ingresó con éxito
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  Usuario usuario = (Usuario) request.getSession().getAttribute("usuario"); %>
<!DOCTYPE html>
<% 
    String error = request.getParameter("Error"), mensaje = request.getParameter("Mensaje"), avisoE = "", avisoM = "";
    
    if(error!= null){
        if (error.equals("1")){
            avisoE = "El producto no pudo ser ingresado, inténtelo de nuevo";
        }
    } else {
        error = "";
    }
    if(mensaje!=null){
        if (mensaje.equals("1")){
            avisoM = "El producto fue ingresado correctamente";
        }
    } else {
        mensaje = "";
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>InicioEmpresa</title>
    </head>
    <body><br>
        <section class="section">
            <div class="container">
                <h1 class="title">
                    ¡Bienvenido, <%=usuario.getNombre() %>!
                </h1>
            </div>
        </section>
        <section class="section">
            <div class="tile is-ancestor">
                <div class="tile is-vertical">
                <div class="tile">
                  <div class="tile is-parent is-vertical">
                    <article class="tile is-child box">
                        <form name="FrmNuevoProd" action="Empresarios" method="get" id="FrmNuevoProd">
                            <p class="title">Añadir Producto</p>
                            <p class="subtitle has-text-danger"><%= avisoE %></p>
                            <p class="subtitle has-text-success"><%= avisoM %></p>
                            <p class="subtitle">Agrega nuevos productos a tu inventario</p>
                            <div class="field">
                                <label>Nombre del producto:</label>
                                <div class="control">
                                  <input class="input" type="text" name="nameProd" id="nameProd"/>
                                </div>
                            </div>
                            <div class="field">
                                <label>Imagen de Producto</label>
                                <div class="control">
                                    <div class="file has-name is-right">
                                        <label class="file-label">
                                          <input class="file-input" type="file" name="resume">
                                          <span class="file-cta">
                                            <span class="file-icon">
                                              <i class="fas fa-upload"></i>
                                            </span>
                                            <span class="file-label">
                                              Choose a file…
                                            </span>
                                          </span>
                                          <span class="file-name">
                                            Screen Shot 2017-07-29 at 15.54.25.png
                                          </span>
                                        </label>
                                      </div>
                                </div>
                            </div>
                            <div class="field">
                                <label>Cantidad:</label>
                                <div class="control">
                                  <input class="input" type="number" name="cantProd" id="cantProd" min="1"/>
                                </div>
                            </div>
                            <div class="field">
                                <label>Precio Unitario:</label>
                                <div class="control">
                                  <input class="input" type="number" name="precProd" id="precProd" min="1"/>
                                </div>
                            </div>
                            <div class="field">
                                <label>Costo Unitario:</label>
                                <div class="control">
                                  <input class="input" type="double" name="costoProd" id="costoProd" min="0.01"/>
                                </div>
                            </div>
                            <div class="field">
                                <label>Descripción:</label>
                                <div class="control">
                                  <input class="input" type="text" name="descProd" id="descProd"/>
                                </div>
                            </div>
                            <div class="field">
                                <div class="control">
                                    <input type="hidden" name="formid" value="11" /><!--El 11 significa que va al servidor 1 y que es el form 1 -->
                                    <input class="button is-link" type="submit" value="send"/>
                                </div>
                            </div>
                        </form>

                    </article>
                            <article class="tile is-child box">
                                <a href="EnviosPend.jsp"><h1 class="title">Envíos</h1>></a>
                              <p class="subtitle">Revisa tus envíos pendientes</p>
                            </article>
                  </div>
                  <div class="tile is-parent">
                    <article class="tile is-child box">
                      <p class="title">Estado de Cuenta</p>
                      <p class="subtitle">Ingresos</p>
                      <p class="subtitle">Artículos más vendidos</p>
                      <p class="list-item">a</p>
                      <p class="list-item">b</p>
                      <p class="subtitle">Productos en inventario</p>
                      <p class="list-item">a</p>
                      <p class="list-item">b</p>
                      <p class="subtitle">Productos agotados</p>
                      <p class="list-item">a</p>
                      <p class="list-item">b</p>
                    </article>
                  </div>
                </div>
            </div>
        </section>
        
            
        </section>
    </body>
</html>
