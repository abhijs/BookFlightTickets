
<html>
    <head>
        <title>User Home</title>
        <style>
            .top{
            height:20px;
            width:100%;
            background-color:yellow;  
            text-decoration:none;
            }
            .header{
                text-decoration:none;
                margin:30px;  
                font-size:20;
                font-weight:bold;
            }
            .abc
            {
                background-color: #B0E0E6;
                padding: 12px 50px;
                
            }
            .button{
                
                padding: 8px 20px;
                text-align: center;
                margin: 15px;
                background-color: #B0E0E6;
                border-radius: 20px;
                cursor: pointer;
            }
            .button:hover{
                background-color:white; 
                }
                
            .footer{position:fixed;
            bottom:0;
            left:45%;
            }
            
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("uid")==null)
            {
                response.sendRedirect("index.jsp?sess=exp");
            }
        %>
        <div class=top align=right>
            <script language=javascript>
            datetoday=new Date();
            timenow=datetoday.getTime();
            datetoday.setTime(timenow);
            thehour = datetoday.getHours();
            if (thehour > 18) display = "Evening";
            else if (thehour >12) display = "Afternoon";
            else display = "Morning";
            var greeting = ("Good " + display + "!");
            document.write(greeting);
            </script>
            <%= session.getAttribute("unm")%> <a href=userlogout.jsp>(Logout)</a>
        </div>
        <br>
        <div>
            <a href=userhome.jsp class=header >Home</a>
            <a href=account.jsp class=header >My Account</a>
            <a href=cancelbooking.jsp class=header>Cancel Booking</a>
            <a href=makepayment.jsp class=header>Make Payment</a>
        </div>
        <br><br>
        
   
