<%-- 
    Document   : EstadoDeVentas
    Created on : 04-08-2020, 04:56:29 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Estadistico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }
    List<Estadistico> listaEstadisticos = (List<Estadistico>) request.getSession().getAttribute("listaEstadisticos");
    List<Estadistico> listaTop5Prod = (List<Estadistico>) request.getSession().getAttribute("listaTop5Prod");
    List<Estadistico> listaTop5Cat = (List<Estadistico>) request.getSession().getAttribute("listaTop5Cat");
    int cantEstadisticos = 0;
    int cantTop5Prod = 0;
    int cantTop5Cat = 0;
    Iterator<Estadistico> iteEstadisticos = null;
    Iterator<Estadistico> iteTop5Prod = null;
    Iterator<Estadistico> iteTop5Cat = null;
    if (listaEstadisticos!=null){
        cantEstadisticos = listaEstadisticos.size();
        iteEstadisticos = listaEstadisticos.iterator();
    }
    if (listaEstadisticos!=null){
        cantTop5Prod = listaTop5Prod.size();
        iteTop5Prod = listaTop5Prod.iterator();
    }
    if (listaEstadisticos!=null){
        cantTop5Cat = listaTop5Cat.size();
        iteTop5Cat = listaTop5Cat.iterator();
    }
    
    Estadistico estadistico = null;
	String  logo = (String)  request.getSession().getAttribute("logo");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
        <title>Ventas: <%= usuario.getNombre() %></title>
    </head>
    <body>
        <section>
			<div>
				<nav class="navbar is-light" role="navigation" aria-label="main navigation" >
					<div class="navbar-brand">
						<img src="<%= logo %>" width="197" height="60">
                       
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
							<a class="navbar-item" href="Empresarios?formid=6">
							  Inventario
							</a>
						</div>
					</div>

					<div class="navbar-end">
						<div class="navbar-item">
							<div class="buttons">
								<a class="button " href="Buscadores?formid=6" style="background-color: #29b342">
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
                        <strong>Ventas</strong>
                    </h1>
                    <h2 class="subtitle" style="color:black">
                        Te presentamos todo lo que quieres saber de tus ventas 
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="tile is-ancestor">
                <div class="tile is-parent">
                    <div class= "tile is-child box">
                        <div class="table-container">
                            <table class="table is-hoverable is-fullwidth">
                                <thead>
                                    <tr>
                                        <th><abbr title="Numero">Numero de Porducto</abbr></th>
                                        <th><abbr title="NomProducto">Nombre de Producto</abbr></th>
                                        <th><abbr title="Categoría">Categoría</abbr></th>
                                        <th><abbr title="Existencias">Busquedas</abbr></th>
                                        <th><abbr title="Existencias">Vendidos</abbr></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    if (cantEstadisticos == 0){
                                    %>
                                    <tr>
                                        <td>No data</td>
                                        <td>No data</td>
                                        <td>No data</td>
                                        <td>No data</td>
                                        <td>No data</td>
                                    </tr>
                                    <% 
                                    } else {
                                        while (iteEstadisticos.hasNext()){
                                            estadistico = iteEstadisticos.next();
                                    %>
                                    <tr>
                                        <td><%= estadistico.getnLista() %></td>
                                        <td><%= estadistico.getNombreProd() %></td>
                                        <td><%= estadistico.getNombrecategoria() %></td>
                                        <td><%= estadistico.getCantBusquedas() %></td>
                                        <td><%= estadistico.getCantVentas() %></td>
                                    </tr>
                                    <% 
                                        }
                                        estadistico = null;
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
