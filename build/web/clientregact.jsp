<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
    <%
    String name = request.getParameter("name");
    String password = request.getParameter("password"); 
    String email = request.getParameter("email");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    
    try{
      
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?)");

    ps.setString(1,name);
    ps.setString(2,password);
    ps.setString(3,email);
    ps.setString(4,dob);
    ps.setString(5,address);
    
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("client.jsp?msg=Registered");
    }
    else{
    response.sendRedirect("clientreg.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>