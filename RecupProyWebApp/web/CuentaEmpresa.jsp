<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Crea una cuenta empresarial</title>
    </head>
    <body>
       <form id="Nuevamicroempresaform" name="Nuevamicroempresaform" action="LogicRegistroNuevoUsuarioServlet" method="post">
        <section class="section">
            <div class="container">
                <h1 class="title">
                    Crea una cuenta empresarial
                </h1>
                <h2 class="title is-2">
                    Es fácil y rápido
                </h2>
            </div>
        <div class="field">
            <label class="label">Nombre</label>
                <div class="control">
                    <input class="input" type="text" name="nombreEmp" id="nombreEmp" placeholder="Text input">
                </div>
        </div>

        <div class="field">
            <label class="label">Username</label>
                <div class="control has-icons-left has-icons-right">
                    <input class="input is-success" type="text" name="userEmp" id="userEmp" idplaceholder="Text input" value="bulma">
                    <span class="icon is-small is-left">
                        <i class="fas fa-user"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i class="fas fa-check"></i>
                    </span>
                </div>
        </div>

        <div class="field">
          <label class="label">NIT</label>
          <div class="control has-icons-left has-icons-right">
            <input class="input is-danger" type="text" name="nit" id="nit" placeholder="Text input" value="9 digitos">
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
                    <input class="input" type="password" name="passEmp" id="passEmp" placeholder="Text input">
                </div>
        </div>
        <div class="field">
            <label class="label">Descripcion</label>
                <div class="control">
                    <textarea class="textarea" type="text" name="descEmp" id="descEmp" placeholder="200 words or less"></textarea>
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
        <input type="hidden" name="formid" value="2" /> 
       </form>
    </body>
</html>
