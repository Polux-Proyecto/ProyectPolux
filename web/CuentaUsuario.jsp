<%-- 
    Document   : CuentaUsuario
    Created on : 03-05-2020, 10:59:31 AM
    Author     : Joanna Rivas
--%>

<%@page import="com.commercewebapp.objects.Arreglos"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="com.commercewebapp.objects.NuevoUsuarioParticular"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <title>Crea una cuenta </title>
        <style>
		.content {
		  max-width: 600px;
		  margin: auto;
		}
		</style>
    </head>
    <%
           NuevoUsuarioParticular usuarioexistente = (NuevoUsuarioParticular)request.getSession().getAttribute("usuarioexistente");
           String error = (String)request.getSession().getAttribute("error");
           String nombre = "";
           String user = "";
           String email = "me@example.com";
           String password = "";
           String pais = "";
           String ciudad = "";
           String direccion = "";
           String sexo = "";
           String sdia = "";
           int dia= -1;
           String smes = "";
           int mes=-1;
           String sanno = "";
           int anno=-1;
           Part imagenperfil = null; 
           String mensajeerror = "";
           Arreglos arreglos =  new Arreglos();
               if(usuarioexistente!=null && error=="1"){
                    nombre = usuarioexistente.getName();
                    user = usuarioexistente.getUsername();
                    email = usuarioexistente.getEmail();
                    pais = usuarioexistente.getPais();
                    ciudad = usuarioexistente.getCiudad();
                    direccion = usuarioexistente.getDireccion();
                    sexo = usuarioexistente.getSexo();
                    sdia = (String)request.getSession().getAttribute("day");
                    dia = Integer.parseInt(sdia);
                    smes = (String)request.getSession().getAttribute("month");
                    mes = Integer.parseInt(smes);
                    sanno = (String)request.getSession().getAttribute("year");
                    anno = Integer.parseInt(sanno);
                    imagenperfil = (Part)request.getSession().getAttribute("imagenfile");
                    
                    mensajeerror = "El nombre de usuario ya existe, intente con otro";
           
                }
    %>
    
    <%
int annos[] = arreglos.getAnnos();
int canAnnos = arreglos.getCant();
     %>
    
    <body>
            <section class="section has-background-light ">
        <form id="Nuevousuarioform" name="Nuevousuarioform" action="LogicRegistroNuevoUsuarioServlet" method="post" enctype="multipart/form-data">
                 <section class="hero is-primary is-bold has-text-centered has-background-grey-light">
  <div class="hero-body">
    <div class="container ">
      <h1 class="title  is-size-1 is-family-sans-serif ">
        BrocOnline Store 
      </h1>
      <h2 class="subtitle">
        "CREA UNA CUENTA DE USUARIO"
      </h2>
    </div>
  </div>
</section>
            <br><br> 
               
                <div class="field">
                    <label>Imagen de Perfil</label>
                    <div class="control">
                        <div class="file has-name is-right">
                            <label class="file-label">
                              <input class="file-input" type="file" name="resume" value=<%=imagenperfil%>>
                              <span class="file-cta">
                                <span class="file-icon">
                                  <i class="fas fa-upload"></i>
                                </span>
                                <span class="file-label">
                                  Agrega una foto de perfil... 
                                </span>
                              </span>
                              <span class="file-name">
                                Screen Shot 2017-07-29 at 15.54.25.png
                              </span>
                            </label>
                          </div>
                    </div>
                </div>
                              <br><br> 
                               <div class="field">
                    
                    <label >Nombre</label>
                    <div class="control">
                        <input id="strnewNombreUsuario" name="strnewNombreUsuario" class="input" type="text" placeholder="Text input" value=<%=nombre%>>
                    </div>
                </div>
                <div class="field">
                    <label>Username</label>
                    <div class="control">
                        <div style="color:red"><%= mensajeerror%>
                        <input id="strNewUsername" name="strNewUsername" class="input" type="text" placeholder="Text input" >
                    </div>
                </div>

                <div class="field">
                  <label>Email</label>
                  <div class="control">
                    <input id="strNewEmail" name="strNewEmail" class="input is-danger" type="email" placeholder="Email input" value=<%=email%>>
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
                                <%
                                    System.out.println(smes);
                                    if(sexo.equals("Femenino")){%>
                                <option value="Femenino" selected="">Femenino</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Indefinido">Prefiero no decirlo</option>
                                
                                <%}else if(sexo.equals("Masculino")){%>
                                <option value="Femenino" >Femenino</option>
                                <option value="Masculino" selected="">Masculino</option>
                                <option value="Indefinido">Prefiero no decirlo</option>
                                
                                <%}else if(sexo.equals("Indefinido") ){%>
                                <option value="Femenino" >Femenino</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Indefinido" selected="">Prefiero no decirlo</option>
                                 <% }else{%>
                                 <option value="Femenino" >Femenino</option>
                                <option value="Masculino" selected="">Masculino</option>
                                <option value="Indefinido">Prefiero no decirlo</option>
                                 <%}%>
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
                                <% 
                                    int dias[] = arreglos.getDias();
                                    for (int j = 0; j < 31 ; j++){ 
                                    if(dias[j]==dia){
                                %>
                                <option value="<%= dias[j] %>" selected=""><%= dias[j] %></option>
                                <% }else{%>
                                <option value="<%= dias[j] %>"><%= dias[j] %></option>
                                
                                <% } 
                                    }
                                %>
                            </select>
                        </div>
                        <div class="select is-info">
                            <label class="label" style="font-weight: 100;">Mes</label>
                            <select  id="StringNewBornMonth " name="StringNewBornMonth">
                                <% 
                                String meses[] = arreglos.getMeses();
                                for (int j=0 ; j < 12; j++){
                                    if((j+1)== mes){
                               
                                %>
                                <option value="<%= j + 1 %>" selected=""><%= meses[j] %></option>
                                <% }else{ %>
                                <option value="<%= j + 1 %>"><%= meses[j] %></option>
                                <%} }%>
                            </select>
                        </div>
                        <div class="select is-info">
                            <label class="label" style="font-weight: 100;">Año</label>
                            <select name="StringNewUseryear" id="StringNewUseryear">
                            
                            <% 
                                    for(int i = 0; i < canAnnos ; i++ ){

                                    if(annos[i]+20 == anno){
                                    %>
                                 <option value="<%= annos[i] + 20 %>" selected="" > <%= annos[i] + 20 %> </option>
                                <%
                                    }else{
                                %>
                                <option value="<%= annos[i] + 20 %>" > <%= annos[i] + 20 %> </option>
                                <%}}%>
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
                                
                                
                                <option value="ElSalvador" <%if(pais.equals("El Salvador")){%>selected<% } %>>El Salvador</option>
                                <option value="Guatemala" <% else if(pais.equals("Guatemala")){%>selected<% } %>>Guatemala</option>
                                <option value="Belice" <%else if(pais.equals("Belice")){%>selected<% } %>>Belice</option>
                                <option value="Nicaragua" <% else if(pais.equals("Nicaragua")){%>selected<% } %>>Nicaragua</option>
                                <option value="Honduras" <% else if(pais.equals("Honduras")){%>selected<% } %>>Honduras</option>
                                <option value="Panama" <% else if(pais.equals("Panamá")){%>selected<% } %>>Panamá</option>
                                <option value="CostaRica" <% else if(pais.equals("Costa Rica")){%>selected<% } %>>Costa Rica</option>
                                
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <label>Ciudad</label>
                    <div class="control">
                        <input id="strnewCiudadUsuario" name="strnewCiudadUsuario"  class="input" type="text" placeholder="Text input" value=<%=ciudad%>>
                    </div>
                </div>
                <div class="field">
                    <label>Dirección</label>
                    <div class="control">
                        <input id="strnewDireccionUsuario" name="strnewDireccionUsuario"  class="input" type="text" placeholder="Text input" value=<%=direccion%>>
                    </div>
                </div>          
                <div class="field is-grouped">
                    <div class="control">
                        <button class="button is-link">Submit</button>
                    </div>
                    <div class="control">
                        <button class="button is-link is-light" href="">Cancel</button>
                    </div>
                </div>
            </section>
            <input type="hidden" name="formid" value="1" />
        </form>
    </body>
</html>
