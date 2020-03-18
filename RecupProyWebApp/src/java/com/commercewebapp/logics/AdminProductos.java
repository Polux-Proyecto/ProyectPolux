package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Producto;

/**
 * Este Logic sirve para administrar todo lo que suceda con los productos, ingresar un nuevo producto, comprar un producto, etc
 * @author Mauricio Aguilar
 */
public class AdminProductos extends Logic {
    DatabaseZ localDatabase = getDatabase();
    
    public boolean crearProducto(Producto producto){
        String pSQL;
        boolean hasFailed = true;
        if (producto != null){
            pSQL = "INSERT INTO `comercebd`.`prodtb` (`idprodtb`,`nombre`,`precio`,`descripcion`,`empresa`,`activo`,`cantidad`) "
                +"VALUES(0, '"+producto.getNombre()+"',"+producto.getPrecio()+",'"+producto.getDescripcion()+"',"+producto.getIdEmpresa()+",1,"+producto.getCantidad()+");";
            hasFailed = localDatabase.executeNonQueryBool(pSQL);
            System.out.println("Se insertaron los datos de usuario particular correctamente");
        }
        
        return hasFailed;
    }
    
}
