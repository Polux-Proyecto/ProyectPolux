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
    </head>
    <body>
        <section>
        <div>
        <nav class="navbar" role="navigation" aria-label="main navigation" >
            <div class="navbar-brand">
                <img src="images/BrocOnlineLogo.jpeg" width="150" height="28">
                       
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
                <a class="navbar-item" href="InicioEmpresa.jsp">
                  Inicio
                </a>
                 <a class="navbar-item" href="EstadoDeVentas.jsp">
                  Ventas
                </a>
                <a class="navbar-item" href="EnviosPend.jsp">
                  Envíos
                </a>
                <a class="navbar-item" href="ClientesFrecuentes.jsp">
                  Clientes 
                </a>
                <a class="navbar-item" href="Inventario.jsp">
                  Inventario
                </a>
              </div>
            </div>

              <div class="navbar-end">
                <div class="navbar-item">
                    <p class="control">
                      <input class="input" type="text" placeholder="Find a post">
                    </p>
                    <p class="control">
                      <button class="button" style="background-color: greenyellow">
                        Buscar
                      </button>
                    </p>
                    <div class="buttons">
                        <a class="button" style="background-color: #29b342">
                      Cerrar sesión
                    </a>
                  </div>
                </div>
              </div>
            </nav>
          </div>
         </div>
        </section>
        <section class="hero is-success"  style="background-color: hsl(120,60%,70%);">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title" style="color:black">
                        <strong>Detalle de Envíos Pendientes</strong>
                    </h1>
                    <h2 class="subtitle"style="color:black">
                        Conoce más sobre el pedido de María 
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                          <th><abbr title="IdProducto">IdProducto</abbr></th>
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
