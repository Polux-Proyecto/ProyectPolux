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
public class Producto {
    private String  nombre, descripcion;
    private int     id, idEmpresa, cantidad;
    private double  precio;
    private boolean activo;

    public Producto(int idC, int idEmpresaC, String nombreC, String descripcionC, double precioC, int activoIC, int cantidadC) {
        this.setId(idC);
        this.setIdEmpresa(idEmpresaC);
        this.setNombre(nombreC);
        this.setDescripcion(descripcionC);
        this.setPrecio(precioC);
        this.setCantidad(cantidadC);
        
        if (activoIC==1){
            this.setActivo(true);
        } else {
            this.setActivo(false);
        }
        
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public int getId() {
        return id;
    }

    private void setId(int id) {
        this.id = id;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    private void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    private void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    private void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isActivo() {
        return activo;
    }

    private void setActivo(boolean activo) {
        this.activo = activo;
    }
}
