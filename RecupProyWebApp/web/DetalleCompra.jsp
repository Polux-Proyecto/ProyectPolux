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
        <section class="section">
            <div class="container">
                <h1 class="title">
                    Detalle de Envios Pendientes
                </h1>
            </div>
        </section>
        <section class="section">
            <div class="table-container">
                <table class="table is striped">
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
                    </tbody>
                </table>
            </div>    
        </section>
    </body>
</html>
