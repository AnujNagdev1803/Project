<%@page import="optimizinginformation.decryption"%>
<%@page import="java.sql.Statement"%>
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
      <li><a href="client_viewfiles.jsp"><span>Split Files</span></a></li>
      <li><a href="client_modify.jsp"><span>Modify Cloud1 Data</span></a></li>
      <li><a href="client_cloud2modify.jsp"><span>Modify Cloud2 Data</span></a></li>
      <li><a href="client_request.jsp"><span>Request</span></a></li>
      <li class="active"><a href="client_download.jsp"><span>Download</span></a></li>      
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
 
      
      <p><center><font size="5" color="black">Verify Secret Key </font></center></p><br/>
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

    int fileid = Integer.parseInt(request.getParameter("id"));
        
        
   String filename = request.getParameter("filename");
   String owner = request.getParameter("owner");
   
  
   
   
     %>
        
         <br> 
   <center>
	
           <form name="f" action="client_download2.jsp" method="post" >  <center>
<table>
   
     
    
       <tr>
            <th><font color="black" size="4">File Id :</th>
            <th><input type="text" name="fileid" value="<%=fileid%>"  style="height:30px; width:170px" readonly></input>
              </th>
        </tr>
    
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
              <th><font color="black" size="4">Cloud1 Key: </th>
              <th><input type="text" name="cloud1key" placeholder="Cloud1 Key"  style="height:30px; width:170px" ></input>
              </th>
        </tr>
              
         
     <tr>
              <th><font color="black" size="4">Cloud2 Key: </th>
              <th><input type="text" name="cloud2key" placeholder="Cloud2 Key"  style="height:30px; width:170px" ></input>
              </th>
        </tr>
         
            
              
	</table>
                    </center>
     
           <br> 
              
	  <tr>
              <td>
                    <input type="submit" value="Verify"  style="height:30px; width:65px" />
             
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
