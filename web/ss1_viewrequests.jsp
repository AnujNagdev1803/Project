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
    
   <script>alert('Response Sent to Client Mail..!')</script>
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
      <li><a href="ss1home.jsp"><span>Home</span></a></li>
      <li><a href="ss1_viewfiles.jsp"><span>View Files</span></a></li>
      <li class="active"><a href="ss1_viewrequests.jsp"><span>View Requests</span></a></li>
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
 
      
      <p><center><font size="5" color="black">View Client Requests </font></center></p><br/>
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

try{ 
	
        Connection con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from clientrequest where part1status = 'Pending'");
        ResultSet rs=pst.executeQuery();
        %>
        
        <center>   <table style="width:80%" border="2"></center>
         
        <tr>
        
        <th>File Name</th>
        <th>Owner</th>
        <th>User</th>
        <th>Status</th>
        <th>Response</th>
        
     
     
 </tr>

<%
       
	while(rs.next()){
            %><tr>
                <td><%=rs.getString("filename")%></td>
                <td><%=rs.getString("owner")%></td>
                <td><%=rs.getString("user")%></td>
                <td><%=rs.getString("part1status")%></td>
                <td><a href="ss1_viewrequests1.jsp?filename=<%=rs.getString("filename")%>&owner=<%=rs.getString("owner")%>&user=<%=rs.getString("user")%>&id=<%=rs.getInt(1)%>"><font color="#0d637d" size="3">Response</font></a> </td>
      
         
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
