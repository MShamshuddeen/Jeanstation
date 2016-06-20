
package Admin.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
         String email=request.getParameter("deluser");
        try{
            
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
            PreparedStatement ps=con.prepareStatement("delete from users where email='"+email+"' ");
            ps.executeUpdate();
            ps.close();
            con.close();
            out.println("<h4 style='text-align:center;'>User data deleted Successfully</h4>");
          out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
           response.setHeader("Refresh", "3; URL=Dashboard.jsp");
            
           
            
        }
        catch(Exception e){
            out.println("<h4>"+e+"</h4>");
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
