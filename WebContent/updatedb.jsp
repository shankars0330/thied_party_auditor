<%@page import="java.sql.ResultSet"%>
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
	String f=(String)session.getAttribute("fid");
	String a=request.getParameter("id");
	String b=request.getParameter("name");
	String c=request.getParameter("email");
	String d=request.getParameter("fname");
	String e=request.getParameter("comment");
	System.out.println("file id=="+f);
	System.out.println("owenr id=="+a);
	System.out.println("owner name=="+b);
	System.out.println("email=="+c);
	System.out.println("fname=="+d);
	System.out.println("content::"+e);
	Connection conn=databasecon.getconnection();
	String sql="update upload set oid=?,oname=?,omail=?,filename=?,file=AES_ENCRYPT(?,'key') where id=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, d);
	ps.setString(5, e);
	ps.setString(6, f);
	ps.executeUpdate();
	response.sendRedirect("doef.jsp?success");
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>