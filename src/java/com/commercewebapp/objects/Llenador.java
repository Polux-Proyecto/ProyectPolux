/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.objects;

import com.commercewebapp.logics.AdminProductos;
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

                        listaProductos.add(productoActual);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(AdminProductos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        
        return listaProductos;
        
    }
    
}
