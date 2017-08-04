

<%

    String s0="insert into airlinedetails(airlinename,flightno,home,destination,dtime,atime,duration,stops,date,sno) values('"+request.getParameter("t1")+"','"+request.getParameter("t2")+"','"+request.getParameter("t3")+"','"+request.getParameter("t4")+"','"+request.getParameter("t5")+"','"+request.getParameter("t6")+"','"+request.getParameter("t7")+"','"+request.getParameter("t8")+"','"+request.getParameter("t9")+"',"+request.getParameter("t10")+")";
    String s1="insert into cost values('"+request.getParameter("t10")+"','Economy','"+request.getParameter("t12")+"')";
    String s2="insert into cost values('"+request.getParameter("t10")+"','Premium-Economy','"+request.getParameter("t13")+"')";
    String s3="insert into cost values('"+request.getParameter("t10")+"','Business','"+request.getParameter("t14")+"')";
   
    if(DB.DBLAYER.executeq(s0))
    {
    if(DB.DBLAYER.executeq(s1))
    {
        if(DB.DBLAYER.executeq(s2))
        {
            if(DB.DBLAYER.executeq(s3))
            {
                response.sendRedirect("addflight.jsp?y=2");
            }
        }
    }
    }
        else
            response.sendRedirect("addflight.jsp?n=2");
%>
