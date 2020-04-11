<%-- 
    Document   : EnviosPend
    Created on : 03-05-2020, 12:22:55 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Envio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    List<Envio> lstEnvio = (List<Envio>) request.getSession().getAttribute("lstEnvio");
    int cantEnvios = 0;
    Iterator<Envio> iteEnvio = null;
    Envio envio = null;
    Producto producto = null;
    Usuario cliente = null;
    String ref;
    
    if (lstEnvio!=null){
        cantEnvios = lstEnvio.size();
        iteEnvio = lstEnvio.iterator();
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Envíos Pendientes</title>
    </head>
    <body>
        <section>
			<div>
				<nav class="navbar" role="navigation" aria-label="main navigation" >
					<div class="navbar-brand">
						<img src="https://lh5.googleusercontent.com/iW2Jwicwe-GQ_iRcZ701dOarjhCOinwnSHh7PllNdHqfJ7c1uF_vFBIuXxZ-FERn6iiifZdkTCcO1r1xO3_OrW2-kIt5bKQyccLPGMlkRuyJzYGrGg=w1280" width="150" height="28">
                       
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
							<a class="navbar-item" href="ClientesFrecuentes.jsp">
								Clientes 
							</a>
							<a class="navbar-item" href="Inventario.jsp">
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
                        <strong>Envios Pendientes</strong>
                    </h1>
                    <h2 class="subtitle" style="color:black">
                        Los siguientes clientes esperan sus pedidos en los próximos días 
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                          <th><abbr title="Cliente">Nombre de cliente</abbr></th>
                          <th><abbr title="Direccion">País</abbr></th>
                          <th><abbr title="Direccion">Ciudad</abbr></th>
                          <th><abbr title="Direccion">Dirección</abbr></th>
                          <th><abbr title="DetalleCompra">Compra</abbr></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (cantEnvios==0){
                                
                        %>
                        <tr>
                            <td>No hay envíos para mostrar</td>
                            <td>--</td>
                            <td><a href="">Detalle de Compra</a></td>
                        </tr>
                        <% 
                                
                            } else {
                                while(iteEnvio.hasNext()){
                                    envio = iteEnvio.next();
                                    producto = envio.getProducto();
                                    cliente = envio.getUsuario();
                                    ref = "Empresarios?formid=5&idCliente="+cliente.getIdUsuario();
                        %>
                        <tr>
                            <td><%= cliente.getNombre() %></td>
                            <td><%= cliente.getDireccion() %> </td>
                            <td><%= cliente.getDireccion() %> </td>
                            <td><%= cliente.getDireccion() %> </td>
                            <td><a href=<%= ref %>>Detalle de Compra</a></td>
                        </tr>
                         <%     }
                            }
                         %>
                    </tbody>
                </table>
            </div>    
        </section>
    </body>
</html>
