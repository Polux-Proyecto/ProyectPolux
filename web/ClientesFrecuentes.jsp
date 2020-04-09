<%-- 
    Document   : ClientesFrecuentes
    Created on : 04-08-2020, 04:56:53 PM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </body>
</html>
