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
public class DefaulImage {
    private byte[] img;

    public DefaulImage(byte[] img) {
        this.setImg(img);
    }
    
    
    
    public byte[] getImg() {
        return img;
    }

    private void setImg(byte[] img) {
        this.img = img;
    }
    
}
