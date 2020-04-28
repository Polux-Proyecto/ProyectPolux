
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="com.commercewebapp.objects.NuevoMicroEmpresario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
   
    List<Categoria> categorias = (List<Categoria>) request.getSession().getAttribute("listaCategoria");
    Iterator<Categoria> iteCategoria = null;
    Categoria categoriaActual = null;
    if (categorias!=null){
         iteCategoria = categorias.iterator();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css">
        <title>Crea una cuenta empresarial</title>
    </head>
    <%
        NuevoMicroEmpresario usuarioexistente = (NuevoMicroEmpresario)request.getSession().getAttribute("usuarioexistente");
        String error = (String)request.getSession().getAttribute("error");
            String name="";
            String user=""; 
            String nit="9-digitos";
            String password="";
            String descripcion="";
            String email="me@example.com";
            String pais="";
            String ciudad="";
            String categoria="";
            int intcategoria=-1;
            byte[] logo=null;
            String mensajeerror = "";
            
                if(usuarioexistente!=null && error=="2"){
                    name = usuarioexistente.getName();
                    nit = usuarioexistente.getNit();
                    descripcion = usuarioexistente.getDescripcion();
                    email =usuarioexistente.getEmail();
                    pais= usuarioexistente.getPais();
                    ciudad = usuarioexistente.getCiudad();
                     intcategoria = usuarioexistente.getCategoria();
                    categoria = Integer.toString(intcategoria);
                    
                    mensajeerror = "El nombre de usuario ya existe, intente con otro";
           
                }
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
                                "CREA UNA CUENTA EMPRESARIAL"
                            </h2>
                        </div>
                    </div>
                </section>
                <br><br> 
                <div class="field">
                    <div class="control">
                        <div class="file has-name is-right">
                            <label class="file-label">
                                <input class="file-input" type="file" name="resume" required>
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
                              </span>
                              <span class="file-name">
                                Ingrese su imagen
                              </span>
                            </label>
                          </div>
                    </div>
                </div>
                <div class="field">
                    <label>Nombre</label>
                    <div class="control">
                        <input class="input" type="text" name="nombreEmp" id="nombreEmp" placeholder="Text input" required value =<%=name%> >
                    </div>
                </div>
                <div class="field">
                    <label>Username</label>
                    <div class="control">
                        <div style="color:red"><%= mensajeerror%></div>
                        <input class="input" type="text" name="userEmp" id="userEmp" idplaceholder="Text input" required>
                    </div>
                </div>
                <div class="field">
                    <label>Email</label>
                    <div class="control">
                        <input id="strNewEmail" name="strNewEmail" class="input is-danger" type="email" placeholder="Email input" value =<%=email%> required>
                    </div>
                </div>
                <div class="field">
                    <label>NIT</label>
                    <div class="control">
                        <input class="input" type="text" name="nit" id="nit" placeholder="Text input" required value =<%=nit%>>
                    </div>
                </div>
                <div class="field">
                    <label>Contraseña</label>
                    <div class="control">
                        <input class="input" type="password" name="passEmp" id="passEmp" placeholder="Text input" required>
                    </div>
                </div>    
                <div class="field">
                    <label>País</label>
                    <div class="control">
                        <div class="select is-info">
                            <select  id="StringNewCountryEmp" name="StringNewCountryEmp" required>
                                <option value="ElSalvador" <%if(pais.equals("El Salvador")){%>selected<% } %>>El Salvador</option>
                                <option value="Guatemala" <%  if(pais.equals("Guatemala")){%>selected<% } %>>Guatemala</option>
                                <option value="Belice" <% if(pais.equals("Belice")){%>selected<% } %>>Belice</option>
                                <option value="Nicaragua" <%  if(pais.equals("Nicaragua")){%>selected<% } %>>Nicaragua</option>
                                <option value="Honduras" <%  if(pais.equals("Honduras")){%>selected<% } %>>Honduras</option>
                                <option value="Panama" <%  if(pais.equals("Panamá")){%>selected<% } %>>Panamá</option>
                                <option value="CostaRica" <%  if(pais.equals("Costa Rica")){%>selected<% } %>>Costa Rica</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <label>Ciudad</label>
                    <div class="control">
                        <input id="strnewCiudadEmp" name="strnewCiudadEmp" class="input" type="text" placeholder="Text input" required value =<%=ciudad%>>
                    </div>
                </div>
                <div class="field">
                    <label>Categoría</label>
                    <div class="control">
                        <div class="select is-info">
                            <select  id="StrCategoria" name="StrCategoria" required>
                                <% if(categorias!=null){
                                        while(iteCategoria.hasNext()){
                                            categoriaActual = iteCategoria.next();
                                            if(categoriaActual.getIdCat()==intcategoria){
                                %>
                                <option selected="" value=<%= categoriaActual.getIdCat() %> > <%= categoriaActual.getNombre() %> </option>
                                <%      }else{%>
                                <option value=<%= categoriaActual.getIdCat() %>><%= categoriaActual.getNombre() %> </option>
                                    <%}}}%>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field">
                <label>Descripcion</label>
                    <div class="control">
                        <textarea class="textarea" type="text" name="descEmp" id="descEmp" placeholder="200 words or less"> <%=descripcion%> </textarea>
                    </div>
                </div>
                <div class="field is-grouped">
                    <div class="control">
                        <button class="button is-link is-primary">Submit</button>
                    </div>
                </div>
                <input type="hidden" name="formid" value="2" > 
            </form>
            <div class="control">
                <a href="index.jsp"><button class="button is-link is-light">Cancel</button></a>
            </div>
        </section>
    </body>
</html>
