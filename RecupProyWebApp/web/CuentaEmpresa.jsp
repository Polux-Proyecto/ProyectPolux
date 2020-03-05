<%-- 
    Document   : CuentaEmpresa
    Created on : 03-05-2020, 10:59:49 AM
    Author     : Joanna Rivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Crea una cuenta empresarial</title>
    </head>
    <body>
        <section class="section">
            <div class="container">
                <h1 class="title">
                    Crea una cuenta empresarial
                </h1>
                <h2 class="title-2">
                    Es fácil y rápido
                </h2>
            </div>
        <div class="field">
            <label class="label">Nombre</label>
                <div class="control">
                    <input class="input" type="text" placeholder="Text input">
                </div>
        </div>

        <div class="field">
            <label class="label">Username</label>
                <div class="control has-icons-left has-icons-right">
                    <input class="input is-success" type="text" placeholder="Text input" value="bulma">
                    <span class="icon is-small is-left">
                        <i class="fas fa-user"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i class="fas fa-check"></i>
                    </span>
                </div>
        </div>

        <div class="field">
          <label class="label">Email</label>
          <div class="control has-icons-left has-icons-right">
            <input class="input is-danger" type="email" placeholder="Email input" value="hello@">
            <span class="icon is-small is-left">
              <i class="fas fa-envelope"></i>
            </span>
            <span class="icon is-small is-right">
              <i class="fas fa-exclamation-triangle"></i>
            </span>
          </div>
        </div>
        
        <div class="field">
            <label class="label">Contraseña</label>
                <div class="control">
                    <input class="input" type="password" placeholder="Text input">
                </div>
        </div>

        <div class="field is-grouped">
          <div class="control">
            <button class="button is-link">Submit</button>
          </div>
          <div class="control">
            <button class="button is-link is-light">Cancel</button>
          </div>
        </div>
       </section>
    </body>
</html>
