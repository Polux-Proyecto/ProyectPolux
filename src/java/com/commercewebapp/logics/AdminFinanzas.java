/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Llenador;
import com.commercewebapp.objects.Tarjetas;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Mauricio Aguilar
 */
public class AdminFinanzas extends Logic {
    private DatabaseZ localDatabase = this.getDatabase();
    
    public List<Tarjetas> getTarjetasByIdCliente(int idCliente){
        List<Tarjetas> tarjetas = null;
        ResultSet result = null;
        
        result = localDatabase.executeQuery("SELECT * FROM comercebd.tarjetas where Cliente = '"+idCliente+"';");
        Llenador llenador = new Llenador();
        
        tarjetas = llenador.llenarTarjetas(result);
        
        return tarjetas;
    }
    
    public Tarjetas getTarjetaByIdTarjeta(int idTarjeta){
        Tarjetas tarjeta = null;
        ResultSet result = null;
        
        result = localDatabase.executeQuery("SELECT * FROM comercebd.tarjetas where idtargetas = '"+idTarjeta+"';");
        Llenador llenador = new Llenador();
        
        tarjeta = llenador.llenarTarjeta(result);
        
        return tarjeta;
    }
    
    public boolean setNuevaTarjeta(Tarjetas tarjeta){
        boolean hasFailed = true;
        String pSql = "INSERT INTO comercebd.tarjetas (Dueño, CodigoSeguridad, NúmeroTargeta, MesExpira, AñoExpira, Cliente, tipo) "
                    + "VALUES ('"+tarjeta.getPropietario()+"', '"+tarjeta.getCodigoS()+"', '"+tarjeta.getNumero()+"', '"+tarjeta.getDia()+"', '"+tarjeta.getAnno()+"', '"+tarjeta.getIdCliente()+"', '"+tarjeta.getTipo()+"');";
        
        System.out.println(pSql);
        if (tarjeta != null){
            hasFailed = localDatabase.executeNonQueryBool(pSql);
        }
        return hasFailed;
    }
    
}
