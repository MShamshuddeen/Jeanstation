
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shamshuddeen
 */
public class PasswordChange extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PasswordChange</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PasswordChange at " + request.getContextPath() + "</h1>");
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
        String username=request.getParameter("username");
        String oldpass=request.getParameter("oldpass");
        String newpass=request.getParameter("newpass");
        try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select*from users where username='"+username+"' and pswd='"+oldpass+"' ");
            if(rs.next()){
                try{
             int usrid=rs.getInt(1);
            Connection con1=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
            PreparedStatement ps1=con1.prepareStatement("update users set pswd='"+newpass+"' where usrid="+usrid+" ");
            ps1.executeUpdate();
            ps1.close();
            con1.close();
            out.println("<h3 style='text-align:center;'>Password updated Successfully</h3>");
           out.println("<h5  style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
           response.setHeader("Refresh", "3; URL=index.jsp");
                }
                catch(Exception ex){
                out.println("<p>"+ex+"</p>");
                
                }
            }
            else{
                   out.println("<h3 style='text-align:center;'>Please Enter valid old password</h3>");
           out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
           response.setHeader("Refresh", "3; URL=index.jsp");     
                        
                        }
            
        
        }
        catch(Exception e){
            out.println("<p>"+e+"</p>");
        }
            
            
        
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
