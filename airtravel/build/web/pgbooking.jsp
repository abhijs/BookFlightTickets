
<%
    
    String d=request.getParameter("hn2");    
    int z=Integer.parseInt(d);
    int k=1;
    while(k!=z)
    {       
    String s="insert into bookings(email,sno,firstname,lastname,gender) values('"+session.getAttribute("uid")+"','"+request.getParameter("hn")+"','"+request.getParameter("t"+k)+"','"+request.getParameter("t"+(k+1))+"','"+request.getParameter("t"+(k+2))+"')";   
    DB.DBLAYER.executeq(s);
    k=k+3;
     if(k>=z)
         break;
    }
   
    if(request.getParameter("hn1").equals("null") || (request.getParameter("hn1")).isEmpty())
        response.sendRedirect("userhome.jsp?y=2");
    else
    {
        String d1=request.getParameter("hn2");       
        int z1=Integer.parseInt(d1);
         int k1=1;
    while(k1!=z1)
    {
        
    String s="insert into bookings(email,sno,firstname,lastname,gender) values('"+session.getAttribute("uid")+"','"+request.getParameter("hn1")+"','"+request.getParameter("t"+k1)+"','"+request.getParameter("t"+(k1+1))+"','"+request.getParameter("t"+(k1+2))+"')";
    
    DB.DBLAYER.executeq(s);
    k1=k1+3;
     if(k1>=z1)
         break;
    }
         response.sendRedirect("userhome.jsp?y=2");
    }
    
  
%>