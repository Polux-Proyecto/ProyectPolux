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
public class Empresa {
    private int idEmpresa;
    private String nombre,descripcion, correo, pais, ciudad; 

    public Empresa(int idEmpresaC, String nombreC, String descripcionC, String correoC, String paisC, String ciudadC) {
        this.setIdEmpresa(idEmpresaC); 
        this.setNombre(nombreC);
        this.setDescripcion(descripcionC);
        this.setCorreo(correoC);
        this.setPais(paisC);
        this.setCiudad(ciudadC);
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

    public String getCorreo() {
        return correo;
    }

    private void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPais() {
        return pais;
    }

    private void setPais(String pais) {
        this.pais = pais;
    }

    public String getCiudad() {
        return ciudad;
    }

    private void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    
    
}
