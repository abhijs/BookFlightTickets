<%@ page language="java" import = "java.sql.* "  %>
<html>
    <head>        
        <title>Admin Login</title>
        <style>
            h2{               
                margin: 20px;
                position: relative;
                left: 43%;
            }
            input[type=email] , input[type=password]{
                margin:7px;
                width: 200px;
                height: 20px;
                position: relative;
                left: 40%;
            }
            .button{
                border: none;
                padding: 10px 30px ; 
                position: relative;
                left: 45%;
            }
            .button:hover{
                background-color: yellow;
            }
            .forgotlink{
                position: relative;
                left: 44%;
            }
        </style>
    </head>
    <body>
        <form name= frm method=post action="achecklogin.jsp">
        <h2>Hello Sir!</h2>
        <div>
        <input type=email name=t1 placeholder="Email address" /><br>
        <input type=password name=t2 placeholder="Password" /><br><br>          
        <input type=submit name=b1 value=Login class=button /><br><br>  
    </div>
    <table align=center >
     <% 
          if(request.getParameter("q")!=null)
             out.print("<tr> <td colspan=2 align=center ><font color=red>Invalid Email id or Password</font></td></tr>");
     %>
 </table>       
    <div class=forgotlink>
        <a href="adminlogin.jsp">Forgot Password ? </a> 
       </div>
       </form>
    </body>
</html>
