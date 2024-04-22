<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String cloud = request.getParameter("cloud");
    
    
    try{
       
    if(cloud.equals("cloud1"))
    {
                
    response.sendRedirect("ss1home.jsp?msg=Login_Successfull");
    }
    
    if(cloud.equals("cloud2"))
    {
               
    response.sendRedirect("ss2home.jsp?msg=Login_Successfull");
    }
    
    else 
    {
    response.sendRedirect("ss.jsp?msg1=LoginFail");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in sslogact"+e.getMessage());
    }
%>