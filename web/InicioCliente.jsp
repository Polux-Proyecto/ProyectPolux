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
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    List<Producto>  deseos  = (List<Producto>)  request.getSession().getAttribute("deseos");
    List<Producto>  pedidos = (List<Producto>)  request.getSession().getAttribute("pedidos");
    Iterator<Producto> iteDeseos    = deseos.iterator();
    Iterator<Producto> itePedidos   = pedidos.iterator();
    int cantDeseos = 0, cantPedidos = 0;
    
    if(deseos!=null){
        cantDeseos = deseos.size();
    }
    if(pedidos!=null){
        cantPedidos = pedidos.size();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        
        
        <title>BrocOnline</title>
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
                <!--  
                Los Ids de las categorías más importantes son:
                Música - 1; Ropa, zapatos, joyería y relojes - 2; Hogar y cocina - 3; Electrónicos - 5; 
                -->
              <div class="navbar-start">
                <a class="navbar-item" href="InicioCliente.jsp">
                  Inicio
                </a>
                 <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=3">
                  Hogar
                </a>
                <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=5">
                  Tecnología
                </a>
                <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=1">
                  Música
                </a>
                <a class="navbar-item" href="CategoriaEmpresas.jsp?idCat=*">
                  Todas las categorías
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
                        <% if (cantDeseos == 0){ %>
                        <p class="subtitle">Tu lista de deseos está vacía</p>
                        <% } else {
                                Producto deseoActual;
                                while(iteDeseos.hasNext()){
                                    deseoActual = iteDeseos.next();
                        %>
                        <p class="subtitle">Tienes <%= cantDeseos %> deseo/s</p>
                        <div class="box">
                            <article class="media">
                                <div class="media-left">
                                  <figure class="image is-128x128">
                                      <a href="EmpresaMuro.jsp"><img src="https://bulma.io/images/placeholders/128x128.png" alt="Image"></a>
                                  </figure>
                                </div>
                                <div class="media-content">
                                  <div class="content">
                                    <p><strong><%= deseoActual.getNombre() %></strong> 
                                        <br><%= deseoActual.getDescripcion() %>
                                    </p><br>
                                  </div>
                                </div>
                            </article>
                        </div>
                        
                        <%      }    
                            }
                        %>
                      </article>
                    </div>
                    <div class="tile is-parent">
                      <article class="tile is-child box">
                        <p class="title">Pedidos pendientes</p>
                        <% if(cantPedidos == 0){ %>
                        <p class="subtitle">No tienes pedidos pendientes</p>
                        <% } else {
                                Producto pedidoActual;
                                while(itePedidos.hasNext()){
                                    pedidoActual = itePedidos.next();
                        %>
                        <p class="subtitle">Tienes <%= cantPedidos %> pedido/s pendiente/s</p>
                        <div class="box">
                            <article class="media">
                                <div class="media-left">
                                  <figure class="image is-128x128">
                                      <a href="EmpresaMuro.jsp"><img src="https://bulma.io/images/placeholders/128x128.png" alt="Image"></a>
                                  </figure>
                                </div>
                                <div class="media-content">
                                  <div class="content">
                                    <p><strong><%= pedidoActual.getNombre() %></strong> 
                                        <br><%= pedidoActual.getDescripcion() %>
                                    </p><br>
                                  </div>
                                </div>
                            </article>
                        </div>
                        
                        <%      }    
                            }
                        %>
                      </article>
                    </div>
                    <div class="tile is-parent" text-align="center">
                      <article class="tile is-child box" >
                        <p class="title">Mi cuenta</p>
                        
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
    </container>
                
    </body>
</html>
