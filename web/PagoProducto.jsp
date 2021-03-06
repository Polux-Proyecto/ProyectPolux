<%-- 
    Document   : PagoProducto
    Created on : 04-03-2020, 09:50:44 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Precios"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Tarjetas"%>
<%@page import="java.util.List"%>
<%@page import="com.commercewebapp.objects.Arreglos"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="com.commercewebapp.objects.Precios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String  logo = (String)  request.getSession().getAttribute("logo");
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    Producto producto = (Producto) request.getSession().getAttribute("producto");
    List<Tarjetas> tarjetas = (List<Tarjetas>) request.getSession().getAttribute("tarjetas");
	Precios precios = (Precios) request.getSession().getAttribute("precios");
        
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }

    Iterator<Tarjetas> iteTarjetas = null;
    int cantTarjetas = 0;
    Tarjetas tarjeta = null;

     if (tarjetas != null){
        cantTarjetas = tarjetas.size();
        iteTarjetas = tarjetas.iterator();
    }


    Arreglos arreglos = new Arreglos();
    int annos[] = arreglos.getAnnos();
    int dias[] = arreglos.getDias();
    String meses[] = arreglos.getMeses();
    int canAnnos = arreglos.getCant();
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Pagar</title>
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
			.col {
				display: table-cell;
				padding: 16px;
			}
			.col-container {
				display: table;
				width: 100%;
			}
		</style>
    </head>
    <body>
		<section>
			<div>
				<nav class="navbar is-light" role="navigation" aria-label="main navigation">
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
		<section style="margin-left: 10px; margin-right: 10px">
			<h1 class="title"> Pago con tarjeta de crédito </h1>
			<div class="col-container">
				<div class="col" style="border: green 10px inset;width: 50%">
					<div class="title is-ancestor">
						<p></p>
					</div>
					<div class="payment" >
						<div class="title is-parent">
							<p>Seleccione su tarjeta de credito:</p>
						</div>
						<section>

						<%  
	if (cantTarjetas > 0) {
            int n;
	while(iteTarjetas.hasNext()){
	tarjeta = iteTarjetas.next();
        n = tarjeta.getIdTarjeta();

					   %>
							<div class="box" style="border: lightgray 2px inset" >
								<article class="media">
									<div class="media-content">
										<div class="content">      
											
												<p><strong> Nombre del propietario: </strong> <%= tarjeta.getPropietario() %> </p>
												<p><strong> Tipo de tarjeta de credito: </strong> <%= tarjeta.getTipo() %> </p>
												<p><strong> Numero de tarjeta de credito: </strong> <%= tarjeta.getCodigoHidden()%> </p>
												<p><strong> Codigo de seguridad: </strong> <%= tarjeta.getCodigoS()%> </p>

												<div class="control" >
                                                                                                    <input type="button" class="button modal-button" data-target="#Modal<%= n %>" aria-haspopup="true" style="background-color: chartreuse" value="Utilizar esta tarjeta"></input>
												</div>
                                                                                                <div class="modal" id="Modal<%= n %>">
                                                                                                    <div class="modal-background"></div>
                                                                                                    
                                                                                                    <div class="modal-card">
                                                                                                        
                                                                                                            <header class="modal-card-head">
                                                                                                                <p class="modal-card-title">Confirmar Pago</p>
                                                                                                                <button class="delete" aria-label="close"></button>
                                                                                                            </header>
                                                                                                            <section class="modal-card-body">

                                                                                                                <p><strong>Datos del producto a facturar</strong></p>
                                                                                                                <br>
                                                                                                                <div class="field">
                                                                                                                    <label>Nombre del producto: <%= producto.getNombre() %> </label>
                                                                                                                </div>
                                                                                                                <br>
                                                                                                                <div class="field">
                                                                                                                    <label>Cantidad: <%= precios.getCantidad() %> </label>
                                                                                                                </div>
                                                                                                                <br>
                                                                                                                <div class="field">
                                                                                                                    <label>Total a pagar: <%= precios.getTotalPagar() %> </label>
                                                                                                                </div>
                                                                                                                <br>
                                                                                                                <p><strong>Datos de la tarjeta</strong></p>
                                                                                                                <br>
                                                                                                                <div class="field">
                                                                                                                    <label>Tipo de tarjeta: <%= tarjeta.getTipo() %> </label>
                                                                                                                </div>
                                                                                                                <br>
                                                                                                                <div class="field">
                                                                                                                    <label>Número de tarjeta: <%= tarjeta.getCodigoHidden()%> </label>
                                                                                                                </div>
                                                                                                                <br>
                                                                                                                <div class="field">
                                                                                                                    <label>Propietario de tarjeta: <%= tarjeta.getPropietario()%> </label>
                                                                                                                </div>
                                                                                                                <br>
                                                                                                                <p><strong>Datos de facturación:</strong></p>

                                                                                                                <p>Presiona confirmar para adquirir este producto, además, recivirás un correo electrónico a la dirección: <%= usuario.getCorreo() %></p>
                                                                                                            
                                                                                                            <footer>
                                                                                                                <form action="Finanzas" name="pago<%= tarjeta.getIdTarjeta() %>" id="pago<%= tarjeta.getIdTarjeta() %>">
                                                                                                                    <input type="hidden" id="formid" name="formid" value="4">
                                                                                                                    <input type="hidden" id="idTarjeta" name="idTarjeta" value="<%= tarjeta.getIdTarjeta() %>">
                                                                                                                    <button class="button is-success" >Comprar</button>
                                                                                                                    
                                                                                                                </form>  
                                                                                                                    <br>
                                                                                                                    <button class="button is-delete" >Cancelar</button>
                                                                                                            </footer>
                                                                                                         </section>
                                                                                                        </div>
                                                                                                    
                                                                                                </div>
                                                                                                
                                                                                                

											</form>
										</div>
									</div>
								</article>
							</div>
					   <% 
	} %>
        
                                                        <script>
                                                            document.querySelectorAll('.modal-button').forEach(function(el) {
                                                            el.addEventListener('click', function() {
                                                                var target = document.querySelector(el.getAttribute('data-target'));

                                                                target.classList.add('is-active');

                                                                target.querySelector('.delete').addEventListener('click',   function() {
                                                                    target.classList.remove('is-active');

                                                                    });
                                                                
                                                                target.querySelector('.is-delete').addEventListener('click',   function() {
                                                                    target.classList.remove('is-active');

                                                                    });
                                                                });
                                                            });

                                                            </script>                                                                                                          
                                                        
	<%
                                                                                                   } else {

					   %>

							<div class="media-content">
								<div class="content">
									<label>No tienes ninguna tarjeta agregada aún ¡agrégala!</label>
								</div>
							</div>

					   <% 
	}
					   %>
						</section>
						<br><br>
						<section>
							<div class="title is-parent">
								<p>Registre una nueva tarjeta de credito:</p>
							</div>

							<div class="box" style="border: lightgray 2px inset">
								<form method="get" action="Finanzas">

										<label for="owner">Dueño de la tarjeta de crédito</label>
										<input type="text" class="form-control" id="Dueno" name="Dueno" placeholder="<%= usuario.getNombre()%>" required>
										<br><br>
										<label for="Tipo">Tipo de tarjeta de crédito</label>

									<div class="select is-info">
                                                                            <select  id="Tipo" name="Tipo" required>
											<option value="Visa">Visa</option>
											<option value="American Express">American Express</option>
											<option value="Mastercard">Mastercard</option>
										</select>
										<br>
									</div>
									<br><br>

									<label for="numero">Número de la tarjeta de crédito</label>
									<input type="text" class="form-control" id="numero" name="numero" pattern=".{16,16}" placeholder="0000000000000000" required>
									<br><br>

									<label for="código">Código de la tarjeta de crédito</label>
									<input type="text" class="form-control" id="codigo" name="codigo" pattern=".{4,4}" placeholder="0000" required>
									<br><br>

									<label for="mes">Mes de vencimieto</label>
									<select name="mes" id="mes" required>
	<% 
	for (int i = 0; i <12; i++){
	%>
                                                                            <option value="<%= i + 1 %>"><%= meses[i] %></option>
	<%
	}
	%>
									</select>
									<br><br>

									<label for="anno">Año de vencimieto</label>

									<select name="anno" id="anno" required>
										<% 
		for(int i = 0; i < canAnnos ; i++ ){
                    if(annos[i]  > 1999 ){
		%>
										<option value="<%= annos[i] + 20 %>"> <%= annos[i] + 20 %> </option>
	<%
                    }
                }
	%>  
									</select>
									<br><br>
									<input type ="hidden" value ="3" name="formid" id="formid">
									<input type="hidden" value="<%= usuario.getIdUsuario() %>" name="idCliente" id="idCliente">
									<div>
										<button  type="submit" class="button is-link">Ingresar tarjeta de crédito</button>
									</div>
								</form>
                                                                <div>
                                                                    <a href="Buscadores?formid=7&cantidad=1"><button class="button is-link is-light">Cancelar</button></a>
                                                                </div>
							</div>
						</section>
					</div>
				</div>
                                
				<div class="col" style="border: green 10px inset">
					<form class="Pago" id="CalcularPrecios" method="get" action="Buscadores">
						<div class="box" style="border: lightgray 2px inset">
							<label class="label">Unidades a facturar:</label>
							<div class="control">
									<p class="subtitle"><%= precios.getCantidad() %></p>
							</div>
						</div>
					</form>
							<br>
					<form class="Pago" id="NuevaCompraForm" method="get" action="Finanzas">
						<div class="box" style="border: lightgray 2px inset">
							<label class="label">Precio Unitario:</label>
							<div class="control">
									<p class="subtitle"><%= precios.getPrecioUnitario() %></p>
							</div>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<label class="label">Cargo por Envío:</label>
							<div class="control">
									<p class="subtitle"><%= precios.getCargoEnvio() %></p>
							</div>
						</div>
						<div class="box" style="border: lightgray 2px inset">
							<label class="label">Total a Pagar:</label>
							<div class="control">
								<p class="subtitle"><%= precios.getTotalPagar() %></p>
							</div>
						</div>
					</form>
				</div>
			</div>
        </section>
    </body>
</html>
