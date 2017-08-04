
<%@ page language="java" import="java.sql.*" %>

<%
    String check=request.getParameter("t2");
    if(check.contains("=") || check.contains("|") || check.contains("'") || check.contains(" "))
    {
        response.sendRedirect("adminlogin.jsp?q=3");
    }
    else{
    String s="select aname,adminid from admins where adminid='"+request.getParameter("t1")+"' and password='"+request.getParameter("t2")+"'";  
    ResultSet rs=DB.DBLAYER.getResult(s);
    
    if(rs==null || rs.next()==false)
        response.sendRedirect("adminlogin.jsp?q=3");
    else
        {
            session.setAttribute("anm" , rs.getString(1));
            session.setAttribute("aid", rs.getString(2));
            response.sendRedirect("addflight.jsp");
        }
    }
%>