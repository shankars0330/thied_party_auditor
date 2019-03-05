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
try
{
	String a=request.getParameter("name");
	String b=request.getParameter("lname");
	String c=request.getParameter("email");
	String d=request.getParameter("pass");
	System.out.println("fname="+a);
	System.out.println("lname="+b);
	System.out.println("email="+c);
	System.out.println("passs="+d);
	Connection conn=databasecon.getconnection();
	String sql="insert into register1(fname,lname,email,password) values(?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, d);
	ps.executeUpdate();
	response.sendRedirect("tpalogin.jsp?success");
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>