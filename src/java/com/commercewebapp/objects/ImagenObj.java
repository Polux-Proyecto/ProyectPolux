// objeto manipula imagenes
package com.commercewebapp.objects;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

@MultipartConfig
public class ImagenObj 
{
    public byte[] convertidorPartaBlob( Part file)
       {
           System.out.println("llego al objeto");
        byte[] imagencomobytearray = null;
        try 
        {
            InputStream filecontent = file.getInputStream();
            imagencomobytearray = IOUtils.toByteArray(filecontent);
            
            
        } catch (IOException ex) 
        {
            Logger.getLogger(ImagenObj.class.getName()).log(Level.SEVERE, null, ex);
        }
           
           
           
        return imagencomobytearray;      
       }
}
