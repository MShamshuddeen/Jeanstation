
package Admin.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderStatus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderStatus at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        int ordno=Integer.parseInt(request.getParameter("ordno"));
        try{
               Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("Jdbc:odbc:jeanstation","sa","domnic");
            PreparedStatement ps=con.prepareStatement("update orderdet set ordstatus='Delivered' where ordno="+ordno+" ");
            ps.executeUpdate();
            ps.close();
            con.close();
            out.println("<h3 style='text-align:center;'>Order Details updated Successfully</h3>");
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
