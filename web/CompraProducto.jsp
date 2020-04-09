<%-- 
    Document   : CompraProducto
    Created on : 04-03-2020, 09:50:06 PM
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
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title><%= producto.getNombre() %></title>
    </head>
    <body>
        <form class="Pago" id="NuevaCompraForm" method="get" action="PagoProducto.jsp">
                <figure class="image is-128x128 is-centered">
                    <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
                </figure>
                <div class="field">
                    <label class="label"><h1> Cantidad:</h1></label>
                    <div class="control">
                        <input class="input" type="number" name="cantComprada" id="cantComprada" placeholder="Text input">
                    </div>
                </div>
                <div class="field">
                    <label class="label"><h1> Precio Unitario:</h1></label>
                    <div class="control">
                        <p class="subtitle"><%= producto.getPrecio() %></p>
                    </div>
                </div>
                <div class="field">
                    <label class="label"><h1> Cargo por Envío:</h1></label>
                    <div class="control">
                        <p class="subtitle"><%= producto.getPrecio()*0.15 %></p>
                    </div>
                </div>
                <div class="field">
                    <label class="label"><h1> Total a Pagar:</h1></label>
                    <div class="control">
                        <p class="subtitle"><%= producto.getPrecio()*1.15 %></p>
                    </div>
                </div>
                <div class="field is-grouped">
                    <div class="control">
                        <button class="button is-link">Continuar</button>
                    </div>
                    <div class="control">
                        <button class="button is-link is-light">Cancelar</button>
                    </div>
                </div>
        </form>
    </body>
</html>
