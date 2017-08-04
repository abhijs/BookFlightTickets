
<%@ page language='java' import='java.sql.*' %>
<%@ include file="aloggedin.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table border=1 align=center width=600 height=150>
        <%
            String s="select * from userrequests order by date desc";
            ResultSet rs=DB.DBLAYER.getResult(s);
            if(rs==null || rs.next()==false)
                out.print("<script language='javascript'>alert('No request to show !');</script>");
            else{
        %>
        <tr>
        <td align=center>Email Id</td>
        <td align=center>Request Id</td>
        <td align=center>Message</td>
        <td align=center>Date</td>
        <%
            do{
                out.print("<tr><td align=center>"+rs.getString(1)+"</td><td align=center>"+rs.getString(2)+"</td><td align=center>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</tr>");
            }while(rs.next());
            }
        %>
    </table>
    </body>
</html>
