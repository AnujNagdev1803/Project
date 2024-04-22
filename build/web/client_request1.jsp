<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
    <%
    String user = session.getAttribute("email").toString();    
        
    String filename = request.getParameter("filename");
    String owner = request.getParameter("owner"); 
    String email = request.getParameter("email");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    int id = 0;
    
    String part1data = "Pending";
    String part2data = "Pending";
    String part1key = "Pending";
    String part2key = "Pending";
    String part1status = "Pending";
    String part2status = "Pending";
    
    try{
      
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into clientrequest values(?,?,?,?,?,?,?,?,?,?)");

    ps.setInt(1,id);
    ps.setString(2,filename);
    ps.setString(3,owner);
    ps.setString(4,user);
    ps.setString(5,part1data);
    ps.setString(6,part2data);
    ps.setString(7,part1key);
    ps.setString(8,part2key);
    ps.setString(9,part1status);
    ps.setString(10,part2status);
    
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("client_request.jsp?msg=Success");
    }
    else{
    response.sendRedirect("client_request.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>