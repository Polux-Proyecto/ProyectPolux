<%-- 
    Document   : MuroProducto
    Created on : 04-08-2020, 02:22:54 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Precios"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="com.commercewebapp.objects.Empresa"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion");
    }
    String hasFailed = (String) request.getSession().getAttribute("h");
    if (hasFailed == null){
        hasFailed = "2";
    }
    Producto producto = (Producto) request.getSession().getAttribute("producto");
    Empresa empresa = (Empresa) request.getSession().getAttribute("empresa");
    String  logo = (String)  request.getSession().getAttribute("logo");
    Precios precios = (Precios) request.getSession().getAttribute("precios");
        
%>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title><%= producto.getNombre() %></title>
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
				<nav class="navbar" role="navigation" aria-label="main navigation">
					<div class="navbar-brand">
						<a class="navbar-item" href="InicioCliente.jsp">
						  <img src= "<%= logo %>" width="197" height="60">
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
        <div class="tile is-ancestor">
            <div class="tile is-parent ">
                <div class="tile is-child box">
                    <div class="box" style="border: lightgray 2px inset">
                        <article class="media">
                            <div class="media-left">
								<figure class="image is-128x128">
									<img src="Imagenes?formid=3&att=producto" alt="Image">
								</figure>
                            </div>
                            <div class="media-content">
								<div class="content">
									<p><strong><%= producto.getNombre() %></strong> 
										<br>Precio: <%= producto.getPrecio() %>
										<br>Descripción: <%= producto.getDescripcion()%>
										<br>Empresa: <a href="Buscadores?formid=8&idEmpresa=<%= producto.getIdEmpresa() %>"><%= empresa.getNombre() %></a>
									</p><br>
								</div>
                            </div>
                            <nav class="navbar" role="navigation" aria-label="main navigation">
                                <div class="field is-grouped">
                                    
                                        
                                    <% if (hasFailed.equals("2")){ %>
                                    <div class="control">
                                        <a class="navbar-item" href="Finanzas?formid=1&idProd=<%= producto.getId() %>&idCliente=<%= usuario.getIdUsuario() %>">
                                            <button class="button is-outlined is-danger" >Lista de deseos</button>
                                        </a>
                                    </div>
                                    <% } else if (hasFailed.equals("1")){ 
                                        request.getSession().setAttribute("h", "2");
                                    %>
                                    <div class="subtitle has-text-danger" >Hubo un error</div><br>
                                    <a class="navbar-item" href="Finanzas?formid=1&idProd=<%= producto.getId() %>&idCliente=<%= usuario.getIdUsuario() %>">
                                            <button class="button is-outlined is-danger" >Lista de deseos</button>
                                    </a>
                                    <% } else if (hasFailed.equals("0")){ 
                                        
                                        request.getSession().setAttribute("h", "2");
                                    %>
                                    <div class="subtitle has-text-success" >Tu producto se añadió correctamente</div><br>
                                    <a class="navbar-item" href="Finanzas?formid=1&idProd=<%= producto.getId() %>&idCliente=<%= usuario.getIdUsuario() %>">
                                            <button class="button is-outlined is-danger" >Lista de deseos</button>
                                    </a>
                                    
                                    <% } %>
                                    <a class="navbar-item" href="Buscadores?formid=7&cantidad=1">
                                        <div class="control">
                                            <button class="button is-outlined">Comprar</button>
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
