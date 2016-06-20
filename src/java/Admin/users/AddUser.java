

package Admin.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddUser extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
      
          String a,b,c,d;
          a=request.getParameter("usr");
          b=request.getParameter("email");
          c=request.getParameter("mob");
          d=request.getParameter("pwd");
          try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("Jdbc:odbc:jeanstation","sa","domnic");
            PreparedStatement ps=con.prepareStatement("insert into users(username,email,mobile,pswd) values(?,?,?,?)");
            ps.setString(1, a);
            ps.setString(2, b);
            ps.setString(3, c);
            ps.setString(4, d);
            ps.executeUpdate();
            ps.close();
            con.close();
            out.println("<h3 style='text-align:center;'>User Profile Created Successfully</h3>");
           out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
          response.setHeader("Refresh", "3; URL=Dashboard.jsp");
          
          }
          
          catch(Exception ex){
            out.println("<h5>"+ex+"</h5>");
          }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
