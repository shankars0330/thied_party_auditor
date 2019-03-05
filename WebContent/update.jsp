<%@page import="java.sql.Blob"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String aa=(String)session.getAttribute("id");
    String bb=(String)session.getAttribute("name");
    String cc=(String)session.getAttribute("mail");
    System.out.println("id="+aa);
    System.out.println("name="+bb);
    System.out.println("mail="+cc);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Template Name: Wetwest
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Wetwest</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="">An Efficient Public Auditing Protocol with Novel Dynamic Structure for Cloud Data</a></h1>
    </div>
    
    <!-- ################################################################################################ -->
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
      <ul class="clear">
      <li><a href="downers.jsp">Home</a></li>
      <li><a href="doreqtcsp.jsp">Upload File</a></li>
      <li><a href="dovf.jsp">View File</a></li>
      <li class="active"><a href="doef.jsp">Edit File</a></li>
      <li><a href="index.html">Logout</a></li>
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
   
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <div id="comments">
        
        <h2>Write A Comment</h2>
        <%
        	String a=request.getParameter("oid");
        	String b=request.getParameter("fid");
    		session.setAttribute("fid", b);
        	String c=null,d=null,e=null,s=null;
        	System.out.println("oid=="+a);
        	System.out.println("fileid=="+b);
        	Connection conn=databasecon.getconnection();
        	String sql="select oname,omail,filename,AES_DECRYPT(file,'key') from upload where oid='"+a+"' && id='"+b+"'";
        	PreparedStatement ps=conn.prepareStatement(sql);
        	ResultSet rs=ps.executeQuery();
        	while(rs.next())
        	{
        		c=rs.getString(1);
        		d=rs.getString(2);
        		e=rs.getString(3);
        		Blob f=rs.getBlob(4);
        		byte[] bdata = f.getBytes(1, (int) f.length());
            	s = new String(bdata);
        	}
        	
        %>
        
        <form action="updatedb.jsp" method="post">
        <div class="one_third first">
            <label for="name">ID <span>*</span></label>
            <input type="text" name="id" id="name" value="<%=a %>" size="22" required>
          </div>
          <div class="one_third first">
            <label for="name">Name <span>*</span></label>
            <input type="text" name="name" id="name" value="<%=c %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="email">Mail <span>*</span></label>
            <input type="email" name="email" id="email" value="<%=d %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">File Name</label>
            <input type="text" name="fname" id="name" value="<%=e %>" size="22">
          </div>
          <div class="block clear">
            <label for="comment">File</label>
            <textarea name="comment" id="comment" cols="25" rows="10"><%=s %></textarea>
          </div>
          <div>
            <input type="submit" name="submit" value="Submit">
            &nbsp;
            <input type="reset" name="reset" value="Reset">
          </div>
          
        </form>
      </div>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>