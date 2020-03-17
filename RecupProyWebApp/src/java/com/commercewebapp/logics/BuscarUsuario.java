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
        System.out.println("Select * from comercebd.clientetb where Username = '"+username+"';");
        ResultSet result = localDatabase.executeQuery("Select * from comercebd.clientetb where Username = '"+username+"';"); 
        String pass, nombre;
        int id;
        int i = 0;
        
        try {
             if (result != null){
                 while (result.next()){
                     System.out.println("Hay algo en la tabla de clientes");
                     nombre = result.getString("Nombre");
                     pass = result.getString("Password");
                     id = result.getInt("idCliente");
                     i++;
                     usuario = new Usuario (false, true, nombre, id, pass, username);
                     System.out.println(nombre+" "+pass+" "+id);
                 }
                 System.out.println("Ya terminó la tabla de clientes");
                 if (i==0){
                     System.out.println("No se encontró nada en la tabla de clientes");
                     System.out.println("SELECT * FROM comercebd.empresatb where Username = '"+username+"';");
                     result = null;
                     result = localDatabase.executeQuery("SELECT * FROM comercebd.empresatb where Username = '"+username+"';");
                     
                     if (result != null){
                         i = 0;
                         while (result.next()){
                            System.out.println("Hay algo en la tabla de empresarios");
                            nombre = result.getString("Nombre");
                            pass = result.getString("Password");
                            id = result.getInt("idempresatb");
                            usuario = new Usuario (true, false, nombre, id, pass, username );
                            System.out.println(nombre+" "+pass+" "+id);
                            i++;
                        }
                        
                    }
                    System.out.println("Llego");
                    if (i==0){
                    System.out.println("El usuario no existe");
                    usuario = new Usuario (false, false, "", 0, "", "");
                     }
                 }
             }
            
        } catch (SQLException ex) {
            Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return usuario;
    }
}
