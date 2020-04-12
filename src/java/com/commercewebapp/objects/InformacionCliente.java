/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.objects;

/**
 *
 * @author 78GDO
 */
public class InformacionCliente {
    private String pais, ciudades, genero;

    public InformacionCliente(String paisC, String ciudadesC, String generoC) {
        this.setPais(paisC);
        this.setCiudades(ciudadesC);
        this.setGenero(generoC);
    }
    
    
    
    public String getPais() {
        return pais;
    }

    private void setPais(String pais) {
        this.pais = pais;
    }

    public String getCiudades() {
        return ciudades;
    }

    private void setCiudades(String ciudades) {
        this.ciudades = ciudades;
    }

    public String getGenero() {
        return genero;
    }

    private void setGenero(String genero) {
        this.genero = genero;
    }
    
    
}
