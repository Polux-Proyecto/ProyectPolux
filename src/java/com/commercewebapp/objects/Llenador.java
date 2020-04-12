/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.objects;

import com.commercewebapp.logics.AdminEmpresas;
import com.commercewebapp.logics.AdminProductos;
import com.commercewebapp.logics.BuscarUsuario;
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

public class Llenador {
    
    public List<Producto> llenarListaProductos(ResultSet result){
        List<Producto> listaProductos = null;
        
        if (result!=null){
            int     id, existencias, idEmpresa;
            String  nombre, descripcion;
            double  precio;   
            Producto productoActual= null;
            listaProductos = new ArrayList();
            try {
                    while(result.next()){
                        id = result.getInt("idprodtb");
                        idEmpresa = result.getInt("empresa");
                        nombre = result.getString("nombre");
                        descripcion = result.getString("descripcion");
                        precio = result.getDouble("precio");
                        existencias = result.getInt("existencias");
                        

                        productoActual = new Producto (id, idEmpresa, nombre, descripcion, precio, 1, existencias);
                        ;
                        listaProductos.add(productoActual);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        
        return listaProductos;
        
    }
    
    public List<Categoria> llenarListaCategoria (ResultSet result){
        List<Categoria> listaCategorias = null;
        
        if(result!=null){
            listaCategorias = new ArrayList();
            Categoria categoria = null;
            String nombre;
            int idCat;
            try {
                while (result.next()){
                    nombre = result.getString("Nombre");
                    idCat = result.getInt("idCategorias");
                    
                    categoria = new Categoria (nombre, idCat);
                    listaCategorias.add(categoria);
                    
                }
                    } catch (SQLException ex) {
                Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return listaCategorias;
    }
    
    public List<Envio> llenarEnvios (ResultSet result){
        List<Envio> lista = null;
        
        if (result!=null){
            BuscarUsuario buscarUsuario = new BuscarUsuario();
            AdminProductos adminProd = new AdminProductos();
            lista = new ArrayList();
            Usuario usuario;
            Producto producto;
            String username , fecha;
            Envio envio;
            int idProd, cantidad;
            try {
                while(result.next()){
                    username = result.getString("Username");
                    idProd = result.getInt("idprodtb");
                    cantidad = result.getInt("cantidad");
                    fecha =  result.getString("fechaPedido");
                    usuario = buscarUsuario.getUsersConCiudadYPais(username);
                    producto = adminProd.getProductoPorId(idProd);
                    envio = new Envio(usuario, producto, cantidad, fecha);
                    
                    lista.add(envio);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminEmpresas.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return lista;
    }

    public List<Stock> llenarStock(ResultSet result) {
        List<Stock> listaStock = null;

        if (result!=null){
            String nombre, categoria;
            int existencias, numero;
            Stock productoActual;
            listaStock = new ArrayList();
            try {
                    while(result.next()){
                        numero = result.getInt("numero");
                        nombre = result.getString("nombre");
                        categoria = result.getString("nombreCat");
                        existencias = result.getInt("existencias");
                        
                        productoActual = new Stock (nombre, categoria, existencias, numero);
                        
                        listaStock.add(productoActual);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        return listaStock;
    }
    
    public List<Usuario> llenarUsuario(ResultSet result){
        List<Usuario> lista = null;
        String pass, nombre, correo ="", genero = "", fechaN = "", direccion = "", username = "", pais = "", ciudad = "";
        int id;
        Usuario usuario = null;
        if(result!=null){
            lista = new ArrayList();
            try {
                 if (result != null){
                     while (result.next()){
                         System.out.println("Hay algo en la tabla de clientes");
                         nombre = result.getString("Nombre");

                         pass =  "";
                         id = result.getInt("idCliente");
                         correo = "";
                         genero = result.getString("Sexo");
                         fechaN = result.getString("FechaNacimiento");
                         direccion = result.getString("Dirección");
                         ciudad = result.getString("Ciudad");
                         pais = result.getString("Pais");
                        
                         usuario = new Usuario (false, true, nombre, id, pass, username, correo, genero, fechaN, direccion);
                         usuario.setCiudad(ciudad);
                         usuario.setPais(pais);
                         
                         lista.add(usuario);
                     }
                 }


            } catch (SQLException ex) {
                    Logger.getLogger(BuscarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    return lista;
    }
}
