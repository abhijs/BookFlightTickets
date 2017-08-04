<%
DB.DBLAYER.executeq("update users set verified=1 where email ='"+request.getParameter("r")+"'");
response.sendRedirect("handleaccounts.jsp");
%>