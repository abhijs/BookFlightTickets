
<%@ include file='userheader.jsp' %>
<%@ page language='java' import='java.sql.*' %>
<script language='javascript'>
    function checkfun()
    {
        var selectBox=document.getElementById("selectBox");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
        var selectBox1=document.getElementById("selectBox1");
        var selectedValue1 = selectBox1.options[selectBox1.selectedIndex].value;
        if(selectedValue == selectedValue1)
            {
            alert("Departure and destination city cannot be same");
            return false;
        }
        else
            return true;
    }
    function changeColor()
    {
        document.getElementById("return").style.color = "#CCCCCC";       
    }
    function changeColor1(){
        document.getElementById("return").style.color = "#008CBA";
    }
</script>
<style>
    #selectBox, #selectBox1{width:150px;}
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
    
    .button1:focus{background-color:#008CBA;}
     label{
            margin:55px;
            color:#008CBA;
            }
            #submit{position:fixed;
               bottom:0%;
                left:49%;
            }
  

</style>
        <div class=abc>   
        <form name=frm method=post action=userhome.jsp onsubmit="return checkfun()">
            <font size=6 > <b> Take a trip now !!</b> </font>
        <input type=button name=b1 value="one way" class=button1   onClick='changeColor()'/>
      <!--  <a href=userhome.jsp class=button1 onClick='changeColor()' >One Way</a>-->
        <input type=button name=b2 value="round trip" class=button1 autofocus onClick='changeColor1()'/>
        <br><br>
        <label>From</label>
        <label>To</label>
        <label>Depart</label>
        <label id='return'>Return</label>
        <label>Passengers</label>
        <label>Class</label><br>
            
         <select name=t1 id="selectBox" onChange='checkfun()'>
             <%
               
            String s="select city from cities"; 
            ResultSet rs=DB.DBLAYER.getResult(s);
            if(rs.next()==true)
              {                     
                 do
                  {
                       out.print("<option width=100 value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                  }while(rs.next());
                                    
              }
             %>
         </select>
         <select name=t2 id="selectBox1" onChange='checkfun()'>
              <%               
            String s1="select city from cities order by city"; 
            ResultSet rs1=DB.DBLAYER.getResult(s1);
            if(rs1.next()==true)
              {                     
                 do
                  {
                       out.print("<option value='"+rs1.getString(1)+"'>"+rs1.getString(1)+"</option>");
                  }while(rs1.next());
                                    
              }
             %>
         </select>
         <input type=date name=t3 placeholder= "Depart"  />
         <input type=date name=t4 placeholder= "Return"  />
         <input type=number name=t5 placeholder= "Passengers" min=1  />
         <select name=t6 >
             <option value="economy">Economy</option>
             <option value="premium economy">Premium Economy</option>
             <option valur="business">Business</option>
         </select>
         <input type=submit value=search name=b3 class=button1>
         </form>
        </div><br><br><br>
        <table border=1 align=center width=90% height=100 >
            <form name=frm method=post action=booking.jsp>
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
                    <tr><td  align=center>
                <input type=submit value=Book   class=button1 />
                </td></tr>
                </table>
                <%
                }
                %>
            </form>
         </table>
         
         
