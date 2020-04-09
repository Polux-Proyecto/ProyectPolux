//Este pojo almacenara datos ingresados de ususraios particulares nuevos para ser insertados a las bds posteriormente
package com.commercewebapp.objects;

public class NuevoUsuarioParticular 
{
     String name;
     String username;
     String email; 
     String password;
     String sexo;
     String pais;
     String ciudad; 
     String direccion;
     String fechanacimiento;
     byte[] imagen;

    public NuevoUsuarioParticular(String Sname, String Susername, String Semail, String Spassword, String Spais, String Sciudad, String Sdireccion, String Ssexo, String Sfechanacimiento, byte[] Simagen) {
        this.setName(Sname);
        this.setUsername(Susername);
        this.setEmail(Semail);
        this.setPassword(Spassword);
        this.setPais(Spais);
        this.setCiudad(Sciudad);
        this.setDireccion(Sdireccion);
        this.setSexo(Ssexo);
        this.setFechanacimiento(Sfechanacimiento);
        this.setImagen(Simagen);
        
     }

    public String getSexo() {
        return sexo;
    }

    private void setSexo(String psexo) {
        this.sexo = psexo;
    }

    public String getFechanacimiento() {
        return fechanacimiento;
    }

    private void setFechanacimiento(String pfechanacimiento) {
        this.fechanacimiento = pfechanacimiento;
    }

    public byte[] getImagen() {
        return imagen;
    }

    private void setImagen(byte[] pimagen) {
        this.imagen = pimagen;
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
