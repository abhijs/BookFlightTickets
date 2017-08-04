<%
    String s1=DB.DBLAYER.getScalar("select requestid from userrequests order by requestid desc limit 1");
    String s2="insert into notifications(description,datetime) values('New suggestion by "+session.getAttribute("uid") +"' ,NOW())";
    if(s1==null||s1.equals(""))
    {
        s1="1";
    }
    else
    {
        int k =Integer.parseInt(s1);
        k++;
        s1=Integer.toString(k);
    } 
    String s="insert into userrequests values('"+session.getAttribute("uid")+"','"+s1+"','"+request.getParameter("tal")+"', NOW())";
    
    if(DB.DBLAYER.executeq(s))
    {
        DB.DBLAYER.executeq(s2);
        response.sendRedirect("suggestion.jsp?y=2");
    }
    else
        response.sendRedirect("suggestion.jsp?n=2"); 
%>