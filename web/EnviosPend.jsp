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
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }
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
	String  logo = (String)  request.getSession().getAttribute("logo");
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
				<nav class="navbar is-light" role="navigation" aria-label="main navigation" >
					<div class="navbar-brand">
						<img src="<%=logo%>" width="197" height="60">    
							<a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
							  <span aria-hidden="true"></span>
							  <span aria-hidden="true"></span>
							  <span aria-hidden="true"></span>
							</a>
					</div>
					<div id="navbarBasicExample" class="navbar-menu">
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
							<div class="buttons">
								<a class="button" style="background-color: #29b342" href="Buscadores?formid=6">
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
                            <td><%= cliente.getPais()%> </td>
                            <td><%= cliente.getCiudad()%> </td>
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
