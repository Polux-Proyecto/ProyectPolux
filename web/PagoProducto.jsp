<%-- 
    Document   : PagoProducto
    Created on : 04-03-2020, 09:50:44 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Arreglos"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String  logo = (String)  request.getSession().getAttribute("logo");
Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion");
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
        <div class="creditCardForm">
            <div class="title">
                <p>Pago con tarjeta de credito</p>
            </div>
            <div class="payment">
                <form>
                    <div class="subtitle">
                <p>Seleccione su tarjeta de credito:</p>
            </div>
                    <section>
                     <div class="box" style="border: lightgray 2px inset" id="derecha"><article class="media">
                                <div class="media-left">
									<figure class="image is-128x128">
										
									</figure>
                                </div>
                                <div class="media-content">
									<div class="content">
                                                                            
                    <label>Nombre del propietario:</label>
                    <br><br>
                    <label>Tipo de tarjeta de credito: </label>
                    <br><br>
                    <label>Numero de Tarjeta de credito:</label>
                    <br><br>
                    <label>Codigo de seguridad:</label>
                    
                    
                        <br><br>
                                                                    
                            
                             <div class="control">
                        <button class="button is-link">Utilizar esta tarjeta de credito</button>
                    </div>
                        </div>                                             
                                                                                
									</div>
                                </div>
                        
                        
                        
                    </section>
                    		
                          
                    
                    
                    
                        <div class="subtitle">
                <p>Registre una nueva tarjeta de credito:</p>
            </div>
                    <div class="form-group owner">
                        <label for="owner">Dueño de la tarjeta de credito</label>
                        <input type="text" class="form-control" id="owner">
                    </div>
                    
                                 <label>Tipo de Tarjeta de credito</label>
                    <div class="control">
                        <div class="select is-info">
                            <select  id="StringNewCountry" name="StringNewCountry" >>
                                <option value="Visa">Visa</option>
                                <option value="American Express">American Express</option>
                                <option value="Mastercard">Mastercard</option>
                                
                            </select>
                        </div>

                    
                </div>
                    <div class="form-group CVV">
                        <label for="cvv">Código de seguridad</label>
                        <input type="text" class="form-control" id="cvv">
                    </div>
                    <div class="form-group" id="card-number-field">
                        <label for="cardNumber">Número de tarjeta</label>
                        <input type="text" class="form-control" id="cardNumber">
                    </div>
                    <div class="form-group" id="expiration-date">
                        <label>Fecha de expiración</label>
                        <select>
<% 
for (int i = 0; i <12; i++){
%>
                            <option value="01"><%= meses[i] %></option>
<%
}
%>
                        </select>
                        <select>
<% 
    for(int i = 0; i < canAnnos ; i++ ){
    %>
                            <option value="<%= annos[i] + 20 %>"> <%= annos[i] + 20 %> </option>
                                
<%
    }
%>
                        </select>
                        
                        <br>
                        <br>
                        <br>
                              <div class="field is-grouped">
                    <div class="control">
                        <button class="button is-link">Ingresar tarjeta de credito</button>
                    </div>
                    <div class="control">
                        <button class="button is-link is-light">Cancelar</button>
                    </div>
                </div>
                    </div>
                        
                   
                        
                        
                        
                        
                        

                  
                </form>
            </div>
        </div>
    </body>
</html>
