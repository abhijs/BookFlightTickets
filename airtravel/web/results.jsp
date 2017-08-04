<%@ page language='java' import='java.sql.*' %>

<html>
<body>
    <style>
        .button1{
        display: inline-block;
        border-radius: 4px;
        border: none;
        color: #FFFFFF;
        font-size: 28px;
        width: 150px;
        margin: 5px;
        padding: 10px;
        text-align:center;
        bacground-color: #CCCCCC;
        transition: all 0.8s;
        cursor:pointer;
    }
    
    .button1:hover{background-color:#008CBA;}
    </style>
    <script language='javascript'>
        function alertfun(){
            alert("Please log in to continue !!");
            }
    </script>
<table border=1 align=center width=90% height=100 >
            
            <%
                String tell=new String() ;
                String s2="select * from airlinedetails where home='"+request.getParameter("t1")+"' and destination='"+request.getParameter("t2")+"' and date='"+request.getParameter("t3")+"'";
                //out.print(s2);
                ResultSet rs2=DB.DBLAYER.getResult(s2);
                if(request.getParameter("t1")!=null)
                if(rs2==null || rs2.next()==false)
                  out.print("<script language='javascript'>alert('There are no flights between this route');</script>");
                else
                    {
                    tell="yes";
                %>
                <tr>
                
                <td>Airline Name</td>
                <td>Flight Number</td>
                <td>From</td>
                <td>To</td>
                <td>Departure time</td>
                <td>Arrival Time</td>
                <td>Duration</td>
                <td>Stops</td>
                <td>Date</td>
                <td>Cost</td>              
                <td>Book</td>
                <%
                String s3=DB.DBLAYER.getScalar("select cost from cost where sno="+rs2.getString(10)+" and class='"+request.getParameter("t6")+"'");
                session.setAttribute("passengers",request.getParameter("t5"));
                
                int k=Integer.parseInt(s3);
                String u=request.getParameter("t5");
                int d=Integer.parseInt(u);
                k= k*d;
                String s4=Integer.toString(k);
                
                do{
                    out.print("<tr><td>"+rs2.getString(1)+"</td><td>"+rs2.getString(2)+"</td><td>"+rs2.getString(3)+"</td><td>"+rs2.getString(4)+"</td><td>"+rs2.getString(5)+"</td><td>"+rs2.getString(6)+"</td><td>"+rs2.getString(7)+"</td><td>"+rs2.getString(8)+"</td><td>"+rs2.getString(9)+"</td><td>"+s3+"*"+request.getParameter("t5")+" = "+s4+"</td><td><input type=radio name=r1 value='"+rs2.getString(10)+"' /> </td></tr>");
                   
                }while(rs2.next());
               
                }
                %>
                
                 
         
         <%
            if(request.getParameter("t4")!=null &&!(request.getParameter("t4").equals("")))
            {
                        
         %>
         
        
         <table width=100%><tr><td align=center  ><br><b><font size=5 > Return Flights </font></b></td></tr></table>
         <table border=1 align=center width=90% height=100>
            <%
                String s5="select * from airlinedetails where home='"+request.getParameter("t2")+"' and destination='"+request.getParameter("t1")+"' and date='"+request.getParameter("t4")+"'";
                //out.print(s2);
                ResultSet rs3=DB.DBLAYER.getResult(s5);
                if(request.getParameter("t4")!=null)
                if(rs3==null || rs3.next()==false)
                  out.print("<script language='javascript'>alert('There are no return flights between this route');</script>");
                else
                    {
                %>
                <tr>
                <td>Airline Name</td>
                <td>Flight Number</td>
                <td>From</td>
                <td>To</td>
                <td>Departure time</td>
                <td>Arrival Time</td>
                <td>Duration</td>
                <td>Stops</td>
                <td>Date</td>
                <td>Cost</td>       
                <td>Book</td>
                <%
                String s6=DB.DBLAYER.getScalar("select cost from cost where sno="+rs3.getString(10)+" and class='"+request.getParameter("t6")+"'");
                int k1=Integer.parseInt(s6);
                String u1=request.getParameter("t5");
                int d1=Integer.parseInt(u1);
                k1= k1*d1;
                String s7=Integer.toString(k1);
                do{
                    out.print("<tr><td>"+rs3.getString(1)+"</td><td>"+rs3.getString(2)+"</td><td>"+rs3.getString(3)+"</td><td>"+rs3.getString(4)+"</td><td>"+rs3.getString(5)+"</td><td>"+rs3.getString(6)+"</td><td>"+rs3.getString(7)+"</td><td>"+rs3.getString(8)+"</td><td>"+rs3.getString(9)+"</td><td>"+s6+"*"+request.getParameter("t5")+" = "+s7+"</td><td><input type=radio name=r2 value='"+rs3.getString(10)+"' /></td></tr>");
                }while(rs3.next());
                
                }
           }
                if(request.getParameter("y")!=null)
                     out.print("<script language='javascript'>alert('Success');</script>");
                if(request.getParameter("n")!=null)
                   out.print("<script language='javascript'>alert('Failed to book');</script>");
                
                %>
                
                <%
                if(tell.equals("yes"))
                {
                %>
                
                <table  width=100% >
                    <tr><td  align=center><br>
                            <input type =button name=b1 value="Book" onClick='alertfun()' class=button1 />  
                </td></tr>
                </table>
                <%
                }
                %>
                
            
         </table>
         </body>
         </html>