<%-- 
    Document   : CategoriaEmpresas
    Created on : 04-03-2020, 09:48:30 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion");
    }
    List<Producto> listaProductos = (List<Producto>) request.getSession().getAttribute("listaProductos");
    String nombreCategoria = (String) request.getSession().getAttribute("nombreCategoria");
    Iterator<Producto> iteProductos = listaProductos.iterator();
    int cantidadProductos = listaProductos.size();
    String ref = "";
	String  logo = (String)  request.getSession().getAttribute("logo");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title><%= nombreCategoria %></title>
		<style>
			.color1{
				background-color: #93d250
			}
			.color2{
				background-color: #508329
			}
			.color3{
				background-color: #dce5d2
			}
			.form-inline {  
				display: flex;
				flex-flow: row wrap;
				align-items: center;
			}
		</style>
    </head>
    <body>
        <section>
            <div>
                <nav class="navbar is-light" role="navigation" aria-label="main navigation">
                        <div class="navbar-brand">
                                <a class="navbar-item" href="InicioCliente.jsp">
                                  <img src="<%= logo %>" width="197" height="60">
                                </a>
                                <a role="button" class="navbar is-white" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                                  <span aria-hidden="true"></span>
                                  <span aria-hidden="true"></span>
                                  <span aria-hidden="true"></span>
                                </a>
                        </div>

                        <div id="navbarBasicExample" class="navbar-menu">
                                <!--  
                                Los Ids de las categorías más importantes son:
                                Música - 1; Ropa, zapatos, joyería y relojes - 2; Hogar y cocina - 3; Electrónicos - 5; 
                                -->
                                <div class="navbar-start">
                                        <a class="navbar-item" href="InicioCliente.jsp">
                                          Inicio
                                        </a>
                                        <a class="navbar-item" href="Buscadores?formid=2&idCat=3">
                                          Hogar
                                        </a>
                                        <a class="navbar-item" href="Buscadores?idCat=5&formid=2">
                                          Tecnología
                                        </a>
                                        <a class="navbar-item" href="Buscadores?idCat=1&formid=2">
                                          Música
                                        </a>
                                        <a class="navbar-item" href="Buscadores?formid=3">
                                          Todas las categorías
                                        </a>
                                </div>
                        </div>

                        <div class="navbar-end">

                                <div class="navbar-item">
                                        <form action="Buscadores" method="get" name="buscador" class="form-inline">
                                                <p class="control">
                                                        <input class="input" type="text" placeholder="Find a post" name="palabra" id="palabra">
                                                </p>
                                                <p class="control">
                                                        <button class="button color1">
                                                                Buscar
                                                        </button>
                                                        <input type="hidden" id="formid" name="formid" value="1">
                                                </p>
                                        </form>
                                        <div class="buttons">
                                            <a class="button color2" href="index.jsp">
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
						<div class="box" style="border: lightgray 2px inset">
							<p class="title">No hay productos de esta categorías</p>
						</div>
						<%
							} else {
								Producto productoActual;
								while (iteProductos.hasNext()){
								productoActual = iteProductos.next();
								ref = "Buscadores?formid=4&idProd="+productoActual.getId();
						%>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<a href= "<%= ref %>" ><img src="https://bulma.io/images/placeholders/128x128.png" alt="Image"></a>
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<a href= "<%= ref %>" ><strong><%= productoActual.getNombre() %></strong></a>
										<p><br><%= productoActual.getDescripcion() %>
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
    </body>
</html>
