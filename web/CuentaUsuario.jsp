<%-- 
    Document   : CuentaUsuario
    Created on : 03-05-2020, 10:59:31 AM
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
        <form id="Nuevousuarioform" name="Nuevousuarioform" action="LogicRegistroNuevoUsuarioServlet" method="post">
            <section class="section">
                <div class="container">
                    <h1 class="title">
                        Crea una cuenta
                    </h1>
                    <h2 class="title is-2">
                        Es fácil y rápido
                    </h2>
                </div>
                <div class="field">
                    <label >Nombre</label>
                    <div class="control">
                        <input id="strnewNombreUsuario" name="strnewNombreUsuario" class="input" type="text" placeholder="Text input">
                    </div>
                </div>
                <div class="field">
                    <label>Imagen de Perfil</label>
                    <div class="control">
                        <div class="file has-name is-right">
                            <label class="file-label">
                              <input class="file-input" type="file" name="resume">
                              <span class="file-cta">
                                <span class="file-icon">
                                  <i class="fas fa-upload"></i>
                                </span>
                                <span class="file-label">
                                  Choose a file…
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
                    <label>Username</label>
                    <div class="control">
                        <input id="strNewUsername" name="strNewUsername" class="input" type="text" placeholder="Text input" >
                    </div>
                </div>

                <div class="field">
                  <label>Email</label>
                  <div class="control">
                    <input id="strNewEmail" name="strNewEmail" class="input is-danger" type="email" placeholder="Email input" value="me@example.com">
                  </div>
                </div>
                <div class="field">
                    <label>Contraseña</label>
                    <div class="control">
                        <input name="newpassword" id="newpassword" class="input is-danger" type="password" placeholder="Text input">
                    </div>
                </div>
                <div class="field">
                    <label>Sexo</label>
                    <div class="control">
                        <div class="select is-info">
                            <select  id="StringNewSexo" name="StringNewSexo">
                                <option value="Femenino">Femenino</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Indefinido">Prefiero no decirlo</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <label>Fecha de Nacimiento</label>
                    <div class="control">
                        <div class="select is-info">
                            <label class="label" style="font-weight: 100;">Día</label>
                            <select  id="StringNewBornDay" name="StringNewBornDay">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="30">31</option>
                            </select>
                        </div>
                        <div class="select is-info">
                            <label class="label" style="font-weight: 100;">Mes</label>
                            <select  id="StringNewBornMonth " name="StringNewBornMonth">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                        <div class="select is-info">
                            <label class="label" style="font-weight: 100;">Año</label>
                            <select onchange="confirm('Año: '+this.value)">
                            <script>
                            var myDate = new Date();
                            var year = myDate.getFullYear();
                            for(var i = 1900; i < year+1; i++){
                            document.write('<option value="'+i+'">'+i+'</option>');
                            }
                            </script>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <br>
                    <label>País</label>
                    <div class="control">
                        <div class="select is-info">
                            <select  id="StringNewCountry" name="StringNewCountry">
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
                        <input id="strnewCiudadUsuario" name="strnewCiudadUsuario" class="input" type="text" placeholder="Text input">
                    </div>
                </div>
                <div class="field">
                    <label>Dirección</label>
                    <div class="control">
                        <input id="strnewDireccionUsuario" name="strnewDireccionUsuario" class="input" type="text" placeholder="Text input">
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
            <input type="hidden" name="formid" value="1" />
        </form>
    </body>
</html>