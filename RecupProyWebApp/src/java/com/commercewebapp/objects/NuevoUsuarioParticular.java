//Este pojo almacenara datos ingresados de ususraios particulares nuevos para ser insertados a las bds posteriormente
package com.commercewebapp.objects;

public class NuevoUsuarioParticular 
{
     String name;
     String username;
     String email; 
     String password;
     String pais;
     String ciudad; 
     String direccion;

    public NuevoUsuarioParticular(String Sname, String Susername, String Semail, String Spassword, String Spais, String Sciudad, String Sdireccion) {
        this.setName(Sname);
        this.setUsername(Susername);
        this.setEmail(Semail);
        this.setPassword(Spassword);
        this.setPais(Spais);
        this.setCiudad(Sciudad);
        this.setDireccion(Sdireccion);
        
     }
     
     
    public String getName() {
        return name;
    }

    private void setName(String pname) {
        this.name = pname;
    }

    public String getUsername() {
        return username;
    }

    private void setUsername(String pusername) {
        this.username = pusername;
    }

    public String getEmail() {
        return email;
    }

    private void setEmail(String pemail) {
        this.email = pemail;
    }

    public String getPassword() {
        return password;
    }

    private void setPassword(String ppassword) {
        this.password = ppassword;
    }

    public String getPais() {
        return pais;
    }

    private void setPais(String ppais) {
        this.pais = ppais;
    }

    public String getCiudad() {
        return ciudad;
    }

    private void setCiudad(String pciudad) {
        this.ciudad = pciudad;
    }

    public String getDireccion() {
        return direccion;
    }

    private void setDireccion(String pdireccion) {
        this.direccion = pdireccion;
    }
     
     
}
