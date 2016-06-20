<%-- 
    Document   : UpdateUser
    Created on : Mar 5, 2016, 11:56:55 PM
    Author     : Shamshuddeen
--%>

<%@page import="java.sql.*;"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Jeanstation : Update User</title>

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
	background-color:#EEEEEE;
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
<div id="main">
<div id="headd">
<h1 style="color:white;margin-left:20px;float:left">JeanStation</h1>
<h4 style="float:Right;margin-right:190px;color:white;margin-top:20px;">Hello</h4>
</div>
<div id="menu">
</div>
<div id="content">
<div style="float:left;width:500px;height:400px;margin-left:50px;margin-top:50px;">
<br/>
<h4 style="color:#337ab7;">Update User Profile</h4>
  <form role="form" action="UpdateUser" method="post">
      <%
          int uid=Integer.parseInt(request.getParameter("usrid"));
          String usrname,email,mob,pass;
          try{
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
            Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("select*from users where usrid='"+uid+"'");
             while(rs.next()){
                 int usid=rs.getInt(1);
                 usrname=rs.getString(2);
                 email=rs.getString(3);
                 mob=rs.getString(4);
                 pass=rs.getString(5);
             out.println("<div class='form-group'>");
             out.println("<input type='hidden' class='form-control' value='"+usid+"' name='uid'>");
             out.println("</div>");    
             out.println("<div class='form-group'>");
             out.println("<label for='usr'>Username:</label>");
             out.println("<input type='text' class='form-control' value='"+usrname+"' name='usr'>");
             out.println("</div>");
             out.println("<div class='form-group'>");
             out.println("<label for='email'>Email:</label>");
             out.println("<input type='email' class='form-control' value='"+email+"' name='email'>");
             out.println("</div>");
	     out.println("<div class='form-group'>");
             out.println("<label for='usr'>Mobile no:</label>");
             out.println("<input type='text' class='form-control'value='"+mob+"' mob name='mob'>");
             out.println("</div>");
             out.println("<div class='form-group'>");
             out.println("<label for='pwd'>Password:</label>");
             out.println("<input type='text' class='form-control' value='"+pass+"' name='pwd' >");
             out.println("</div>");
      }
      }
      catch(Exception e){
    
    }
      %>
      
    <input type="submit" class="btn btn-info" value="Update User"/>
  </form>

</div>
</div>
</div>
</body>
</html>