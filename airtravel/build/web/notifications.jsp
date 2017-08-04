<%@ include file= "aloggedin.jsp" %>
<%@ page language='java' import='java.sql.*' %>

<table width="800" border="1" align=center height=20>
<%
    String l="select * from notifications  order by datetime desc" ;
    ResultSet r=DB.DBLAYER.getResult(l);
    if(r==null || r.next()==false)
        out.print("<script language='javascript'>alert('No new Notification');</script>");
    else
    {
  %>
    <tr><td><b>Notification Text</b></td>
    <td colspan=2><b>Date time of notification</b></td>
    <td><b>Delete</b></td></tr>
    <%
    do
    {
        if(r.getString("readby").equals("0"))
            out.print("<tr><td><font color=red><b>"+r.getString(2)+"</b></font></td><td colspan=2><b>"+r.getString(4)+"</b></td><td><a href=deletenotification.jsp?e="+r.getString(1)+"><img src='close.ico' height=20 width=20/></a></td></tr>");
        else
            out.print("<tr><td >"+r.getString(2)+"</td><td colspan=2>"+r.getString(4)+"</td><td><a href=deletenotification.jsp?e="+r.getString(1)+"><img src=Close.ico height=50 width=50/></a></tr>");
    
    }while(r.next());
       String sn="update notifications set readby=1 ";
       DB.DBLAYER.executeq(sn);
       }
%>

</table>
