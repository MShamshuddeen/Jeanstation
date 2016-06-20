
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sendgrid.*;
/**
 *
 * @author Shamshuddeen
 */
public class RegisterServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
             Users us=new Users(a,b,c,d);
             try{
                 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                 Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
                 PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?)");
                 ps.setString(1, us.getName());
                 ps.setString(2, us.getEmail());
                 ps.setString(3, us.getMobile());
                 ps.setString(4, us.getPass());
                 ps.executeUpdate();
                 ps.close();
                 con.close();
                 SendGrid sendgrid = new SendGrid("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");

    SendGrid.Email email = new SendGrid.Email();
    email.addTo(b);
    email.setFrom("shamshuddeen@hotmail.com");
    email.setSubject("JeanStation: Welcome");
    email.setText("Hi "+a+"\n\n Thankyou for creating JeanStation account, You're all ready to go! \n  Your Email: "+b+" \n  Your Password: "+d+" \n\n  Regards \n JeanStation Team\n\n\n ");

    try {
      SendGrid.Response res = sendgrid.send(email);
      System.out.println(res.getMessage());
    }
    catch (SendGridException e) {
      System.out.println(e);
      
    }
                 out.println("<h3 style='text-align:center;'>Registration Successful</h3>");
                  out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
                 response.setHeader("Refresh", "3; URL=index.jsp");
                // out.println("<a href='index.jsp'>HomePage</a>");
             }
             catch(Exception e){
                 
                out.println("<h1>"+e+"</h1>"); 
             }
             
             
        
        
        
        
        
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
