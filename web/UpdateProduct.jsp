<%-- 
    Document   : UpdateProduct
    Created on : Mar 6, 2016, 10:56:01 PM
    Author     : Shamshuddeen
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Jeanstation : Update Product</title>
			 <link rel="StyleSheet" href="style/bootstrap.min.css"/>
			 <script src="js/bootstrap.min.js"></script>
			 <script src="js/jquery.min.js"></script>
                         <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
#bdy{
	margin:0px;
	padding:0px;
}
#main{
	width:1366px;
	height:800px;
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
	background-color:#EEEEEE;
	width:300px;
	height:680px;
	float:left;
}
#content{
	background-color:#EEEEEE;
	width:1066px;
	height:680px;
	float:left;
}

</style>
</head>
<body id="bdy">
<div id="main">
<div id="headd">
<h1 style="color:white;margin-left:20px;float:left">JeanStation</h1>
<h4 style="float:Right;margin-right:190px;color:white;margin-top:20px;">Hello</h4>
</div>
<div id="menu">
</div>
<div id="content">
<div style="float:left;width:500px;height:680px;margin-left:50px;margin-top:20px;">
<h4 style="color:#337ab7;">Update Product Data</h4>
  <form role="form" action="UpdateProduct" method="get">
      <% 
          int pid=Integer.parseInt(request.getParameter("updateprod"));
          try{
                String pname,pcat,pdesc,pstatus;
                int price;
                  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                  Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
                  Statement st=con.createStatement();
                  ResultSet rs=st.executeQuery("select*from product where pid="+pid+"");
                  while(rs.next()){
                  pname=rs.getString(2);
                  pcat=rs.getString(3);
                  pdesc=rs.getString(4);
                  price=rs.getInt(5);
                  pstatus=rs.getString(7);
                  out.println("<input type='hidden' class='form-control' value='"+pid+"' name='pid'>");
                  out.println("<div class='form-group'>");
                  out.println("<label for='usr'>Product Name:</label>");
                  out.println("<input type='text' class='form-control' value='"+pname+"' name='prodname'>");
                  out.println("</div>");
                  out.println("<div class='form-group'>");
                  out.println("<label for='usr'>Product Category:</label>");
                  out.println("<select class='form-control' name='pcat'>");
                  if(pcat.equals("Jeans")){
                  out.println("<option selected='selected' value='Jeans'>Jeans</option>");
                  out.println("<option value='Tshirts'>Tshirts</option>");
                  out.println("<option value='Trousers'>Trousers</option>");
                  out.println("<option value='Shirts'>Shirts</option>");
                  }
                  else if(pcat.equals("Tshirts")){
                  out.println("<option  value='Jeans'>Jeans</option>");
                  out.println("<option selected='selected' value='Tshirts'>Tshirts</option>");
                  out.println("<option value='Trousers'>Trousers</option>");
                  out.println("<option value='Shirts'>Shirts</option>");
                  }
                  else if(pcat.equals("Trousers")){
                  out.println("<option  value='Jeans'>Jeans</option>");
                  out.println("<option  value='Tshirts'>Tshirts</option>");
                  out.println("<option selected='selected' value='Trousers'>Trousers</option>");
                  out.println("<option value='Shirts'>Shirts</option>");
                  }
                  else if(pcat.equals("Shirts")){
                  out.println("<option  value='Jeans'>Jeans</option>");
                  out.println("<option  value='Tshirts'>Tshirts</option>");
                  out.println("<option  value='Trousers'>Trousers</option>");
                  out.println("<option selected='selected' value='Shirts'>Shirts</option>");
                  }
                  out.println("</select>");
                  out.println("</div>");
                  out.println("<div class='form-group'>");
                  out.println("<label for='comment'>Product Description:</label>");
                  out.println("<textarea class='form-control' rows='5'  name='pdesc'>"+pdesc+"</textarea>");
                  out.println("</div>");
                  out.println("<div class='form-group'>");
                  out.println("<label for='usr'>Product Price:</label>");
                  out.println("<input type='number' class='form-control'value='"+price+"' name='price'>");
                  out.println("</div>");
                  out.println("<div class='form-group'>");
                  out.println("<label for='usr'>Product Status:</label>");
                  out.println("<select class='form-control' name='pstatus'>");
                  if(pstatus.equals("Available")){
                  out.println("<option selected='selected' value='Available'>Available</option>");
                  out.println("<option value='N/A'>N/A</option>");
                  }
                  else if(pstatus.equals("N/A")){
                  out.println("<option value='Available'>Available</option>");
                  out.println("<option selected='selected' value='N/A'>N/A</option>");
                  }
                  out.println("</select>");
                  out.println("</div>");
                  out.println("<input type='submit' class='btn btn-info' value='Update Product'/>");
                  }
                  
            }
          catch(Exception e){
          
          }
      %>
		
  </form>


</div>
</div>
</div>
</body>
</html>