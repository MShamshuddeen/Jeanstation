<%-- 
    Document   : Dashboard
    Created on : Mar 5, 2016, 12:42:43 PM
    Author     : Shamshuddeen
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Jeanstation : Admin Dashboard</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#bdy{
	margin:0px;
	padding:0px;
}
#main{
	width:1366px;
	height:660px;
	background-color:#EEEEEE;
	float:left;
}
#headd{
	background-color:#337ab7;
	width:1366px;
	height:70px;
	float:left;
	box-shadow: 1px 1px 5px 0px grey;
}
#menu{
	background-color:black;
	width:300px;
	height:590px;
	float:left;
}
#content{
	background-color:#EEEEEE;
	width:1066px;
	height:590px;
	float:left;
}

</style>
</head>
<body id="bdy">
    <%         
             HttpSession ad1=request.getSession();
             if(ad1.getAttribute("adminname")==null){
                out.println("<h3 style='text-align:center;'>Please login first</h3>");
                out.println("<h5 style='text-align:center;'><a href='js-admin.html'>Click Here for Admin login Panel</a></h5>");
             }
             else{
                String name=(ad1.getAttribute("adminname").toString());
 
%>
    
<div id="main">
<!--User Section Start-->

<div class="modal fade" id="adduser" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add new User</h4>
        </div>
        <div class="modal-body">
          <form role="form" action="AddUser" method="post">
		<div class="form-group">
      <label for="usr">Username:</label>
      <input type="text" class="form-control" name="usr" placeholder="Name" required>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" name="email" placeholder="sample@example.com" required>
    </div>
	<div class="form-group">
      <label for="usr">Mobile no:</label>
      <input type="text" class="form-control" name="mob" placeholder="999-000-1111" required>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" name="pwd" placeholder="Enter password" required>
    </div>
    <input type="submit" class="btn btn-info" value="AddUser"/>
  </form>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="deleteuser" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete User Profile</h4>
        </div>
        <div class="modal-body">
            <p>Select User which you want to delete</p>
            <form role="form" action="DeleteUser" method="get">
            <select class='form-control' name="deluser" required>
                <option value="" selectted="selected">Select</option>
          <%
             Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("select*from users");
             while(rs.next()){   
              String emailid=rs.getString("email");
               out.println("<option value='"+emailid+"'>"+emailid+"</option>"); 
             }
          %>
            </select>
            <input type="Submit" class="btn btn-info" value="Delete"/>
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  
  <div class="modal fade" id="viewuser" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">View All Users Profile</h4>
        </div>
        <div class="modal-body">
         <table class="table">
    <thead>
      <tr>
        <th>UserId</th>
        <th>Username</th>
        <th>Email</th>
        <th>Mobile</th>
        <th>Password</th>
      
      </tr>
    </thead>
    <tbody>
        <%
             try{
                rs=st.executeQuery("select*from users");
                 while(rs.next()){
            out.println("<tr class='info'>");
            out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getString(5)+"</td></tr>");
              }
              }
             catch(Exception e){
             
             }
      %>
    </tbody>
  </table>  
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="updateuser" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select User Profile</h4>
        </div>
        <div class="modal-body">
         
            <p>Select User which you want to Update</p>
           
          <%
             String emailid;
             int usrid;
             try{
             rs=st.executeQuery("select*from users");
              out.println("<select class='form-control' name='UpdateUser' required>");
                out.println("<option value='' selected='selected'>Select</option>");
             while(rs.next()){
               usrid=rs.getInt(1);  
               emailid=rs.getString("email");
               out.println("<option value='"+usrid+"'>"+emailid+"</option>"); 
               
               %>
               <input type="submit" onclick="location.href='UpdateUser.jsp?usrid=<%=usrid%>'" class="btn btn-info" value="SelectUser"/>   
               
           <%  }
             out.println("</select>");
          
             }
             catch(Exception e){
           
             }
          %>
 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
   <!--User Section End-->       
  
   
   
   
   <!--Product Section Start-->        
  
  <div class="modal fade" id="addproduct" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Product</h4>
        </div>
        <div class="modal-body">
           <form role="form" action="AddProduct" method="post" enctype="multipart/form-data">
		<div class="form-group">
      <label for="usr">Product Name:</label>
      <input type="text" class="form-control" name="prodname" placeholder=" Product Name" required>
    </div>
    <div class="form-group">
      <label for="usr">Product Category:</label>
      <select class="form-control" name="pcat" required>
        <option value="" selected="selected">Select</option>  
        <option value="Jeans">Jeans</option>
        <option value="Tshirts">Tshirts</option>
        <option value="Trousers">Trousers</option>
        <option value="Shirts">Shirts</option>
      </select>
    </div>
    <div class="form-group">
      <label for="comment">Product Description:</label>
      <textarea class="form-control" rows="5" name="pdesc"></textarea>
    </div>
    <div class="form-group">
      <label for="usr">Product Price:</label>
      <input type="number" class="form-control" name="price" placeholder="Product Price" required>
    </div> 
     <div class="form-group">
      <label for="usr">Product Image:</label>
      <input type="file" class="btn btn-Primary"  name="file" required>
    </div>
    <div class="form-group">
      <label for="usr">Product Status:</label>
      <select class="form-control" name="pstatus" required>
          <option value="" selected="selected">Select</option>
        <option value="Available">Available</option>
        <option value="N/A">N/A</option>
      </select>
    </div>
               
    
    <input type="submit" class="btn btn-info" value="Add Product"/>
  </form>
            
            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="deleteproduct" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete Product</h4>
        </div>
        <div class="modal-body">
          <p>Select a product Which you want to delete</p>
          <form role="form" action="DeleteProduct" method="get">
            <select class='form-control' name="deluser" required>
                <option value="" selectted="selected">Select</option>
          <%
             try{
              rs=st.executeQuery("select*from product");
             while(rs.next()){   
               int pid=rs.getInt("pid");
               String pname=rs.getString("pname");
               out.println("<option value='"+pid+"'>"+pname+"</option>"); 
             }
             }
             catch(Exception e){
             
             }
          %>
            </select>
            <input type="Submit" class="btn btn-info" value="Delete"/>
            </form>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  
  <div class="modal fade" id="viewproduct" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">View Product</h4>
        </div>
        <div class="modal-body">
          <table class="table">
    <thead>
      <tr>
        <th>ProductId</th>
        <th>Product Name</th>
        <th>Product Category</th>
        <th>Product Description</th>
        <th>Product Price</th>
        <th>Product Image</th>
        <th>Product Status</th>
      
      </tr>
    </thead>
    <tbody>
        <%
             try{
                rs=st.executeQuery("select*from product");
                 while(rs.next()){
            out.println("<tr class='info'>");
            out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getInt(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td></tr>");
              }
              }
             catch(Exception e){
             
             }
      %>
    </tbody>
  </table>  
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="updateproduct" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Product</h4>
        </div>
        <div class="modal-body">
          <p>Select product which you want to update</p>
          <form role="form" action="UpdateProduct.jsp" method="get">
            <select class='form-control' name="updateprod" required>
                <option value="" selectted="selected">Select</option>
          <%
             try{
              rs=st.executeQuery("select*from product");
             while(rs.next()){   
               int pid=rs.getInt("pid");
               String pname=rs.getString("pname");
               out.println("<option value='"+pid+"'>"+pname+"</option>"); 
             }
             }
             catch(Exception e){
             
             }
          %>
            </select>
            <input type="Submit" class="btn btn-info" value="Select"/>
            </form>
        
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  
 <!--Product Section End-->  
   
   
 <div style="overflow:scroll;" class="modal fade" id="addorder" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">View Undelivered Order</h4>
        </div>
        <div style="overflow:scroll;" class="modal-body">
             <form action="OrderStatus" method="get">
          <table class="table">
    <thead>
      <tr>
        <th>Order no.</th>
        <th>Product Id</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total Price</th>
        <th>Product Size</th>
        <th>Shipping Address</th>
        <th>Pincode</th>
        <th>City</th>
        <th>Email</th>
        <th>Name</th>
        <th>Mobile</th>
        <th>Order Status</th>
        <th>Action</th>
      
      </tr>
    </thead>
    <tbody>
        <%
             try{
                rs=st.executeQuery("select*from orderdet where ordstatus='Undelivered' ");
                 while(rs.next()){
            out.println("<tr class='info'>");
            int ordno=rs.getInt(1);
            out.println("<td>"+ordno+"</td>");
            out.println("<td>"+rs.getInt(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getInt(4)+"</td>");
            out.println("<td>"+rs.getInt(5)+"</td>");
            out.println("<td>"+rs.getInt(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td>");
            out.println("<td>"+rs.getString(8)+"</td>");
            out.println("<td>"+rs.getString(9)+"</td>");
            out.println("<td>"+rs.getString(10)+"</td>");
            out.println("<td>"+rs.getString(11)+"</td>");
            out.println("<td>"+rs.getString(12)+"</td>");
            out.println("<td>"+rs.getString(13)+"</td>");
            out.println("<td>"+rs.getString(14)+"</td>");
            
            %>
    <td>
        
    <label><input type="radio" value="<%=ordno%>" name="ordno">Change Status</label>
     
    </td> 
            
            <%
            out.println("</tr>");
              }
              }
             catch(Exception e){
             
             }
      %>
    </tbody>
  </table>
    <input type="submit" class="btn btn-primary" value="Delivered"/>
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
    <div  style="overflow:scroll;" class="modal fade" id="deleteorder" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">View Delivered Order</h4>
        </div>
        <div style="overflow:scroll;" class="modal-body">
           
          <table class="table">
    <thead>
      <tr>
        <th>Order no.</th>
        <th>Product Id</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total Price</th>
        <th>Product Size</th>
        <th>Shipping Address</th>
        <th>Pincode</th>
        <th>City</th>
        <th>Email</th>
        <th>Name</th>
        <th>Mobile</th>
        <th>Order Status</th>
        
      
      </tr>
    </thead>
    <tbody>
        <%
             try{
                rs=st.executeQuery("select*from orderdet where ordstatus='Delivered' ");
                 while(rs.next()){
            out.println("<tr class='info'>");
            out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getInt(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getInt(4)+"</td>");
            out.println("<td>"+rs.getInt(5)+"</td>");
            out.println("<td>"+rs.getInt(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td>");
            out.println("<td>"+rs.getString(8)+"</td>");
            out.println("<td>"+rs.getString(9)+"</td>");
            out.println("<td>"+rs.getString(10)+"</td>");
            out.println("<td>"+rs.getString(11)+"</td>");
            out.println("<td>"+rs.getString(12)+"</td>");
            out.println("<td>"+rs.getString(13)+"</td>");
            out.println("<td>"+rs.getString(14)+"</td>");
            %>
       
            <%
            out.println("</tr>");
              }
              }
             catch(Exception e){
             
             }
      %>
    </tbody>
  </table> 
    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
 
   
    
    
<div id="headd">
<h1 style="color:white;margin-left:20px;float:left">JeanStation</h1>


<h4 style="float:Right;margin-right:190px;margin-top:20px;">Hello <span style='color:#FFFFFF;'><%=name%></span></h4>

</div>
<div id="menu">
<div class="container" style="width:300px;height">
  <h3 Style="color:white;">Menu</h3>
  <ul class="nav nav-pills nav-stacked">
    <li class="active"><a href="#">Dashboard</a></li>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Users <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a data-toggle="modal" data-target="#adduser" href="#">Add new user</a></li>
        <li><a data-toggle="modal" data-target="#deleteuser" href="#">Delete User</a></li>
        <li><a data-toggle="modal" data-target="#viewuser" href="#">View All User</a></li> 
        <li><a data-toggle="modal" data-target="#updateuser" href="#">Update User</a></li>                        
      </ul>
    </li>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Product <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a data-toggle="modal" data-target="#addproduct" href="#">Add new Product</a></li>
        <li><a data-toggle="modal" data-target="#deleteproduct" href="#">Delete Product</a></li>
		<li><a data-toggle="modal" data-target="#viewproduct" href="#">View All Product</a></li>
        <li><a data-toggle="modal" data-target="#updateproduct" href="#">Update Product</a></li>                        
      </ul>
    </li>
	 <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Order <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a data-toggle="modal" data-target="#addorder" href="#">View Undelivered Order</a></li>
        <li><a data-toggle="modal" data-target="#deleteorder" href="#">View Delivered Order</a></li>
	                       
      </ul>
    </li>
	 <li><a href="Adminlogout">Logout</a></li>
  </ul>
</div>
</div>
<div id="content">
    <h4 style="color:#337ab7;margin-left:50px;"><b>Latest five Product</b></h4>
<div style="overflow:scroll;background-color:#FFFFFF;width:900px;height:220px;margin-left:50px;margin-top:20px;box-shadow: 0px 1px 7px 2px grey;">
<table class="table">
    <thead>
      <tr>
        <th>Product ID:</th>
        <th>Name</th>
        <th>Category</th>
        <th>Description</th>
        <th>Price</th>
        <th>Image</th>
        <th>Status</th>
      
      </tr>
    </thead>
    <tbody>
       <%
             try{
                rs=st.executeQuery("select top 5*from  product order by pid desc");
                 while(rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getInt(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td></tr>");
              }
              }
             catch(Exception e){
             
             }
      %>
    </tbody>
  </table>
</div>
<h4 style="color:#337ab7;margin-left:50px;"><b>Latest five Orders</b></h4>
<div style="overflow:scroll;background-color:#FFFFFF;width:900px;height:220px;margin-left:50px;margin-top:20px;box-shadow: 0px 1px 7px 2px grey;">
<table class="table">
    <thead>
      <tr>
        <th>Order no.</th>
        <th>Product Id</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total Price</th>
        <th>Product Size</th>
        <th>Shipping Address</th>
        <th>Pincode</th>
        <th>City</th>
        <th>Email</th>
        <th>Name</th>
        <th>Mobile</th>
        <th>Order Status</th>
      
      </tr>
    </thead>
    <tbody>
        <%
             try{
                rs=st.executeQuery("select top 5*from  orderdet  order by ordno desc");
                 while(rs.next()){
            out.println("<tr class='info'>");
            out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getInt(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getInt(4)+"</td>");
            out.println("<td>"+rs.getInt(5)+"</td>");
            out.println("<td>"+rs.getInt(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td>");
            out.println("<td>"+rs.getString(8)+"</td>");
            out.println("<td>"+rs.getString(9)+"</td>");
            out.println("<td>"+rs.getString(10)+"</td>");
            out.println("<td>"+rs.getString(11)+"</td>");
            out.println("<td>"+rs.getString(12)+"</td>");
            out.println("<td>"+rs.getString(13)+"</td>");
            out.println("<td>"+rs.getString(14)+"</td></tr>");
            
              }
              }
             catch(Exception e){
             
             }
      %>
    </tbody>
  </table> 
</div>

</div>
</div>
    <%
             }             
    %>
</body>
</html>