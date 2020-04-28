
package com.commercewebapp.messages;

import com.commercewebapp.objects.Precios;
import com.commercewebapp.objects.Producto;
import com.commercewebapp.objects.Tarjetas;
import com.commercewebapp.objects.Usuario;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MessageObj {
    public boolean enviarCorreo(Usuario usuario, Producto producto, Precios precios, Tarjetas tarjeta ) {
    boolean enviado = false;
            String p_nombre  = usuario.getNombre(),  correoDestinatario  =usuario.getCorreo(),  p_montoTotal = precios.getTotalPagar();
            String de = "pruebapolux@gmail.com"; 
            String clave = "mbbvr9788";
            String para=correoDestinatario;  
            String host = "smtp.gmail.com";

            Properties prop = System.getProperties();

            prop.put("mail.smtp.starttls.enable","true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user",de);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port",587);
            prop.put("mail.smtp.auth","true");

            Session sesion = Session.getDefaultInstance(prop,null);

            MimeMessage message = new MimeMessage(sesion);

        
            try {
                message.setFrom(new InternetAddress(de));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(para));

                message.setSubject("BrocOnline");
                message.setContent("<div style='border: green 10px inset;'><table>"
                        + "<tr><th></td><td><div><h2 style=\"font-family: serif; text-align: center; \">¡"+p_nombre+", su compra se ha realizado exitosamente!</h4></div></td></tr></table>"
                        +"<table><tr><th><h4 style=\"font-family: serif; text-align: center; \">Usted ha adquirido "+precios.getCantidad()+" del producto "+producto.getNombre()+"</h4></tr>"
                        +"<table><tr><th><h4 style=\"font-family: serif; text-align: center; \">Cancelando un total de $ "+precios.getTotalPagar()+"</h4></tr>"
                        +"<table><tr><th><h4 style=\"font-family: serif; text-align: center; \">El pago se realizó con la tarjeta "+tarjeta.getCodigoHidden()+"</h4></tr>"
                        +"<table><tr><th><h4 style=\"font-family: serif; text-align: center; \">¡Gracias por utilizar BrocOnline!</h4></tr>"
                        +"<table><tr><th><h4 style=\"font-family: serif; text-align: center; \">Atentamente, </h4></tr>"
                        +"<table><tr><th><h4 style=\"font-family: serif; text-align: center; \">Fidel Sorto </h4></tr>"
                        +"<table><tr><th><h4 style=\"font-family: serif; text-align: center; \">Gerente de ventas de Grupo Pólux </h4></tr>"
                        , "text/html; charset=utf-8");

                Transport transport = sesion.getTransport("smtp");

                transport.connect(host,de,clave);

                transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));

                transport.close();
                
                
            } catch (MessagingException ex) {
                Logger.getLogger(MessageObj.class.getName()).log(Level.SEVERE, null, ex);
                Logger.getLogger(MessageObj.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
        
            
        
            
            enviado = true;
            
    return enviado;
    }
}
