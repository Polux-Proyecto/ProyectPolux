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
    byte[] img;

    public Categoria(String nombreC, int idCatC, byte[] imgC) {
        this.setNombre(nombreC);
        this.setIdCat(idCatC);
        this.setImg(imgC);
    }

    public byte[] getImg() {
        return img;
    }

    private void setImg(byte[] img) {
        this.img = img;
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
