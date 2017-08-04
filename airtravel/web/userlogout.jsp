<%
     session.removeAttribute("uid" );
     session.removeAttribute("unm");
     session.removeAttribute("passengers");
     if(session.getAttribute("uid")==null)
    {
    response.sendRedirect("index.jsp?sess=exp");
    }

%>