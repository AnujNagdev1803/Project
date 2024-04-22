<%@page import="optimizinginformation.encryption"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
<%
   String filename = request.getParameter("filename");
   String owner = request.getParameter("owner");
   String part2data = request.getParameter("part2data");
   String finaldata = null;
   String cloudname = request.getParameter("cloudname");
   String fname = request.getParameter("fname");
   String cloud1data = request.getParameter("cloud1data");
  String cloud2data = request.getParameter("cloud2data");
    if(cloudname.equals("cloud1"))
  {
      
      if (cloud1data.contains(part2data) )
      {
          finaldata = cloud1data;
  }
      else
      {
          finaldata = cloud1data +" "+ part2data;
      }
  }
  if(cloudname.equals("cloud2"))
  {
        if (cloud2data.contains(part2data) )
      {
          finaldata = cloud2data;
  }
      else
      {
          finaldata = cloud2data +" "+ part2data;
      }
  }
   
     KeyGenerator keyGen = KeyGenerator.getInstance("AES");
    keyGen.init(128);
    SecretKey secretKey = keyGen.generateKey();
    System.out.println("secret key:" + secretKey);
   
    //converting secretkey to String
     byte[] be = secretKey.getEncoded();//encoding secretkey
     String skey = Base64.encode(be);
    String part2cipher = new encryption().encrypt(finaldata, secretKey);
     
     
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("update clientupload set filedata = '"+part2cipher+"',fkey = '"+skey+"' where fname = '"+fname+"' and cloud = '"+cloudname+"'  ");

    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("client_cloud2modify.jsp?msg=Success");
    }
    else{
    response.sendRedirect("client_cloud2modify.jsp?msg1=Failed");    
    }
   
   
   
%>