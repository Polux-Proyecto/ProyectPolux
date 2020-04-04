<%-- 
    Document   : index
    Created on : 03-18-2020, 09:30:14 AM
    Author     : 78GDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String error = (String)session.getAttribute("error");
    String message = "";
    if (error != null){
        if (error.equals("1")){
            message = "Error en inicio de sesión: la contraseña o el username no coincide";
        } else {
            message = "Error en inicio de sesión: el usuario ingresado no existe";
        }
    }
%>
<html>
    <head>
        <title>Brocolin: Iniciar sesión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section class="section">
            <div class="container">
                <h1 class="title is-2">
                    Distribuidora Brocolin
                </h1>
                <h2 class="title is-3">
                    Iniciar Sesión:
                </h2>
            </div><br><br>
            <form action="LoggeoUsuarios" method="post">
				<div class="field">
                                    
                                    <label class="title">Usuario</label><br>
                                        <div class="subtitle has-text-danger" ><%= message%></div>
					<p class="control">
						<input class="input" type="text" name="nameis" placeholder="Usuario">
					</p>
				</div>
                <div class="field">
                    <label class="title">Contraseña</label><br><br>
                    <div class="control">
                        <input class="input" type="password" name="passis" id="passis"/>
                    </div>
                </div>
                <div class="field">
                    <div class="control">
                        <input class="button is-link" type="submit" value="send"/>
                        
                    </div>
                </div>
            </form>
			<br>
            <div class="is-link">
                <h2>
					<strong>¿No tienes cuenta? </strong>
					<br>
                    <a href="CuentaUsuario.jsp">Crea una cuenta de usuario</a>
					<br>
					<a href="CuentaEmpresa.jsp">Crea una cuenta de empresa</a>
                </h2>
            </div>
        </section>
        <!--
        <a href="https://api.whatsapp.com/send?phone=50371268339&text=Hola,%20¿qué%20tal%20estás?">Mensaje</a>
        -->
    </body>
</html>
