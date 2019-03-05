<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="databaseconnection.graph"%>
<%@page import="java.util.List"%>
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
      <li><a href="admin.jsp">Home</a></li>
      <li><a href="register1.jsp">Data Owners</a></li>
      <li><a href="register2.jsp">TPA</a></li>
      <li class="active"><a href="chart.jsp">Chart</a></li>
      <li><a href="index.html">Logout</a></li>
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>
<div class="wrapper bgded overlay" style="background-image:url('images/demo/backgrounds/wallpaper.jpg');">
  <article class="hoc container clear center"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle" style="margin-bottom:30px;">
      <div>
			<form action="#">
<table class="tab">   
<tr><td><label style="color: blue;">Select Type:</label></td><td><select name="type" style="color: blue;">
<option value="column">Column Chart</option>
<option value="bar">Bar Chart</option>
<option value="area">Area Chart</option>
<option value="spline">Spline Chart</option>
<option value="line">line Chart</option></select></td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<td><input type="submit" value="submit" style="color: blue;" /></td></tr>
<%
List<graph> list=new ArrayList<graph>();
int count;
double count1;
String s1="";
String s2="";
try
{
	Connection conn=databasecon.getconnection();
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("SELECT id,size,sync FROM upload ");
		while(rs.next())
				{
	    //System.out.println( output.getCommandResult() );
	    //Iterable<DBObject> list1= output.results();
	   
	    	int date =rs.getInt("id");
	    	System.out.println("$$$$$$$date"+date);
	        count = rs.getInt("size");
	        System.out.println("$$$$$$$count"+count);
	        count1 = rs.getDouble("sync");
	        System.out.println("$$$$$$$count1"+count1);
	        graph gp=new graph();
	        gp.setFile(date);	       
	        gp.setenc(count);
	        gp.setdec(count1);
	        list.add(gp);
				}
	    for(Integer i =0;i<list.size(); i++)
	    {
	    	graph a = list.get(i);
	    	s1=s1+"{label: \""+a.getFile()+"\",y:"+a.getenc()+"},";
	    	s2=s2+"{label: \""+a.getFile()+"\",y:"+a.getdec()+"},";
	    } 	    
				

}
catch(Exception e)
{
	e.printStackTrace();
}
%>    
    </table></form>
     <%
   String type = request.getParameter("type");
   %>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">

window.onload = function () 
{
	var chart = new CanvasJS.Chart("chartContainer", {
	theme: "theme2",//theme1
	title:{text: "DATA OWNERS COMPUTATIONAL COST" },
	animationEnabled: false,   // change to true
	data: [              
	{
	// Change type to "bar", "area", "spline", "pie",etc.
	type: "<%=type%>",
	dataPoints: [
	            <%=s1%>
	]
	},
	{
		// Change type to "bar", "area", "spline", "pie",etc.
		type: "<%=type%>",
		dataPoints: [
		            <%=s2%>
		]
		}
	]
	});
	chart.render();
}
</script>  
<div id="chartContainer" style="height: 500px; width: 700px; margin-left: -100px; position: related;"></div>  
               
		</div>
    </div>
    <!-- ################################################################################################ -->
  </article>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <h6 class="heading"></h6>
      <p></p>
    </div>
    
    <!-- ################################################################################################ -->
  </section>
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>