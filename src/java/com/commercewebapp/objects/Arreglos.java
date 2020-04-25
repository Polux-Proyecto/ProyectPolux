/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.objects;

import java.time.Year;

/**
 *
 * @author Mauricio Aguilar
 */
public class Arreglos {
    private int cant = 0; 
    
    public Arreglos(){
        int year = Year.now().getValue();
        this.setCant(year - 1900);
    }

    public int getCant() {
        return cant;
    }

    private void setCant(int cant) {
        this.cant = cant;
    }
    
    
    public String[] getMeses(){
        String meses[] = new String[12];
        meses[0] = "Enero";
        meses[1] = "Febrero";
        meses[2] = "Marzo";
        meses[3] = "Abril";
        meses[4] = "Mayo";
        meses[5] = "Junio";
        meses[6] = "Julio";
        meses[7] = "Agosto";
        meses[8] = "Septiembre";
        meses[9] = "Octubre";
        meses[10] = "Noviembre";
        meses[11] = "Diciembre";
        return meses;
    }
    
    public int[] getDias(){
        int dias[] = null;
        int i = 31;
        
        dias = new int[31];
        for (int j = 0; j< i; j++){
            dias[j] = j + 1;
        }        
        return dias;
    }
    
    public int[] getAnnos(){
        
        int annos [] = new int [cant];
        for (int i = 0; i < cant ; i++ ){
            annos[i] = 1900 + i;
        }
        return annos;
    }
}
