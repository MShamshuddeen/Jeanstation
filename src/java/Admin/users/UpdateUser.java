

package Admin.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class UpdateUser extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUser at " + request.getContextPath() + "</h1>");
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
          int a;
          String b,c,d,e;
          a=Integer.parseInt(request.getParameter("uid"));
          b=request.getParameter("usr");
          c=request.getParameter("email");
          d=request.getParameter("mob");
          e=request.getParameter("pwd");
          try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("Jdbc:odbc:jeanstation","sa","domnic");
            PreparedStatement ps=con.prepareStatement("update users set username=?, email=?, mobile=?, pswd=? where usrid=? ");
            ps.setString(1, b);
            ps.setString(2, c);
            ps.setString(3, d);
            ps.setString(4, e);
            ps.setInt(5, a);
            ps.executeUpdate();
            ps.close();
            con.close();
            out.println("<h3 style='text-align:center;'>User Profile updated Successfully</h3>");
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
