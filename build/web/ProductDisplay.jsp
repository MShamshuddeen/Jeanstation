<%-- 
    Document   : ProductDisplay
    Created on : Feb 24, 2016, 10:19:46 PM
    Author     : Shamshuddeen
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JeanStation : Product Display</title>
        <link rel="StyleSheet" href="style/StyleSheet.css"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
 
        <style>
      #main_div{
        width: 1366px;
        min-height: 100px;
       background: #EEE;
      }
      #contentdiv{
          width: 1200px;
          min-height:600px;
       
          margin-left: 80px;
          float: left;
          margin-top: 131px;
      }
	  #prodimgbox{
			background-color:#FFFFFF;
			width:350px;
			height:450px;
			float:left;
			box-shadow: -1px 1px 3px 0px grey;
	  }
	  #proddetbox{
	  background-color:#FFFFFF;
			width:800px;
			height:450px;
			float:left;
			margin-left:30px;
			box-shadow: -1px 1px 3px 0px grey;
	  }
	  #containspace{
	
		width:1200px;
		height:40px;
	  }
	  #contact{
		width:1200px;
	
		height:500px;
		float:left;
	  }         
          #proddata{
          
           width:750px;
           height: 450px;
           margin-left:20px;
          }
  </style>
  

    </head>
    <body id="bdy">
    <div id="main_div">
        <div class="modal fade" id="help" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Help</h4>
        </div>
        <div class="modal-body">
            <h4 style="color: #2DBFF5;">Why have I not received my order yet?</h4>
            <p>In rare situations, orders may sometimes get delayed. We will keep you updated on the status of your orders. Log in to your account on our website/app to track your orders in the 'My Orders' section.</p>
            <h4 style="color: #2DBFF5;">I have placed my order. Now what?</h4>
            <p>Look forward to receiving your order! We will send you a confirmation email and SMS with your order details and estimated delivery dates. You can also log into your account on our website/app to track your orders in the 'My Orders' section.</p>
            <h4 style="color: #2DBFF5;">How can I check the status of my order?</h4>
            <p>You can easily check the status of your order by logging into your account on our website/app. Go to the 'My Orders' section and click on 'Track Order' to get the updated status of each item you have ordered.</p>
            <h4 style="color: #2DBFF5;">Why has the tracking status not changed in many days?</h4>
            <p>This may happen rarely, when there is a delay in receiving courier tracking updates. Don't worry, we work closely with the couriers to ensure your item will reach you as promised. If it has not been delivered to you by the promised date, please inform us in the 'Help section'. Click on 'View Help Center' and select 'Contact Customer Care'.</p>
            <h4 style="color: #2DBFF5;">How do I know my order is confirmed?</h4>
            <p>Once you place your order, we will send you a confirmation email and SMS with order details and estimated delivery dates. You can also log into your account on our website/app for the latest update on your order's status in the 'My Orders' section.</p>
            <h4 style="color: #2DBFF5;">Both SD & courier websites have different delivery dates. Which is correct?</h4>
            <p>We advise you to wait till the promised delivery date communicated by us. Your item will reach you by this date. To check the updated status of your order, please log into your account on Snapdeal and go to 'My Orders' section. In the unlikely event of any delay, we will inform you via email and SMS. You can also write to us in our 'Help' Section. Click on 'View Help Center' and write to us in 'Contact Customer Care'. We will look into your request at the earliest.</p>
            <h3>Need more help</h3>
            <h5>goto <a href="Contact_us.html">Contact Us</a></h5> or
            <h5>Call +91-981-073-1540</h5>
            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
        
  
   <div style="overflow:scroll" class="modal fade" id="account" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Account</h4>
        </div>
        <div class="modal-body">
        <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Account</a></li>
    <li><a data-toggle="tab" href="#myorder">My Order</a></li>
    <li><a data-toggle="tab" href="#accdet">Account Details</a></li>
    <li><a data-toggle="tab" href="#changepass">Change Password</a></li>
  </ul>
         <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Account</h3>
       <%
                                  HttpSession ob3=request.getSession();
                                  
                                  if(ob3.getAttribute("username")==null){
                                    out.println("<h5>Hello <span style='color:#2DBFF5;'>Guest</span></h5>");
                                    %>
                                    <h5>Please login or Register here.</h5>
                                   <input type='button' onclick='location.href="login.html"' class='btn btn-info' value='Login'/> 
                                  <input type='button' onclick='location.href="Register.html"' class='btn btn-info' value='Register'/>
                                   <%
                                  }
                                  else{
                                  String usr=(ob3.getAttribute("username").toString());
                                  out.println("<h5>Hello <span style='color:#2DBFF5;'>"+usr+"</span></h5>"); 
                                  %>
                                  <input type='button' onclick='location.href="Logout"' class='btn btn-info' value='Logout'/>
                             <%     
                                  }
                                %>
    </div>
    <div  style="overflow:scroll;" id="myorder" class="tab-pane fade">
      <h3>My Order</h3>
       <%
        if(ob3.getAttribute("username")==null){
           out.println("<h5>Please login here to view order details</h5>");
           %>
       <input type='button' onclick='location.href="login.html"' class='btn btn-info' value='Login'/> 
           <%
        }
        else{
        String usr=(ob3.getAttribute("username").toString());
        out.println("<p>Hello <span style='color:#2DBFF5;'>"+usr+"</span></p>");
        try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("select*from orderdet where usrname='"+usr+"' ");
             if(rs.next()){
             
        
        
        %>
        <table class="table">
    <thead>
      <tr>
        <th>Order No.</th>
        <th>Product Id</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total Price</th>
        <th>Size</th>
        <th>Shipping Address</th>
        <th>Pincode</th>
        <th>City</th>
        <th>Email</th>
        <th>Mobile no.</th>
        <th>Order Status</th>
      
      </tr>
    </thead>
    <tbody>
        <tr class='success'>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getInt(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getInt(4)%></td>
            <td><%=rs.getInt(5)%></td>
            <td><%=rs.getInt(6)%></td> 
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
            <td><%=rs.getString(9)%></td>
            <td><%=rs.getString(10)%></td>
            <td><%=rs.getString(11)%></td>
            <td><%=rs.getString(13)%></td>
            <td><%=rs.getString(14)%></td>
        </tbody>
  </table>
        
        
        <%
             }
             else{
                 %>
                 <h4>You did not place any order.</h4>
                 <%
             }
        }         
        catch(Exception e){
         out.println("<p>"+e+"</p>");
        }
        }
       %>
    </div>
    <div id="accdet" class="tab-pane fade">
      <h3>Account Details</h3>
      <%
        if(ob3.getAttribute("username")==null){
           out.println("<h5>Please login first</h5>");
           %>
       <input type='button' onclick='location.href="login.html"' class='btn btn-info' value='Login'/> 
           <%
        }
        else{
        String usr=(ob3.getAttribute("username").toString());
        out.println("<p>Hello <span style='color:#2DBFF5;'>"+usr+"</span></p>");
        try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("select*from users where username='"+usr+"' ");
             if(rs.next()){
             
        
        
        %>
        <table class="table">
    <thead>
      <tr>
        <th>UserName</th>
        <th>Email id</th>
        <th>Mobile no.</th>
        <th>Password</th>
      </tr>
    </thead>
    <tbody>
        <tr class='success'>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
        </tr>
        </tbody>
  </table>
        
        
        <%
             }
             else{
                 %>
                 <h4>You did not place any order.</h4>
                 <%
             }
        }         
        catch(Exception e){
         out.println("<p>"+e+"</p>");
        }
        }
       %>
    </div>
    <div id="changepass" class="tab-pane fade">
         <h3>Password Change</h3>
        <%
        if(ob3.getAttribute("username")==null){
           out.println("<h5>Please login first</h5>");
           %>
       <input type='button' onclick='location.href="login.html"' class='btn btn-info' value='Login'/> 
           <%
        }
        else{
        String usr=(ob3.getAttribute("username").toString());
       
        %>
        
        <form role="form" action="PasswordChange" method="post">
            <input type="hidden" class="form-control" name="username"  value="<%=usr%>" >
        <div class="form-group">
      <label for="usr">Old Password:</label>
      <input type="password" class="form-control" name="oldpass" placeholder="type your old password" required>
    </div>   
            <div class="form-group">
      <label for="usr">New Password:</label>
      <input type="password" class="form-control" name="newpass" placeholder="type new password" required>
    </div>
        <input type="submit" class="btn btn-primary" value="Change Password"/>     
        </form>
        <%
        }
        %>
    </div>
  </div>   
            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>      
        
        
            <div id="head">
                <div id="head1">
                    <div id="live_div">
                        <img src="images/live24x7.png" style="width:30px;height:30px;float:left;margin-top: 1px;" />
                        <p style="color: white;margin-left:5px;float: left;font-size: 20px;margin-top: 4px;">24x7 live support</p>
                        
                    </div>
                    <div id="ship_div">
                        <img src="images/ship_icon.png" style="width:30px;height:30px;float:left;margin-top: 1px;" />
                        <p style="color: white;margin-left:5px;float: left;font-size: 20px;margin-top: 3px;">Free shipping on order over 1000</p>
                        
                    </div>
                    <div id="btn_div">
                        <input id="login_btn" onclick="location.href='login.html'" type="submit" value="Login"/>
                        <input id="reg_btn" onclick="location.href='Register.html'" type="submit" value="Register"/>
                    </div>
                </div>
                
                <div id="logo_div">
                    <img src="images/logo.png" id="logo" ><a href="#"></a></img>
                </div>
                <div id="searchbox_div">
                   <form role="form" action="Search.jsp" method="get">
                    <input type="text" name="keyword" id="searchbox"/>
                    <button id="search_btn" type="submit">
                        <img src="images/search_icon.png" style="width:30px;height:30px;" />
                    </button>
                    </form>
                </div>
                
                <div id="head_all_btn">
                    <div class="head_all_btn1">
                        <button id="hbtn1" type="submit" data-toggle="modal" data-target="#help" style="border: 1px none #FFFFFF;background-color:#FFFFFF;width:78px;height:26px;">
                            <img src="images/phone_logo.png" style="width:22px;height:22px;"/>
                        </button>
                        <p style="float:left;margin-left:23px;margin-top:2px;">Help</p>
                        
                    </div>
                    <div class="head_all_btn1">
                        <button id="hbtn2" type="submit" data-toggle="modal" data-target="#account" style="border: 1px none #FFFFFF;background-color:#FFFFFF;width:78px;height:26px;">
                            <img src="images/user.png" style="width:22px;height:22px;"/>
                           
                        </button>
                        <p style="float:left;margin-left:15px;margin-top:1px;">Account</p>
                        
                    </div>
                    <div class="head_all_btn1">
                        <button  id="hbtn3" type="submit" style="width:79px;height:28px;border: 1px none #FFFFFF;background-color:#FFFFFF;">
                            <img src="images/shoppingcart.png" style="width:22px;height:22px;"/>
                        </button>
                      <p style="float:left;margin-left:24px;margin-top:1px;">Cart</p>
                    </div>
                    
                </div>
           
            </div>
    <div id="contentdiv">
	<div id="containspace">
	</div>
	<div id="contact">
            <%
                try{
                    String image;
                    String prodname;
                    int price;
                    String category;
                    String desc;
                int prodid=Integer.parseInt(request.getParameter("pid"));
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select*from product where pid="+prodid+" ");
                if(rs.next()){
                    prodname=rs.getString(2);
                    category=rs.getString(3);
                    desc=rs.getString(4);
                    price=rs.getInt(5);
                  image=this.getServletContext().getInitParameter("imglocation")+"/jeans/"+rs.getString("img");
                        out.println("<div id='prodimgbox'>");
                   out.println("<img src='"+image+"' style='width:350px;height:430px;float:left;margin-top:10px;'/>");
		
                    out.println("</div>");
                    out.println("<div id='proddetbox'>");
                    out.println("<div id='proddata'>");
		out.println("<div style='width:750px;height:250px;'>");
		out.println("<div style='float:left;width:375px;height:250px;'>");
		out.println("<table><form role='form' action='BuyNow.jsp?pid="+prodid+"' method='post'");
		out.println("<tr>");
		out.println("<td><h2>"+prodname+"<br/><span style='font-size:15px;color:#9e9e9e;'>"+category+"</span></h2></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td><label for='sel1'>Quantity:</label>");
                out.println("<select style='width:100px;' class='form-control' name='quantity' id='quantity' required>");
                out.println("<option value='' selected='selected'>Select</option>");
                out.println("<option value='1'>1</option>");
                out.println("<option value='2'>2</option>");
                out.println("<option value='3'>3</option>");
                out.println("<option value='4'>4</option>");       
		out.println("<option value='5'>5</option>");
                out.println("</select></td>");
                if((category.equals("Jeans")) || (category.equals("Trousers"))){
                out.println("<td> <label for='sel1'>Size:</label>");
                out.println("<select  style='width:100px;' class='form-control' name='size' id='psize' required>");
                out.println("<option value='' selected='selected'>Select</option>");
                out.println("<option value='28'>28</option>");
                out.println("<option value='30'>30</option>");
                out.println("<option value='32'>32</option>");
                out.println("<option value='34'>34</option>");       
		out.println("<option value='36'>36</option>");
                out.println("</select></td>");
                }
                else if((category.equals("Tshirts")) || (category.equals("Shirts"))){
                out.println("<td> <label for='sel1'>Size:</label>");
                out.println("<select  style='width:100px;' class='form-control'name='size' id='psize' required>");
                out.println("<option value='' selected='selected'>Select</option>");
                out.println("<option value='S'>S</option>");
                out.println("<option value='M'>M</option>");
                out.println("<option value='L'>L</option>");
                out.println("<option value='XL'>XL</option>");       
		out.println("<option value='XXL'>XXL</option>");
                out.println("<option value='XXXL'>XXXL</option>");
                out.println("</select></td>");
                }
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td><h3>Price: "+price+"</h3></td>");
		out.println("</tr>");
		out.println("</table>");
            	out.println("</div>");
		
		out.println("<div style='float:right;width:375px;height:250px;'>");
		out.println("<table>");
                out.println("<tr>"); 
               // out.println("<td><p style='margin-top:20px;margin-left:40px;color:#9e9e9e;'>Item will be delivered in 5-7 days</p>");
               if(price>=1000){
                out.println("<td><p style='margin-top:20px;margin-left:40px;color:black;'>Item will be delivered in 5-7 days<span style='color:#5cb85c;'> Free Delivery</span></p>");
                }
                else{
                 out.println("<td><p style='margin-top:20px;margin-left:40px;color:black;'>Item will be delivered in 5-7 days <span style='color:red;'>Delivery Charges may apply</p>"); 
                }
                      
                %>
                <input style='width:175px;font-size:24px;margin-left:50px;margin-top:30px;' type='submit' class='btn btn-success btn-lg' value='BUY NOW'><br/>
        </form>
	    <%    
	        out.println("</tr>");
		out.println("</table>");
		out.println("</div>");
		out.println("</div>");
		out.println("<div style='float:left;width:750px;height:200px;'>");
		out.println("<div class='panel panel-primary'>");
                out.println("<div class='panel-heading'>Product Details</div>");
                out.println("<div class='panel-body'>"+desc+"</div>");
                out.println("</div>");
		out.println("</div>");
		out.println("</div>");
                   
                }
                }
                catch(Exception e){
                }
            %>
		
        </div>
		
		</div>
    
       
    
       
      
		</div>
<div id="footerspace">
</div>

<div id="footer_div">
<div class="footersection">
<h3 style="margin-left:10px;color:#F97E76;">Pages</h3>
<ul style="margin-left:15px;" class="list-group">
<li><a style="color:white;font-size:18px;text-decoration: none;font-weight: initial;" href="about_us.html">About Us</a></li>
<li><a style="color:white;font-size:18px;text-decoration: none;font-weight: initial;" href="Contact_us.html">Contact Us</a></li>
<li><a style="color:white;font-size:18px;text-decoration: none;font-weight: initial;" href="login.html">Login</a></li>
<li><a style="color:white;font-size:18px;text-decoration: none;font-weight: initial;" href="Register.html">Register</a></li>
</ul>
</div>
<div class="footersection">
<h3 style="margin-left:10px;color:#F97E76;">Connect with Us</h3>
<ul style="margin-left:15px;" class="list-group">
<li><a class="fa fa-facebook-f" style="color:white;font-size:20px;text-decoration: none;font-weight: initial;" href=""> Facebook</a></li>
<li><a class="fa fa-google-plus" style="color:white;font-size:20px;text-decoration: none;font-weight: initial;" href=""> Google plus</a></li>
<li><a class="fa fa-twitter" style="color:white;font-size:20px;text-decoration: none;font-weight: initial;" href=""> Twitter</a></li>
<li><a class="fa fa-youtube-play" style="color:white;font-size:20px;text-decoration: none;font-weight: initial;" href=""> Youtube</a></li>
</ul>


</div>
<div class="footersection">
<h3 style="margin-left:10px;color:#F97E76;">Download Apps</h3>
<ul style="margin-left:15px;" class="list-group">
<li><a class="fa fa-android" style="color:white;font-size:22px;text-decoration: none;font-weight: initial;" href=""> Google Play</a></li>
<li><a class="fa fa-apple" style="color:white;font-size:22px;text-decoration: none;font-weight: initial;" href=""> App Store</a></li>
<li><a class="fa fa-windows" style="color:white;font-size:22px;text-decoration: none;font-weight: initial;" href=""> Windows Store</a></li> 
</ul>

</div>
<div class="footerend">
<img src="images/logo.png"  style="width:150px;height:40px;" />
<p style="color:#ffffff;font-size:16px;">&copy; 2016 JeanStation, All Rights Reserved</p>
</div>
</div>
</div>

        
    </body>
</html>


