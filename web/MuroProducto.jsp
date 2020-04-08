<%-- 
    Document   : MuroProducto
    Created on : 04-08-2020, 02:22:54 PM
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
        <div class="tile is-ancestor">
            <div class="tile is-parent ">
                <div class="tile is-child box">
                    <div class="box">
                        <article class="media">
                            <div class="media-left">
                              <figure class="image is-128x128">
                                <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
                              </figure>
                            </div>
                            <div class="media-content">
                              <div class="content">
                                <p><strong>Nombre del producto</strong> 
                                  <br>Precio:<br>Descripción:
                                </p><br>
                              </div>
                            </div>
                            <nav class="navbar" role="navigation" aria-label="main navigation">
                                <div class="field is-grouped">
                                    <a class="navbar-item">
                                        <div class="control">
                                            <button class="button is-outlined is-danger">Lista de deseos</button>
                                        </div>
                                    </a>
                                    <a class="navbar-item" href="CompraProducto.jsp">
                                        <div class="control">
                                            <button class="button is-outlined ">Comprar</button>
                                        </div>
                                    </a>
                                </div>
                            </nav>
                        </article>
                    </div>
                </div>
             </div>
        </div>
    </body>
</html>
