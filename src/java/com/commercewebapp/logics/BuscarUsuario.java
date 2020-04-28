package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Llenador;
import com.commercewebapp.objects.NuevoMicroEmpresario;
import com.commercewebapp.objects.NuevoUsuarioParticular;
import com.commercewebapp.objects.Usuario;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.serial.SerialBlob;

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
        String pass, nombre, correo ="", genero = "", fechaN = "", direccion = "";
        int id;
        int i = 0;
        Blob blobimagenperfil;
        byte[] imagenperfil;
        
        try {
             if (result != null){
                 while (result.next()){
                     System.out.println("Hay algo en la tabla de clientes");
                     nombre = result.getString("Nombre");
                     pass = result.getString("Password");
                     id = result.getInt("idCliente");
                     correo = result.getString("Correo");
                     genero = result.getString("Sexo");
                     fechaN = result.getString("FechaNacimiento");
                     direccion = result.getString("Dirección");
                     blobimagenperfil = result.getBlob("ImagenPerfil");
                     imagenperfil = blobimagenperfil.getBytes(1, (int) blobimagenperfil.length() );
                     i++;
                     usuario = new Usuario (false, true, nombre, id, pass, username, correo, genero, fechaN, direccion, imagenperfil);
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
                            correo = result.getString("Email");
                            blobimagenperfil = result.getBlob("Logo");
                            imagenperfil = blobimagenperfil.getBytes(1, (int) blobimagenperfil.length() );
                            usuario = new Usuario (true, false, nombre, id, pass, username, correo, genero, fechaN, direccion, imagenperfil);
                            System.out.println(nombre+" "+pass+" "+id);
                            i++;
                        }
                        
                    }
                    System.out.println("Llego");
                    if (i==0){
                    System.out.println("El usuario no existe");
                    usuario = new Usuario (false, false, "", 0, "", "", "", "", "", "", null);
                     }
                 }
             }
            
        } catch (SQLException ex) {
            Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return usuario;
    }
    public Usuario getClienteById (int idCliente)  {
        
        DatabaseZ localDatabase = getDatabase();
        List<Usuario> usuarios = null;
        Usuario usuario = null;
        System.out.println("Select * from comercebd.clientetb where idCliente = '"+idCliente+"' LIMIT 1;");
        ResultSet result = localDatabase.executeQuery("Select * from comercebd.clientetb where idCliente = '"+idCliente+"' LIMIT 1;"); 
        Llenador llenador = new Llenador();
        usuarios = llenador.llenarUsuario(result);
        if (usuarios!=null){
            Iterator<Usuario> iteUser = usuarios.iterator();
            usuario = iteUser.next();
        }
        
        return usuario;
    }
    public Usuario getUsersConCiudadYPais (String username)  {
        
        DatabaseZ localDatabase = getDatabase();
        Usuario usuario = null;
        System.out.println("Select * from comercebd.clientetb where Username = '"+username+"';");
        ResultSet result = localDatabase.executeQuery("Select * from comercebd.clientetb where Username = '"+username+"';"); 
        String pass, nombre, correo ="", genero = "", fechaN = "", direccion = "", ciudad, pais;
        int id;
        int i = 0;
        
        try {
             if (result != null){
                 while (result.next()){
                    System.out.println("Hay algo en la tabla de clientes");
                    nombre = result.getString("Nombre");
                    pass = result.getString("Password");
                    id = result.getInt("idCliente");
                    correo = result.getString("Correo");
                    genero = result.getString("Sexo");
                    fechaN = result.getString("FechaNacimiento");
                    direccion = result.getString("Dirección");
                    ciudad = result.getString("Ciudad");
                    pais = result.getString("Pais");
                    i++;
                    usuario = new Usuario (false, true, nombre, id, pass, username, correo, genero, fechaN, direccion, null);
                    System.out.println(nombre+" "+pass+" "+id);
                    usuario.setCiudad(ciudad);
                    usuario.setPais(pais);
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
                            correo = result.getString("Email");
                            usuario = new Usuario (true, false, nombre, id, pass, username, correo, genero, fechaN, direccion, null);
                            System.out.println(nombre+" "+pass+" "+id);
                            i++;
                        }
                        
                    }
                    System.out.println("Llego");
                    if (i==0){
                    System.out.println("El usuario no existe");
                    usuario = new Usuario (false, false, "", 0, "", "", "", "", "", "", null);
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
       Connection conn = null;
       PreparedStatement statement;
       conn = localDatabase.getConnection();
       boolean hasfailed = false;
//       String pSQL;

       if(nuevouser!=null){

               String bdnombre = nuevouser.getName();
               String bduser = nuevouser.getUsername();
               String bdemail = nuevouser.getEmail();
               String bdpassword = nuevouser.getPassword();
               String bdpais = nuevouser.getPais();
               String bdciudad = nuevouser.getCiudad();
               String bddireccion = nuevouser.getDireccion();
               String bdsexo = nuevouser.getSexo();
               String bdfechanacimiento = nuevouser.getFechanacimiento();
               byte[] bdimagenperfil = nuevouser.getImagen();

              
               try{
                  Blob imagenblob = new SerialBlob(bdimagenperfil); 
               statement = conn.prepareStatement("INSERT INTO comercebd.clientetb(Nombre,Correo,Username,Password,Pais,Ciudad,Dirección,Sexo,FechaNacimiento,ImagenPerfil)"
                       + "VALUES(?,?,?,?,?,?,?,?,?,?)");
               
               
                       statement.setString(1, bdnombre);
                       statement.setString(2, bdemail);
                       statement.setString(3, bduser);
                       statement.setString(4, bdpassword);
                       statement.setString(5, bdpais);
                       statement.setString(6, bdciudad);
                       statement.setString(7, bddireccion);
                       statement.setString(8, bdsexo);
                       statement.setString(9, bdfechanacimiento);
                       statement.setBlob(10, imagenblob);
                       
               System.out.println("hasta aca si llego");
               
//               hasfailed = localDatabase.executeNonQueryBool(pSQL);
              int si = statement.executeUpdate();
              
              System.out.println("no valio");
              if (si>0){
                  hasfailed = true;
              
               System.out.println("Se insertaron los datos de usuario particular correctamente");
              }
              
           } catch (SQLException ex) {
               Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
           }
           
       } 
       else if(nuevoempresario!=null)
       {
            String bdname = nuevoempresario.getName();
            String bduser = nuevoempresario.getUser(); 
            String bdnit = nuevoempresario.getNit();
            String bdpassword = nuevoempresario.getPassword();
            String bddescripcion = nuevoempresario.getDescripcion();
            String bdemail = nuevoempresario.getEmail();
            String bdpais = nuevoempresario.getPais();
            String bdciudad = nuevoempresario.getCiudad();
            int bdcategoria = nuevoempresario.getCategoria();
            byte[] bdlogo = nuevoempresario.getLogo();
             
            System.out.println("antes de insertar si salio");
           try {
               Blob imagenblob = new SerialBlob(bdlogo); 
//            pSQL = "INSERT INTO comercebd.empresatb(Nombre,Nit,Password,Username,Descripcion,Email,Pais,Ciudad,categoria,Logo)"
//                    + "VALUES('"+bdname+"','"+bdnit+"','"+bdpassword+"','"+bduser+"','"+bddescripcion+"','"+bdemail+"','"+bdpais+"','"  + bdciudad +"','"+bdcategoria+"','"+Arrays.toString(bdlogo)+"')";
//            hasfailed = localDatabase.executeNonQueryBool(pSQL);
                statement = conn.prepareStatement("INSERT INTO comercebd.empresatb(Nombre,Nit,Password,Username,Descripcion,Email,Pais,Ciudad,categoria,Logo)"
                + "VALUES(?,?,?,?,?,?,?,?,?,?)");
                
                       statement.setString(1, bdname);
                       statement.setString(2, bdnit);
                       statement.setString(3, bdpassword);
                       statement.setString(4, bduser);
                       statement.setString(5, bddescripcion);
                       statement.setString(6, bdemail);
                       statement.setString(7, bdpais);
                       statement.setString(8, bdciudad);
                       statement.setInt(9, bdcategoria);
                       statement.setBlob(10, imagenblob);
                
                        int si = statement.executeUpdate();
              
              
              if (si>0){
                  hasfailed = true;
              
               System.out.println("Se insertaron los datos de microempresario correctamente");
              }
              
           } catch (SQLException ex) {
               Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
           }
            
       }
        
        return hasfailed;
    }
    
    public String getNombreClientePorId(int idCliente){
        String nombre = null;
        DatabaseZ localDatabase = getDatabase();
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.clientetb "
                + "WHERE clientetb.idCliente = '"+idCliente+"' LIMIT 1;");
        
        if (result!=null){
            try {
                while(result.next()){
                    nombre = result.getString("Nombre");
                }
            } catch (SQLException ex) {
                Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return nombre;
    }
    public String getPaisClientePorId(int idCliente){
        String nombre = null;
        DatabaseZ localDatabase = getDatabase();
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.clientetb "
                + "WHERE clientetb.idCliente = '"+idCliente+"' LIMIT 1;");
        
        if (result!=null){
            try {
                while(result.next()){
                    nombre = result.getString("Pais");
                }
            } catch (SQLException ex) {
                Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return nombre;
    }
    public String getCiudadClientePorId(int idCliente){
        String nombre = null;
        DatabaseZ localDatabase = getDatabase();
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.clientetb "
                + "WHERE clientetb.idCliente = '"+idCliente+"' LIMIT 1;");
        
        if (result!=null){
            try {
                while(result.next()){
                    nombre = result.getString("Ciudad");
                }
            } catch (SQLException ex) {
                Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return nombre;
    }
}
