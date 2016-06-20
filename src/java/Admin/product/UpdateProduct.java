
package Admin.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shamshuddeen
 */
public class UpdateProduct extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
          String pname,pcat,pdesc,pstatus;
          int pid,price;
           pid=Integer.parseInt(request.getParameter("pid"));
           pname=request.getParameter("prodname");
           pcat=request.getParameter("pcat");
           pdesc=request.getParameter("pdesc");
           price=Integer.parseInt(request.getParameter("price"));
           pstatus=request.getParameter("pstatus");
          try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("Jdbc:odbc:jeanstation","sa","domnic");
            PreparedStatement ps=con.prepareStatement("update product set pname=?, pcat=?, pdesc=?, price=?, pstatus=? where pid="+pid+" ");
            ps.setString(1,pname);
            ps.setString(2, pcat);
            ps.setString(3, pdesc);
            ps.setInt(4, price);
            ps.setString(5, pstatus);
            ps.executeUpdate();
            ps.close();
            con.close();
            out.println("<h3 style='text-align:center;'>Product updated Successfully</h3>");
           out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
            response.setHeader("Refresh", "3; URL=Dashboard.jsp");
          
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
