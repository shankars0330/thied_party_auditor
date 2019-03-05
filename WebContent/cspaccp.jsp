<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
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
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
System.out.println("name="+name);
System.out.println("email="+email);
try
{
	Connection conn=databasecon.getconnection();
	String sql="update request set status=? where name=? && email=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, "sended");
	ps.setString(2, name);
	ps.setString(3, email);
	ps.executeUpdate();
	response.sendRedirect("cspresp.jsp?success");
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>