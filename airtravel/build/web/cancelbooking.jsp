<%@ include file="userheader.jsp" %>

<%@ page language='java' import='java.sql.*' %>
<html>
    <head>
        <title>Bookings Page</title>
    </head>
    <Script language='javascript'>
        function cancelfun()
        {
            i=confirm("Do you want to cancel your booking ?");
            if(i==true)
                return true;
            if(i==false)
                return false; 
            
        }
        
    </SCRIPT>
    <body>
        <table border=1 width=90% >
            <%
            String s="select distinct(sno) from bookings where email='"+session.getAttribute("uid")+"'";
            ResultSet rs1=DB.DBLAYER.getResult(s);
            if(rs1==null || rs1.next()==false)
                  out.print("<script language='javascript'>alert('There are no Bookings');</script>");
                else
                    {
            %>
            <tr>
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
            do{
                String s1="select * from airlinedetails where sno='"+rs1.getString(1)+"' and date>=CURDATE()";   
                ResultSet rs=DB.DBLAYER.getResult(s1);
               while(rs.next()){                 
                        out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td><a href=deletebooking.jsp?c='"+rs.getString(1)+"'  onClick='return cancelfun()' >Cancel</a> </td></tr>");
                 
                    }
              }while(rs1.next());
                    }
            if(request.getParameter("y")!=null)
                out.print("<script language='javascript'>alert('Success');</script>");
            %>
        </table>
    </body>
</html>
