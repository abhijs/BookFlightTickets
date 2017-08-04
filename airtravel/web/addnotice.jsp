<%@ include file="aloggedin.jsp" %>

<html>
    <head>        
        <title>Notice Page</title>
        <style>
            h2{text-align:center;}
            textarea{
                display: block;
                margin-left: auto;
                margin-right: auto;
            }
            .button{
                margin: 30px;   
                border: none;
                background-color: #CCCCCC;
                padding: 10px 50px;
                font-size:28px;
                position: fixed;
                left: 42%;
                transition: all 0.8s;
            }
            .button:hover{
                background-color: #008CBA;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <h2>Add a new notice!</h2>
        <div>
            <form name=frm method=post action=pgaddnotice.jsp>
                <textarea rows=10 cols=70 name=tal ></textarea><br>
                    <input type=submit value="Post" class=button  />
            </form>
        </div>
        <%
            if(request.getParameter("y")!=null)
                out.print("<script language='javascript'>alert('Notice added successfully!')</script>");
            if(request.getParameter("n")!=null)
                out.print("<script language='javascript'>alert('Failed, try again later!')</script>");
        %>
    </body>
</html>
