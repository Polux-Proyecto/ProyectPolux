/*
 *Este es un usuarioGeneral. Este objeto sirve tanto para los usuarios que representan microempresarios_
 *y aquellos que son compradores. Para diferenciar estre estos existen dos boolean, uno llamadomicroempresario 
 *y otro llamado usuario. 
 */
package com.commercewebapp.objects;

/** ESte sí es un POJO
 * @author Mauricio Aguilar
 */
public class Usuario {
    private boolean microEmpresario;
    private boolean usuario;
    private String nombre;
    private int idUsuario;

    public Usuario(boolean microEmpresarioC, boolean usuarioC, String nombreC, int idUsuarioC) {
        this.microEmpresario = microEmpresarioC;
        this.usuario = usuarioC;
        this.nombre = nombreC;
        this.idUsuario = idUsuarioC; //Este es el id de la base de datos del usuario (Se supone que es la PK)
    }
    
    public boolean isMicroEmpresario() {
        return microEmpresario;
    }

    private void setMicroEmpresario(boolean microEmpresario) {
        this.microEmpresario = microEmpresario;
    }

    public boolean isUsuario() {
        return usuario;
    }

    private void setUsuario(boolean usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    private void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
    
    
}
