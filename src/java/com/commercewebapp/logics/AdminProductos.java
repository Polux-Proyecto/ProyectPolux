package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Categoria;
import com.commercewebapp.objects.Producto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        
        List<Producto> listaProductos = null;
        int     id, idEmpresa, existencias;
        String  nombre, descripcion;
        double  precio;
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb where upper(nombre) like Upper('%"+nombreBusqueda+"%');");
        
        if(result!=null){
            Producto productoActual;
            listaProductos = new ArrayList();
            
            try {
                
                while(result.next()){
                    id = result.getInt("idprodtb");
                    idEmpresa = result.getInt("empresa");
                    nombre = result.getString("nombre");
                    descripcion = result.getString("descripcion");
                    precio = result.getDouble("precio");
                    existencias = result.getInt("existencias");
                    
                    productoActual = new Producto(id, idEmpresa, nombre, descripcion, precio, 1, existencias);
                    
                    listaProductos.add(productoActual);
                }
                
                
            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            
            }
            
        }
    
        return listaProductos;
    }
    
    public Producto getProductoPorId (int idProd){
        
        Producto producto = null;
        int     idEmpresa, existencias;
        String  nombre, descripcion;
        double  precio;
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb where idprodtb='"+idProd+"';");
        
        if(result!=null){
            Producto productoActual;
            List<Producto> listaProductos;
            listaProductos = new ArrayList();
            
            try {
                
                while(result.next()){
                    idEmpresa = result.getInt("empresa");
                    nombre = result.getString("nombre");
                    descripcion = result.getString("descripcion");
                    precio = result.getDouble("precio");
                    existencias = result.getInt("existencias");
                    productoActual = new Producto(idProd, idEmpresa, nombre, descripcion, precio, 1, existencias);
                    listaProductos.add(productoActual);
                }
                
                
            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            
            }
            
            producto = listaProductos.get(0);
        }
    
        return producto;
    }
    
    public List<Producto> getPedidosPorUsuario (int idUsuario){
        
        List<Producto> listaProductos = null;
        int     id, idEmpresa, existencias;
        String  nombre, descripcion;
        double  precio;
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
                + "inner join comercebd.pedidostb "
                + "where comercebd.pedidostb.producto = comercebd.prodtb.idprodtb "
                + "and comercebd.pedidostb.cliente = '"+idUsuario+"' LIMIT 5;");
        
        if(result!=null){
            Producto productoActual;
            listaProductos = new ArrayList();
            
            try {
                
                while(result.next()){
                    id = result.getInt("idprodtb");
                    idEmpresa = result.getInt("empresa");
                    nombre = result.getString("nombre");
                    descripcion = result.getString("descripcion");
                    precio = result.getDouble("precio");
                    existencias = result.getInt("existencias");
                    
                    productoActual = new Producto(id, idEmpresa, nombre, descripcion, precio, 1, existencias);
                    
                    listaProductos.add(productoActual);
                }
                
                
            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            
            }
            
        }
        
        return listaProductos;
    }
    
    public List<Producto> getDeseosPorUsuario (int idUsuario){
        
        List<Producto> listaProductos = null;
        int     id, idEmpresa, existencias;
        String  nombre, descripcion;
        double  precio;
        
        ResultSet result = localDatabase.executeQuery("SELECT  * FROM comercebd.prodtb "
                + "inner join comercebd.deseostb where "
                + "comercebd.deseostb.producto = comercebd.prodtb.idprodtb "
                + "and comercebd.deseostb.cliente = '"+idUsuario+"' LIMIT 5;");
        
        if(result!=null){
            Producto productoActual;
            listaProductos = new ArrayList();
            
            try {
                
                while(result.next()){
                    id = result.getInt("idprodtb");
                    idEmpresa = result.getInt("empresa");
                    nombre = result.getString("nombre");
                    descripcion = result.getString("descripcion");
                    precio = result.getDouble("precio");
                    existencias = result.getInt("existencias");
                    
                    productoActual = new Producto(id, idEmpresa, nombre, descripcion, precio, 1, existencias);
                    
                    listaProductos.add(productoActual);
                }
                
                
            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            
            }
            
        }
        
        return listaProductos;
    }
    
    public List<Producto> getProductoPorPalabra (String palabra) {
        //Devuelve una lista de productos buscando la palabra ingresada en el nombre del producto, de la empresa o la descripción
        
        List<Producto> listaProductos = null;
        int     id, idEmpresa, existencias;
        String  nombre, descripcion;
        double  precio;    
            
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
                + "inner join comercebd.empresatb on prodtb.empresa = empresatb.idempresatb "
                + "where UPPER(prodtb.descripcion) like UPPER('%"+palabra+"%') "
                + "or UPPER(prodtb.nombre) like UPPER('%"+palabra+"%') "
                + "or UPPER(empresatb.Nombre) like UPPER('%"+palabra+"%');");
        
        if (result != null){
            listaProductos = new ArrayList();
            Producto productoActual = null;
            
            try {
                while(result.next()){
                    id = result.getInt("idprodtb");
                    idEmpresa = result.getInt("empresa");
                    nombre = result.getString("nombre");
                    descripcion = result.getString("descripcion");
                    precio = result.getDouble("precio");
                    existencias = result.getInt("existencias");
                    
                    productoActual = new Producto (id, idEmpresa, nombre, descripcion, precio, 1, existencias);
                    
                    listaProductos.add(productoActual);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return listaProductos; 
    }
    
    public List<Producto> getProductoPorCategoria (int categoria, boolean colocarEmpresario) {
        //Devuelve una lista de productos buscando la palabra ingresada en el nombre del producto, de la empresa o la descripción
        
        List<Producto> listaProductos = null;
        int     id, idEmpresa, existencias;
        String  nombre, descripcion, nombreEmpresario;
        double  precio;    
            
        ResultSet result = localDatabase.executeQuery("SELECT prodtb.*, empresatb.Nombre as NombreEmpresario "
                + "FROM comercebd.prodtb inner join comercebd.empresatb "
                + "on empresatb.idempresatb = prodtb.empresa "
                + "where prodtb.categoria = '"+categoria+"' LIMIT 15;");
        
        if (result != null){
            listaProductos = new ArrayList();
            Producto productoActual = null;
            
            try {
                while(result.next()){
                    id = result.getInt("idprodtb");
                    idEmpresa = result.getInt("empresa");
                    nombre = result.getString("nombre");
                    descripcion = result.getString("descripcion");
                    precio = result.getDouble("precio");
                    existencias = result.getInt("existencias");
                    
                    productoActual = new Producto (id, idEmpresa, nombre, descripcion, precio, 1, existencias);
                    
                    if (colocarEmpresario){
                        nombreEmpresario = result.getString("NombreEmpresario");
                    }
                    
                    listaProductos.add(productoActual);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
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
    
    
    
}
