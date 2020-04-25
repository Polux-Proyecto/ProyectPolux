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
public class Precios {
    private String precioUnitario, cargoEnvio, totalPagar;
    private int cantidad;
    
    public Precios (double precioU, int cantidad){
        double dCargoEnvio = cantidad*precioU*0.1;
        double dtotalPagar = cantidad*precioU + dCargoEnvio;
        
        dCargoEnvio = (double) Math.round(dCargoEnvio * 100d / 100d);
        dtotalPagar = (double) Math.round(dtotalPagar * 100d / 100d);
        
        this.setPrecioUnitario(Double.toString(precioU));
        this.setCargoEnvio(Double.toString(dCargoEnvio));
        this.setTotalPagar(Double.toString(dtotalPagar));
        this.setCantidad(cantidad);
        
    }

    public int getCantidad() {
        return cantidad;
    }

    private void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    

    public String getPrecioUnitario() {
        return precioUnitario;
    }

    private void setPrecioUnitario(String precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public String getCargoEnvio() {
        return cargoEnvio;
    }

    private void setCargoEnvio(String cargoEnvio) {
        this.cargoEnvio = cargoEnvio;
    }

    public String getTotalPagar() {
        return totalPagar;
    }

    private void setTotalPagar(String totalPagar) {
        this.totalPagar = totalPagar;
    }
    
    
}
