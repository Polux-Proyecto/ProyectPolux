<%-- 
    Document   : DetalleCompra
    Created on : 03-05-2020, 12:58:00 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.commercewebapp.objects.Envio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    List<Envio> lstEnvioPorCliente = (List<Envio>) request.getSession().getAttribute("lstEnvioPorCliente");
    String nombre = (String) request.getSession().getAttribute("nombre");
    Iterator<Envio> iteEnvioPC = null;
    int cantEnviosPC = 0, i = 0;
    Producto producto;
    Usuario cliente;
    Envio envio;
    if (lstEnvioPorCliente!=null){
        iteEnvioPC = lstEnvioPorCliente.iterator();
        cantEnviosPC = lstEnvioPorCliente.size() ;
    }
	String  logo = (String)  request.getSession().getAttribute("logo");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Detalle de Envios</title>
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
				<nav class="navbar" role="navigation" aria-label="main navigation" >
					<div class="navbar-brand">
						<img src="<%= logo %>" width="150" height="28">
                       
						<a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
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
							<a class="navbar-item" href="InicioEmpresa.jsp">
							  Inicio
							</a>
							<a class="navbar-item" href="Empresarios?formid=2">
							  Ventas
							</a>
							<a class="navbar-item" href="Empresarios?formid=3">
							  Envíos
							</a>
							<a class="navbar-item" href="Empresarios?formid=7">
							  Clientes 
							</a>
							<a class="navbar-item" href="Empresarios?formid=6">
							  Inventario
							</a>
						</div>
					</div>

					<div class="navbar-end">
						<div class="navbar-item">
							<p class="control">
								<input class="input" type="text" placeholder="Find a post">
							</p>
							<p class="control">
								<button class="button" style="background-color: greenyellow">
									Buscar
								</button>
							</p>
							<div class="buttons">
								<a class="button" style="background-color: #29b342">
									Cerrar sesión
								</a>
							</div>
						</div>
					</div>
				</nav>
			</div>
        </section>
		<section class="hero is-success"  style="background-color: hsl(120,60%,70%);">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title" style="color:black">
                        <strong>Detalle de Compras</strong>
                    </h1>
                    <h2 class="subtitle" style="color:black">
                        Información de las compras de <%= nombre %> 
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                          <th><abbr title="Numero">Numero de porducto</abbr></th>
                          <th><abbr title="NomProducto">Nombre de producto</abbr></th>
                          <th><abbr title="Cantidad">Cantidad comprada</abbr></th>
                          <th><abbr title="FechaEntrega">Fecha de compra</abbr></th>
                          <th><abbr title="FechaEntrega">Suma</abbr></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (cantEnviosPC == 0){
                        %>
                        <tr>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                        </tr>
                        
                        <% } else {
                                while(iteEnvioPC.hasNext()){
                                envio = iteEnvioPC.next();
                                cliente = envio.getUsuario();
                                producto = envio.getProducto();
                                i++;
                            %>
                        <tr>
                            <td><%= i %></td>
                            <td><%= producto.getNombre() %></td>
                            <td><%= envio.getCantidad() %></td>
                            <td><%= envio.getFecha() %></td>
                            <td><%= envio.getCantidad()*producto.getPrecio() %></td>
                        </tr>
                        <% 
                            }
                        }   
                        %>
                    </tbody>
                </table>
            </div>    
        </section>
    </body>
</html>
