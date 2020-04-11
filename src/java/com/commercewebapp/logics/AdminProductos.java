package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Llenador;
import com.commercewebapp.objects.Producto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Este Logic sirve para administrar todo lo que suceda con los productos, ingresar un nuevo producto, comprar un producto, etc
 * @author Mauricio Aguilar
 */
public class AdminProductos extends Logic {
    DatabaseZ localDatabase = getDatabase();
    
    public boolean crearProducto(Producto producto){
        String  pSQL;
        boolean hasFailed = true;
        
        if (producto != null){
            pSQL = "INSERT INTO `comercebd`.`prodtb` (`idprodtb`,`nombre`,`precio`,`descripcion`,`empresa`,`activo`,`cantidad`) "
                +"VALUES(0, '"+producto.getNombre()+"',"+producto.getPrecio()+",'"+producto.getDescripcion()+"',"+producto.getIdEmpresa()+",1,"+producto.getCantidad()+");";
            hasFailed = localDatabase.executeNonQueryBool(pSQL);
            System.out.println("Se insertaron los datos de usuario particular correctamente");
        }
        
        return hasFailed;
    }
    
    public List<Producto> getProductosPorNombre (String nombreBusqueda){
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb where upper(nombre) like Upper('%"+nombreBusqueda+"%');");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
    
        return listaProductos;
    }
    
    public Producto getProductoPorId (int idProd){
        
        Producto producto = null;
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb where idprodtb='"+idProd+"';");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        if (listaProductos!=null){
            producto = listaProductos.get(0);
        }
    
        return producto;
    }
    
    public List<Producto> getPedidosPorUsuario (int idUsuario){
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
                + "inner join comercebd.pedidostb "
                + "where comercebd.pedidostb.producto = comercebd.prodtb.idprodtb "
                + "and comercebd.pedidostb.cliente = '"+idUsuario+"' LIMIT 5;");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        return listaProductos;
    }
    
    public List<Producto> getDeseosPorUsuario (int idUsuario){
        
        
        ResultSet result = localDatabase.executeQuery("SELECT  * FROM comercebd.prodtb "
                + "inner join comercebd.deseostb where "
                + "comercebd.deseostb.producto = comercebd.prodtb.idprodtb "
                + "and comercebd.deseostb.cliente = '"+idUsuario+"' LIMIT 5;");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        return listaProductos;
    }
    
    public List<Producto> getProductoPorPalabra (String palabra) {
        //Devuelve una lista de productos buscando la palabra ingresada en el nombre del producto, de la empresa o la descripción
           
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
                + "inner join comercebd.empresatb on prodtb.empresa = empresatb.idempresatb "
                + "where UPPER(prodtb.descripcion) like UPPER('%"+palabra+"%') "
                + "or UPPER(prodtb.nombre) like UPPER('%"+palabra+"%') "
                + "or UPPER(empresatb.Nombre) like UPPER('%"+palabra+"%');");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        return listaProductos; 
    }
    
    public List<Producto> getProductoPorCategoria (int categoria, boolean colocarEmpresario) {
        //Devuelve una lista de productos buscando la palabra ingresada en el nombre del producto, de la empresa o la descripción
        
        ResultSet result = localDatabase.executeQuery("SELECT prodtb.*, empresatb.Nombre as NombreEmpresario "
                + "FROM comercebd.prodtb inner join comercebd.empresatb "
                + "on empresatb.idempresatb = prodtb.empresa "
                + "where prodtb.categoria = '"+categoria+"' LIMIT 15;");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        return listaProductos; 
    }
    
    public String getNombreCategoriaPorId (int idCat){
        ResultSet result = localDatabase.executeQuery("SELECT Nombre FROM comercebd.categorias where idCategorias = '"+idCat+"' LIMIT 1;");
        String nombre = "";
        
        if (result!= null){
            
            try {
                while (result.next()){
                    nombre = result.getString("Nombre");
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return nombre;
    }
    
    public List<Producto> getArticulosMasVendidos(int idEmpresa, int limite){
        
        ResultSet result = localDatabase.executeQuery("SELECT sum(cantidad) as ventas, pedidostb.producto as idprodtb, empresatb.nombre as nombreEmpresa,  prodtb.nombre, prodtb.descripcion, prodtb.precio, prodtb.existencias "
                + "FROM comercebd.pedidostb  INNER JOIN comercebd.prodtb  ON prodtb.idprodtb = pedidostb.producto "
                + "INNER JOIN comercebd.empresatb ON empresatb.idempresatb = prodtb.idprodtb  "
                + "WHERE empresatb.idempresatb = '"+idEmpresa+"'  "
                + "GROUP BY pedidostb.producto, empresatb.nombre,  prodtb.nombre, prodtb.descripcion, prodtb.precio, prodtb.existencias "
                + "ORDER BY ventas desc LIMIT '"+limite+"';");
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        return listaProductos;
    }
    
    public List<Producto> getProductosPocoStock (int idEmpresa, int limite, boolean permitirCero){
         ResultSet result = null;
        if (permitirCero){   
            result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
                + "WHERE empresa = '"+idEmpresa+"' ORDER BY existencias asc LIMIT "+limite+";");
        }else{
            result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
                + "WHERE empresa = '"+idEmpresa+"' and not existencias = 0"
                + " ORDER BY existencias asc LIMIT "+limite+";");
        }
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        
        return listaProductos;
    }
    
    public List<Producto> getProductosSinStock (int idEmpresa, int limite){
           
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
                + "WHERE empresa = '"+idEmpresa+"' AND existencias = '0'  LIMIT "+limite+";");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductos(result);
        
        return listaProductos;
    }
    
    
}
