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
public class Stock {
    String nombre, categoria;
    int existencias, numero;

    public Stock(String nombre, String categoria, int existencias, int numero) {
        this.setNombre(nombre);
        this.setCategoria(categoria);
        this.setExistencias(existencias);
        this.setNumero(numero);
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    private void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getExistencias() {
        return existencias;
    }

    private void setExistencias(int existencias) {
        this.existencias = existencias;
    }

    public int getNumero() {
        return numero;
    }

    private void setNumero(int numero) {
        this.numero = numero;
    }
    
    
}
