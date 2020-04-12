<%-- 
    Document   : Busqueda
    Created on : 04-08-2020, 07:26:38 PM
    Author     : Joanna Rivas
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%      
    String  logo = (String)  request.getSession().getAttribute("logo");
    String  palabra = (String)  request.getSession().getAttribute("palabra");
    List<Producto>  listaProductos = (List<Producto>)  request.getSession().getAttribute("listaProductos");
    int cantProd = 0;
    Producto producto = null;
    Iterator<Producto> iteProducto = null;
    if (listaProductos!=null){
        cantProd = listaProductos.size();
        iteProducto = listaProductos.iterator();
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title>Buscar <%= palabra %></title>
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
                        <p class="title"><%= palabra %></p>
                        <% 
                            if (cantProd==0){
                                
                            %>
                            <div class="box">
                                    <div class="media-content">
                                        <div class="content">
                                            <p><strong>No se encontraron resultados</strong> 
                                            <br>Lo sentimos, no hemos encontrado nada que se parezca a tu búsqueda
                                            </p><br>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        <% } else {
                                while(iteProducto.hasNext()){
                                    producto = iteProducto.next();
                        %>   
                            <div class="box">
                                <article class="media">
                                    <div class="media-left">
                                        <figure class="image is-128x128">
                                            <a href="MuroProducto.jsp"><img src="https://bulma.io/images/placeholders/128x128.png" alt="Image"></a>
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <div class="content">
                                            <p><strong><%= producto.getNombreEmpresa() %></strong>
                                                <br>Nombre del producto: <%= producto.getNombre() %>
                                                <br>Descripción: <%= producto.getDescripcion() %>
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
