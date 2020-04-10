<%-- 
    Document   : EstadoDeVentas
    Created on : 04-08-2020, 04:56:29 PM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
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
                        <strong>Ventas</strong>
                    </h1>
                    <h2 class="subtitle"style="color:black">
                        Te presentamos todo lo que quieres saber de tus ventas 
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="tile is-ancestor">
                <div tile is-parent>
                    <div class= "tile is-child box">
                        <div class="table-container">
                            <table class="table is-hoverable is-fullwidth">
                                <thead>
                                    <tr>
                                     <th><abbr title="Numero">Numero de Porducto</abbr></th>
                                      <th><abbr title="NomProducto">Nombre de Producto</abbr></th>
                                      <th><abbr title="Categoría">Categoría</abbr></th>
                                      <th><abbr title="Existencias">Busquedas</abbr></th>
                                      <th><abbr title="Existencias">En Lista de Deseos</abbr></th>
                                      <th><abbr title="Existencias">Vendidos</abbr></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Café Buendía</td>
                                        <td>Comida</td>
                                        <td>200</td>
                                        <td>50000</td>
                                        <td>30000</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Camisa de Mickey Mouse</td>
                                        <td>Ropa</td>
                                        <td>1000</td>
                                        <td>200000</td>
                                        <td>9000</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tile is-parent">
                    <div class="tile is-child box">
                        <article>
                            <p class="tile">
                                <strong>Ventas según producto</strong>
                            </p>
                            <div id="productChart" style="height: 250px;"></div>
                            <script>
                                //Esto es JavaScript
                                new Morris.Bar({
                                    // ID del elemento en que se va a formar el gráfico
                                    element: 'productChart',
                                    // Data es la información a partir de la cual se construye el gráfico
                                    data: [
                                      { product: 'Café Buendía', ventas: 30000 },
                                      { product: 'Camisa de Mickey Mouse', ventas: 9000 },
                                    ],
                                    // El nombre del atributo del eje x
                                    xkey: 'product',
                                    // El nombre del atributo del eje y
                                    ykeys: ['ventas'],
                                    // Etiqueta
                                    labels: ['Ventas'],
                                    
                                    barColors: ['forestgreen']
                                  });
                            </script>
                        </article>
                        <article>
                            <p class="tile">
                                <strong>Ventas según Categoría</strong>
                            </p>
                            <div id="categoryChart" style="height: 250px;"></div>
                            <script>
                                //Esto es JavaScript
                                new Morris.Bar({
                                    // ID del elemento en que se va a formar el gráfico
                                    element: 'categoryChart',
                                    // Data es la información a partir de la cual se construye el gráfico
                                    data: [
                                      { product: 'Comida', ventas: 30000 },
                                      { product: 'Ropa', ventas: 9000 },
                                    ],
                                    // El nombre del atributo del eje x
                                    xkey: 'product',
                                    // El nombre del atributo del eje y
                                    ykeys: ['ventas'],
                                    // Etiqueta
                                    labels: ['Ventas'],
                                    
                                    barColors: ['chartreuse']
                                  });
                            </script>
                        </article>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
