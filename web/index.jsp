<%-- 
    Document   : index
    Created on : 03-18-2020, 09:30:14 AM
    Author     : 78GDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String error = (String)session.getAttribute("error");
    String codigo = (String)session.getAttribute("codigo");
    String newuser = (String)session.getAttribute("nuevouser");
    String usuarioregitrado = "";
    String message = "";
    if (error != null){
        if (error.equals("1")){
            message = "Error en inicio de sesión: la contraseña o el username no coincide";
        } else {
            message = "Error en inicio de sesión: el usuario ingresado no existe";
        }
    }
    if (codigo!=null){
        if(codigo=="27"){
            message = "Bienvenido, su nuevo usuario ha sido regsitrado con exito! , ingrese su contraseña ";
            usuarioregitrado = newuser;
        }
    }
    
%>
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
        
        
        <section class="section has-background-light">
            
            <form action="LoggeoUsuarios" method="post" class="content">
				<div class="field  ">
                                    
                                    <label class="title is-size-3">Usuario: </label><br>
                                        <div class="subtitle has-text-danger" ><%= message%></div>
					<p class="control">
						<input class="input" type="text" name="nameis" placeholder="Usuario" value=<%=usuarioregitrado%>>
					</p>
				</div>
                <div class="field">
                    <label class="title">Contraseña: </label><br><br>
                    <div class="control">
                        <input class="input" type="password" name="passis" id="passis"/>
                    </div>
                </div>
                                        <br> 
                <div class="field">
                    <div class="control">
                        <input class="button is-link is-bold is-medium" type="submit" value="Send"/>
                        
                    </div>
                </div>
            </form>
                                        <br>
            <div class="is-link content">
                <h2>
                    <strong>¿No tienes cuenta? </strong>
                    <br>
                    <a href="CuentaUsuario.jsp">Crea una cuenta de usuario</a>
                        <br>
                    <a href="Buscadores?formid=5">Crea una cuenta empresarial</a>
                </h2>
            </div>
        </section>
        <!--
        <a href="https://api.whatsapp.com/send?phone=50371268339&text=Hola,%20¿qué%20tal%20estás?">Mensaje</a>
        -->
    </body>
</html>
