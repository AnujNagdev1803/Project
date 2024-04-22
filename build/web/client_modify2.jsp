<%@page import="java.sql.Statement"%>
<%@page import="optimizinginformation.MinHash"%>
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
      <li class="active"><a href="client_modify.jsp"><span>Modify Cloud1 Data</span></a></li>
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
 
      
      <p><center><font size="5" color="black">Calculate Jaccard Similarity </font></center></p><br/>
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
        
 String cloudname =null;
        
   String filename = request.getParameter("filename");
   String owner = request.getParameter("owner");
   String part1data = request.getParameter("firstdata");
  String cloud1data = request.getParameter("cloud1data");
  String cloud2data = request.getParameter("seconddata");
  String fname = request.getParameter("fname");
   double x =0;
   double y =0;
   String a = "site like Wikipedia which will contain information for students as reference for different topics on technology of different branches.";
   String b = "site like Wikipedia which will contain information for students as reference for different topics on technology of different branches.";
   
   MinHash abc = new MinHash();
   
   x =(abc.exactJaccard(cloud1data, part1data)*100);
   
   System.out.println(x);
   
    y =(abc.exactJaccard(cloud2data, part1data)*100);
   
   System.out.println(y);
   
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select cloud from clientupload where filename= '"+filename+"' ");
    
    
   if(x>y) {
    
   cloudname = "cloud1";    
   }
  else if(x<y) {
    
   cloudname = "cloud2";    
   }
  else if(x==y)
          {
              if( rs.next() )
              {
                  cloudname = rs.getString("cloud");
              }
              
          }
   
   
%>
   
   
        
        <center>
	
           <form name="f" action="client_modify3.jsp" method="post" >  <center>
<table>
   
     
     <input type="hidden" name="cloudname" value="<%=cloudname%>" style="height:30px; width:170px">
     <input type="hidden" name="fname" value="<%=fname%>" style="height:30px; width:170px">
           
    
        <tr>
            <th><font color="black" size="4">File Name :</th>
            <th><input type="text" name="filename" value="<%=filename%>"  style="height:30px; width:170px" readonly></input>
              </th>
        </tr>

            <input type="hidden" name="cloud1data" value="<%=cloud1data%>" style="height:30px; width:170px">
         <input type="hidden" name="cloud2data" value="<%=cloud2data%>" style="height:30px; width:170px">   
              
        <tr>
              <th><font color="black" size="4">Data Owner: </th>
              <th><input type="text" name="owner" value="<%=owner%>"  style="height:30px; width:170px" readonly></input>
              </th>
        </tr>
              
          <tr>
              <th><font color="black" size="4">Part1:</th>
              <th><textarea type="text" name="part1data" value="<%=part1data%>" style="height:30px; width:170px"><%=part1data%></textarea>  
              </th>
        </tr> 
              
       
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
              <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
  <br/>
        
        <center>   <table style="width:80%" border="2"></center>
        <p><center><font size="5" color="black">MinHash Similarity </font></center></p><br/>
         
        <tr>
        
        <th>File Name</th>
        <th>Cloud1 MinHash Similarity</th>
        <th>Cloud2 MinHash Similarity</th>
          <th>File Upload To</th>
      
 </tr>

<tr>
                <td><%=filename%></td>
                <td><%=x%></td>
                <td><%=y%></td>
                <td><%=cloudname%></td>
           
         
        </tr>
    </table>


        
        <br><br><br>
         <hr>    
      
           
        
         
         
              
              
	</table>
                    </center>
     
           <br> 
              
	  <tr>
              <td>
                    <input type="submit" value="Upload"  style="height:30px; width:65px" />
             
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
