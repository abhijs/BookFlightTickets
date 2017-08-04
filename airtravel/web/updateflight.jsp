<%@ page language="java" import="java.sql.* " %>
<%@ include file="aloggedin.jsp" %>
<html>
    <head>
        <title>Flight Info</title>
    </head>
    <body>
        <script language="javascript">
    function falert()
        {
        i=confirm("Sure to make changes ?");
        if(i==true)
            return true;
        if(i==false)
            return false;
            
        }
    </script>
        <%
            ResultSet rs=DB.DBLAYER.getResult("select * from airlinedetails");
            if(rs==null || rs.next()==false)
            {               
                out.print("<script language='javascript'>alert('No Flight information present');</script>");
                
            }
            else{
         %>
         <table border=1 width=100%>
             <tr>
                 <td>Serial no</td>
                 <td>Airline Name</td>
                 <td>Flight Number</td>
                 <td>From</td>
                 <td>To</td>
                 <td>Departure Time</td>
                 <td>Arrival Time</td>
                 <td>Duration</td>
                 <td>Number of Stops</td>
                 <td>Date</td>
                 <td>Options</td>
             </tr>            
                 <%
                 
                   do
                   {
                       
                   out.print("<tr><td>"+rs.getString(10)+"</td><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td><a href=delete.jsp?r="+rs.getString(10)+" onclick='return falert()'><img src=Close.ico title=delete width=50/></a> <a href=updateflight.jsp?r="+rs.getString(10)+ " > <img src=edit.jpg width=50 title=edit /></a></td></tr>");
                   if(request.getParameter("r")!=null && request.getParameter("r").equals(rs.getString(10)))
                       out.print("<form name=frm method=post action=editflights.jsp><tr><td><input type=hidden name=rn value='"+rs.getString(10)+ "'/>"+rs.getString(10)+" </td><td><input type=text name=t1 value='"+rs.getString(1)+"' /></td><td><input type=text name=t2 value='"+rs.getString(2)+"' /></td><td><input type=text name=t3 value='"+rs.getString(3)+"' /></td><td><input type=text name=t4 value='"+rs.getString(4)+"' /></td><td><input type=text name=t5 value='"+rs.getString(5)+"' /></td><td><input type=text name=t6 value='"+rs.getString(6)+"' /></td><td><input type=text name=t7 value='"+rs.getString(7)+"' /></td><td><input type=text name=t8 value='"+rs.getString(8)+"' /></td><td><input type=text name=t9 value='"+rs.getString(9)+"' /></td><td><input type=submit name =b1 value= save /><br><input type=button value=cancel onclick=window.location='updateflight.jsp' /></td></tr></form>");
                   
                   }while(rs.next());
                 if(request.getParameter("q")!=null)
                     out.print("<script language='javascript'>alert('Data Updated');</script>");
                 if(request.getParameter("g")!=null)
                     out.print("<script language='javascript'>alert('Failed to update');</script>");
                 %>
             
         </table>
         <%
            }               
        %>
    </body>
</html>
