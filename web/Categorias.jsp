<%-- 
    Document   : Categorias
    Created on : 04-09-2020, 11:06:39 AM
    Author     : Mauricio Aguilar
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }
    List<Categoria> listaCategoria = (List<Categoria>) request.getSession().getAttribute("listaCategoria");
    int mitad = (Integer) request.getSession().getAttribute("mitad");
    mitad ++;
    Iterator<Categoria> iteCategorias = listaCategoria.iterator();
    int cantidadCategorias = listaCategoria.size();
    int i=0;
    int k = 0;
    String  logo = (String)  request.getSession().getAttribute("logo");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title>Categorias</title>
        <Style>
            #izquierda{
                float:left;
                width:50%;
            }
            #derecha{
                float:right;
                width:50%;
            }
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
        </Style>
    </head>
    <body>
        <section>
			<div>
				<nav class="navbar" role="navigation" aria-label="main navigation">
					<div class="navbar-brand">
						<a class="navbar-item" href="InicioCliente.jsp">
							<img src= "<%= logo %>" width="197" height="60">
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
        <section>
            <div class="tile is-ancestor">
                <div class="tile is-parent ">
                    <div class="tile is-child box">
                        <p class="title">Todas las categorías</p>
                        <% 
                            if (cantidadCategorias==0){
                        %>
                        <div class="box" style="border: lightgray 2px inset">
                             <p class="title">No hay Categorías para mostrar :(</p>
                        </div>
                        <%
						} else {

						Categoria categoriaActual;
						while (iteCategorias.hasNext()){
						categoriaActual = iteCategorias.next();
						String ref = "Buscadores?formid=2&idCat="+categoriaActual.getIdCat();

						if (i<=mitad) {%>
						<div class="box" style="border: lightgray 2px inset" id="izquierda">
							<article class="media">
                                <div class="media-left">
									<figure class="image is-128x128">
										<a href="EmpresaMuro.jsp"><img src="Imagenes?formid=2&idImgen=<%= k %>&att=listaCategoria" alt="Image"></a>
									</figure>
                                </div>
                                <div class="media-content">
									<div class="content">
										<a href= "<%= ref %>" ><strong><%= categoriaActual.getNombre() %></strong> </a>
										<br>
									</div>
                                </div>
                            </article>
                        </div>
						<%      } else { %>
						<div class="box" style="border: lightgray 2px inset" id="derecha"><article class="media">
                                <div class="media-left">
									<figure class="image is-128x128">
										<a href="EmpresaMuro.jsp"><img src="Imagenes?formid=2&idImgen=<%= k %>&att=listaCategoria" alt="Image"></a>
									</figure>
                                </div>
                                <div class="media-content">
									<div class="content">
										<a href= "<%= ref %>" ><strong><%= categoriaActual.getNombre() %></strong> </a>
										<br>
									</div>
                                </div>
                            </article>
                        </div>
                            <%         } 
                                    k++;
                            }
                        }
                        %>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
