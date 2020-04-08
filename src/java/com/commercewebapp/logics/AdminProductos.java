package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
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
        
        return null;
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
}
