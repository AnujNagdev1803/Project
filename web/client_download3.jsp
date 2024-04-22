<%

 String filename = request.getParameter("filename"); 
 String fname = filename.concat(".txt");
 String cloud1content = request.getParameter("cloud1content");
 String cloud2content = request.getParameter("cloud2content");

 String content = cloud1content+" "+cloud2content;
 
 response.setHeader("Content-Disposition", "attachment;filename=\"" + fname + "\"");
 out.write(content); 

%>