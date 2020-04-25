
package com.commercewebapp.objects;

public class NuevoProducto
{
        String nombreproducto;
        int precioproducto;
        String descripcionproducto;
        int empresaproducto;
        int categoriaproducto;
        int busquedasproducto;
        int existenciasproducto;
        byte[] imagenproducto;

    public NuevoProducto(String nombreprodc , int precioprodc , String descripcionprodc , int empresac , int categoriac, int busquedac , int existenciasc , byte[] imagenc) 
    {
        this.setNombreproducto(nombreprodc);
        this.setPrecioproducto(precioprodc);
        this.setDescripcionproducto(descripcionprodc);
        this.setEmpresaproducto(empresac);
        this.setCategoriaproducto(categoriac);
        this.setBusquedasproducto(busquedac);
        this.setExistenciasproducto(existenciasc);
        this.setImagenproducto(imagenc);
    }

        
        
    public String getNombreproducto() {
        return nombreproducto;
    }

    private void setNombreproducto(String pnombreproducto) {
        this.nombreproducto = pnombreproducto;
    }

    public int getPrecioproducto() {
        return precioproducto;
    }

    private void setPrecioproducto(int pprecioproducto) {
        this.precioproducto = pprecioproducto;
    }

    public String getDescripcionproducto() {
        return descripcionproducto;
    }

    private void setDescripcionproducto(String pdescripcionproducto) {
        this.descripcionproducto = pdescripcionproducto;
    }

    public int getEmpresaproducto() {
        return empresaproducto;
    }

    private void setEmpresaproducto(int pempresaproducto) {
        this.empresaproducto = pempresaproducto;
    }

    public int getCategoriaproducto() {
        return categoriaproducto;
    }

    private void setCategoriaproducto(int pcategoriaproducto) {
        this.categoriaproducto = pcategoriaproducto;
    }

    public int getBusquedasproducto() {
        return busquedasproducto;
    }

    private void setBusquedasproducto(int pbusquedasproducto) {
        this.busquedasproducto = pbusquedasproducto;
    }

    public int getExistenciasproducto() {
        return existenciasproducto;
    }

    private void setExistenciasproducto(int pexistenciasproducto) {
        this.existenciasproducto = pexistenciasproducto;
    }

    public byte[] getImagenproducto() {
        return imagenproducto;
    }

    private void setImagenproducto(byte[] pimagenproducto) {
        this.imagenproducto = pimagenproducto;
    }
                
        
}
