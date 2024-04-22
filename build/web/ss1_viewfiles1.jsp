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
      <li><a href="ss1home.jsp"><span>Home</span></a></li>
      <li class="active"><a href="ss1_viewfiles.jsp"><span>View Files</span></a></li>
      <li><a href="ss1_viewrequests.jsp"><span>View Requests</span></a></li>
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
 
      
      <p><center><font size="5" color="black">View Files </font></center></p><br/>
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
   String filedata = request.getParameter("filedata");
   
 
   
     %>
        
         <br> 
   <center>
	
           <form name="f" action="client_viewfiles2.jsp" method="post" >  <center>
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
              <th><textarea type="text" name="first" value="<%=filedata%>" style="height:30px; width:170px"><%=filedata%></textarea>
              </th>
        </tr> 
              
           
              
           
    
         
            
              
	</table>
                    </center>
     
           <br> 
              
	 
 
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
