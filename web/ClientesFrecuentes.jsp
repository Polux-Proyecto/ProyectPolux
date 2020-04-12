<%-- 
    Document   : ClientesFrecuentes
    Created on : 04-08-2020, 04:56:53 PM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.InformacionCliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    Usuario         usuario = (Usuario)         request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion");
    }
    String  logo = (String)  request.getSession().getAttribute("logo");
    List<Usuario> top10 = (List<Usuario>) request.getSession().getAttribute("top10Clientes");
    List<InformacionCliente> paises = (List<InformacionCliente>) request.getSession().getAttribute("paises");
    List<InformacionCliente> ciudades = (List<InformacionCliente>) request.getSession().getAttribute("ciudades");
    InformacionCliente genero = (InformacionCliente) request.getSession().getAttribute("genero");
    
    int cantTop10 = 0;
    int cantPaises = 0;
    int cantCiudades = 0;
    
    Iterator<Usuario> iteTop10 = null;
    Iterator<InformacionCliente> itePaises = null;
    Iterator<InformacionCliente> iteCiudades = null;
    
    Usuario user = null;
    InformacionCliente info = null;
    
    if(top10!=null){
        iteTop10 = top10.iterator();
        cantTop10 = top10.size();
    }
    if(top10!=null){
        itePaises = paises.iterator();
        cantPaises = paises.size();
    }
    if(top10!=null){
        iteCiudades = ciudades.iterator();
        cantCiudades = ciudades.size();
    }

%>
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
                <img src= "<%= logo %>" width="150" height="28">
                       
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
                        <strong>Clientes Frecuentes</strong>
                    </h1>
                    <h2 class="subtitle"style="color:black">
                        Conoce a tus clientes más fieles 
                    </h2>
                </div>
            </div>
        </section>
        <br>
        <section style="margin: 10px;">
            <div class="tile is-ancestor">
                <div class="tile is-parent">
                  <div class="tile is-child box"style="border: green 10px inset;">
                      <p class="title">Información importante sobre tus Clientes</p><br>
                        <p class="subtitle">Países de Origen Principales</p>
                        <% if (cantPaises == 0 ){ %>
                        <p class="list-item">No se encontraron datos</p>
                        <%  } else { 
                                while (itePaises.hasNext()){
                                    info = itePaises.next(); 
                        %>
                        <p class="list-item"><%= info.getPais() %></p><br>
                        <% 
                                }
                            }
                        %>
                        <p class="subtitle">Ciudades Importantes</p>
                        <% if (cantCiudades == 0 ){ %>
                        <p class="list-item">a</p>
                        <%  } else { 
                                while (iteCiudades.hasNext()){
                                    info = iteCiudades.next(); 
                        %>
                        <p class="list-item"><%= info.getCiudades() %></p><br>
                        <% 
                                }
                            }
                        %>
                        <p class="subtitle">Sexo predominante</p>
                        <% if (genero == null){ %>
                        <p class="list-item">No se encontraron datos</p>
                        <%  } else { %>
                        <p class="list-item"><%= genero.getGenero() %></p><br>
                        <% 
                            }
                        %>             
                  </div>
                </div>
                <div class="tile is-parent">
                  <div class="tile is-child box" style="border: black 10px inset;">
                    <p class="title">Top 10 Clientes Frecuentes</p>
                    <% 
                    if(cantTop10 == 0){
                    %>
                    <p>No se encontraron datos</p>
                    <%
                        } else {
                            while(iteTop10.hasNext()){
                                user = iteTop10.next();
                        %>
                        <div class="box">
                            <article class="media">
                                <div class="media-left">
                                    <figure class="image is-128x128">
                                        <a href=""><img src="https://bulma.io/images/placeholders/128x128.png" alt="Image"></a>
                                    </figure>
                                </div>
                                <div class="media-content">
                                    <div class="content">
                                        <p><strong><%= user.getNombre() %></strong> 
                                            <br>País:<%= user.getPais() %><br>Ciudad: <%= user.getCiudad() %><br>Género: <%= usuario.getGenero() %><br>Dirección: <%= usuario.getDireccion() %>
                                        </p><br>
                                    </div>
                                </div>
                            </article>
                        </div>
                        <% 
                            }
                        }
                        %>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
