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
public class Categoria {
    String nombre;
    int idCat;

    public Categoria(String nombreC, int idCatC) {
        this.setNombre(nombreC);
        this.setIdCat(idCatC);
    }
    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdCat() {
        return idCat;
    }

    private void setIdCat(int idCat) {
        this.idCat = idCat;
    }
    
    
    
    
    
}
