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
public class BuscarUsuario {
//Este objeto tiene el propósito de buscar el usuario y confirmar si la contraseña es correcta
    private String nombre;
    private String clave;
    private String autorizado;

//Constructor
    public BuscarUsuario (String nombreC, String claveC) {
        this.setClave(claveC);
        this.setNombre(nombreC);
    }
//Métodos
    
    
    
    
    
    
    
//getters y setters 
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClave() {
        return clave;
    }

    private void setClave(String clave) {
        this.clave = clave;
    }

}
