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
	String a=request.getParameter("oid");
	String b=request.getParameter("fid");
	System.out.println("oid="+a);
	System.out.println("fid="+b);
	Connection conn=databasecon.getconnection();
	String sql="delete from upload where oid=? && id=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.executeUpdate();
	response.sendRedirect("doef.jsp?success");
}
catch(Exception ec)
{
	ec.printStackTrace();
}
%>
</body>
</html>