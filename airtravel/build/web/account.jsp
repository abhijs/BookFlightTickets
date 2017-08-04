
<%@ include file='userheader.jsp' %>
<%@ page language='java' import='java.sql.*' %>

<html>
    <head>        
        <title>My Account</title>
        <style>
           a:link{text-decoration:none;          
           margin:30px;
           
        } 
        </style>
    </head>
    
    <body>
        <table border=1 width=100% height=80%>
            <tr><td>
            <img src="profilepics/<%= session.getAttribute("uid") %>.jpg" width="100" height="100" title="Your Pic"  />
            </td></tr> 
            <tr>
            <td width= 200>
            <a href=profile.jsp>My Profile</a><br><br>
            <a href=trips.jsp>My Trips</a><br><br>
            <a href=suggestion.jsp>Drop a Note</a>
            </td>
        <td  align=center>