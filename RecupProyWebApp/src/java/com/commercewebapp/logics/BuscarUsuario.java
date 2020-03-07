package com.commercewebapp.logics;

/*
    Este objeto tiene el propósito de buscar el usuario y confirmar si la contraseña es correcta
    !!--Este objeto no es un POJO
*/

public class BuscarUsuario {
    private String nombre;
    private String clave;
    private boolean autorizado;

//Constructor
    public BuscarUsuario (String nombreC, String claveC) {
        this.setClave(claveC);
        this.setNombre(nombreC);
        this.setAutorizado(false); //El usuario no está autorizado en un principio
    }

//Métodos
    public void buscar(){
        //Acá se acudirá a la base de datos y se revisará si el usuario existe
        
        //Si el usuario se encontró se efectuará el siguiente proceso
        /*if (usuarioencontrado()) then{
            */
            this.setAutorizado(true);
            /*
        }
        */
    } 
    
    
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

    public boolean isAutorizado() {
        return autorizado;
    }

    private void setAutorizado(boolean autorizado) {
        this.autorizado = autorizado;
    }

    
    
}
