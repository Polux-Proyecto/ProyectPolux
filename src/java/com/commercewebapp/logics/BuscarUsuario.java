package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.NuevoMicroEmpresario;
import com.commercewebapp.objects.NuevoUsuarioParticular;
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
        
        DatabaseZ localDatabase = getDatabase();
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

    public boolean createnewuser(NuevoUsuarioParticular nuevouser, NuevoMicroEmpresario nuevoempresario) 
    {
       DatabaseZ localDatabase = getDatabase();
       boolean hasfailed = true;
       String pSQL;

       if(nuevouser!=null){
           String bdnombre = nuevouser.getName();
           String bduser = nuevouser.getUsername();
           String bdemail = nuevouser.getEmail();
           String bdpassword = nuevouser.getPassword();
           String bdpais = nuevouser.getPais();
           String bdciudad = nuevouser.getCiudad();
           String bddireccion = nuevouser.getDireccion();
           
           pSQL = "INSERT INTO comercebd.clientetb(Nombre,Correo,Username,Password,Pais,Ciudad,Dirección)"
                   + "VALUES('"+bdnombre+"','"+bdemail+"','"+bduser+"','"+bdpassword+"','"+bdpais+"','"+bdciudad+"','"+bddireccion+"')";
           hasfailed = localDatabase.executeNonQueryBool(pSQL);
           System.out.println("Se insertaron los datos de usuario particular correctamente");
           
       } 
       else if(nuevoempresario!=null)
       {
            String bdname = nuevoempresario.getName();
            String bduser = nuevoempresario.getUser(); 
            String bdnit = nuevoempresario.getNit();
            String bdpassword = nuevoempresario.getPassword();
            String bddescripcion = nuevoempresario.getDescripcion();
            
            pSQL = "INSERT INTO comercebd.empresatb(Nombre,Nit,Password,Username,Descripcion)"
                    + "VALUES('"+bdname+"','"+bdnit+"','"+bdpassword+"','"+bduser+"','"+bddescripcion+"')";
            hasfailed = localDatabase.executeNonQueryBool(pSQL);
            System.out.println("Se insertaron los datos de microempresario correctamente");
                 
       }
       
        return hasfailed;
    }
}
