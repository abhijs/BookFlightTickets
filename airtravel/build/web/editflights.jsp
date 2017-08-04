<%
    String s="update airlinedetails set airlinename='"+request.getParameter("t1")+"',flightno='"+request.getParameter("t2")+"',home='"+request.getParameter("t3")+"',destination='"+request.getParameter("t4")+"',dtime='"+request.getParameter("t5")+"',atime='"+request.getParameter("t6")+"',duration='"+request.getParameter("t7")+"',stops='"+request.getParameter("t8")+"',date='"+request.getParameter("t9")+"' where sno="+request.getParameter("rn");
    //out.print(s);
    if(DB.DBLAYER.executeq(s))
    {
        response.sendRedirect("updateflight.jsp?q=5");
    }
    else
    {
        response.sendRedirect("updateflight.jsp?g=5");
    }
%>
