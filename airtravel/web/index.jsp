<%@ page language='java' import='java.sql.*' %>

<html>
    <head>
        <title>Home Page</title>
        <style>
            h2{text-align:center;}
            .abc
            {
                background-color: #B0E0E6;
                padding: 12px 50px;
                
            }
            
                
                .footer{
                    background-color: yellow;
                    width: 100% ;
                    text-align: center;
                    position:fixed;
                    bottom: 0;
                    right: 0;
                    
                }
            .notice{
                background-color: white;
                width:100%;
                height: 200px;
                text-align:center;
                
            }
            label{
            margin:60px;
            }
            
            .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
    
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.close1 {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close1:hover,
.close1:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
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
    
    .button1:hover{background-color:#008CBA;}
    
        </style>
    </head>
    <body>
        <div>
            <h2>Welcome</h2>
            <!-- Trigger/Open The Modal -->
           <button id="myBtn" class=button1>LOG-IN</button>
           <button id =signup class=button1>SIGN-UP</button>
           
           <!-- The Modal -->
  <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content" >
    <span class="close">&times;</span>
    <div >
        <form name=frm method=post action=checkuser.jsp>
        <input type=email name=t1 placeholder="Email Address" size=30/><br><br>
        <input type=password name=t2 placeholder="Password" size=30/><br><br>
        <input type=submit value="LOG IN" class=button1 />
    </form>
    </div>
  </div>
</div>

<div id="my" class="modal">

  <!-- Modal content -->
  <div class="modal-content" >
    <span1 class="close1">&times;</span1>
    <div >
        <form name=frm method=post action=signup.jsp>
        <input type=text name =t4 placeholder="Name"    size=30/><br><br>
        <input type=email name=t1 placeholder="Email Address" size=30/><br><br>
        <input type=mumeric name=t2 placeholder="Mobile Number" size=30/><br><br>
        <input type=password name=t3 placeholder="Password" size=30/><br><br>
        <input type=submit value="SIGN UP" class=button1 />
    </form>
    </div>
  </div>
</div>
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
<script>
// Get the modal
var modal = document.getElementById('myModal');
var modal1 = document.getElementById('my');
// Get the button that opens the modal
var btn = document.getElementById("myBtn");
var btn1= document.getElementById("signup");
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var span1= document.getElementsByClassName("close1")[0];
// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}
btn1.onclick = function(){
    modal1.style.display = "block";
}
// When the user clicks on <span> (x), close the modal

span.onclick = function() {
    modal.style.display = "none";
}
span1.onclick = function(){
    modal1.style.display = "none";
}
// When the user clicks anywhere outside of the modal, close it
/*window.onclick = function(event){
    if(event.target == modal){
        modal.style.display= "none";
    }
}
window.onclick = function(event1){
    if(event1.target == modal1){
        modal1.style.display= "none";
    }
}*/
</script>

        </div>
        
        <br><br>
        <div class=abc>  
        <form name=frm method=post action=results.jsp>
        Book Domestic & International Flights 
        <input type=button name=b1 value="one way" class=button1 onClick='changeColor()' />
        <input type=button name=b2 value="round trip" class=button1 onClick='changeColor1()' autofocus />
        <br>
        <label>From</label>
        <label>To</label>
        <label>Depart</label>
        <label>Return</label>
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
         <input type=date name=t3 placeholder= "Depart" />
         <input type=date name=t4 placeholder= "Return" />
         <input type=text name=t5 placeholder= "Passengers" />
         <select name=t6 >
             <option value="economy">Economy</option>
             <option value="premium economy">Premium Economy</option>
             <option valur="business">Business</option>
         </select>
         <input type=submit value=search name=b3 class=button1>
             </form>
        </div>
        <!--notice-->
        <div class=notice>
            <h2>Notices</h2>
            <marquee onMouseOver="this.stop()" onMouseOut="this.start()" scrollamount="3" direction="left" loop="true" width="100%">
            <%
                String r1="select notice from notices";
                ResultSet d1=DB.DBLAYER.getResult(r1);
                if(d1==null || d1.next()==false)
                    out.print("<script language=javascript>alert('No new notice to show');</script>");
                else
                    {
                    do{
                       out.print("<tr><td><img src=arrow.jpg width=15 height=10 />" +d1.getString(1)+"</td></tr>"); 
                    }while(d1.next());
                }
            %>
        </marquee>
        </div>
        <div class=footer>
            <a href="adminlogin.jsp">Poweredby:AirTravel</a>
        </div>
        <%
            if(request.getParameter("y")!=null)
                out.print("<script language='javascript'>alert('Successfully registered, Wait for confirmation!');</script>");
            if(request.getParameter("n")!=null)
                out.print("<script language='javascript'>alert('Failed, Try again later!');</script>");   
                        if(request.getParameter("q")!=null)
                out.print("<script language='javascript'>alert('Wrong username or password or you are not verified yet !');</script>");
       %>
    </body>
</html>
