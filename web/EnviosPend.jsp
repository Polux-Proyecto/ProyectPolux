<%-- 
    Document   : EnviosPend
    Created on : 03-05-2020, 12:22:55 PM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Envíos Pendientes</title>
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
                      <button class="button is-dark">
                        Buscar
                      </button>
                    </p>
                    <div class="buttons">
                        <a class="button is-primary" style="background-color: #34b575">
                      Cerrar sesión
                    </a>
                  </div>
                </div>
              </div>
            </nav>
          </div>
         </div>
        </section>
        <section class="section">
            <div class="container">
                <h1 class="title">
                    Envios Pendientes
                </h1>
                <h2 class="title-2">
                    Los siguientes clientes esperan sus pedidos en los próximos días 
                </h2>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is striped">
                    <thead>
                        <tr>
                          <th><abbr title="Cliente">Nombre de cliente</abbr></th>
                          <th><abbr title="Direccion">Dirección</abbr></th>
                          <th><abbr title="Mensaje"> </abbr></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Nombre cliente</td>
                            <td><a href="DetalleCompra.jsp">Direccion de Cliente</a></td>
                            <td><a href="https://api.whatsapp.com/send?phone=503+phone+&text=Hola,%20tu%20pedido%20se%20encuentra%20en%20tu%20oficina%20de%20correos%20más%20cercana.">Enviar Mensaje</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </section>
    </body>
</html>
