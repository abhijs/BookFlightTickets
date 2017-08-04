<%@ page language="java" import="java.sql.*" %>

<%
    String check=request.getParameter("t2");
    if(check.contains("=") || check.contains("|") || check.contains("'") || check.contains(" "))
    {
        response.sendRedirect("index.jsp?q=3");
    }
    else{
    String s="select email,name from users where email='"+request.getParameter("t1")+"' and password='"+request.getParameter("t2")+"' and verified=1";  
    
    ResultSet rs=DB.DBLAYER.getResult(s);
    
    if(rs==null || rs.next()==false)
        response.sendRedirect("index.jsp?q=3");
    else
        {
            session.setAttribute("uid" , rs.getString(1));
            session.setAttribute("unm", rs.getString(2));
            response.sendRedirect("userhome.jsp");
        }
    }
%> 