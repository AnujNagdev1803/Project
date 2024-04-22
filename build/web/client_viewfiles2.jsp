<%@page import="optimizinginformation.encryption"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Optimizing Information</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper1">
<div id="container">
  <h1>Optimizing Information Leakage in Multicloud Storage Services</h1>
  <div id="nav">
   <ul>
      <li><a href="clienthome.jsp"><span>Home</span></a></li>
      <li><a href="client_upload.jsp"><span>Upload Files</span></a></li>
      <li class="active"><a href="client_viewfiles.jsp"><span>Split Files</span></a></li>
      <li><a href="client_modify.jsp"><span>Modify Cloud1 Data</span></a></li>
      <li><a href="client_cloud2modify.jsp"><span>Modify Cloud2 Data</span></a></li>
      <li><a href="client_request.jsp"><span>Request</span></a></li>
      <li><a href="client_download.jsp"><span>Download</span></a></li>      
      <li><a href="index.html"><span>Logout</span></a></li>
    </ul>
  </div>
  <div id="featured">
    <ul>
      <li class="ss1"><a href="">Heading for Project</a></li>
    </ul>
   
       
        <img src="images/22.jpg" align="right" width="280" height="340"/>
 
  </div>
  
  <center>
  <div id="content" >
 
      
      <p><center><font size="5" color="black">Encrypted File Upload to Cloud</font></center></p><br/>
    <style>
        th{
            color: #50aac3;
        }
         tr{
            color: black;
        }
        
        td{
            text-align: center;
        }
    </style>
     
    
    <% 

   String filename = request.getParameter("filename");
   String owner = request.getParameter("owner");
  
String firstdata=request.getParameter("firstdata");
String seconddata = request.getParameter("seconddata");

   
    KeyGenerator keyGen = KeyGenerator.getInstance("AES");
    keyGen.init(128);
    SecretKey secretKey = keyGen.generateKey();
    System.out.println("secret key:" + secretKey);
    
    KeyGenerator keyGen1 = KeyGenerator.getInstance("AES");
    keyGen1.init(128);
    SecretKey secretKey1 = keyGen1.generateKey();
    System.out.println("secret key:" + secretKey1);
    
    //converting secretkey to String
     byte[] be = secretKey.getEncoded();//encoding secretkey
     String skey = Base64.encode(be);
     
     byte[] be1 = secretKey1.getEncoded();//encoding secretkey
     String skey1 = Base64.encode(be1);
     
     System.out.println("converted secretkey to string:" + skey);
     String part1cipher = new encryption().encrypt(firstdata, secretKey);
     String part2cipher = new encryption().encrypt(seconddata, secretKey1);
   
      session.setAttribute("skey",skey);
      session.setAttribute("skey1",skey1);
   
   
     %>
        
         <br> 
   <center>
	
           <form name="f" action="client_viewfiles3.jsp" method="post" >  <center>
<table>
   
     
    
    
        <tr>
            <th><font color="black" size="4">File Name :</th>
            <th><input type="text" name="filename" value="<%=filename%>"  style="height:30px; width:170px" readonly></input>
              </th>
        </tr>

              
              
        <tr>
              <th><font color="black" size="4">Data Owner: </th>
              <th><input type="text" name="owner" value="<%=owner%>"  style="height:30px; width:170px" readonly></input>
              </th>
        </tr>
              
          <tr>
              <th><font color="black" size="4">Part1:</th>
              <th><textarea type="text" name="first" value="<%=part1cipher%>" style="height:30px; width:170px"><%=part1cipher%></textarea>
              </th>
        </tr> 
              
           
              
         <tr>
              <th><font color="black" size="4">Part2:</th>
              <th><textarea type="text" name="second" value="<%=part2cipher%>" style="height:30px; width:170px"><%=part2cipher%></textarea>
              </th>
        </tr>    
    
         
            
              
	</table>
                    </center>
     
           <br> 
              
	  <tr>
              <td>
                    <input type="submit" value="submit"  style="height:30px; width:65px" />
             
              </td>
            </tr>
 
       </form>
  <br> 
         <hr>   
      
      
      
      
      
      
      
   
      
  </div>
  
  
  
  <div class="clear"></div>
</div>
<div id="footer">
  <div id="footerContainer">
   
  </div>
</div>
</body>
</html>
