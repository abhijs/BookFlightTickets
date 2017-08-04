<%
    String s1=DB.DBLAYER.getScalar("select noticeid from notices order by noticeid desc limit 1");
    if(s1==null || s1.equals(""))
        s1="1";
    else
    {
        int k=Integer.parseInt(s1);
        k++;
        s1=Integer.toString(k);
    }
    String s="insert into notices values("+s1+",'"+session.getAttribute("aid")+"','"+request.getParameter("tal")+"')";
    
    if(DB.DBLAYER.executeq(s))
        response.sendRedirect("addnotice.jsp?y=2");
    else
        response.sendRedirect("addnotice.jsp?n=2");
%>