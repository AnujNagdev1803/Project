<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    
    try{
       
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user where email= '"+name+"' and password='"+password+"'");
    if(rs.next())
    {

    String user = rs.getString("name");
    session.setAttribute("user",user);
    String email = rs.getString("email");
    session.setAttribute("email",email);
                   
    response.sendRedirect("clienthome.jsp?msg=Login_Successfull");
    }
    else 
    {
    response.sendRedirect("client.jsp?msg1=LoginFail");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in clientlogact"+e.getMessage());
    }
%>