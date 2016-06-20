

package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Adminlogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Adminlogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Adminlogin at " + request.getContextPath() + "</h1>");
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
        String username=request.getParameter("usr");
        String pass=request.getParameter("pwd");
        
        try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select*from admin where usrname='" + username + "' and pass='" + pass + "'");
            if(rs.next()){
              String name=rs.getString(1);
              HttpSession ad=request.getSession();
              ad.setAttribute("adminname", name);
              RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
              rd.forward(request, response);
            }
            else{
               out.println("<h4 style='text-align:center;'>Login Failed</h4>");
                out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
                response.setHeader("Refresh", "3; URL=js-admin.html");
          // out.println("<a href='js-admin.html'>Goto Login Panel</a>");
                
            }
        }
        catch(Exception e){
            out.println("<h4>"+e+"</h4>");
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
