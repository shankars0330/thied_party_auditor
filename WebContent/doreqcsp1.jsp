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
      <li class="active"><a href="doreqtcsp.jsp">Request To CSP</a></li>
      <li><a href="dofuplo.jsp">Upload File</a></li>
      <li><a href="doreqttpa.jsp">Request To TPA</a></li>
      <li><a href="doresttpa.jsp">TPA Report</a></li>
      <li><a href="doview.jsp">View Table Data</a></li>
      <li><a href="#">Logout</a></li>
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%
	String a=request.getParameter("pk");
	String b=request.getParameter("sk");
	String c=request.getParameter("fname");
	System.out.println("pk="+a);
	System.out.println("sk="+b);
	System.out.println("name="+c);
	session.setAttribute("pk", a);
	session.setAttribute("sk", b);
	session.setAttribute("fname", c);
%>
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter first"> 
      <!-- ################################################################################################ -->
      
      <div id="comments">      
       
        <h2>Upload File To CSP</h2>
        <form action="doreqcsp1db.jsp" method="post" enctype="multipart/form-data">
          <div class="one_third first">
            <label for="name">Public Key<span>*</span></label>
            <input type="text" name="pk" id="name" value="<%=a %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="email">Secrete Key<span>*</span></label>
            <input type="password" name="sk" id="name" value="<%=b %>" size="22" required>
          </div>
          <div class="one_third first">
            <label for="url">File Name</label>
            <input type="text" name="text" id="name" value="<%=c %>" size="22">
          </div>
          <div class="one_third ">
            <label for="url">File</label>
            <input type="file" name="text" id="name" value="" size="22">
          </div>
          <div class="one_third first">
            <input type="submit" name="submit" value="Submit"> 
          </div>
          <div class="one_third ">            
            <input type="reset" name="reset" value="Reset">
          </div>
        </form>
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
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>