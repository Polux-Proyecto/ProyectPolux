<%-- 
    Document   : InicioCliente
    Created on : 03-05-2020, 11:30:56 AM
    Author     : Joanna Rivas
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    Usuario  usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (request.getSession(false) == null || usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }
    List<Producto>  deseos  = (List<Producto>)  request.getSession().getAttribute("deseos");
    List<Producto>  pedidos = (List<Producto>)  request.getSession().getAttribute("pedidos");
    String  logo = (String)  request.getSession().getAttribute("logo");
    Iterator<Producto> iteDeseos    = deseos.iterator();
    Iterator<Producto> itePedidos   = pedidos.iterator();
    int cantDeseos = 0, cantPedidos = 0;
    int k = 0;
	String ref = "";
    if(deseos!=null){
        cantDeseos = deseos.size();
    }
    if(pedidos!=null){
        cantPedidos = pedidos.size();
    }
    String valor = (String) request.getSession().getAttribute("valor");
    %> 
<html>
	<head>
	<%if (valor != null){
        if(valor.equals("1")){
            request.getSession().removeAttribute("valor");
            %>
            <script>
                alert('¡Lo sentimos, no se puedo realizar la compra, inténtelo de nuevo más tarde! Es posible que ya no haya sufiente producto en el almacen para la cantidad que deseas comprar. ');
            </script>
            <%
        } else {
            request.getSession().removeAttribute("valor");
            %>
            <script>
                alert('¡Gracias por tu compra, se realizó con éxito, en unos momentos recibirás un correo de confirmación!');
            </script>
            <%
        }
    }
    
%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
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
			.border {
				border-width: 2px; border-color:black ; border-style: solid; 
			}
		</style>
        <title>BrocOnline</title>
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
                                <a class="button color2" href="Buscadores?formid=6">
									Cerrar sesión
								</a>
							</div>
						</div>
					</div>
				</nav>
            </div>
        </section>
        <section class="hero is-medium has-carousel">
			<div class="hero-head"></div>
			<div class="hero-body">
				<div id="carousel-demo" class="hero-carousel" data-autoplay="true" data-navigation-keys="false" data-autoplay-speed="5000" data-effect="fade" data-duration="1000">
					<div class="carousel-item has-text-centered has-background">
						<img class="is-background" style="overflow:hidden; width:2000px; height:200px;" src="images/QuedateEnCasa.jpeg">
						<div class="box" >
							<div class="EnlaceCarousel">
								<h1><strong><a href="Buscadores?formid=2&idCat=1">#QuedateEnCasa y disfruta de la mejor música para tu alma</a> </strong></h1>
							</div>
						</div>
					</div>
					<div class="carousel-item has-text-centered has-background">
						<img class="is-background" style="overflow:hidden; width:2000px; height:200px;" src="images/ContenidoExclusivo.jpeg">
						<div class="box" >
							<div class="EnlaceCarousel">
								<a href="Buscadores?formid=3"><h1><strong>Visita nuestras categorías</strong></h1></a>
							 </div>
						</div>
					</div>
					<div class="carousel-item has-text-centered has-background">
						<img class="is-background" style="overflow:hidden; width:2000px; height:200px;" src="images/LetrasNegras.png">
						<div class="box" >
							<div class="EnlaceCarousel">
								<h1><strong><a href="Buscadores?formid=2&idCat=3">#QuedateEnCasa, y distruta de los pruductos para el hogar</a></strong></h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hero-foot"></div>
		</section>
		<!-- End Hero Carousel -->

		<script src="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/js/bulma-carousel.min.js"></script>
		<script>
			bulmaCarousel.attach('#carousel-demo', {
				slidesToScroll: 1,
				slidesToShow: 2
                                
			});
		</script>
		<section>
			<div class="tile is-ancestor" style="margin-left:10px;margin-right: 10px">
				<div class="tile is-parent">
					<article class="tile is-child box" style="border: green 10px inset">
						<p class="title">Lista de deseos</p>
						<% if (cantDeseos == 0){ %>
						<p class="subtitle">Tu lista de deseos está vacía</p>
						<% } else {
						%>
						<p class="subtitle">Tienes <%= cantDeseos %> deseo/s</p>
						<%
								Producto deseoActual;
								while(iteDeseos.hasNext()){
									deseoActual = iteDeseos.next();
									ref = "Buscadores?formid=4&idProd="+deseoActual.getId();
						%>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<a href= "<%= ref %>" ><img src="Imagenes?formid=1&idImgen=<%= k %>&att=deseos" alt="Image" style="overflow:hidden ;max-height: 128px; max-width:128px"></a>
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<p><strong><%= deseoActual.getNombre() %></strong><br>
											<a href="Buscadores?formid=8&idEmpresa=<%= deseoActual.getIdEmpresa() %>"> <%= deseoActual.getNombreEmpresa()%> </a>
											<br><%= deseoActual.getDescripcion() %>
										</p><br>
									</div>
									
								</div>                                       
							</article>
							<div class="buttons">
								<a class="button is-danger is-outlined" href="EliminaRegistros?formid=25&idprod=<%= deseoActual.getId() %>&idusu=<%= usuario.getIdUsuario() %>">
									Eliminar de deseos
								</a>
								<a class="button is-outlined" href="Buscadores?formid=4&idProd=<%= deseoActual.getId() %>">
									Comprar
								</a>
							</div>
						</div>

						<%    k++;  }    
							}
						%>
					</article>
				</div>
				<div class="tile is-parent">
					<article class="tile is-child box" style="border: green 10px inset;">
						<p class="title">Pedidos pendientes</p>
						<% if(cantPedidos == 0){ %>
						<p class="subtitle">No tienes pedidos pendientes</p>
						<% } else {
						%>
						<p class="subtitle">Tienes <%= cantPedidos %> pedido/s pendiente/s</p>
						<%
								Producto pedidoActual;
                                                                k = 0;
								while(itePedidos.hasNext()){
									pedidoActual = itePedidos.next();
									ref = "Buscadores?formid=4&idProd="+pedidoActual.getId();
						%>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<a href= "<%= ref %>" ><img src="Imagenes?formid=1&idImgen=<%= k %>&att=pedidos" alt="Image" style="overflow:hidden ;max-height: 128px; max-width:128px  "></a>
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<p>
											<strong><%= pedidoActual.getNombre() %></strong>
											<br><a href="Buscadores?formid=8&idEmpresa=<%= pedidoActual.getIdEmpresa() %>"> <%= pedidoActual.getNombreEmpresa() %> </a>
											<br><%= pedidoActual.getDescripcion() %>
										</p><br>
									</div>
								</div>
							</article>
						</div>

						<%      k++; }    
                                                    }
						%>
					</article>
				</div>
				<div class="tile is-parent" >
					<article class="tile is-child box" style="border: green 10px inset;">
						<div class="media-left form-inline" style="float:right">
							<figure class="image">
								<a><img src="Imagenes?formid=5&usuario=<%= usuario %>" class="border" alt="Image" style="overflow:hidden ;max-height: 128px; max-width:128px"></a>
							</figure>
						</div>
						<p class="title">Mi cuenta</p>
						<br>
						<p class="subtitle"><strong>Nombre de Contacto</strong></p>
						<div class="content">
                        <%= usuario.getNombre() %>
						</div>
						
						<p class="subtitle"><strong>Correo Electrónico</strong></p>
						<div class="content">
							<%= usuario.getCorreo() %>
						</div>
						<p class="subtitle"><strong>Género</strong></p>
						<div class="content">
							<%= usuario.getGenero() %>
						</div>
						<p class="subtitle"><strong>Fecha de Nacimiento</strong></p>
						<div class="content">
							<%= usuario.getFechaN() %>
						</div>
						<p class="subtitle"><strong>Dirección de Entrega</strong></p>
						<div class="content">
							<%= usuario.getDireccion() %>
						</div>
					</article>
				</div>
			</div>
		</section>        
    </body>
</html>
