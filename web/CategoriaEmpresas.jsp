<%-- 
    Document   : CategoriaEmpresas
    Created on : 04-03-2020, 09:48:30 PM
    Author     : Joanna Rivas
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    List<Producto> listaProductos = (List<Producto>) request.getSession().getAttribute("listaProductos");
    String nombreCategoria = (String) request.getSession().getAttribute("nombreCategoria");
    Iterator<Producto> iteProductos = listaProductos.iterator();
    int cantidadProductos = listaProductos.size();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <div>
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
              <a class="navbar-item" href="https://bulma.io">
                <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
              </a>

              <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
              </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
              <div class="navbar-start">
                <a class="navbar-item" href="InicioCliente.jsp">
                  Inicio
                </a>
                 <a class="navbar-item" href="Buscadores?idCat=3&formid=2">
                  Hogar
                </a>
                <a class="navbar-item" href="Buscadores?idCat=5&formid=2">
                  Tecnología
                </a>
                <a class="navbar-item" href="Buscadores?idCat=1&formid=2">
                  Música
                </a>
                <a class="navbar-item" href="Buscadores?idCat=*&formid=2">
                  Todas las categorías
                </a>
              </div>
            </div>

                      <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                      </a>
                    </div>
                    <div id="navbarBasicExample" class="navbar-menu">
                        <div class="navbar-start">
                            <a class="navbar-item" href="InicioCliente.jsp">
                              Inicio
                            </a>
                             <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=3">
                              Hogar
                            </a>
                            <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=5">
                              Tecnología
                            </a>
                            <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=1">
                              Música
                            </a>
                            <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=*">
                              Todas las categorías
                            </a>
                        </div>
                    </div>
                    <div class="navbar-end">
                        <div class="navbar-item">
                            <p class="control">
                                <input class="input" type="text" placeholder="Find a post">
                            </p>
                            <p class="control">
                              <button class="button is-primary">
                                Buscar
                              </button>
                            </p>
                            <div class="buttons">
                                <a class="button is-light">
                                    Cerrar sesión
                                </a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </section>
        <section>
            <div class="tile is-ancestor">
                <div class="tile is-parent ">
                    <div class="tile is-child box">
                        <p class="title"><%= nombreCategoria %></p>
                        <% 
                            if (cantidadProductos==0){
                        %>
                        <div class="box"
                             <p class="title">No hay productos de esta categorías</p>
                        </div>
                        <%
                            } else {
                                Producto productoActual;
                                while (iteProductos.hasNext()){
                                productoActual = iteProductos.next();
                        %>
                        <div class="box">
                            <article class="media">
                                <div class="media-left">
                                  <figure class="image is-128x128">
                                      <a href="EmpresaMuro.jsp"><img src="https://bulma.io/images/placeholders/128x128.png" alt="Image"></a>
                                  </figure>
                                </div>
                                <div class="media-content">
                                  <div class="content">
                                    <p><strong><%= productoActual.getNombre() %></strong> 
                                      <br><%= productoActual.getDescripcion() %>
                                    </p><br>
                                  </div>
                                </div>
                            </article>
                        </div>
                        <% 
                            }
                        }
                        %>
                    </div>
                </div>
            </div>
        </section>    
    
</html>
