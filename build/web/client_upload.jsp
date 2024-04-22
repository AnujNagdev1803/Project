<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Optimizing Information</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
     <%
if(request.getParameter("msg")!=null){%>
    
   <script>alert('File Uploaded Successfully..!')</script>
<%}
if(request.getParameter("msg1")!=null){%>

 <script>alert('error in file Upload..!')</script>
<%
}
%>    
    
<body>
<div id="wrapper1">
<div id="container">
  <h1>Optimizing Information Leakage in Multicloud Storage Services</h1>
  <div id="nav">
    <ul>
      <li><a href="clienthome.jsp"><span>Home</span></a></li>
      <li class="active"><a href="client_upload.jsp"><span>Upload Files</span></a></li>
      <li><a href="client_viewfiles.jsp"><span>Split Files</span></a></li>
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
 
   <center><p><font size="5" color="black">Upload File </font></p><br/></center>
     
    <form action="Upload"  method="post" enctype="multipart/form-data" >
    <center><table width="371" border="0" >

    <tr><td><font color="black"> File Name :</td>
    <td><input type="text" name="filename" required="" /></td></tr>
    <tr><td><font color="black"> Select File :</td>
    <td><input type="file" name="file" required="" /></td></tr>
    
    <td rowspan="2">
    <td><br><input type="submit" name="submit" value="Upload" /></td>
   
    </td>
    <tr></tr>      
    </table></center>
    </form>    
  </div>
  
  
  
  <div class="clear"></div>
</div>
<div id="footer">
  <div id="footerContainer">
   
  </div>
</div>
</body>
</html>
