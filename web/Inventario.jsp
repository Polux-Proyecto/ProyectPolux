<%-- 
    Document   : Inventario
    Created on : 04-08-2020, 04:59:33 PM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <section>
        <div>
        <nav class="navbar" role="navigation" aria-label="main navigation" >
            <div class="navbar-brand">
                <img src="https://lh5.googleusercontent.com/iW2Jwicwe-GQ_iRcZ701dOarjhCOinwnSHh7PllNdHqfJ7c1uF_vFBIuXxZ-FERn6iiifZdkTCcO1r1xO3_OrW2-kIt5bKQyccLPGMlkRuyJzYGrGg=w1280" width="150" height="28">
                       
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
                 <a class="navbar-item" href="Empresarios?formid=2">
                  Ventas
                </a>
                <a class="navbar-item" href="Empresarios?formid=3">
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
                        <strong>Inventario</strong>
                    </h1>
                    <h2 class="subtitle"style="color:black">
                       Te ayudamos a controlar tu stock y a satisfacer a tus clientes  
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                          <th><abbr title="Numero">Numero de Porducto</abbr></th>
                          <th><abbr title="NomProducto">Nombre de Producto</abbr></th>
                          <th><abbr title="Categoría">Categoría</abbr></th>
                          <th><abbr title="Existencias">Existencias</abbr></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Café Buendía</td>
                            <td>Comida</td>
                            <td>200</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Camisa de Mickey Mouse</td>
                            <td>Ropa</td>
                            <td>1000</td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </section>
    </body>
</html>
