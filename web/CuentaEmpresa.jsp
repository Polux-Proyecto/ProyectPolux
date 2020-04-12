
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
            byte[] logo=null;
            String mensajeerror = "";
            
                if(usuarioexistente!=null && error=="2"){
                    name = usuarioexistente.getName();
                    nit = usuarioexistente.getNit();
                    descripcion = usuarioexistente.getDescripcion();
                    email =usuarioexistente.getEmail();
                    pais= usuarioexistente.getPais();
                    ciudad = usuarioexistente.getCiudad();
                    int intcategoria = usuarioexistente.getCategoria();
                    categoria = Integer.toString(intcategoria);
                    
                    mensajeerror = "El nombre de usuario ya existe, intente con otro";
           
                }
    %>
    <body>
        
 
        <form id="Nuevamicroempresaform" name="Nuevamicroempresaform" action="LogicRegistroNuevoUsuarioServlet" method="post" method="post" enctype="multipart/form-data">
        
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
                        <input class="input" type="text" name="nombreEmp" id="nombreEmp" placeholder="Text input" value =<%=name%>>
                    </div>
                </div>

                <div class="field">
                    <label>Username</label>
                    <div class="control">
                        <div style="color:red"><%= mensajeerror%>
                        <input class="input" type="text" name="userEmp" id="userEmp" idplaceholder="Text input">
                    </div>
                </div>
                <div class="field">
                    <label>Email</label>
                    <div class="control">
                        <input id="strNewEmail" name="strNewEmail" class="input is-danger" type="email" placeholder="Email input" value =<%=email%>>
                    </div>
                </div>
                <div class="field">
                    <label>NIT</label>
                    <div class="control">
                        <input class="input" type="text" name="nit" id="nit" placeholder="Text input" value =<%=nit%>>
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
                        <input id="strnewCiudadEmp" name="strnewCiudadEmp" class="input" type="text" placeholder="Text input" value =<%=ciudad%>>
                    </div>
                </div>
                 <div class="field">
                    <label>Categoría</label>
                    <div class="control">
                        <div class="select is-info">
                            <select  id="StrCategoria" name="StrCategoria">
                                <% if(categorias!=null){
                                        while(iteCategoria.hasNext()){
                                            categoriaActual = iteCategoria.next();
                                %>
                                <option value=<%= categoriaActual.getIdCat() %>><%= categoriaActual.getNombre() %> </option>
                                <%      }
                                    }%>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field">
                <label>Descripcion</label>
                    <div class="control">
                        <textarea class="textarea" type="text" name="descEmp" id="descEmp" placeholder="200 words or less" value =<%=descripcion%>></textarea>
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
