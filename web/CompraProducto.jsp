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
		<style>
			body{
				background:#508329
			}
			.color1{
				background-color: #93d250
			}
			.color2{
				background-color: #508329
			}
			.color3{
				background-color: #dce5d2
			}
		</style>
    </head>
    <body>
		<section>
			<div>
				<nav class="navbar" role="navigation" aria-label="main navigation">
					<div class="navbar-brand">
					  <a class="navbar-item" href="InicioCliente.jsp">
						<img src="https://lh5.googleusercontent.com/iW2Jwicwe-GQ_iRcZ701dOarjhCOinwnSHh7PllNdHqfJ7c1uF_vFBIuXxZ-FERn6iiifZdkTCcO1r1xO3_OrW2-kIt5bKQyccLPGMlkRuyJzYGrGg=w1280" width="197" height="60">
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
							<form action="Buscadores" method="get" name="buscador">
								<p class="control">
								  <input class="input" type="text" placeholder="Find a post" name="palabra" id="palabra">
								</p>
								<p class="control">
								  <button class="button color1">
									Buscar
								  </button>
								<input type="hidden" id="formid" name="formid" value="1">
							</form>
							<div class="buttons">
								<a class="button color2">
								  Cerrar sesión
								</a>
							</div>
						</div>
                  
					</div>
				</nav>
            </div>
        </section>
        <section>
			<div class="tile is-parent">
				<article class="tile is-child box">
					<form class="Pago" id="NuevaCompraForm" method="get" action="PagoProducto.jsp">
						<div>
							<figure class="image is-128x128 is-centered">
								<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image" align="left">
							</figure>
							<h1>
								Descripción:
							</h1>
							<p>
								(Descripción)
							</p>
						</div>
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
				</article>
			</div>
		</section>
    </body>
</html>
