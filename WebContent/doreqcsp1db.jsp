<%@page import="java.text.DateFormat"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<html>
<head>
<title>dpaas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<%
DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
Date date= new Date();
String strDateNew=(dateFormat.format(date)); //2016/11/16 12:08:43
System.out.println("date=="+strDateNew);
	   
    String aa=(String)session.getAttribute("id");
    String bb=(String)session.getAttribute("name");
    String cc=(String)session.getAttribute("mail");
    System.out.println("id="+aa);
    System.out.println("name="+bb);
    System.out.println("mail="+cc);
     
	String a=(String)session.getAttribute("pk");
	String b=(String)session.getAttribute("sk");
	String c=(String)session.getAttribute("fname");
	System.out.println("pk=="+a);
	System.out.println("sk=="+b);
	System.out.println("fname=="+c);
	
	String A="E:\\jsp\\thied_party_auditor\\WebContent\\files\\"+c;
	System.out.println("file path::"+A);
	FileInputStream fis=null;
	File image=new File(A);
	long l=image.length();
	double i=(double)l;
	double k;
	int j;
	k=i/1000;
	j=(int)k;
	
	System.out.println("file lenth-"+k);
	System.out.println("file lenth-"+j);
	try
	{
		Connection con = databasecon.getconnection();
		PreparedStatement ps=con.prepareStatement("insert into upload(oid,oname,omail,publickey,secretkey,filename,file,date,status,size,sync) values(?,?,?,?,?,?,AES_ENCRYPT(?,'key'),?,?,?,?)");
		ps.setString(1, aa);
		ps.setString(2,bb);
		ps.setString(3,cc);
		ps.setString(4,a);
		ps.setString(5,b);
		ps.setString(6,c);
		fis = new FileInputStream(image);
		ps.setBinaryStream(7, (InputStream)fis, (int)(image.length()));
		ps.setString(8, strDateNew);
		ps.setString(9, "pending");
		ps.setInt(10, j);
		ps.setDouble(11, k);
		ps.executeUpdate();
		System.out.print(fis);
		System.out.print("Successfully uploaded");
		response.sendRedirect("doreqtcsp.jsp?success");
	}

	catch(Exception e1)
	{
		out.println(e1.getMessage());
	}
%>
</body>
</html>
