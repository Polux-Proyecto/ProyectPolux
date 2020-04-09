<%-- 
    Document   : MuroProducto
    Created on : 04-08-2020, 02:22:54 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Empresa"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    
    Producto producto = (Producto) request.getSession().getAttribute("producto");
    Empresa empresa = (Empresa) request.getSession().getAttribute("empresa");
%>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title><%= producto.getNombre() %></title>
    </head>
    <body>
        <div class="tile is-ancestor">
            <div class="tile is-parent ">
                <div class="tile is-child box">
                    <div class="box">
                        <article class="media">
                            <div class="media-left">
                              <figure class="image is-128x128">
                                <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
                              </figure>
                            </div>
                            <div class="media-content">
                              <div class="content">
                                <p><strong><%= producto.getNombre() %></strong> 
                                  <br>Precio: <%= producto.getPrecio()%>
                                  <br>Descripción: <%= producto.getDescripcion()%>
                                  <br>Empresa: <%= empresa.getNombre() %>
                                </p><br>
                              </div>
                            </div>
                            <nav class="navbar" role="navigation" aria-label="main navigation">
                                <div class="field is-grouped">
                                    <a class="navbar-item">
                                        <div class="control">
                                            <button class="button is-outlined is-danger">Lista de deseos</button>
                                        </div>
                                    </a>
                                    <a class="navbar-item" href="CompraProducto.jsp">
                                        <div class="control">
                                            <button class="button is-outlined ">Comprar</button>
                                        </div>
                                    </a>
                                </div>
                            </nav>
                        </article>
                    </div>
                </div>
             </div>
        </div>
    </body>
</html>
