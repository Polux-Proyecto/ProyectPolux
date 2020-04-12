<%-- 
    Document   : EmpresaMuro
    Created on : 04-03-2020, 09:48:05 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="com.commercewebapp.objects.Empresa"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String  logo = (String)  request.getSession().getAttribute("logo");
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title>Nombre de la Empresa</title>
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
        <section class="section">
            <div class="container">
                <h1 class="title">
                    Nombre de la Empresa 
                </h1>
                <h2 class="title-2">
                    Nuestros Productos Favoritos
                </h2>
            </div>    
        </section>
        <section class="hero is-medium has-carousel">
                    <div class="hero-head"></div>
                    <div class="hero-body">
                        <div id="carousel-demo" class="hero-carousel" data-autoplay="true" data-navigation-keys="false" data-autoplay-speed="5000" data-effect="fade" data-duration="1000">
                            <div class="carousel-item has-text-centered has-background">
                                <img class="is-background" style="width:2000px; height:200px;" src="https://wikiki.github.io/images/merry-christmas.jpg">
                                <div class="box" >
                                    <div class="EnlaceCarousel">
                                        <a href="MuroProducto.jsp"><h1><strong>Nombre de Producto</strong></h1></a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item has-text-centered has-background">
                                <img class="is-background" style="width:2000px; height:200px;" src="https://wikiki.github.io/images/singer.jpg">
                                <div class="box" >
                                    <div class="EnlaceCarousel">
                                        <a href="MuroProducto.jsp"><h1><strong>Nombre de Producto</strong></h1></a>
                                     </div>
                                </div>
                            </div>
                            <div class="carousel-item has-text-centered has-background">
                                <img class="is-background" style="width:2000px; height:200px;" src="https://wikiki.github.io/images/sushi.jpg">
                                <div class="box" >
                                    <div class="EnlaceCarousel">
                                        <a href="MuroProducto.jsp"><h1><strong>Nombre de Producto</strong></h1></a>
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
			<div class="tile is-ancestor">
				<div class="tile is-parent ">
					<article class="tile is-child box" style="border: green 10px inset;">
						<p class="title">Nuestros Productos</p>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<p><strong>Nombre del producto</strong> 
											<br>Precio:<br>Descripción:
										</p><br>
									</div>
								</div>
								<nav class="navbar" role="navigation" aria-label="main navigation">
									<div class="field is-grouped">
										<a class="navbar-item">
											<div class="control">
												<button class="button is-outlined is-danger">Lista de deseos</button>
											</div>
										</a>
										<a class="navbar-item" href="CompraProducto.jsp">
											<div class="control">
												<button class="button is-outlined ">Comprar</button>
											</div>
										</a>
									</div>
								</nav>
							</article>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<p><strong>Nombre del producto</strong> 
											<br>Precio:<br>Descripción:
										</p>
									</div>
								</div>
								<nav class="navbar" role="navigation" aria-label="main navigation">
									<div class="field is-grouped">
										<a class="navbar-item">
											<div class="control">
												<button class="button is-outlined is-danger">Lista de deseos</button>
											</div>
										</a>
										<a class="navbar-item" href="CompraProducto.jsp">
											<div class="control">
												<button class="button is-outlined ">Comprar</button>
											</div>
										</a>
									</div>
								</nav>
							</article>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<p><strong>Nombre del producto</strong> 
											<br>Precio:<br>Descripción:
										</p>
									</div>
								</div>
								<nav class="navbar" role="navigation" aria-label="main navigation">
									<div class="field is-grouped">
										<a class="navbar-item">
											<div class="control">
												<button class="button is-outlined is-danger">Lista de deseos</button>
											</div>
										</a>
										<a class="navbar-item" href="CompraProducto.jsp">
											<div class="control">
												<button class="button is-outlined ">Comprar</button>
											</div>
										</a>
									</div>
								</nav>
							</article>
						</div>
					</article>
				</div>    
				<div class="tile is-parent">
					<article class="tile is-child box" style="border: green 10px inset;">
						<p class="title">Novedades</p>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<p><strong>Nombre del producto</strong> 
											<br>Precio:<br>Descripción:
										</p><br>
									</div>
								</div>
								<nav class="navbar" role="navigation" aria-label="main navigation">
									<div class="field is-grouped">
										<a class="navbar-item">
											<div class="control">
												<button class="button is-outlined is-danger">Lista de deseos</button>
											</div>
										</a>
										<a class="navbar-item" href="CompraProducto.jsp">
											<div class="control">
												<button class="button is-outlined ">Comprar</button>
											</div>
										</a>
									</div>
								</nav>
							</article>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
									<figure class="image is-128x128">
										<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
									</figure>
								</div>
								<div class="media-content">
									<div class="content">
										<p><strong>Nombre del producto</strong> 
											<br>Precio:<br>Descripción:
										</p>
									</div>
								</div>
								<nav class="navbar" role="navigation" aria-label="main navigation">
									<div class="field is-grouped">
										<a class="navbar-item">
											<div class="control">
												<button class="button is-outlined is-danger">Lista de deseos</button>
											</div>
										</a>
										<a class="navbar-item" href="CompraProducto.jsp">
											<div class="control">
												<button class="button is-outlined ">Comprar</button>
											</div>
										</a>
									</div>
								</nav>
							</article>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<article class="media">
								<div class="media-left">
								  <figure class="image is-128x128">
									<img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
								  </figure>
								</div>
								<div class="media-content">
								  <div class="content">
									<p><strong>Nombre del producto</strong> 
									  <br>Precio:<br>Descripción:
									</p>
								  </div>
								</div>
								<nav class="navbar" role="navigation" aria-label="main navigation">
									<div class="field is-grouped">
										<a class="navbar-item">
											<div class="control">
												<button class="button is-outlined is-danger">Lista de deseos</button>
											</div>
										</a>
										<a class="navbar-item" href="CompraProducto.jsp">
											<div class="control">
												<button class="button is-outlined ">Comprar</button>
											</div>
										</a>
									</div>
								</nav>
							</article>
						</div>
					</article>
				</div>
			</div>
		</section>          
    </body>
</html>

                               