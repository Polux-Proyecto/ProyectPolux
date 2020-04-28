package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.DefaulImage;
import com.commercewebapp.objects.Llenador;
import com.commercewebapp.objects.NuevoProducto;
import com.commercewebapp.objects.Precios;
import com.commercewebapp.objects.Producto;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.serial.SerialBlob;

/**
 * Este Logic sirve para administrar todo lo que suceda con los productos, ingresar un nuevo producto, comprar un producto, etc
 * @author Mauricio Aguilar
 */
public class AdminProductos extends Logic {
    DatabaseZ localDatabase = getDatabase();
    

    
    public boolean crearProducto(NuevoProducto producto){
        boolean hasFailed = true;
        DatabaseZ localDatabase2 = getDatabase();
        Connection conn = null;
        PreparedStatement statement;
        conn = localDatabase2.getConnection();
        
        if (producto != null)
        {
            try {
                String bdnombre = producto.getNombreproducto();
                int bdprecioproducto = producto.getPrecioproducto();
                String bddescripcionproducto= producto.getDescripcionproducto();
                int bdempresaproducto = producto.getEmpresaproducto();
                int bdcategoriaproducto = producto.getCategoriaproducto();
                int bdbusquedasproducto = producto.getCategoriaproducto();
                int bdexistenciasproducto = producto.getExistenciasproducto();
                byte[] bdimagenproducto = producto.getImagenproducto();
                Blob imagenblob = new SerialBlob(bdimagenproducto);
                
                statement = conn.prepareStatement("INSERT INTO comercebd.prodtb"
                        + "(nombre,precio,descripcion,empresa,categoria,busquedas,existencias,imagen)"
                        + "VALUES(?,?,?,?,?,?,?,?)");
                
                statement.setString(1, bdnombre);
                statement.setInt(2, bdprecioproducto);
                statement.setString(3, bddescripcionproducto);
                statement.setInt(4, bdempresaproducto);
                statement.setInt(5, bdcategoriaproducto);
                statement.setInt(6, bdbusquedasproducto);
                statement.setInt(7, bdexistenciasproducto);
                statement.setBlob(8, imagenblob);
                
                int si = statement.executeUpdate();
              
              if (si>0){
                  hasFailed = true;
              
                System.out.println("Se insertaron los datos de nuevo producto correctamente");
              }

            } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return hasFailed;
    }
    
    public boolean eliminardeseo (int idprod ,int idusu){
        boolean hasFailed = true;
        DatabaseZ localDatabase2 = getDatabase();
        
        int idproducto = 0;
        idproducto = idprod;
        int iduser = 0;
        iduser = idusu;
        System.out.println(String.valueOf(idproducto));
        System.out.println(String.valueOf(iduser));
        if(idproducto!=0){
            hasFailed = localDatabase2.executeNonQueryBool("DELETE FROM comercebd.deseostb WHERE producto="+idproducto+" and cliente="+iduser+";");
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
        
        ResultSet result = localDatabase.executeQuery("SELECT prodtb.*, pedidostb.*, empresatb.Nombre as NombreEmpresa  "
                + " FROM comercebd.prodtb inner join comercebd.pedidostb on comercebd.pedidostb.producto = comercebd.prodtb.idprodtb"
                + " inner join comercebd.empresatb on empresatb.idempresatb = prodtb.empresa and comercebd.pedidostb.cliente = "+idUsuario+" where pedidostb.entregado = 0 LIMIT 15;");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductosConNombreEmpresa(result);
        
        return listaProductos;
    }
    
    public List<Producto> getDeseosPorUsuario (int idUsuario){
        
        
        ResultSet result = localDatabase.executeQuery("SELECT  prodtb.*, empresatb.Nombre as NombreEmpresa FROM comercebd.prodtb "
                + "inner join comercebd.deseostb on comercebd.deseostb.producto = comercebd.prodtb.idprodtb "
                + "inner join comercebd.empresatb on empresatb.idempresatb = prodtb.empresa and comercebd.deseostb.cliente = '"+idUsuario+"' LIMIT 15;");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductosConNombreEmpresa(result);
        
        return listaProductos;
    }
    
    public List<Producto> getProductoPorPalabra (String palabra) {
        //Devuelve una lista de productos buscando la palabra ingresada en el nombre del producto, de la empresa o la descripción
           
        ResultSet result = localDatabase.executeQuery("SELECT *, empresatb.Nombre as NombreEmpresa FROM comercebd.prodtb "
                + "inner join comercebd.empresatb on prodtb.empresa = empresatb.idempresatb "
                + "where UPPER(prodtb.descripcion) like UPPER('%"+palabra+"%') "
                + "or UPPER(prodtb.nombre) like UPPER('%"+palabra+"%') "
                + "or UPPER(empresatb.Nombre) like UPPER('%"+palabra+"%');");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductosConNombreEmpresa(result);
        
        return listaProductos; 
    }
    
    public List<Producto> getProductoPorCategoria (int categoria, boolean colocarEmpresario) {
        //Devuelve una lista de productos buscando la palabra ingresada en el nombre del producto, de la empresa o la descripción
        
        ResultSet result = localDatabase.executeQuery("SELECT prodtb.*, empresatb.Nombre as NombreEmpresa "
                + "FROM comercebd.prodtb inner join comercebd.empresatb "
                + "on empresatb.idempresatb = prodtb.empresa "
                + "where prodtb.categoria = '"+categoria+"' LIMIT 15;");
        
        Llenador llenador = new Llenador();
        List<Producto> listaProductos = llenador.llenarListaProductosConNombreEmpresa(result);
        
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
        
        ResultSet result = localDatabase.executeQuery("SELECT sum(cantidad) as ventas, "
                + "pedidostb.producto as idprodtb, empresatb.nombre as nombreEmpresa,  "
                + "prodtb.nombre, prodtb.descripcion, prodtb.precio, prodtb.existencias, prodtb.imagen, prodtb.empresa "
                + "FROM comercebd.pedidostb  INNER JOIN comercebd.prodtb  "
                + "ON prodtb.idprodtb = pedidostb.producto INNER JOIN comercebd.empresatb "
                + "ON empresatb.idempresatb = prodtb.empresa  WHERE empresatb.idempresatb = '"+idEmpresa+"'  "
                + "GROUP BY pedidostb.producto, empresatb.nombre,  prodtb.nombre, "
                + "prodtb.descripcion, prodtb.precio, prodtb.existencias ORDER BY ventas desc LIMIT "+limite+";");
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
    
    public List<Producto> getProductosPorEmpresa (int idEmpresa, int limite){
         ResultSet result = null;
          
        result = localDatabase.executeQuery("SELECT * FROM comercebd.prodtb "
            + "WHERE empresa = '"+idEmpresa+"' ORDER BY existencias asc LIMIT "+limite+";");
        
        
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
    
   public Precios getPrecios (Producto producto, int cantidad){
       Precios precios = null;
       precios = new Precios(producto.getPrecio(), cantidad);
       return precios;
   }
   
   public DefaulImage getDefaultImage() {
       DefaulImage img = null;
       Blob blob = null;
       byte[] arr = null;
       
       ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.defaultimage LIMIT 1;");
       
       if (result!=null){
           try {
               while (result.next()){
                   blob = result.getBlob("image");
                   
                   arr = blob.getBytes(1, (int) blob.length()) ;
                   
                   img = new DefaulImage(arr);
               }
           } catch (SQLException ex) {
               Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       
       
       return img;
   }
    
   public boolean reduceStock(int idProd, int cantidad){
       boolean hasFailed = true;
       int stock;
       ResultSet result = localDatabase.executeQuery("SELECT existencias FROM comercebd.prodtb where idprodtb = "+idProd+" Limit 1;");
       
       if(result!=null){
           try {
               while(result.next()){
                   stock = result.getInt("existencias");
                   stock = stock - cantidad;
                   hasFailed = localDatabase.executeNonQueryBool("UPDATE comercebd.prodtb SET existencias = '"+stock+"' WHERE idprodtb = '"+idProd+"';");
               }
           } catch (SQLException ex) {
               Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       
       return hasFailed;
   }

    public int getExistenciasByIdProd(int idProd) {
        int stock = 0;
        ResultSet result = localDatabase.executeQuery("SELECT existencias FROM comercebd.prodtb where idprodtb = "+idProd+" Limit 1;");
        
        if(result!=null){
           try {
               while(result.next()){
                   stock = result.getInt("existencias");
               }
           } catch (SQLException ex) {
               Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
        
        return stock;
    }
}
