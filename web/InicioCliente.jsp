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
       <section>
        <div>
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
              <a class="navbar-item" href="https://bulma.io">
                <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
              </a>

              <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
              </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
              <div class="navbar-start">
                <a class="navbar-item" href="InicioCliente">
                  Inicio
                </a>
                 <a class="navbar-item" href="CategoriaEmpresas.jsp">
                  Hogar
                </a>
                <a class="navbar-item" href="CategoriaEmpresas.jsp">
                  Tecnología
                </a>
                <a class="navbar-item" href="CategoriaEmpresas.jsp">
                  Conveniencia
                </a>
                <a class="navbar-item" href="CategoriaEmpresas.jsp">
                  Otro
                </a>
              </div>
            </div>

              <div class="navbar-end">
                <div class="navbar-item">
                    <p class="control">
                      <input class="input" type="text" placeholder="Find a post">
                    </p>
                    <p class="control">
                      <button class="button is-primary">
                        Buscar
                      </button>
                    </p>
                    <div class="buttons">
                    <a class="button is-light">
                      Cerrar sesión
                    </a>
                  </div>
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
                                <img class="is-background" style="width:2000px; height:200px;" src="https://wikiki.github.io/images/merry-christmas.jpg">
                                <div class="box" >
                                    <div class="EnlaceCarousel">
                                        <a href="EmpresaMuro.jsp"><h1><strong>Nombre de La Empresa</strong></h1></a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item has-text-centered has-background">
                                <img class="is-background" style="width:2000px; height:200px;" src="https://wikiki.github.io/images/singer.jpg">
                                <div class="box" >
                                    <div class="EnlaceCarousel">
                                        <a href="EmpresaMuro.jsp"><h1><strong>Nombre de La Empresa</strong></h1></a>
                                     </div>
                                </div>
                            </div>
                            <div class="carousel-item has-text-centered has-background">
                                <img class="is-background" style="width:2000px; height:200px;" src="https://wikiki.github.io/images/sushi.jpg">
                                <div class="box" >
                                    <div class="EnlaceCarousel">
                                        <a href="EmpresaMuro.jsp"><h1><strong>Nombre de La Empresa</strong></h1></a>
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
    <container>
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
    </container>
                
    </body>
</html>
