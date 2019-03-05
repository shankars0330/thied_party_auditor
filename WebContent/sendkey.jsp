<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%   
	   	String name=request.getParameter("n");
		String email=request.getParameter("em");
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		   System.out.println("mail=="+email);
		   System.out.println("name=="+name);
	  String host="", user="", pass="";
	  int a=(int) (Math.random() * 999999);


host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="chennaisunday2@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="customerservice"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =email; // out going email id

String from ="chennaisunday2@gmail.com"; //Email id of the recipient
//String subject=(String)session.getAttribute("subject");
//String subject ="welcome";

String messageText ="Mr "+name+" this is your key:"+a;
//session.setAttribute("email",email);
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject("Cloud Service Provider");
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());
//out.println("message successfully sended"); // assume it was sent
response.sendRedirect("cspaccp.jsp?success");
}
catch (Exception err) {

out.println("message not successfully sended"); // assume it?s a fail
}
transport.close();

%>


</body>
</html>