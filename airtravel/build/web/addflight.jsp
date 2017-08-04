<%@ include file= "aloggedin.jsp" %>
<%@ page language='java' import='java.sql.*' %>

<html>
    <head>
        <title>Add Flight Details</title>
        <style>
            h3{text-align:center;}
            .button{
                    border:none;
                    background-color: #CCCCCC;
                    padding:7px 25px;
                    position :relative;
                    left: 80px;
            }
            .button:hover{
                background-color: #008CBA;
                cursor:pointer;
            }
            
            label{display: inline-block;
                width:200px;
            }
        </style>
    </head>
    <body>
        <h3>Enter the flight details here !!</h3>
        <form name=frm method=post action="pgaddflight.jsp" >
        <div>
            <% 
            int k;
            String s="0";
            s=DB.DBLAYER.getScalar("select sno from airlinedetails order by sno desc limit 1");
            if(s==null || s.equals(""))
                s="1";              
            else
                {
                k=Integer.parseInt(s);
                k=k+1;
                s=Integer.toString(k);
            }
            %>
         <label>Serial number</label><input type=text name="t10" value= <%= s%> size=30  readonly /><br><br>
        <label>Airline's Name </label><input type=text name="t1" placeholder= "Airline" size=30/><br><br>
        <label>Flight Number </label><input type=text name="t2" placeholder= "Flight Number" size=30/><br><br>
        <label>From</label>      
        <select name=t3 id="selectBox" onChange='checkfun()'>
             <%
             
            String s1="select city from cities";  
            ResultSet rs=DB.DBLAYER.getResult(s1);
            if(rs.next()==true)
              {                     
                 do
                  {
                       out.print("<option width=100 value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                  }while(rs.next());
                                    
              }
             %>
            
         </select>
         
          <br><br>
             
         <label>To</label>
         <select name=t4 id="selectBox1" onChange='checkfun()'>
              <%               
            String s2="select city from cities order by city"; 
            ResultSet rs1=DB.DBLAYER.getResult(s2);
            if(rs1.next()==true)
              {                     
                 do
                  {
                       out.print("<option value='"+rs1.getString(1)+"'>"+rs1.getString(1)+"</option>");
                  }while(rs1.next());
                                    
              }
             %>
         </select>
        

        <br><br>
        <label>Departure Time</label><input type=time name="t5" placeholder= "Departure Time" /><br><br>
        <label>Arrival Time</label><input type=time name="t6" placeholder= "Arrival Time" /><br><br>
        <label>Flight Duration</label><input type=time name="t7" placeholder= "Flight Duration" /><br><br>
        <label>Number Of Stops</label><select name=t8 value= Stops >
            <option value= "Non-Stop">Non-Stop</option>
            <option value="1">1</option>
            <option value=2>2</option>
        </select><br><br>
        <label>Date</label><input type=date name="t9" placeholder= "Date" size=30/><br><br>
  
            <label>Class :</label><label>Cost :</label><br><br>
            <label>Economy</label><input type=number name=t12  min=1 onKeyUp="if(this.value<0){this.value='';}"/><br><br>
            <label>Premium Economy</label><input type=number name=t13   min=1 onKeyUp="if(this.value<0){this.value='';}"/><br><br>
            <label>Business</label><input type=number name=t14    min=1 onKeyUp="if(this.value<0){this.value='';}"/><br><br><br>
        <input type=submit name=b1 value=Submit class=button />
           </div>
           <% 
       if(request.getParameter("n")!=null)
        {
            out.print("<script language='javascript'>alert('Failed, Try again later !');</script>");
        }
        if(request.getParameter("y")!=null)
        {
            out.print("<script language='javascript'>alert('Data added successfully !');</script>");
        }
       %>
       </form>
       
    </body>
</html>
