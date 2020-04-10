/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Mauricio Aguilar
 */
public class AdminPedidos extends Logic{
    DatabaseZ localDatabase = getDatabase();
    
    public int getCantidadPedidos(int idEmpresario){
        int cantidad = -1;
        
        ResultSet result = localDatabase.executeQuery("SELECT count(*) as cantidad FROM comercebd.pedidostb "
                + "INNER JOIN comercebd.prodtb on prodtb.idprodtb = pedidostb.producto "
                + "INNER JOIN comercebd.empresatb on prodtb.empresa = empresatb.idempresatb "
                + "WHERE empresatb.idempresatb = '"+idEmpresario+"';");
        
        if (result!=null){
            try {
                while (result.next()){
                    cantidad = result.getInt("cantidad");
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminPedidos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return cantidad;
    }
    
    
}
