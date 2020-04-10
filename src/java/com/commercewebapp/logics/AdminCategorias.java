package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Categoria;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mauricio Aguilar
 */
public class AdminCategorias extends Logic{
    DatabaseZ localDatabase =  getDatabase();
    
    public List<Categoria> getAllCategorias (){
        List<Categoria> listaCategorias = null;
        
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.categorias ORDER BY Nombre LIMIT 25;");
        
        if(result!=null){
            listaCategorias = new ArrayList();
            Categoria categoria = null;
            String nombre;
            int idCat;
            try {
                while (result.next()){
                    nombre = result.getString("Nombre");
                    idCat = result.getInt("idCategorias");
                    
                    categoria = new Categoria (nombre, idCat);
                    listaCategorias.add(categoria);
                    
                }
                    } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return listaCategorias;
    }
    
    public int getMitadCategorias (int size){
        int mitad = (int) Math.round(size/2);
        
        return mitad;
    }
}
