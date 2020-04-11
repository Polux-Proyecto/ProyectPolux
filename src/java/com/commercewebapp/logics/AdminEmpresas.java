/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.logics;
import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Empresa;
import com.commercewebapp.objects.Envio;
import com.commercewebapp.objects.Llenador;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 78GDO
 */
public class AdminEmpresas extends Logic {
    DatabaseZ localDatabase = getDatabase();
    
    public Empresa getEmpresasPorId(int idEmpresa){
        Empresa empresa = null;
        String nombre, descripcion, correo, pais, ciudad;
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.empresatb where empresatb.idempresatb = '"+idEmpresa+"' Limit 1;");
        
        if (result!= null){
            
            
            try {
                while(result.next()){
                    nombre = result.getString("Nombre");
                    descripcion = result.getString("Descripcion");
                    correo = result.getString("Descripcion");
                    pais = result.getString("Pais");
                    ciudad = result.getString("Ciudad");
                    empresa = new Empresa(idEmpresa, nombre, descripcion, correo, pais, ciudad);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminEmpresas.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return empresa;
    }
    
    public List<Envio> getEnviosPorId (int idEmpresa){
        List<Envio> lista = null;
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.pedidostb "
                + "INNER JOIN prodtb on prodtb.idprodtb = pedidostb.producto "
                + "INNER JOIN clientetb on clientetb.idCliente = pedidostb.cliente "
                + "where prodtb.empresa = '"+idEmpresa+"' and pedidostb.entregado = 0 "
                + "ORDER BY pedidostb.fechaPedido asc;");
        
        Llenador llenador = new Llenador();
        lista = llenador.llenarEnvios(result);
        
        return lista;
    }
    
    public List<Envio> getEnviosPorIdEmpYCliente (int idEmpresa, int idCliente){
        List<Envio> lista = null;
        
        ResultSet result = localDatabase.executeQuery("SELECT * FROM comercebd.pedidostb "
                + "INNER JOIN prodtb on prodtb.idprodtb = pedidostb.producto "
                + "INNER JOIN clientetb on clientetb.idCliente = pedidostb.cliente "
                + "where prodtb.empresa = '"+idEmpresa+"' and pedidostb.entregado = 0 and clientetb.idCliente = '"+idCliente+"'"
                + " ORDER BY pedidostb.fechaPedido asc;");
        
        Llenador llenador = new Llenador();
        lista = llenador.llenarEnvios(result);
        
        return lista;
    }
    
}
