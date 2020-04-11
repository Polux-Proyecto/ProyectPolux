<%-- 
    Document   : DetalleCompra
    Created on : 03-05-2020, 12:58:00 PM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Detalle de Envios</title>
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
						  <img src="https://lh5.googleusercontent.com/iW2Jwicwe-GQ_iRcZ701dOarjhCOinwnSHh7PllNdHqfJ7c1uF_vFBIuXxZ-FERn6iiifZdkTCcO1r1xO3_OrW2-kIt5bKQyccLPGMlkRuyJzYGrGg=w1280" width="197" height="60">
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
            <div class="table-container">
                <table class="table is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                          <th><abbr title="Numero">Numero de Porducto</abbr></th>
                          <th><abbr title="NomProducto">Nombre de Producto</abbr></th>
                          <th><abbr title="Cantidad">Cantidad comprada</abbr></th>
                          <th><abbr title="FechaEntrega">Fecha de Entrega</abbr></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Café Buendía</td>
                            <td>20</td>
                            <td>20/06/2020</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Camisa</td>
                            <td>54</td>
                            <td>06/04/2020</td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </section>
    </body>
</html>
