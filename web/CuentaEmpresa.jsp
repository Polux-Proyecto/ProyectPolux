
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
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
                    <div class="control">
                        <input class="input" type="text" name="userEmp" id="userEmp" idplaceholder="Text input">
                    </div>
                </div>
                <div class="field">
                    <label class="label">Email</label>
                    <div class="control">
                        <input id="strNewEmail" name="strNewEmail" class="input is-danger" type="email" placeholder="Email input" value="me@example.com">
                    </div>
                </div>
                <div class="field">
                    <label class="label">NIT</label>
                    <div class="control">
                        <input class="input" type="text" name="nit" id="nit" placeholder="Text input" value="9 digitos">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Contraseña</label>
                    <div class="control">
                        <input class="input" type="password" name="passEmp" id="passEmp" placeholder="Text input">
                    </div>
                </div>    
                <div class="field">
                    <label class="label">País</label>
                    <div class="control">
                        <div class="select is-info">
                            <select  id="StringNewCountryEmp" name="StringNewCountryEmp">
                                <option value="ElSalvador">El Salvador</option>
                                <option value="Guatemala">Guatemala</option>
                                <option value="Belice">Belice</option>
                                <option value="Nicaragua">Nicaragua</option>
                                <option value="Honduras">Honduras</option>
                                <option value="Panama">Panamá</option>
                                <option value="CostaRica">Costa Rica</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <label class="label">Ciudad</label>
                    <div class="control">
                        <input id="strnewCiudadEmp" name="strnewCiudadEmp" class="input" type="text" placeholder="Text input">
                    </div>
                </div>
                 <div class="field">
                    <label class="label">Categoría</label>
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
