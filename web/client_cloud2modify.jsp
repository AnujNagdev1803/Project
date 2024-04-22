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
    <%
if(request.getParameter("msg")!=null){%>
    
   <script>alert('File Modified Sucessfully..!')</script>
<%}
if(request.getParameter("msg1")!=null){%>

 <script>alert(' Failed..!')</script>
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
      <li><a href="client_upload.jsp"><span>Upload Files</span></a></li>
      <li><a href="client_viewfiles.jsp"><span>Split Files</span></a></li>
      <li><a href="client_modify.jsp"><span>Modify Cloud1 Data</span></a></li>
      <li class="active"><a href="client_cloud2modify.jsp"><span>Modify Cloud2 Data</span></a></li>
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
 
      
      <p><center><font size="5" color="black">Modify Cloud2 Files </font></center></p><br/>
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
String user = session.getAttribute("email").toString();
try{ 
	
        Connection con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from clientupload where cloud = 'cloud2'  and owner = '"+user+"' ");
        ResultSet rs=pst.executeQuery();
        %>
        
        <center>   <table style="width:80%" border="2"></center>
         
        <tr>
        <th>File Id</th>
        <th>File Name</th>
        <th>Owner</th>
         <th>View</th>
        
     
     
 </tr>

<%
       
	while(rs.next()){
            %><tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString("owner")%></td>
                <td><a href="client_cloud2modify1.jsp?filename=<%=rs.getString(2)%>&owner=<%=rs.getString("owner")%>&cloud2data=<%=rs.getString("filedata").replaceAll("\\+", "%2B")%>&fileid=<%=rs.getInt(1)%>&fname=<%=rs.getString("fname")%>&fkey=<%=rs.getString("fkey").replaceAll("\\+", "%2B")%>"><font color="#0d637d" size="3">View</font></a> </td>
      
         
        </tr>
      <%  }
        
        %> </table>

<% }
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
        
        <br><br><br>
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
