
package com.commercewebapp.messages;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MessageObj {
    public boolean enviarCorreo(String mensaje, String asunto) throws AddressException, MessagingException{
    boolean enviado = false;
        
            String de = "pruebapolux@gmail.com"; 
            String clave = "mbbvr9788";
            String para="jaky47@gmail.com";  
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

            message.setFrom(new InternetAddress(de));
            
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(para));

            message.setSubject(asunto);
            message.setText(mensaje);

            Transport transport = sesion.getTransport("smtp");

            transport.connect(host,de,clave);

            transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));

            transport.close();

            enviado = true;

        

    return enviado;
    }
}
