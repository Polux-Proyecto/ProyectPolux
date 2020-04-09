
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
        
 
        <form id="Nuevamicroempresaform" name="Nuevamicroempresaform" action="LogicRegistroNuevoUsuarioServlet" method="post" method="post" enctype="multipart/form-data">
        
            <section class="section has-background-light ">
                <div class="container">
                    <h1 class="title  is-size-1 has-text-primary ">
                        Bienvenido a BrocOnline 
                    </h1>
                    <h2 class="subtitle is-size-4 is-italic  ">
                        Crea una cuenta empresarial 
                    </h2>
                </div>
                <div class="field">
                    
                    <div class="control">
                        <div class="file has-name is-right">
                            <label class="file-label">
                              <input class="file-input" type="file" name="resume">
                              <span class="file-cta">
                                <span class="file-icon">
                                  <i class="fas fa-upload"></i>
                                </span>
                                <span class="file-label is-primary ">
                                  Logo Empresarial... 
                                </span>
                              </span>
                              <span class="file-name">
                                Screen Shot 2017-07-29 at 15.54.25.png
                              </span>
                            </label>
                          </div>
                    </div>
                </div>
                <div class="field">
                    <label>Nombre</label>
                    <div class="control">
                        <input class="input" type="text" name="nombreEmp" id="nombreEmp" placeholder="Text input">
                    </div>
                </div>

                <div class="field">
                    <label>Username</label>
                    <div class="control">
                        <input class="input" type="text" name="userEmp" id="userEmp" idplaceholder="Text input">
                    </div>
                </div>
                <div class="field">
                    <label>Email</label>
                    <div class="control">
                        <input id="strNewEmail" name="strNewEmail" class="input is-danger" type="email" placeholder="Email input" value="me@example.com">
                    </div>
                </div>
                <div class="field">
                    <label>NIT</label>
                    <div class="control">
                        <input class="input" type="text" name="nit" id="nit" placeholder="Text input" value="9 digitos">
                    </div>
                </div>

                <div class="field">
                    <label>Contraseña</label>
                    <div class="control">
                        <input class="input" type="password" name="passEmp" id="passEmp" placeholder="Text input">
                    </div>
                </div>    
                <div class="field">
                    <label>País</label>
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
                    <label>Ciudad</label>
                    <div class="control">
                        <input id="strnewCiudadEmp" name="strnewCiudadEmp" class="input" type="text" placeholder="Text input">
                    </div>
                </div>
                 <div class="field">
                    <label>Categoría</label>
                    <br>
                    <input class="is-checkradio" id="StrCategoria" type="radio" name="StrCategoria" checked="checked">
                    <label for="NecBasicas">Necesidades Básicas</label>
                    
                    <input class="is-checkradio" id="StrCategoria" type="radio" name="StrCategoria">
                    <label for="Hogar">Hogar</label>
                    
                    <input class="is-checkradio" id="StrCategoria" type="radio" name="StrCategoria" >
                    <label for="Tec">Tecnología</label>
                    
                    <input class="is-checkradio" id="StrCategoria" type="radio" name="StrCategoria" >
                    <label for="Repuestos">Repuestos</label>
                </div>
                    
                <div class="field">
                <label>Descripcion</label>
                    <div class="control">
                        <textarea class="textarea" type="text" name="descEmp" id="descEmp" placeholder="200 words or less"></textarea>
                    </div>
                </div>
                 
                <div class="field is-grouped">
                    <div class="control">
                        <button class="button is-link is-primary">Submit</button>
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
