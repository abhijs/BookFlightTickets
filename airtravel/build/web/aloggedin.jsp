
<html>
    <head>
        <title>Home</title>
        <style>
            a:link{
                    display:inline-block;                    
                    padding: 14px 16px;
                    text-decoration: none;
                    margin:10px 10px 60px 30px; 
                    color:black;
                    background-color: yellow;
                }
            a:hover{
                background-color: #CCCCCC;
                text-decoration: none;
            }
            top{
            background-color: yellow;
            width:100%;
            position:fixed;
            left:40%;
            
            }
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("aid")==null)
            {
                response.sendRedirect("index.jsp?sess=exp");
            }
        %>
        <table width="100%" >
        <tr><td colspan="3" align="right">
                
                <SCRIPT LANGUAGE="JavaScript">
                    datetoday = new Date();
                    timenow=datetoday.getTime();
                    datetoday.setTime(timenow);
                    thehour = datetoday.getHours();
                    if (thehour > 18) display = "Evening";
                    else if (thehour >12) display = "Afternoon";
                    else display = "Morning";
                    var greeting = ("Good " + display + "!");
                    document.write(greeting);
                </script>

                
                &nbsp;<%= session.getAttribute("anm")%> &nbsp;&nbsp;<a href="alogout.jsp">(Logout)</a>
        </td></tr>
            </table>      
            <% 
                String r1="select count(*) from notifications where readby=0";
                String k1= DB.DBLAYER.getScalar(r1);
                if(k1==null)
                   k1="0";
            %>
        <div >
            <a href="notifications.jsp">Notifications </a><font color='red' size=6 >( <%=k1 %> )</font>
            <a href="addflight.jsp">Add Flight </a>
            <a href="updateflight.jsp">Update Flight </a>           
            <a href="addnotice.jsp">Add Notice</a>
            <a href="clientrequest.jsp">Client's Request </a>
            <a href="handleaccounts.jsp">Client's Account </a>
            
        </div>
    </body>
</html>
