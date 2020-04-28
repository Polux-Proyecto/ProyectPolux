<%-- 
    Document   : InicioEmpresa
    Created on : 03-05-2020, 11:31:15 AM
    Author     : Joanna Rivas
    Errores    : 
        1 - No se pudo insertar el producto ingresado
    Mensajes   :
        1 - El producto se ingresó con éxito
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.commercewebapp.objects.Producto"%>
<%@page import="com.commercewebapp.objects.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="com.commercewebapp.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
    if (usuario==null){
        response.sendRedirect("ErrorEnInicioSesion.jsp");
    }
    List<Producto> listaProdMasVendidos = (List<Producto>) request.getSession().getAttribute("listaProdMasVendidos");
    List<Producto> listaPrdMenosStock = (List<Producto>) request.getSession().getAttribute("listaPrdMenosStock");
    List<Producto> listaProdSinStock = (List<Producto>) request.getSession().getAttribute("listaProdSinStock");
    int cantidadProducto = (Integer) request.getSession().getAttribute("cantidadProducto");
    
    
    int cantMasVendidos = 0;
    int cantMenosStock = 0;
    int cantSinStock = 0;
    Iterator<Producto> iteMasVendidos = null;
    Iterator<Producto> iteMenosStock = null;
    Iterator<Producto> iteSinStock = null;
    
    if (cantidadProducto==-1){
        cantidadProducto = 0;
    }
    if(listaProdMasVendidos!=null){
        cantMasVendidos = listaProdMasVendidos.size();
         iteMasVendidos = listaProdMasVendidos.iterator();
    }
    if(listaPrdMenosStock!=null){
        cantMenosStock = listaPrdMenosStock.size();
        iteMenosStock = listaPrdMenosStock.iterator();
    }
    if(listaProdSinStock!=null){
        cantSinStock = listaProdSinStock.size();
        iteSinStock = listaProdSinStock.iterator();
    }
    
    Producto producto = null;
    String  logo = (String)  request.getSession().getAttribute("logo");
   %> 
   
<% 
                List<Categoria> categorias = (List<Categoria>) request.getSession().getAttribute("listaCategoria");
                Iterator<Categoria> iteCategoria = null;
                Categoria categoriaActual = null;
                if (categorias!=null){
                 iteCategoria = categorias.iterator();
                }
%>
    
<%
    String error = request.getParameter("Error"), mensaje = request.getParameter("Mensaje"), avisoE = "", avisoM = "";
    
    if(error!= null){
        if (error.equals("1")){
            avisoE = "El producto no pudo ser ingresado, inténtelo de nuevo";
        }
    } else {
        error = "";
    }
    if(mensaje!=null){
        if (mensaje.equals("1")){
            avisoM = "El producto fue ingresado correctamente";
        }
    } else {
        mensaje = "";
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/bulma/bulma.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/709f0bb893.js" crossorigin="anonymous"></script>
        <title>InicioEmpresa</title>
		<style>
			.color1{
				background-color: #93d250
			}
			.color2{
				background-color: #508329
			}
			.color3{
				background-color: #dce5d2
			}
			.form-inline {  
				display: flex;
				flex-flow: row wrap;
				align-items: center;
			}
		</style>
    </head>
    <body>
        <section>
			<div>
				<nav class="navbar is-light" role="navigation" aria-label="main navigation" >
					<div class="navbar-brand is-light">
						<img src="<%= logo %>" width="197" height="60">
						<a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
							<span aria-hidden="true"></span>
							<span aria-hidden="true"></span>
							<span aria-hidden="true"></span>
						</a>
					</div>
					<div id="navbarBasicExample" class="navbar-menu">
						<div class="navbar-start">
							<a class="navbar-item" href="InicioEmpresa.jsp">
							  Inicio
							</a>
							<a class="navbar-item" href="Empresarios?formid=2">
							  Ventas
							</a>
							<a class="navbar-item" href="Empresarios?formid=3">
							  Envíos
							</a>
							<a class="navbar-item" href="Empresarios?formid=7">
							  Clientes 
							</a>
							<a class="navbar-item" href="Empresarios?formid=6">
							  Inventario
							</a>
						</div>
					</div>
					<div class="navbar-end">
						<div class="navbar-item">
							<div class="buttons">
								<a class="button " href="Buscadores?formid=6" style="background-color: #29b342">
									Cerrar sesión
								</a>
							</div>
						</div>
					</div>
				</nav>
			</div>
        </section>
        <section class="hero is-success"  style="background-color: hsl(120,60%,70%);">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title" style="color:black">
                        <strong>¡Bienvenido, <%=usuario.getNombre() %>!</strong>
                    </h1>
                    <h2 class="subtitle" style="color:black">
                        Tus clientes esperan
                    </h2>
                </div>
            </div>
        </section>
        <section>
            <div class="container" style="object-fit: contain">
                <figure class="image" style="height: 200px;">
                    <img src="images/LetrasNegras.png" alt=""/>
                </figure>
            </div>
            <br>
            <br>
            <br>
            <br>
        </section>        
        <section class="section" >
            <div class="tile is-ancestor">
                <div class="tile is-vertical">
                        <div class="tile">
                                <div class="tile is-parent is-vertical">
                                        <article class="tile is-child box" style="border: green 10px inset;">

                                        <p class="title">Añadir Producto</p>
                                        <p class="subtitle">Agrega nuevos productos a tu inventario</p>
                                        <button class="button modal-button" data-target="#Modal1" aria-haspopup="true" style="background-color: chartreuse">Nuevo Producto</button>

                                        <div class="modal" id="Modal1">
                                                <div class="modal-background"></div>
                                                <div class="modal-card">
                                                        <header class="modal-card-head">
                                                                <p class="modal-card-title">Nuevo Producto</p>
                                                                <button class="delete" aria-label="close"></button>
                                                        </header>
                                                        <section class="modal-card-body">
                                                                <form name="FrmNuevoProd" action="Empresarios" method="post" id="FrmNuevoProd" enctype="multipart/form-data">
                                                                    <input type="hidden" name="formid" id="formid" value="1">
                                                                        <p class="subtitle has-text-danger"><%= avisoE %></p>
                                                                        <p class="subtitle has-text-success"><%= avisoM %></p>

                                                                        <div class="field">
                                                                                <label>Nombre del producto:</label>
                                                                                <div class="control">
                                                                                  <input class="input" type="text" name="nameProd" id="nameProd"/>
                                                                                </div>
                                                                        </div>
                                                                        <div class="field">
                                                                                <label>Imagen de Producto</label>
                                                                                <div class="control">
                                                                                        <div class="file has-name is-right">
                                                                                                <label class="file-label">
                                                                                                        <input class="file-input" type="file" name="resume">
                                                                                                        <span class="file-cta">
                                                                                                                <span class="file-icon">
                                                                                                                        <i class="fas fa-upload"></i>
                                                                                                                </span>
                                                                                                                <span class="file-label">
                                                                                                                        Seleccione una imagen
                                                                                                                </span>
                                                                                                        </span>
                                                                                                        <span class="file-name">
                                                                                                                Seleccione una imagen
                                                                                                        </span>
                                                                                                </label>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        <div class="field">
                                                                                <label>Cantidad:</label>
                                                                                <div class="control">
                                                                                        <input class="input" type="number" name="cantProd" id="cantProd" min="1"/>
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
                                                                                        <label>Precio Unitario:</label>
                                                                                        <div class="control">
                                                                                                <input class="input" type="number" name="precProd" id="precProd" min="1"/>
                                                                                        </div>
                                                                                </div>

                                                                                <div class="field">
                                                                                        <label>Descripción:</label>
                                                                                        <div class="control">
                                                                                                <input class="input" type="text" name="descProd" id="descProd"/>
                                                                                        </div>
                                                                                </div>
                                                                        
                                                                </section>
                                                                <footer class="modal-card-foot">
                                                                    <input type="hidden" id="formid" value="1">
                                                                        <button class="button is-success" >Guardar cambios</button>
                                                                        <button class="button is-delete">Cancelar</button>
                                                                </footer>
                                                                </form>                            
                                                        </div>
                                                </div>
                                                <script>
                                                        document.querySelectorAll('.modal-button').forEach(function(el) {
                                                                el.addEventListener('click', function() {
                                                                  var target = document.querySelector(el.getAttribute('data-target'));

                                                                  target.classList.add('is-active');

                                                                  target.querySelector('.delete').addEventListener('click',   function() {
                                                                          target.classList.remove('is-active');

										   });
										});
									  });
                              
								</script>
							</article>
							<article class="tile is-child box" style="border: green 10px inset;">
								<h1 class="title">Envíos</h1>
								<p class="subtitle">Tienes <%= cantidadProducto %> envíos pendientes</p>
								<div class="container" style="margin-left: 20px">
									<span class="icon is-large">
										<a href="Empresarios?formid=3"><i class="fas fa-box-open" style="font-size: 5em; color: chartreuse"></i></a>
									</span>
								</div>
							</article>
						</div>
						<div class="tile is-parent">
							<article class="tile is-child box" style="border: black 10px inset;">
								<p class="title">Informe de Ventas</p>
								<p class="subtitle">Artículos más vendidos</p>
								<% 
									if (cantMasVendidos == 0){
								%>
								<p class="list-item">No has vendido ningún producto</p>
								<% 
									}else{
										while(iteMasVendidos.hasNext()){
										producto = iteMasVendidos.next();
								%>
								<p class="list-item"><%= producto.getNombre() %></p>
								<% 
									}
								}
								%>
								<br>
								<p class="subtitle">Productos en inventario más cercanos a agotarse</p>
								<% 
									if (cantMenosStock == 0){
								%>
								<p class="list-item">No se encontraron productos en inventario</p>
								<% 
									}else{
										while(iteMenosStock.hasNext()){
										producto = iteMenosStock.next();
								%>
								<p class="list-item"><%= producto.getNombre() %></p>
								<% 
									}
								}
								%>
								<br>
								<p class="subtitle">Productos agotados</p>
								<% 
									if (cantSinStock == 0){
								%>
								<p class="list-item">No hay ningún producto sin Stock</p>
								<% 
									}else{
										while(iteSinStock.hasNext()){
										producto = iteSinStock.next();
								%>
								<p class="list-item"><%= producto.getNombre() %></p>
								<% 
									}
								}
								%>
								<br>
                        
								<div class="field is-grouped">
                                                                    <form method="get" action="Empresarios">
                                                                        <input type="hidden" name="formid" id="formid" value="2">
                                                                        <button class="button" style="background-color: #29b342">
                                                                            Ir a ventas  
                                                                        </button>
                                                                    </form>

                                                                    <form method="get" action="Empresarios">
                                                                        <input type="hidden" name="formid" id="formid" value="6">
                                                                        <button class="button" style="background-color: chartreuse">
                                                                            Ir a inventario
                                                                        </button>
                                                                    </form>
								</div>
                    
							</article>
						</div>
					</div>
				</div>
            </div>
        </section>
    </body>
</html>
