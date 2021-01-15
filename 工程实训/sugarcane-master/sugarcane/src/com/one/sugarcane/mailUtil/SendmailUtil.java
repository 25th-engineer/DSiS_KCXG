package com.one.sugarcane.mailUtil;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class SendmailUtil {


	

/**
* 发送邮件
*
* @param headName
*            邮件头文件名
* @param sendHtml
*            邮件内容
* @param receiveUser
*            收件人地址
*/
public static void doSendHtmlEmail(String email, String title,
String href) {
	
	Properties props = new Properties();
	props.put("mail.transport.protocol", "smtp");
	props.put("mail.smtp.host", "smtp.163.com");
	props.put("mail.smtp.auth", "true");
	Session session = Session.getInstance(props,new Authenticator() {
		public PasswordAuthentication getPasswordAuthentication() { 
			return new PasswordAuthentication("welzx0726@163.com","welzx0726");
			}
	});
	
	Message message = new MimeMessage(session);
	try {
		
		message.setFrom(new InternetAddress("welzx0726@163.com"));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		message.setSubject(title);			
		message.setText(href);
	
		Transport.send(message);
	} catch (AddressException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (MessagingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

