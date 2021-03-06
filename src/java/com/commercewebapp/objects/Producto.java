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
    private String  nombre, descripcion, nombreEmpresa;
    private int     id, idEmpresa, cantidad;
    private double  precio;
    private boolean activo;
    private Empresa empresa;
    private byte[] imagen;
    

    public Producto(int idC, int idEmpresaC, String nombreC, String descripcionC, double precioC, int activoIC, int cantidadC, byte[] imagenC ) {
        this.setId(idC);
        this.setIdEmpresa(idEmpresaC);
        this.setNombre(nombreC);
        this.setDescripcion(descripcionC);
        this.setPrecio(precioC);
        this.setCantidad(cantidadC);
        this.setNombreEmpresa("");
        if (activoIC==1){
            this.setActivo(true);
        } else {
            this.setActivo(false);
        }
        this.setImagen(imagenC);
        
    }

    public byte[] getImagen() {
        return imagen;
    }

    private void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
    
    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

        
    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
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
