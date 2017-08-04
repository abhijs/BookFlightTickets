<%
    String check=request.getParameter("t1");
    if(check.contains("=") || check.contains("|") || check.contains("'") || check.contains(" "))
    {
        response.sendRedirect("profile.jsp?q=3");
    }
    else{
    String s="update users set password='"+request.getParameter("t1")+"',name='"+request.getParameter("t2")+"' where email='"+request.getParameter("rn")+"'";
    
    if(DB.DBLAYER.executeq(s))
    {
        response.sendRedirect("profile.jsp?y=2");
    }
    else
    {
        response.sendRedirect("profile.jsp?n=2");
    }
    }
%>