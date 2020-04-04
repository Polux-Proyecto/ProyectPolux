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
