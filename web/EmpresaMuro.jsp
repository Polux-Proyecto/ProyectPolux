<%-- 
    Document   : EmpresaMuro
    Created on : 04-03-2020, 09:48:05 PM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title>Nombre de la Empresa</title>
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
			<div id="carousel-demo" class="hero-carousel">
				<div class="item-1">
                                    <a href="EmpresaMuro.jsp"><image src="https://wikiki.github.io/images/merry-christmas.jpg" /></a>
                                
				</div>
				<div class="item-2">
                                    <a title="Nombre Empresa" href="EmpresaMuro.jsp"><image src="https://wikiki.github.io/images/singer.jpg" /></a>
				</div>
				<div class="item-3">
                                    <a href="EmpresaMuro.jsp"><image src="https://wikiki.github.io/images/sushi.jpg" /></a>
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
                        <div class="tile is-parent ">
                            <div class="tile is-child box">
                                <p class="title">Nuestros Productos</p>
                                <div class="box">
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
                                <div class="box">
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
                                <div class="box">
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
                            </div>
                        </div>    
                        <div class="tile is-parent">
                            <div class="tile is-child box">
                                <p class="title">Novedades</p>
                                <div class="box">
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
                                <div class="box">
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
                                <div class="box">
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
                            </div>
                        </div>
                    </div>
                </section>    
                
    </body>
</html>

                               