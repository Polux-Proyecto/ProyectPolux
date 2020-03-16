package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseX;
import com.commercewebapp.objects.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @version 1.0
 * @author Mauricio Aguilar
 */

public class BuscarUsuario extends Logic {
    
    
//Debuelve todos los usuario con el nombre que se le pase
    public List<Usuario> getAllUsers (String username) throws SQLException {
        List<Usuario> list = null;
        DatabaseX localDatabase = getDatabase();
        Usuario usuario;
        ResultSet result = localDatabase.executeQuery("Select * from comercebd.clientetb where Username = '"+username+"';"); 
        
        result.next();
        
        if (!result.wasNull()){ 
        //Este se ejecuta si el usuario es cliente
        result.last();
            try {
                int id;
                String nombre;
                String contra;
                String username2;
                list = new ArrayList<>();
                
                
                while(result.next()){
                    id = result.getInt("idCliente");
                    nombre = result.getString("Nombre");
                    contra = result.getString("Password");
                    username2 = result.getString("Username");
                    
                    usuario = new Usuario (false, true, nombre, id, contra, username2);
                    list.add(usuario);
                }
            } catch (SQLException ex) {
                Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
        //Este se ejecuta si el usuario no es cliente
            result = localDatabase.executeQuery("select * from comercebd.empresatb where username = '"+username+"';");
            
            result.next();
            
            if (!result.wasNull()){ 
        //Este se ejecuta si el usuario es cliente
            result.last();
                try {
                    int id;
                    String nombre;
                    String contra;
                    String username2;
                    list = new ArrayList<>();

                    while(result.next()){
                        id = result.getInt("idCliente");
                        nombre = result.getString("Nombre");
                        contra = result.getString("Password");
                        username2 = result.getString("Username");

                        usuario = new Usuario (true, false, nombre, id, contra, username2);
                        list.add(usuario);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        }    
        
        return list;
        
    }
    
}
