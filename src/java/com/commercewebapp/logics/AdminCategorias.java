package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Categoria;
import com.commercewebapp.objects.Llenador;
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
        
        Llenador llenador = new Llenador();
        listaCategorias = llenador.llenarListaCategoria(result);
        
        return listaCategorias;
    }
    
    public int getMitadCategorias (int size){
        int mitad = (int) Math.round(size/2);
        return mitad;
    }
    
}
