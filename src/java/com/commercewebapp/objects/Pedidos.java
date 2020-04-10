/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.objects;

/**
 *
 * @author Mauricio Aguilar
 */
public class Pedidos {
    Producto producto;
    Usuario usuario;
    int cantidad;

    public Pedidos(Producto producto, Usuario usuario, int cantidad) {
        this.setProducto(producto);
        this.setUsuario(usuario);
        this.setCantidad(cantidad);
    }
    
    public Producto getProducto() {
        return producto;
    }

    private void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    private void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getCantidad() {
        return cantidad;
    }

    private void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
