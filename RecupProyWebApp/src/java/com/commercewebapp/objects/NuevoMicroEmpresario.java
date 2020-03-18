//Este pojo almacenara datos ingresados de microempresarios nuevos para ser insertados a las bds posteriormente
package com.commercewebapp.objects;

public class NuevoMicroEmpresario 
{
    String name;
    String user; 
    String nit;
    String password;
    String descripcion;

    public NuevoMicroEmpresario(String Sname, String Suser, String Snit, String Spassword, String Sdescripcion) {
        this.setName(Sname);
        this.setUser(Suser);
        this.setNit(Snit);
        this.setPassword(Spassword);
        this.setDescripcion(Sdescripcion);
    }
    
    

    public String getName() {
        return name;
    }

    private void setName(String pname) {
        this.name = pname;
    }

    public String getUser() {
        return user;
    }

    private void setUser(String puser) {
        this.user = puser;
    }

    public String getNit() {
        return nit;
    }

    private void setNit(String pnit) {
        this.nit = pnit;
    }

    public String getPassword() {
        return password;
    }

    private void setPassword(String ppassword) {
        this.password = ppassword;
    }

    public String getDescripcion() {
        return descripcion;
    }

    private void setDescripcion(String pdescripcion) {
        this.descripcion = pdescripcion;
    }
    
    
}
