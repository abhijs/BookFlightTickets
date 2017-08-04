<%
    String s="insert into users(email,mobileno,password,name) values('"+request.getParameter("t1")+"','"+request.getParameter("t2")+"','"+request.getParameter("t3")+"','"+request.getParameter("t4")+"')";
    String s1="insert into notifications(description,datetime) values('New registeration by user',NOW())";

    if(DB.DBLAYER.executeq(s))
    {
        DB.DBLAYER.executeq(s1);
        response.sendRedirect("index.jsp?y=2");       
    }
    else
        response.sendRedirect("index.jsp?n=2");
%>