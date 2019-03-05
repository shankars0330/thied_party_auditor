<%@page import="java.sql.Blob"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String k1=request.getParameter("id");
String k2=request.getParameter("name");	
String k3=request.getParameter("key1");
String k4=request.getParameter("key2");	
String k5=request.getParameter("fname");

System.out.println("id=="+k1);
System.out.println("name=="+k2);
System.out.println("pk=="+k3);
System.out.println("sk=="+k4);
System.out.println("fname=="+k5);

Blob file1= null;
String data1=null;

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try
{
	con=databasecon.getconnection();
	ps = con.prepareStatement("select filename,AES_DECRYPT(file,'key') from upload where publickey ='"+k3+"' and secretkey='"+k4+"'");
	rs = ps.executeQuery();
	while(rs.next())
	{	
		String name=rs.getString(1);
		session.setAttribute("fname", name);
		file1=rs.getBlob(2);
	}
	session.setAttribute("resumeBlob1",file1);    

}
	catch(Exception e2)
{
out.println("Exception :"+e2);
}
response.sendRedirect("tpafile2.jsp");

%>

</body>
</html>