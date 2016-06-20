
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
       
       String email=request.getParameter("email");
       String password=request.getParameter("password");
       try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select*from users where email='"+email+"' and pswd='"+password+"' ");
            if(rs.next()){
                String name=rs.getString(2);
             HttpSession hs=request.getSession();
             hs.setAttribute("username", name);
              out.println("<h3 style='text-align:center;'>Login Successfully</h3>");
               out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
                response.setHeader("Refresh", "3; URL=index.jsp");
             // out.println("<a href='index.jsp'>Goto Homepage</a>");
            }
            else{
               out.println("<h3 style='text-align:center;'>Login Failed</h3>");
              //out.println("<a href='Register.html'>Please Register here</a>");
                out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
               response.setHeader("Refresh", "3; URL=login.html");
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
