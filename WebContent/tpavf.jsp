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
<style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      * {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
*:before, *:after {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: "Helvetica Neue", "Helvetica", "Roboto", "Arial", sans-serif;
  color: #5e5d52;
}

a {
  color: #337aa8;
}
a:hover, a:focus {
  color: #4b8ab2;
}

.container {
  margin: 5% 3%;
}
@media (min-width: 48em) {
  .container {
    margin: 2%;
  }
}
@media (min-width: 75em) {
  .container {
    margin: 2em auto;
    max-width: 75em;
  }
}

.responsive-table {
  width: 100%;
  margin-bottom: 1.5em;
}
@media (min-width: 48em) {
  .responsive-table {
    font-size: .9em;
  }
}
@media (min-width: 62em) {
  .responsive-table {
    font-size: 1em;
  }
}
.responsive-table thead {
  position: absolute;
  clip: rect(1px 1px 1px 1px);
  /* IE6, IE7 */
  clip: rect(1px, 1px, 1px, 1px);
  padding: 0;
  border: 0;
  height: 1px;
  width: 1px;
  overflow: hidden;
}
@media (min-width: 48em) {
  .responsive-table thead {
    position: relative;
    clip: auto;
    height: auto;
    width: auto;
    overflow: auto;
  }
}
.responsive-table thead th {
  background-color: #1d96b2;
  border: 1px solid #1d96b2;
  font-weight: normal;
  text-align: center;
  color: white;
}
.responsive-table thead th:first-of-type {
  text-align: left;
}
.responsive-table tbody,
.responsive-table tr,
.responsive-table th,
.responsive-table td {
  display: block;
  padding: 0;
  text-align: left;
  white-space: normal;
}
@media (min-width: 48em) {
  .responsive-table tr {
    display: table-row;
  }
}
.responsive-table th,
.responsive-table td {
  padding: .5em;
  vertical-align: middle;
}
@media (min-width: 30em) {
  .responsive-table th,
  .responsive-table td {
    padding: .75em .5em;
  }
}
@media (min-width: 48em) {
  .responsive-table th,
  .responsive-table td {
    display: table-cell;
    padding: .5em;
  }
}
@media (min-width: 62em) {
  .responsive-table th,
  .responsive-table td {
    padding: .75em .5em;
  }
}
@media (min-width: 75em) {
  .responsive-table th,
  .responsive-table td {
    padding: .75em;
  }
}
.responsive-table caption {
  margin-bottom: 1em;
  font-size: 1em;
  font-weight: bold;
  text-align: center;
}
@media (min-width: 48em) {
  .responsive-table caption {
    font-size: 1.5em;
  }
}
.responsive-table tfoot {
  font-size: .8em;
  font-style: italic;
}
@media (min-width: 62em) {
  .responsive-table tfoot {
    font-size: .9em;
  }
}
@media (min-width: 48em) {
  .responsive-table tbody {
    display: table-row-group;
  }
}
.responsive-table tbody tr {
  margin-bottom: 1em;
  border: 2px solid #1d96b2;
}
@media (min-width: 48em) {
  .responsive-table tbody tr {
    display: table-row;
    border-width: 1px;
  }
}
.responsive-table tbody tr:last-of-type {
  margin-bottom: 0;
}
@media (min-width: 48em) {
  .responsive-table tbody tr:nth-of-type(even) {
    background-color: rgba(94, 93, 82, 0.1);
  }
}
.responsive-table tbody th[scope="row"] {
  background-color: #1d96b2;
  color: white;
}
@media (min-width: 48em) {
  .responsive-table tbody th[scope="row"] {
    background-color: transparent;
    color: #5e5d52;
    text-align: left;
  }
}
.responsive-table tbody td {
  text-align: right;
}
@media (min-width: 30em) {
  .responsive-table tbody td {
    border-bottom: 1px solid #1d96b2;
  }
}
@media (min-width: 48em) {
  .responsive-table tbody td {
    text-align: center;
  }
}
.responsive-table tbody td[data-type=currency] {
  text-align: right;
}
.responsive-table tbody td[data-title]:before {
  content: attr(data-title);
  float: left;
  font-size: .8em;
  color: rgba(94, 93, 82, 0.75);
}
@media (min-width: 30em) {
  .responsive-table tbody td[data-title]:before {
    font-size: .9em;
  }
}
@media (min-width: 48em) {
  .responsive-table tbody td[data-title]:before {
    content: none;
  }
}

    </style>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
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
  <div class="container">
  <table class="responsive-table">
    <caption>Data Owners Uploaded Data Files</caption>
    <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Public Key</th>
        <th scope="col">File Name</th>
        <th scope="col">Date</th>
        <th scope="col">Status</th>
        <th scope="col">File</th>
        <th scope="col">File</th>
      </tr>
    </thead>
    <tfoot>
      
    </tfoot>
    <tbody>  
    <%
    String id1=null,id2=null;
    try
    {
    Connection con = databasecon.getconnection();
    PreparedStatement ps=con.prepareStatement("select oid,oname,omail,publickey,filename,date,status from upload where status='pending'");
    ResultSet rs=ps.executeQuery();
    	
    while(rs.next())
     {

     %>
    	<tr>
        <th scope="row"><%=rs.getString(1) %></th>
        <td data-title="Released"><%=rs.getString(2) %></td>
        <td data-title="Studio"><%=rs.getString(3) %></td>
        <td data-title="Worldwide Gross" data-type="currency"><%=rs.getString(4) %></td>
        <td data-title="Domestic Gross" data-type="currency"><%=rs.getString(5) %></td>
        <td data-title="Foreign Gross" data-type="currency"><%=rs.getString(6) %></td>
        <td data-title="Foreign Gross" data-type="currency"><%=rs.getString(7) %></td>
        <td data-title="Foreign Gross" data-type="currency"><a href="accept.jsp?id=<%=rs.getString(1) %>&&key=<%=rs.getString(4) %>" style="text-decoration: underline;">verified</a></td>
        <td data-title="Budget" data-type="currency">
        <a href="tpafile.jsp?id=<%=rs.getString(1) %>&&key=<%=rs.getString(4) %>" style="text-decoration: underline;">Audit</a></td>
      </tr>
    				 <%
    		  
    }

    }
     catch(Exception e1)
    {
    out.println(e1.getMessage());

    }
    %>
   
    </tbody>
  </table>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>