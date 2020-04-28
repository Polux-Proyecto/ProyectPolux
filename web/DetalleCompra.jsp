<%-- 
    Document   : DetalleCompra
    Created on : 03-05-2020, 12:58:00 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.commercewebapp.objects.Envio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }
    List<Envio> lstEnvioPorCliente = (List<Envio>) request.getSession().getAttribute("lstEnvioPorCliente");
    Usuario cliente = (Usuario) request.getSession().getAttribute("clienteU");
    Iterator<Envio> iteEnvioPC = null;
    int cantEnviosPC = 0, i = 0;
    Producto producto;
    Envio envio;
    if (lstEnvioPorCliente!=null){
        iteEnvioPC = lstEnvioPorCliente.iterator();
        cantEnviosPC = lstEnvioPorCliente.size() ;
    }
	String  logo = (String)  request.getSession().getAttribute("logo");
%>
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
				<nav class="navbar is-light" role="navigation" aria-label="main navigation" >
					<div class="navbar-brand">
						<img src="<%=logo%>" width="197" height="60">    
							<a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
							  <span aria-hidden="true"></span>
							  <span aria-hidden="true"></span>
							  <span aria-hidden="true"></span>
							</a>
					</div>
					<div id="navbarBasicExample" class="navbar-menu">
						<div class="navbar-start">
								<a class="navbar-item" href="InicioEmpresa.jsp">
									Inicio
								</a>
								<a class="navbar-item" href="Empresarios?formid=2">
									Ventas
								</a>
								<a class="navbar-item" href="Empresarios?formid=3">
									 Envíos
								</a>
								<a class="navbar-item" href="Empresarios?formid=7">
									Clientes 
								</a>
								<a class="navbar-item" href="Empresarios?formid=6">
									Inventario
								</a>
						</div>
					</div>
					<div class="navbar-end">
						<div class="navbar-item">
							<div class="buttons">
								<a class="button" style="background-color: #29b342">
									Cerrar sesión
								</a>
							</div>
						</div>
					</div>
				</nav>
			</div>
        </section>
		<section class="hero is-success"  style="background-color: hsl(120,60%,70%);">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title" style="color:black">
                        <strong>Detalle de Compras</strong>
                    </h1>
                    <h2 class="subtitle" style="color:black">
                        Información de las compras de <%= cliente.getNombre() %> 
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                          <th><abbr title="Numero">Numero de porducto</abbr></th>
                          <th><abbr title="NomProducto">Nombre de producto</abbr></th>
                          <th><abbr title="Cantidad">Cantidad comprada</abbr></th>
                          <th><abbr title="FechaEntrega">Fecha de compra</abbr></th>
                          <th><abbr title="FechaEntrega">Suma</abbr></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (cantEnviosPC == 0){
                        %>
                        <tr>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                            <td>No se encontraron datos</td>
                        </tr>
                        
                        <% } else {
                                while(iteEnvioPC.hasNext()){
                                envio = iteEnvioPC.next();
                                cliente = envio.getUsuario();
                                producto = envio.getProducto();
                                i++;
                            %>
                        <tr>
                            <td><%= i %></td>
                            <td><a class="modal-link" data-target="#Modal2"><%= producto.getNombre() %></a></td>
                            <div class="modal" id="Modal2">
                                <div class="modal-background"></div>
                                <div class="modal-card">
                                    <header class="modal-card-head">
                                            <p class="modal-card-title">Confirmación de Envío</p>
                                            <button class="delete" aria-label="close"></button>
                                    </header>
                                    <section class="modal-card-body">
                                        <div>
                                            <p class="title-2">
                                                ¿Desea confirmar que ya ha enviado este producto a <%= cliente.getNombre() %>?
                                            </p>
                                        </div>
                                    </section>
                                    <footer class="modal-card-foot">
                                        <form name="FrmConfirmarEnv" action="Finanzas" method="post" id="FrmConfirmarEnv" >
                                            <input type="hidden" name="formid" id="formid" value="6">
                                            <input type="hidden" name="idEnvio" id="idEnvio" value="<%= envio.getIdEnvio() %>">
                                            <div class="control">
                                                <button class="button is-success" >Confirmar</button>
                                            </div>
                                        </form>
                                        <button class="button is-delete">Cancelar</button>
                                    </footer>
                                                                                            
                                </div>
                            </div>
                            
                            <td><%= envio.getCantidad() %></td>
                            <td><%= envio.getFecha() %></td>
                            <td><%= envio.getCantidad()*producto.getPrecio() %></td>
                        </tr>
                        <% 
                            }
                        }   
                        %>
                        
                        <script>
                                document.querySelectorAll('.modal-link').forEach(function(el) {
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
                    </tbody>
                </table>
            </div>    
        </section>
    </body>
</html>
