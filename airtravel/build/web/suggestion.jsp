
<%@ include file='account.jsp' %>  
<h2>Whats up !!!</h2>
<form name=frm method=p0st action=userrequest.jsp> 
<div>
    <textarea rows=10 cols=70 name=tal></textarea>
</div><br><br>
<div><input type=submit value=Send </div>
</form>
<%
if(request.getParameter("y")!=null)
  out.print("<script language='javascript'>alert('Sent successfully,Will reply soon on your email !')</script>");
if(request.getParameter("n")!=null)
  out.print("<script language='javascript'>alert('Failed, try again later!')</script>");
%>
<%@ include file='userfooter.jsp' %>