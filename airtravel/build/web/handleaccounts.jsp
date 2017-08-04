<%@ include file= "aloggedin.jsp" %>
<%@ page language='java' import='java.sql.*' %>

<html>
    <head>
        <title>Users Accounts</title>
    </head>
    <body>
        <%
        String s="select *from users";
        ResultSet rs=DB.DBLAYER.getResult(s);
        if(rs==null || rs.next()==false)
        {
            out.print("<script language='javascript'>alert('No accounts to show');</script>");
        }
        else{
        %>
        <table border=1 width=70% align=center>
            <tr>
            <td>Email Address</td>
            <td>Mobile Number</td>
            <td>Password</td>
            <td>Verified</td>
            <td>Activate/Deactivate</td>
        </tr>
        <%
            do{
                out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><a href=activate.jsp?r="+rs.getString(1)+">Activate</a><a href=deactivate.jsp?r="+rs.getString(1)+">Deactivate</a></tr>");
                
            }while(rs.next());
            }
        %>
    </body>
</html>
