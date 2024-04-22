<%@page import="optimizinginformation.Mail"%>
<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
    <%
    String filename = request.getParameter("filename");
    String owner = request.getParameter("owner"); 
    String user = request.getParameter("user");
    int id = Integer.parseInt(request.getParameter("id"));
    
    String filedata = null;
    String fkey = null;
    
    Connection con=Dbconnection.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from clientupload where fname= '"+filename+"' and cloud='cloud1' and owner = '"+owner+"' ");
    if(rs.next())
    {
    filedata = rs.getString("filedata");
    fkey = rs.getString("fkey");
        
    }
    
    try{
      
    
    PreparedStatement ps=con.prepareStatement("update clientrequest set part1data = '"+filedata+"',part1key = '"+fkey+"',part1status = 'Response Sent' where id = "+id+" and user = '"+user+"' ");

    
    
    int i=ps.executeUpdate();
    if(i>0)
    {
        
   Mail m = new Mail();
   String msg ="filename :"+filename+"\nCloud1 Secret Key:"+fkey;
   m.secretMail(msg,filename,user);       
        
    response.sendRedirect("ss1_viewrequests.jsp?msg=Success");
    }
    else{
    response.sendRedirect("ss1_viewrequests.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>