
<html>
    <head>
        <title>Booking Page</title>
    </head>
    <% 
    Integer p = Integer.parseInt((String)session.getAttribute("passengers")); %>
    <body>
        <table border=1 align=center width=60% height=40%>
           <form name=frm method=post action = pgbooking.jsp >
            <%
            int k=1;
            int d=0;
            String z=request.getParameter("r1");              
            String z1=request.getParameter("r2");
            while(p>0)
            {       
            %>
          
            <tr><td colspan=2> Passenger <%= k++ %> : </td></tr>
            <tr><td  align=center><input type=text name="t<%= ++d%>" placeholder="First Name " /></td>
            <td align=center><input type=text name="t<%= ++d%>" placeholder="Last Name" /></td></tr>
            <tr><td ><input type=radio name="t<%= ++d %>" value="male" <%= (request.getParameter("td")==null || request.getParameter("d").equals("male")?"checked":"") %> />Male</td>
            <td><input type=radio name="t<%= d%>" value="female" <%= (request.getParameter("td")!=null && request.getParameter("d").equals("female")?"checked":"") %> />Female</td></tr>
                        
            <% 
                --p;               
                
            }
            %>
             <input type=hidden name=hn value='<%= z  %>' /> 
             <input type=hidden name=hn1 value='<%= z1  %>' />
             <input type=hidden name=hn2 value='<%= d  %>' /> 
            <tr><td colspan=2 align=center><input type=submit value=Confirm /> </td></tr>
            </form>
        </table>
    </body>
</html>
