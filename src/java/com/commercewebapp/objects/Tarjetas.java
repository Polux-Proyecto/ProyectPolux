/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.objects;

/**
 *
 * @author 78GDO
 */
public class Tarjetas {
    private String propietario, tipo, numero, codigoS, fechaE, codigoHidden, mes, anno;
    private int idTarjeta, idCliente;
    
    public Tarjetas(String propietarioC, String tipoC, String numeroC, String codigoSC, String mesC, String annoC, int idTarjetaC, int idClienteC) {
        this.setPropietario(propietarioC);
        this.setTipo(tipoC);
        this.setNumero(numeroC);
        this.setCodigoS(codigoSC);
        this.setAnno(annoC);
        this.setDia(mesC);
        String fechaEC = mesC + "/"+ annoC;
        this.setFechaE(fechaEC);
        this.setIdTarjeta(idTarjetaC);
        this.setIdCliente(idClienteC);
        this.hide(numeroC);
    }
    
    public void hide(String numeroC){
        String temporal = "";
        
        temporal = numeroC.substring(0, 4);
        temporal = temporal + "********";
        temporal = temporal + numeroC.substring(13, 16);
        
        this.setCodigoHidden(temporal);
        
    }

    public String getDia() {
        return mes;
    }

    private void setDia(String mes) {
        this.mes = mes;
    }

    public String getAnno() {
        return anno;
    }

    private void setAnno(String anno) {
        this.anno = anno;
    }
    
    public String getCodigoHidden() {
        return codigoHidden;
    }

    private void setCodigoHidden(String codigoHidden) {
        this.codigoHidden = codigoHidden;
    }
    
    
    public int getIdCliente() {
        return idCliente;
    }

    private void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
    
    
    
    public int getIdTarjeta() {
        return idTarjeta;
    }

    private void setIdTarjeta(int idTarjeta) {
        this.idTarjeta = idTarjeta;
    }
    
    public String getPropietario() {
        return propietario;
    }

    private void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public String getTipo() {
        return tipo;
    }

    private void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNumero() {
        return numero;
    }

    private void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCodigoS() {
        return codigoS;
    }

    private void setCodigoS(String codigoS) {
        this.codigoS = codigoS;
    }

    public String getFechaE() {
        return fechaE;
    }

    private void setFechaE(String fechaE) {
        this.fechaE = fechaE;
    }
    
}
