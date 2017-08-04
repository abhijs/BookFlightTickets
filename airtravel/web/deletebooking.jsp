<%
    DB.DBLAYER.executeq("delete from bookings where bookingid="+request.getParameter("c"));
    
    response.sendRedirect("cancelbooking.jsp?y=2");

%>