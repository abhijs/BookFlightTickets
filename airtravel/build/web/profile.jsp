<%@ include file='account.jsp' %>  


        <table border=1  width="700">
            <tr>
            <td>Email Address</td>   
            <td>Mobile Number</td>           
            <td>Password</td>
            <td>User Name</td>
            <td>Update Profile</td>
        </tr>
        <%
        ResultSet rs =DB.DBLAYER.getResult("select * from users where email='"+session.getAttribute("uid")+"'");
        while(rs.next())
         {
              out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td> <a href=profile.jsp?u="+rs.getString(1)+" >Update</td></tr>");
              if(request.getParameter("u")!=null && request.getParameter("u").equals(rs.getString(1)))
                  out.print("<form name=frm method=post action ='updateprofile.jsp' ><tr><td><input type=hidden name=rn value='"+rs.getString(1)+ "'/>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><input type=text name=t1 value='"+rs.getString(3)+"' /></td><td><input type=text name =t2 value='"+rs.getString(5)+"' /></td><td><input type=submit value=Save /><br><input type=button value=cancel onclick=window.location='profile.jsp' /></td></tr></form>");
                
        }
        if(request.getParameter("y")!=null)
            out.print("<script language='javascript'>alert('Data Updated');</script>");
        if(request.getParameter("n")!=null)
                     out.print("<script language='javascript'>alert('Failed to update');</script>");
        if(request.getParameter("q")!=null)
                     out.print("<script language='javascript'>alert('Password cannot contain =,|');</script>");
        %>
    
   
        </table>
        
<%@ include file='userfooter.jsp' %>