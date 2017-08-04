<%
    session.removeAttribute("anm");
    session.removeAttribute("aid");
    if(session.getAttribute("aid")==null)
    {
    response.sendRedirect("index.jsp?sess=exp");
    }
%>