<%
String s="delete from airlinedetails where sno="+request.getParameter("r") ;
DB.DBLAYER.executeq(s);
response.sendRedirect("updateflight.jsp");
%>