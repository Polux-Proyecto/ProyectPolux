<%-- 
    Document   : InicioEmpresa
    Created on : 03-05-2020, 11:31:15 AM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>InicioEmpresa</title>
    </head>
    <body>
        <section class="section">
            <div class="container">
                <h1 class="title">
                    ¡Bienvenido de nuevo!
                </h1>
            </div>
        </section>
        <section class="section">
            <div class="tile is-ancestor">
                <div class="tile is-vertical">
                <div class="tile">
                  <div class="tile is-parent is-vertical">
                    <article class="tile is-child box">
                      <p class="title">Añadir Producto</p>
                      <p class="subtitle">Agrega nuevos productos a tu inventario</p>
                      <div class="field">
                          <label>Nombre del producto:</label>
                          <div class="control">
                            <input class="input" type="text" name="nameProd" id="nameProd"/>
                          </div>
                      </div>
                      <div class="field">
                          <label>Cantidad:</label>
                          <div class="control">
                            <input class="input" type="number" name="cantProd" id="cantProd"/>
                          </div>
                      </div>
                      <div class="field">
                          <label>Costo Unitario:</label>
                          <div class="control">
                            <input class="input" type="double" name="costoProd" id="costoProd"/>
                          </div>
                      </div>
                      <div class="field">
                          <label>Descripción:</label>
                          <div class="control">
                            <input class="input" type="text" name="descProd" id="descProd"/>
                          </div>
                      </div>
                    </article>
                    <article class="tile is-child box">
                        <a href="EnviosPend.jsp"><h1 class="title">Envíos</h1>></a>
                      <p class="subtitle">Revisa tus envíos pendientes</p>
                    </article>
                  </div>
                  <div class="tile is-parent">
                    <article class="tile is-child box">
                      <p class="title">Estado de Cuenta</p>
                      <p class="subtitle">Ingresos</p>
                      <p class="subtitle">Artículos más vendidos</p>
                      <p class="list-item">a</p>
                      <p class="list-item">b</p>
                      <p class="subtitle">Productos en inventario</p>
                      <p class="list-item">a</p>
                      <p class="list-item">b</p>
                      <p class="subtitle">Productos agotados</p>
                      <p class="list-item">a</p>
                      <p class="list-item">b</p>
                    </article>
                  </div>
                </div>
            </div>
        </section>
        
            
        </section>
    </body>
</html>
