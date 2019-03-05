<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.zip.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@page import="java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.* " errorPage="Error.jsp" %>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="java.sql.*"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%!
            private static String algorithm = "DESede";
            private static Key key = null;
            private static Cipher cipher = null;
            private static byte[] encrypt(String input)throws Exception {
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] inputBytes = input.getBytes();
            return cipher.doFinal(inputBytes);
        }
%>
<%!
            private static String decrypt(byte[] encryptionBytes)throws Exception {
            cipher.init(Cipher.DECRYPT_MODE, key);
            byte[] recoveredBytes =  cipher.doFinal(encryptionBytes);
            String recovered =  new String(recoveredBytes);
            return recovered;
          }
          %>
<%
DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
Date date= new Date();
String strDateNew=(dateFormat.format(date)); //2016/11/16 12:08:43
System.out.println("date=="+strDateNew);


String saveFile="";
//String contentType1=request.getAttribute("file");
String contentType = request.getContentType();




if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}


int ch;
    StringBuffer strContent = new StringBuffer("");
    FileInputStream fin = null;
	
	
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();


fin = new FileInputStream(ff);
      while ((ch = fin.read()) != -1)
        strContent.append((char) ch);
      fin.close();
	  String ss=(strContent.toString());

StringBuffer buffer=new StringBuffer();
 key = KeyGenerator.getInstance(algorithm).generateKey();
            cipher = Cipher.getInstance(algorithm);
            String input = ss;
           // System.out.println("Entered: " + input);
            byte[] encryptionBytes = encrypt(input);
            String passw=new String(encryptionBytes);
            System.out.print(passw);
String cyrpt=(decrypt(passw.getBytes()));
//out.print(aa);

%>

<%
    
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
    
FileInputStream fis;
PreparedStatement ps = null;
try{

Connection con = databasecon.getconnection();
ps = con.prepareStatement("insert into upload(oid,oname,omail,publickey,secretkey,filename,file,date,status) values(?,?,?,?,?,?,AES_ENCRYPT(?,'key'),?,?)");
			  	ps.setString(1,aa);
				ps.setString(2,bb);
                ps.setString(3,cc);				
				ps.setString(4,a);
				ps.setString(5,b); 
				ps.setString(6,c);
				ps.setString(7,cyrpt);
				ps.setString(8,strDateNew);
				ps.setString(9,"pending");
				ps.executeUpdate();	
				
		} 
		
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
//out.print(ss);
	}
	
	/* response.sendRedirect("encrypt.jsp");		 */	
	response.sendRedirect("doreqtcsp.jsp?success");		
	
						
%>
