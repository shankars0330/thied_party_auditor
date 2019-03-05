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
try
{
	String a=request.getParameter("email");
	String b=request.getParameter("pass");
	System.out.println("email="+a);
	System.out.println("pass="+b);
	Connection conn=databasecon.getconnection();
	String sql="select * from register where email=? && password=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String f=rs.getString("id");
		String d=rs.getString("fname");
		String e=rs.getString("lname");
		String c=rs.getString("email");
		System.out.println("id"+f);
		String g=d+e;
		System.out.println("doname="+g);
		System.out.println("email"+c);
		
		session.setAttribute("id", f);
		session.setAttribute("name", g);
		session.setAttribute("mail", c);		
		response.sendRedirect("downers.jsp?success");
	}
	else
	{
		response.sendRedirect("dolodin.jsp?failure");
	}
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>