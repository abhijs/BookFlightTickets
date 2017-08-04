<%
DB.DBLAYER.executeq("update users set verified=0 where email ='"+request.getParameter("r")+"'");
response.sendRedirect("handleaccounts.jsp");
%>