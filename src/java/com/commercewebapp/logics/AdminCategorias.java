package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Categoria;
import com.commercewebapp.objects.Llenador;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Mauricio Aguilar
 */
public class AdminCategorias extends Logic{
    DatabaseZ localDatabase =  getDatabase();
    
    public List<Categoria> getAllCategorias (){
        List<Categoria> listaCategorias = null;
        
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.categorias ORDER BY Nombre LIMIT 25;");
        
        Llenador llenador = new Llenador();
        listaCategorias = llenador.llenarListaCategoria(result);
        
        return listaCategorias;
    }
    
    public int getMitadCategorias (int size){
        int mitad = (int) Math.round(size/2);
        return mitad;
    }
    
}
