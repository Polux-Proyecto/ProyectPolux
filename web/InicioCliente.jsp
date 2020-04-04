<%-- 
    Document   : InicioCliente
    Created on : 03-05-2020, 11:30:56 AM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        
        
        <title>InicioCliente</title>
    </head>
    <body>
        <section class="section">
            <div class="container">
                <h1 class="title">
                    ¡Bienvenido de nuevo! 
                </h1>
            </div>    
        </section>
        <section class="hero is-light">
            <div class="hero-body">
              <div class="container">
                <nav class="level" >
                    <p class="level-item has-text-centered">
                      <a class="link is-info">Necesidades básicas</a>
                    </p>
                    <p class="level-item has-text-centered">
                      <a class="link is-info">Hogar</a>
                    </p>
                    <p class="level-item has-text-centered">
                      <img src="https://bulma.io/images/bulma-type.png" alt="" style="height: 30px;">
                    </p>
                    <p class="level-item has-text-centered">
                      <a class="link is-info">Tecnología</a>
                    </p>
                    <p class="level-item has-text-centered">
                      <a class="link is-info">Repuestos</a>
                    </p>
                    <p class="control">
                      <input class="input" type="text" placeholder="Find a post">
                    </p>
                    <p class="control">
                      <button class="button">
                        Buscar
                      </button>
                    </p>
                  </nav>
              </div>
            </div>
        </section>
        <section class="hero is-medium has-carousel">
			<div id="carousel-demo" class="hero-carousel">
				<div class="item-1">
                                    <image src="https://wikiki.github.io/images/merry-christmas.jpg" />
                                
				</div>
				<div class="item-2">
                                    <image src="https://wikiki.github.io/images/singer.jpg" />
				</div>
				<div class="item-3">
                                    <image src="https://wikiki.github.io/images/sushi.jpg" />
				</div>
			</div>
			<div class="hero-head"></div>
			<div class="hero-body"></div>
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
                    <div class="tile is-parent">
                      <article class="tile is-child box">
                        <p class="title">Lista de deseos</p>
                        <p class="subtitle">Tu lista de deseos está vacía</p>
                        <a href="">Seguro que te gusta</a>
                      </article>
                    </div>
                    <div class="tile is-parent">
                      <article class="tile is-child box">
                        <p class="title">Pedidos pendientes</p>
                        <p class="subtitle">No tienes pedidos pendientes</p>
                      </article>
                    </div>
                    <div class="tile is-parent" text-align="center">
                      <article class="tile is-child box" >
                        <p class="title">Mi cuenta</p>
                        
                        <p class="subtitle"><strong>Nombre de Contacto</strong></p>
                        <div class="content">
                            Maria Flores
                        </div>
                        <p class="subtitle"><strong>Correo Electrónico</strong></p>
                        <div class="content">
                          m@gmail.com
                        </div>
                        <p class="subtitle"><strong>Sexo</strong></p>
                        <div class="content">
                          Mujer
                        </div>
                        <p class="subtitle"><strong>Año de Nacimiento</strong></p>
                        <div class="content">
                          1999
                        </div>
                        <p class="subtitle"><strong>Dirección de Entrega</strong></p>
                        <div class="content">
                          Calle Las Flores, edificio 124
                        </div>
                      </article>
                    </div>
                  </div>
                </section>
                
    </body>
</html>
