package com.commercewebapp.logics;

import com.commercewebapp.objects.Usuario;

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
    public Usuario buscar(){
        //Acá se acudirá a la base de datos y se revisará si el usuario existe
        boolean usuarioencontrado = true;
        //Con los datos obtenidos de la BD, se debe meter el id en la siguiente variable y tambien se debe autorizar con setAutorizado(true);
        boolean isUsuario = true;
        boolean isEmpresario = false;
        int idUsuario = 1;
        
        //Si el usuario se encontró se efectuará el siguiente proceso
        if (usuarioencontrado) {
            
            this.setAutorizado(true);
            //Una vez autorizado y con el id y sabiendo si es microempresario o usuario normal, se llena lo siguiente
            Usuario usuario = new Usuario(isEmpresario, isUsuario, this.nombre, idUsuario );
            return usuario;
            
        } else {
            Usuario usuario = new Usuario(false, false, null, null);
            return usuario;
            return null;
        }
        
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
