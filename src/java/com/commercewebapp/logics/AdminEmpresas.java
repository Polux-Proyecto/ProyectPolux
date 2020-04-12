/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.logics;
import com.commercewebapp.database.DatabaseZ;
import com.commercewebapp.objects.Empresa;
import com.commercewebapp.objects.Envio;
import com.commercewebapp.objects.InformacionCliente;
import com.commercewebapp.objects.Llenador;
import com.commercewebapp.objects.Stock;
import com.commercewebapp.objects.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    
    public List<Stock> getInvertarioPorId (int idEmpresario){
        
        ResultSet result = localDatabase.executeQuery("SELECT row_number() over (order by existencias asc) as numero, prodtb.nombre, categorias.Nombre as nombreCat , prodtb.existencias  "
                + "FROM comercebd.prodtb INNER JOIN comercebd.categorias on prodtb.categoria = categorias.idCategorias "
                + "WHERE prodtb.empresa = '"+idEmpresario+"';");
        
        Llenador llenador = new Llenador();
        List<Stock> listaStock = llenador.llenarStock(result);
        
        return listaStock;
    }
    
    public List<Usuario> getTop10Clientes (int idEmpresa){
        List<Usuario> top10Clientes = null;
        
        ResultSet result = localDatabase.executeQuery("SELECT clientetb.Nombre, clientetb.idCliente, clientetb.Username,  clientetb.Pais, clientetb.Ciudad, clientetb.Dirección, clientetb.Sexo, clientetb.FechaNacimiento, clientetb.ImagenPerfil "
                + "FROM comercebd.clientetb "
                + "INNER JOIN pedidostb on pedidostb.cliente = clientetb.idCliente "
                + "INNER JOIN prodtb on prodtb.idprodtb = pedidostb.producto "
                + "Where prodtb.empresa = '"+idEmpresa+"' group by  clientetb.Nombre, clientetb.idCliente, clientetb.Username,  clientetb.Pais, clientetb.Ciudad, clientetb.Dirección, clientetb.Sexo, clientetb.FechaNacimiento, clientetb.ImagenPerfil, prodtb.empresa "
                + "ORDER BY sum(pedidostb.idPedidos) desc LIMIT 10;");
        
        Llenador llenador = new Llenador();
        top10Clientes = llenador.llenarUsuario(result);
        
        return top10Clientes;
    }

    public List<InformacionCliente> getTopPaises(int idEmpresa, int limite) {
        List<InformacionCliente> lista = null;
        ResultSet result = localDatabase.executeQuery("SELECT count( clientetb.Pais) as cantidad, clientetb.Pais "
                + "FROM comercebd.pedidostb INNER JOIN clientetb on clientetb.idCliente = pedidostb.cliente "
                + "INNER JOIN prodtb on prodtb.idprodtb = pedidostb.producto where prodtb.empresa = '"+idEmpresa+"' "
                + "group by clientetb.Pais order by cantidad desc Limit "+limite+";");
        if (result != null){
            lista = new ArrayList();
            String pais = "";
            InformacionCliente info = null;
            try {
                    
                while (result.next()){
                    pais = result.getString("Pais");
                    
                    info = new InformacionCliente(pais, "", "");
                    lista.add(info);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminEmpresas.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return lista;
    }

    public List<InformacionCliente> getTopCiudades(int idEmpresa, int limite) {
    List<InformacionCliente> lista = null;
        ResultSet result = localDatabase.executeQuery("SELECT count( clientetb.Ciudad ) as cantidad, clientetb.Ciudad "
                + "FROM comercebd.pedidostb INNER JOIN clientetb on clientetb.idCliente = pedidostb.cliente "
                + "INNER JOIN prodtb on prodtb.idprodtb = pedidostb.producto where prodtb.empresa = '"+idEmpresa+"' "
                + "group by clientetb.Ciudad order by cantidad desc limit "+limite+";");
        if (result != null){
            lista = new ArrayList();
            String ciudad = "";
            InformacionCliente info = null;
            try {
                    
                while (result.next()){
                    ciudad = result.getString("Ciudad");
                    
                    info = new InformacionCliente("", ciudad, "");
                    lista.add(info);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminEmpresas.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return lista;
    }

    public InformacionCliente getTopGenero(int idEmpresa) {
        InformacionCliente genero = null;
        ResultSet result = localDatabase.executeQuery("SELECT count( clientetb.Ciudad ) as cantidad, clientetb.Ciudad "
                + "FROM comercebd.pedidostb INNER JOIN clientetb on clientetb.idCliente = pedidostb.cliente "
                + "INNER JOIN prodtb on prodtb.idprodtb = pedidostb.producto where prodtb.empresa = '"+idEmpresa+"' "
                + "group by clientetb.Ciudad order by cantidad desc limit 1;");
        if (result != null){
            String sexo = "";
            
            try {
                    
                while (result.next()){
                    sexo = result.getString("Ciudad");
                    
                    genero = new InformacionCliente("", "", sexo);
                    
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminEmpresas.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return genero;
    }
}
