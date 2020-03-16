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
    private String contra;
    private String username;

    public Usuario(boolean microEmpresarioC, boolean usuarioC, String nombreC, int idUsuarioC, String contraC, String usernameC) {
        this.setMicroEmpresario(microEmpresarioC);
        this.setUsuario(usuarioC);
        this.setNombre(nombreC);
        this.setIdUsuario(idUsuarioC); //Este es el id de la base de datos del usuario (Se supone que es la PK)
        this.setContra(contraC);
        this.setUsername(usernameC);
    }

    public String getUsername() {
        return username;
    }

    private void setUsername(String username) {
        this.username = username;
    }
    

    public String getContra() {
        return contra;
    }

    private void setContra(String contra) {
        this.contra = contra;
    }

    public boolean isMicroEmpresario() {
        return microEmpresario;
    }

    private void setMicroEmpresario(boolean microEmpresariop) {
        this.microEmpresario = microEmpresariop;
    }

    public boolean isUsuario() {
        return usuario;
    }

    private void setUsuario(boolean usuariop) {
        this.usuario = usuariop;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombrep) {
        this.nombre = nombrep;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    private void setIdUsuario(int idUsuariop) {
        this.idUsuario = idUsuariop;
    }
    
    
    
    
}
