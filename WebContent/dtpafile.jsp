<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
      <li><a href="tpaudit.jsp">Home</a></li>
      <li class="active"><a href="tpavf.jsp">File Details</a></li>
      <li><a href="tpareport.jsp">TPA Report</a></li>
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
    <div class="content three_quarter first"> 
      <!-- ################################################################################################ -->
      <%
      		  String a=request.getParameter("id");
    		  String b=request.getParameter("key");
    		  System.out.println("id%%="+a);
    		  System.out.println("key=="+b);
    		  String c=null,d=null,e=null,f=null,g=null;
      try
      {
      Connection con = databasecon.getconnection();
      PreparedStatement ps=con.prepareStatement("select oid,oname,publickey,secretkey,filename from upload where oid='"+a+"' and publickey='"+b+"'");
      ResultSet rs=ps.executeQuery();      	
      if(rs.next())
      {
     	c=rs.getString("oid");
     	d=rs.getString("oname");
     	e=rs.getString("publickey");
     	f=rs.getString("secretkey");
     	g=rs.getString("filename");
     	System.out.println();	System.out.println();	System.out.println();	System.out.println(); 	System.out.println();
      }

      }
       catch(Exception e1)
      {
      out.println(e1.getMessage());

      }
      %>
      <div id="comments">      
       
        <h2>Upload File To CSP</h2>
        <form action="tpafile1.jsp" method="post">
          <div class="one_third first">
            <label for="name">Owner ID<span>*</span></label>
            <input type="text" name="id" id="name" value="<%=c %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="email">Owner Name<span>*</span></label>
            <input type="text" name="name" id="name" value="<%=d %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Public Key</label>
            <input type="text" name="key1" id="name" value="<%=e %>" size="22">
          </div>
          <div class="one_third first">
            <label for="url">Private Key</label>
            <input type="text" name="key2" id="name" value="<%=f %>" size="22">
          </div>
          <div class="one_third">
            <label for="url">File Name</label>
            <input type="text" name="fname" id="name" value="<%=g %>" size="22">
          </div>
          <div>
          <button style="position: absolute; margin-top: 170px; cursor: pointer;">Decrypt And Download</button>
          </div>
        </form>
        <button style="position: absolute; margin-top: 170px; margin-left:300px; cursor: pointer;"><a href="tpavf.jsp">Back</a></button>
      </div>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    
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