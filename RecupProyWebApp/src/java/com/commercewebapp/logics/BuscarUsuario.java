package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseX;
import com.commercewebapp.objects.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @version 1.0
 * @author Mauricio Aguilar
 */

public class BuscarUsuario extends Logic {
    
    
//Debuelve todos los usuario con el nombre que se le pase
    public Usuario getAllUsers (String username)  {
        
        DatabaseX localDatabase = getDatabase();
        Usuario usuario = null;
        ResultSet result = localDatabase.executeQuery("Select * from comercebd.clientetb where Username = '"+username+"';"); 
        String pass, nombre;
        int id;
        
        
        try {
                pass = result.getString("Password");
                nombre = result.getString("Nombre");
                id = result.getInt("idCliente");
            
            if (result.isFirst()){
            //Es porque el usuario existe y está en la tabla de clientes
                
                pass = result.getString("Password");
                nombre = result.getString("Nombre");
                id = result.getInt("idCliente");
                
                usuario = new Usuario(false, true, nombre, id, pass, username);
                
            } else {
            //Es porque no se encontro en la tabla de clientes   
                //result = localDatabase.executeQuery("Select * from comercebd.empresatb where Username = '"+username+"';");
                
                
                if (result.isFirst()){
                pass = result.getString("Password");
                nombre = result.getString("Nombre");
                id = result.getInt("idempresatb");
                
                usuario = new Usuario(false, true, nombre, id, pass, username);
                }
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return usuario;
    }
}
