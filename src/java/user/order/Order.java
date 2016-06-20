
package user.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Order extends HttpServlet  {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
       PrintWriter out=response.getWriter();
       int pid=Integer.parseInt(request.getParameter("pid"));
       String size=request.getParameter("size");
       int quantity=Integer.parseInt(request.getParameter("quantity"));
       String username=request.getParameter("username");
       String saddress=request.getParameter("saddress");
       String city=request.getParameter("city");
       String pincode=request.getParameter("pincode");
       String email=request.getParameter("email");
       String mobile=request.getParameter("mobile");
       String pname=request.getParameter("pname");
       String ordstatus=request.getParameter("status");
       int price=Integer.parseInt(request.getParameter("price"));
       int tprice=Integer.parseInt(request.getParameter("tprice"));
       
       
    /*   
       out.println("<p>"+pid+"</p>");
       out.println("<p>"+size+"</p>");
       out.println("<p>"+quantity+"</p>");
       out.println("<p>"+username+"</p>");
       out.println("<p>"+saddress+"</p>");
       out.println("<p>"+city+"</p>");
       out.println("<p>"+pincode+"</p>");
       out.println("<p>"+email+"</p>");
       out.println("<p>"+mobile+"</p>");
       out.println("<p>"+pname+"</p>");
       out.println("<p>"+ordstatus+"</p>");
       out.println("<p>"+price+"</p>");
       out.println("<p>"+tprice+"</p>");
       */
       
       try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("Jdbc:odbc:jeanstation","sa","domnic");
            PreparedStatement ps=con.prepareStatement("insert into orderdet(pid,pname,quantity,price,tprice,psize,saddress,pincode,city,email,usrname,mobile,ordstatus) values(?,?,?,?,?,?,?,?,?,?,?,?,?) ");
            ps.setInt(1, pid);
            ps.setString(2, pname);
            ps.setInt(3, quantity);
            ps.setInt(4, price);
            ps.setInt(5, tprice);
            ps.setString(6, size);
            ps.setString(7,saddress);
            ps.setString(8, pincode);
            ps.setString(9, city);
            ps.setString(10, email);
            ps.setString(11, username);
            ps.setString(12, mobile);
            ps.setString(13, ordstatus);
            ps.executeUpdate();
            ps.close();
            con.close();
            try{
              
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn=DriverManager.getConnection("Jdbc:odbc:jeanstation","sa","domnic");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select*from orderdet where email='"+email+"'");
            if(rs.next()){
             int ordno=rs.getInt(1);
             Twilio sms=new Twilio(mobile,username,ordno);
             sms.sendMessage();
                
            }  
              
            }
            catch(Exception e){
             
                out.println("<p>"+e+"</p>");
            
            }
            
            RequestDispatcher rd=request.getRequestDispatcher("thanks.jsp?email="+email+"");
            rd.forward(request, response);
     
          }
          
          catch(Exception ex){
            out.println("<h5>"+ex+"</h5>");
          }
      
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
