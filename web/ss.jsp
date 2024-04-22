<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Optimizing Information</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
  <%
if(request.getParameter("msg")!=null){%>
    
   <script>alert('File Modified Sucessfully..!')</script>
<%}
if(request.getParameter("msg1")!=null){%>

 <script>alert('Login Fail..!')</script>
<%
}
%>    
<body>
<div id="wrapper1">
<div id="container">
  <h1>Optimizing Information Leakage in Multicloud Storage Services</h1>
  <div id="nav">
     <ul>
      <li><a href="index.html"><span>Home</span></a></li>
      <li><a href="client.jsp"><span>Client</span></a></li>
      <li><a href="ms.jsp"><span>Metadata Servers</span></a></li>
      <li class="active"><a href="ss.jsp"><span>Storage Servers</span></a></li>
    </ul>
  </div>
  <div id="featured">
    <ul>
      <li class="ss1"><a href="">Heading for Project</a></li>
    </ul>
    <form id="quote" action="ssact.jsp" method="post">
      <h2>Storage Servers Login</h2>
        <label> Username:</label>
        <input type="text" name="name" />
        <label> Password:</label>
        <input type="password" name="password" />
        
        <label> Cloud:</label>
       
      <select name="cloud" style="width:250px; height: 30px;">
         <option>--Select--</option>
         <option value="cloud1">Storage Server1</option>
    <option value="cloud2">Storage Server2</option>
      </select>  
        
        <br><br><br>
       
      <input class="btn" type="image" src="images/submit_btn.jpg"/><br><br><br>
    </form>
      
  </div>
  <br><br><br><br><br><br><br><br><br><br>
  <div class="clear"></div>
</div>
<div id="footer">
  <div id="footerContainer">
   
  </div>
</div>
</body>
</html>
