/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pk.Models;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author HP
 */
public class sendMail {
    public static void  SendEmail(String email) {



String to = email;
String subject = "New command added";
String msg = "Thank you for choosing our DREAM HOTEL! \n We wish you wonderfol moments  \n See you soon!";
final String from = "dreamhotel80@gmail.com";
final String password = "dreamy123";



Properties props = new Properties();
props.setProperty("mail.transport.protocol", "smtp");
props.setProperty("mail.host", "smtp.gmail.com");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "465");
props.put("mail.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");
Session session;
session = Session.getDefaultInstance(props,
new javax.mail.Authenticator() {
@Override
protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
return new javax.mail.PasswordAuthentication(from, password);
}
});
try {
Transport transport = session.getTransport();
InternetAddress addressFrom = new InternetAddress(from);



MimeMessage message = new MimeMessage(session);
message.setSender(addressFrom);
message.setSubject(subject);
message.setContent(msg, "text/plain");
message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));



transport.connect();
Transport.send(message);
transport.close();
} catch (MessagingException ex) {
JOptionPane.showMessageDialog(null, ex.getMessage());
}
}

}
