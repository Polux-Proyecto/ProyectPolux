<%-- 
    Document   : InicioEmpresa
    Created on : 03-05-2020, 11:31:15 AM
    Author     : Joanna Rivas
    Errores    : 
        1 - No se pudo insertar el producto ingresado
    Mensajes   :
        1 - El producto se ingresó con éxito
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="java.util.List"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
    List<Producto> listaProdMasVendidos = (List<Producto>) request.getSession().getAttribute("listaProdMasVendidos");
    List<Producto> listaPrdMenosStock = (List<Producto>) request.getSession().getAttribute("listaPrdMenosStock");
    List<Producto> listaProdSinStock = (List<Producto>) request.getSession().getAttribute("listaProdSinStock");
    
    int cantMasVendidos = 0;
    int cantMenosStock = 0;
    int cantSinStock = 0;
    Iterator<Producto> iteMasVendidos = null;
    Iterator<Producto> iteMenosStock = null;
    Iterator<Producto> iteSinStock = null;
    
    if(listaProdMasVendidos!=null){
        cantMasVendidos = listaProdMasVendidos.size();
         iteMasVendidos = listaProdMasVendidos.iterator();
    }
    if(listaPrdMenosStock!=null){
        cantMenosStock = listaPrdMenosStock.size();
        iteMenosStock = listaPrdMenosStock.iterator();
    }
    if(listaProdSinStock!=null){
        cantSinStock = listaProdSinStock.size();
        iteSinStock = listaProdSinStock.iterator();
    }
    
    Producto producto = null;
    
   %> 
    
    
<%
    String error = request.getParameter("Error"), mensaje = request.getParameter("Mensaje"), avisoE = "", avisoM = "";
    
    if(error!= null){
        if (error.equals("1")){
            avisoE = "El producto no pudo ser ingresado, inténtelo de nuevo";
        }
    } else {
        error = "";
    }
    if(mensaje!=null){
        if (mensaje.equals("1")){
            avisoM = "El producto fue ingresado correctamente";
        }
    } else {
        mensaje = "";
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/709f0bb893.js" crossorigin="anonymous"></script>
        <title>InicioEmpresa</title>
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
                        <a class="button " href="index.jsp" style="background-color: #29b342">
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
                        <strong>¡Bienvenido, <%=usuario.getNombre() %>!</strong>
                    </h1>
                    <h2 class="subtitle"style="color:black">
                        Tus clientes esperan
                    </h2>
                </div>
            </div>
        </section>
        <section>
            <div class="container" style="object-fit: contain">
                <figure class="image" style="height: 200px;">
                    <img src="images/LetrasNegras.png" alt=""/>
                </figure>
            </div>
            <br>
            <br>
            <br>
            <br>
        </section>        
        <section class="section" >
            <div class="tile is-ancestor">
                <div class="tile is-vertical">
                <div class="tile">
                  <div class="tile is-parent is-vertical">
                    <article class="tile is-child box" style="border: green 10px inset;">
                        
                        <p class="title">Añadir Producto</p>
                        <p class="subtitle">Agrega nuevos productos a tu inventario</p>
                        <button class="button modal-button" data-target="#Modal1" aria-haspopup="true" style="background-color: chartreuse">Nuevo Producto</button>
                        
                        <div class="modal" id="Modal1">
                            <div class="modal-background"></div>
                            <div class="modal-card">
                              <header class="modal-card-head">
                                <p class="modal-card-title">Nuevo Producto</p>
                                <button class="delete" aria-label="close"></button>
                              </header>
                              <section class="modal-card-body">
                                <form name="FrmNuevoProd" action="Empresarios" method="get" id="FrmNuevoProd">
                                    <p class="subtitle has-text-danger"><%= avisoE %></p>
                                    <p class="subtitle has-text-success"><%= avisoM %></p>
                                    
                                    <div class="field">
                                        <label>Nombre del producto:</label>
                                        <div class="control">
                                          <input class="input" type="text" name="nameProd" id="nameProd"/>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Imagen de Producto</label>
                                        <div class="control">
                                            <div class="file has-name is-right">
                                                <label class="file-label">
                                                  <input class="file-input" type="file" name="resume">
                                                  <span class="file-cta">
                                                    <span class="file-icon">
                                                      <i class="fas fa-upload"></i>
                                                    </span>
                                                    <span class="file-label">
                                                      Choose a file…
                                                    </span>
                                                  </span>
                                                  <span class="file-name">
                                                    Screen Shot 2017-07-29 at 15.54.25.png
                                                  </span>
                                                </label>
                                              </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Cantidad:</label>
                                        <div class="control">
                                          <input class="input" type="number" name="cantProd" id="cantProd" min="1"/>
                                        </div>
                                    </div>
                                     <div class="field">
                                        <label>Categoría</label>
                                        <br>
                                        <input class="is-checkradio" id="NecBasicas" type="radio" name="NecBasicas" checked="checked">
                                        <label for="NecBasicas">Necesidades Básicas</label>

                                        <input class="is-checkradio" id="Hogar" type="radio" name="Hogar" checked="checked">
                                        <label for="Hogar">Hogar</label>

                                        <input class="is-checkradio" id="Tec" type="radio" name="Tec" checked="checked">
                                        <label for="Tec">Tecnología</label>

                                        <input class="is-checkradio" id="Repuestos" type="radio" name="Repuestos" checked="checked">
                                        <label for="Repuestos">Repuestos</label>
                                    </div>
                                    <div class="field">
                                        <label>Precio Unitario:</label>
                                        <div class="control">
                                          <input class="input" type="number" name="precProd" id="precProd" min="1"/>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Costo Unitario:</label>
                                        <div class="control">
                                          <input class="input" type="double" name="costoProd" id="costoProd" min="0.01"/>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Descripción:</label>
                                        <div class="control">
                                          <input class="input" type="text" name="descProd" id="descProd"/>
                                        </div>
                                    </div>
                                </form>
                              </section>
                              <footer class="modal-card-foot">
                                <button class="button is-success">Save changes</button>
                                <button class="button is-delete">Cancel</button>
                              </footer>
                            </div>
                                    
                          </div>
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
                        </article>
                        <article class="tile is-child box" style="border: green 10px inset;">
                            <h1 class="title">Envíos</h1>
                            <p class="subtitle">Tienes X envíos pendientes</p>
                            <div class="container" style="margin-left: 20px">
                                <span class="icon is-large">
                                    <a href="EnviosPend.jsp"><i class="fas fa-box-open" style="font-size: 5em; color: chartreuse"></i></a>
                                </span>
                            </div>
                        </article>
                  </div>
                  <div class="tile is-parent">
                      <article class="tile is-child box" style="border: black 10px inset;">
                        <p class="title">Informe de Ventas</p>
                        <p class="subtitle">Artículos más vendidos</p>
                        <% 
                            if (cantMasVendidos == 0){
                        %>
                        <p class="list-item">No has vendido ningún producto</p>
                        <% 
                            }else{
                                while(iteMasVendidos.hasNext()){
                                producto = iteMasVendidos.next();
                        %>
                        <p class="list-item"><%= producto.getNombre() %></p>
                        <% 
                            }
                        }
                        %>
                        <br>
                        <p class="subtitle">Productos en inventario más cercanos a agotarse</p>
                        <% 
                            if (cantMenosStock == 0){
                        %>
                        <p class="list-item">No se encontraron productos en inventario</p>
                        <% 
                            }else{
                                while(iteMenosStock.hasNext()){
                                producto = iteMenosStock.next();
                        %>
                        <p class="list-item"><%= producto.getNombre() %></p>
                        <% 
                            }
                        }
                        %>
                        <br>
                        <p class="subtitle">Productos agotados</p>
                        <% 
                            if (cantSinStock == 0){
                        %>
                        <p class="list-item">No hay ningún producto sin Stock</p>
                        <% 
                            }else{
                                while(iteSinStock.hasNext()){
                                producto = iteSinStock.next();
                        %>
                        <p class="list-item"><%= producto.getNombre() %></p>
                        <% 
                            }
                        }
                        %>
                        <br>
                        <a href="EstadoDeVentas.jsp"><small>Más información</small></a>
                    </article>
                  </div>
                </div>
            </div>
            </div>
        </section>
    </body>
</html>
