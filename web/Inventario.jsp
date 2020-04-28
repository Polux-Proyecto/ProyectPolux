<%-- 
    Document   : Inventario
    Created on : 04-08-2020, 04:59:33 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Stock"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }
    List<Stock> inventario = (List<Stock>) request.getSession().getAttribute("listaStock");
    int cantInventario = 0;
    Iterator <Stock> iteInventario = null;
    Stock stock = null;
    
    if (inventario!=null){
        cantInventario = inventario.size();
        iteInventario = inventario.iterator();
    }
    
 %>
<!DOCTYPE html>
<%String  logo = (String)  request.getSession().getAttribute("logo");%>

<%
   /* ESTE MENSAJE ES POR SI ACASO (NO TOCAR)*/
    String productoexitoso = (String)request.getSession().getAttribute("productoexitoso");
    String messageprod="";
    if(productoexitoso=="25")
    {
        messageprod="Su nuevo producto ha sido registrado con exito";
        productoexitoso="26";
        request.getSession().setAttribute("productoexitoso", productoexitoso);
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
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
                        <strong>Inventario</strong>
                    </h1>
                    <h2 class="subtitle" style="color:black">
                       Te ayudamos a controlar tu stock y a satisfacer a tus clientes  
                    </h2>
                   <div style="color:blue"><%= messageprod%>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is-hoverable is-fullwidth">
                    <thead>
                        <tr>
							<th><abbr title="Numero">Numero de Porducto</abbr></th>
							<th><abbr title="NomProducto">Nombre de Producto</abbr></th>
							<th><abbr title="Categoría">Categoría</abbr></th>
							<th><abbr title="Existencias">Existencias</abbr></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  
                        if (cantInventario==0){  
                        %>
                        <tr>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                        </tr>
                        <%  
                            
                        } else {
                            while(iteInventario.hasNext()){
                            stock = iteInventario.next();
                        %>
                        <tr>
                            <td><%= stock.getNumero()  %></td>
                            <td><%= stock.getNombre()%></td>
                            <td><%= stock.getCategoria()%></td>
                            <td><%= stock.getExistencias()%></td>
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
