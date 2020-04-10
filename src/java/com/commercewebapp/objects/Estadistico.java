 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.objects;

/**
 *
 * @author Mauricio Aguilar
 */
public class Estadistico {
    private String nombreProd, nombrecategoria;
    private int idEmpresa, nLista;
    private int cantBusquedas,  cantVentas;
    private double cantDinero;

    public Estadistico(String nombreProdC, String nombrecategoriaC, int idEmpresaC, int cantBusquedasC, int cantVentasC, int nListaC, double cantDineroC) {
        this.setNombreProd(nombreProdC);
        this.setNombrecategoria(nombrecategoriaC) ;
        this.setIdEmpresa(idEmpresaC);
        this.setCantBusquedas(cantBusquedasC);
        this.setCantVentas(cantVentasC);
        this.setnLista(nListaC);
        this.setCantDinero(cantDineroC);
    }

    public double getCantDinero() {
        return cantDinero;
    }

    private void setCantDinero(double cantDinero) {
        this.cantDinero = cantDinero;
    }
    
    

    public int getnLista() {
        return nLista;
    }

    private void setnLista(int nLista) {
        this.nLista = nLista;
    }
    
    public String getNombreProd() {
        return nombreProd;
    }

    private void setNombreProd(String nombreProd) {
        this.nombreProd = nombreProd;
    }

    public String getNombrecategoria() {
        return nombrecategoria;
    }

    private void setNombrecategoria(String nombrecategoria) {
        this.nombrecategoria = nombrecategoria;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    private void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getCantBusquedas() {
        return cantBusquedas;
    }

    private void setCantBusquedas(int cantBusquedas) {
        this.cantBusquedas = cantBusquedas;
    }

    public int getCantVentas() {
        return cantVentas;
    }

    private void setCantVentas(int cantVentas) {
        this.cantVentas = cantVentas;
    }
    
    
}
