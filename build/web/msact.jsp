<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    
    try{
       
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from ms where username= '"+name+"' and password='"+password+"'");
    if(rs.next())
    {

   
                   
    response.sendRedirect("mshome.jsp?msg=Login_Successfull");
    }
    else 
    {
    response.sendRedirect("ms.jsp?msg1=LoginFail");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in mslogact"+e.getMessage());
    }
%>