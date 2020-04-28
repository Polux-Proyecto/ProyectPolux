<%-- 
    Document   : ErrorEnInicioSesion
    Created on : 03-15-2020, 06:15:14 PM
    Author     : 78GDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Brocoline: Iniciar sesión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
		<style>
		.content {
		  max-width: 600px;
		  margin: auto;
		}
                a {
                    font-size: 17px;
                }
		</style>
    </head>
    <body>
        <br><br>
        <section class="hero is-primary is-bold has-text-centered has-background-grey-light">
            <div class="hero-body">
                <div class="container ">
                    <h1 class="title  is-size-1 is-family-sans-serif ">
                        BrocOnline Store 
                    </h1>
                    <h2 class="subtitle">
                        "The market in your hands"
                    </h2>
                </div>
            </div>
        </section>
        <br><br> 
        <section class="section has-background-light">
            <form action="LoggeoUsuarios" method="post" class="content">
                <h1 class="title has-text-centered  is-size-2 title-color-red is-family-sans-serif "> Ups... hubo un error en su inicio de sesión</h1>
                <br><br>	
                <div class="field">
                    <div class="control">
                        <input class="button is-primary is-bold is-large is-fullwidth" type="submit" value="Regresar a pagina de inicio" herf="index.jsp"/>
                    </div>
                </div>
            </form>
        </section>
    </body>
</html>