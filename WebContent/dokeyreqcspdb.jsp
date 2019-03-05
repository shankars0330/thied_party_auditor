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
	String b=request.getParameter("email");
	String c=request.getParameter("comment");
	System.out.println("name="+a);
	System.out.println("email="+b);
	System.out.println("comment="+c);
	String d="pending";
	Connection conn=databasecon.getconnection();
	String sql="insert into request(name,email,comment,status) values(?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, d);
	ps.executeUpdate();
	response.sendRedirect("dokeyreqtcsp.jsp?success");
}
catch(Exception es)
{
	es.printStackTrace();
}
%>
</body>
</html>