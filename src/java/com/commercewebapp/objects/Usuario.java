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
    private int idUsuario;
    private String nombre, contra, username, correo, genero, fechaN, direccion, ciudad, pais;
    private byte[] imagen;
    
    public Usuario(boolean microEmpresarioC, boolean usuarioC, String nombreC, int idUsuarioC, String contraC, String usernameC, String correoC, String generoC, String fechaNC, String direccionC,  byte[] imagenC) {
        this.setMicroEmpresario(microEmpresarioC);
        this.setUsuario(usuarioC);
        this.setNombre(nombreC);
        this.setIdUsuario(idUsuarioC); //Este es el id de la base de datos del usuario (Se supone que es la PK)
        this.setContra(contraC);
        this.setUsername(usernameC);
        this.setCorreo(correoC);
        this.setGenero(generoC);
        this.setFechaN(fechaNC);
        this.setDireccion(direccionC);
        this.setImagen(imagenC);
        
    }

    public byte[] getImagen() {
        return imagen;
    }

    private void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
    
    
    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
   
    public String getDireccion() {
        return direccion;
    }

    private void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getGenero() {
        return genero;
    }

    private void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFechaN() {
        return fechaN;
    }

    private void setFechaN(String fechaN) {
        this.fechaN = fechaN;
    }

    public String getCorreo() {
        return correo;
    }

    private void setCorreo(String correoP) {
        this.correo = correoP;
    }
    
    public String getUsername() {
        return username;
    }

    private void setUsername(String usernameP) {
        this.username = usernameP;
    }
    

    public String getContra() {
        return contra;
    }

    private void setContra(String contraP) {
        this.contra = contraP;
    }

    public boolean isMicroEmpresario() {
        return microEmpresario;
    }

    private void setMicroEmpresario(boolean microEmpresarioP) {
        this.microEmpresario = microEmpresarioP;
    }

    public boolean isUsuario() {
        return usuario;
    }

    private void setUsuario(boolean usuarioP) {
        this.usuario = usuarioP;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombreP) {
        this.nombre = nombreP;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    private void setIdUsuario(int idUsuarioP) {
        this.idUsuario = idUsuarioP;
    }
    
}
