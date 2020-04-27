/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Llenador;
import com.commercewebapp.objects.Precios;
import com.commercewebapp.objects.Producto;
import com.commercewebapp.objects.Tarjetas;
import com.commercewebapp.objects.Usuario;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
    
    public boolean setVenta(Usuario usuario, Producto producto, Precios precios, Tarjetas tarjeta){
        boolean hasFailed = true;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.now();
        String date = dtf.format(localDate);
        System.out.println(dtf.format(localDate)); 
        String pSql = "INSERT INTO comercebd.pedidostb ( cliente, producto, cantidad, entregado, precio, fechaPedido, Tarjeta) VALUES ( '"+usuario.getIdUsuario()+"', '"+producto.getId()+"', '"+precios.getCantidad()+"', '0', '"+precios.getTotalPagar()+"', '"+date+"', '"+tarjeta.getIdTarjeta()+"');";
        System.out.println(pSql);
        hasFailed = localDatabase.executeNonQueryBool(pSql);
        return hasFailed;
        
    }
}
