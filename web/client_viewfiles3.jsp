<%@page import="optimizinginformation.Ftpcon"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="optimizinginformation.Dbconnection"%>
<%@ page session="true" %>
<%
    
 String skey = session.getAttribute("skey").toString();
 String skey1 = session.getAttribute("skey1").toString();
    
    
 String filename = request.getParameter("filename");
 String first1 = request.getParameter("filename")+"1";
 String second1 = request.getParameter("filename")+"2";
 String owner = request.getParameter("owner");
 String first = request.getParameter("first");
 String second = request.getParameter("second");

String first11 = first1.concat(".txt");
String second11 = second1.concat(".txt");
 
String server = "cloud1";
String server1 = "cloud2";
 int id = 0;

    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into clientupload values(?,?,?,?,?,?,?)");

    ps.setInt(1,id);
    ps.setString(2,first11);
    ps.setString(3,owner);
    ps.setString(4,first);
    ps.setString(5,"cloud1");
    ps.setString(6,skey);
    ps.setString(7,filename);
    
    PreparedStatement ps1=con.prepareStatement("insert into clientupload values(?,?,?,?,?,?,?)");

    ps1.setInt(1,id);
    ps1.setString(2,second11);
    ps1.setString(3,owner);
    ps1.setString(4,second);
    ps1.setString(5,"cloud2");
    ps1.setString(6,skey1);
    ps1.setString(7,filename);
    ps1.executeUpdate();
    
    int i=ps.executeUpdate();
    if(i>0)
    {
       
        
     File f = new File("C:\\Users\\dell\\Desktop\\upload\\"+first11);
     FileWriter fw = new FileWriter(f);
     fw.write(first);
     fw.close();
     Ftpcon ftpcon = new Ftpcon();
     ftpcon.upload(f, first11,server);
     /*Cloud End*/
     
     File f1 = new File("C:\\Users\\dell\\Desktop\\upload\\"+second11);
     FileWriter fw1= new FileWriter(f1);
     fw1.write(second);
     fw1.close();
     Ftpcon ftpcon1 = new Ftpcon();
     ftpcon.upload(f1, second11,server1);
     /*Cloud End*/
     
        
        
    PreparedStatement ps2=con.prepareStatement("update clientfile set filestatus='Uploaded' where filename = '"+filename+"' ");
    ps2.executeUpdate();
        
    response.sendRedirect("client_viewfiles.jsp?msg=Success");
    }
    else{
    response.sendRedirect("client_viewfiles.jsp?msg1=Failed");    
    }






%>