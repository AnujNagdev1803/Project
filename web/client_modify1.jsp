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
 
      
      <p><center><font size="5" color="black">Modify Cloud1 Files </font></center></p><br/>
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

    int fileid = Integer.parseInt(request.getParameter("fileid"));
        
        
   String filename = request.getParameter("filename");
   String owner = request.getParameter("owner");
   String cloud1data = request.getParameter("cloud1data");
   String fname = request.getParameter("fname");
   String fkey = request.getParameter("fkey");
   String cloud2data = null;
   String cloud2key = null;
   
   String content = new decryption().decrypt(cloud1data, fkey);
   
    //int l=filedata.length();
  //int len=filedata.length()/2;
//String firstdata=filedata.substring(0,len);
//String seconddata = filedata.substring(len,l);

    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from clientupload where fname= '"+fname+"' and cloud = 'cloud2' ");
    if(rs.next())
    {
    cloud2data = rs.getString("filedata");
    cloud2key = rs.getString("fkey");
    }
   
   String cloud2content = new decryption().decrypt(cloud2data, cloud2key);
   
   
   
     %>
        
         <br> 
   <center>
	
           <form name="f" action="client_modify2.jsp" method="post" >  <center>
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

        <input type="hidden" name="cloud1data" value="<%=content%>" style="height:30px; width:170px">
         <input type="hidden" name="seconddata" value="<%=cloud2content%>" style="height:30px; width:170px">
          <input type="hidden" name="fname" value="<%=fname%>" style="height:30px; width:170px">
                  
              
        <tr>
              <th><font color="black" size="4">Data Owner: </th>
              <th><input type="text" name="owner" value="<%=owner%>"  style="height:30px; width:170px" readonly></input>
              </th>
        </tr>
              
          <tr>
              <th><font color="black" size="4">Part1:</th>
              <th><textarea type="text" name="firstdata" value="<%=content%>" style="height:30px; width:170px"><%=content%></textarea>
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
