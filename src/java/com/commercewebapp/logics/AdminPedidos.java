/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Estadistico;
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
public class AdminPedidos extends Logic{
    DatabaseZ localDatabase = getDatabase();
    
    public int getCantidadPedidos(int idEmpresario){
        int cantidad = -1;
        
        ResultSet result = localDatabase.executeQuery("SELECT count(*) as cantidad FROM comercebd.pedidostb "
                + "INNER JOIN comercebd.prodtb on prodtb.idprodtb = pedidostb.producto "
                + "INNER JOIN comercebd.empresatb on prodtb.empresa = empresatb.idempresatb "
                + "WHERE empresatb.idempresatb = '"+idEmpresario+"' and pedidostb.entregado = 0;");
        
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
    
    public List<Estadistico> getAllEstadisticosPorIdEmpresa(int idEmpresa){
        List<Estadistico> listaEstadistico = null;
        int numProd, busquedas, vendidos;
        String nombreProd, categoria;
        
        Estadistico estadistico;
        
        ResultSet result = localDatabase.executeQuery("SELECT row_number() over (order by (sum(pedidostb.cantidad))) as numeroProducto, prodtb.nombre, categorias.Nombre, sum(pedidostb.cantidad) as cantVendida, prodtb.busquedas "
                + "FROM comercebd.pedidostb  INNER JOIN prodtb on prodtb.idprodtb = pedidostb.producto "
                + "INNER JOIN categorias on  prodtb.categoria = categorias.idCategorias  "
                + "WHERE prodtb.empresa = '"+idEmpresa+"' and (datediff(current_date(), pedidostb.fechaPedido) < 31) "
                + "group by (pedidostb.producto), pedidostb.producto, prodtb.nombre, categorias.Nombre, prodtb.busquedas;");
        
        if (result!=null){
            listaEstadistico = new ArrayList();
            try {
                while (result.next()){
                    numProd = result.getInt("numeroProducto");
                    busquedas = result.getInt("busquedas");
                    vendidos = result.getInt("cantVendida");
                    nombreProd = result.getString("nombre");
                    categoria = result.getString("Nombre");
                    
                    estadistico = new Estadistico(nombreProd, categoria, idEmpresa, busquedas, vendidos, numProd );
                    listaEstadistico.add(estadistico);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminPedidos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return listaEstadistico;
    }
    
}
