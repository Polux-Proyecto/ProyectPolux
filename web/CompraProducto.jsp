<%-- 
    Document   : CompraProducto
    Created on : 04-03-2020, 09:50:06 PM
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
    Producto producto = (Producto) request.getSession().getAttribute("producto");
    Empresa empresa = (Empresa) request.getSession().getAttribute("empresa");
    String  logo = (String)  request.getSession().getAttribute("logo");
    Precios precios = (Precios) request.getSession().getAttribute("precios");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			.col-container {
				display: table;
				width: 100%;
			}
			.col {
				display: table-cell;
				padding: 16px;
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
		<section style="border: green 10px inset; margin-left: 10px; margin-right: 10px">
			<h1 class="title"> <%= producto.getNombre() %> </h1>
			<div class="col-container">
				<div class="col" style="width: 50%">
					<div>
						<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
						<h1>
							Descripción:
						</h1>
						<p>
							(Descripción)Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Mauris ante ligula, facilisis sed ornare eu, lobortis in odio. Praesent convallis urna a lacus interdum ut hendrerit risus congue.
						</p>
					</div>
				</div>
				<div class="col" style="width: 50%">
					<form class="Pago" id="CalcularPrecios" method="get" action="Buscadores">
						<div class="box" style="border: lightgray 2px inset">
							<div class="control" style="width:200px">
								<label class="label">Cantidad:</label>
								<input type="hidden" name="formid" id="formid" value="7">
								<input class="input" type="number" name="cantidad" id="cantidad" placeholder="<%= precios.getCantidad() %>" >
							</div>
							<div class="control" style="width:200px">
								<button class="button color1"  >Calcular</button>
							</div>
						</div>
					</form>
					<form class="Pago" id="NuevaCompraForm" method="get" action="Buscadores">
						<div class="box" style="border: lightgray 2px inset">
							<label class="label">Precio Unitario:</label>
							<div class="control">
									<p class="subtitle"><%= precios.getPrecioUnitario() %></p>
							</div>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<label class="label">Cargo por Envío:</label>
							<div class="control">
									<p class="subtitle"><%= precios.getCargoEnvio() %></p>
							</div>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<label class="label">Total a Pagar:</label>
							<div class="control">
								<p class="subtitle"><%= precios.getTotalPagar() %></p>
							</div>
						</div>
						<div class="field is-grouped">
							<div class="control">
									<button class="button is-link">Continuar</button>
							</div>
							<div class="control">
									<button class="button is-link is-light">Cancelar</button>
							</div>
							<input type="hidden" id="formid" name="formid" value="8" >

						</div>
					</form>
				</div>
			</div>
		</section>
    </body>
</html>
